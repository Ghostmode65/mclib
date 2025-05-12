package xyz.wagyourtail.jsmacros.luaj.library.impl;

import party.iroiro.luajava.Lua;
import party.iroiro.luajava.value.LuaFunction;
import party.iroiro.luajava.value.LuaValue;

import xyz.wagyourtail.jsmacros.core.Core;
import xyz.wagyourtail.jsmacros.core.MethodWrapper;
import xyz.wagyourtail.jsmacros.core.language.BaseScriptContext;
import xyz.wagyourtail.jsmacros.core.library.IFWrapper;
import xyz.wagyourtail.jsmacros.core.library.Library;
import xyz.wagyourtail.jsmacros.core.library.PerExecLanguageLibrary;
import xyz.wagyourtail.jsmacros.luaj.language.impl.LuajLanguageDefinition;
import xyz.wagyourtail.jsmacros.luaj.language.impl.LuajScriptContext;

import java.util.concurrent.locks.ReentrantLock;
import java.util.function.Supplier;

@Library(value = "JavaWrapper", languages = LuajLanguageDefinition.class)
public class FWrapper extends PerExecLanguageLibrary<Lua, LuajScriptContext> implements IFWrapper<LuaFunction> {

    private final ReentrantLock luaLock = new ReentrantLock();

    public FWrapper(LuajScriptContext context, Class language) {
        super(context, language);
    }

    private LuaValue callFunction(LuaFunction fn, Object... args) {
        Lua lua = ctx.getContext();
        if (lua == null) {
            return null;
        }
        
        luaLock.lock();
        try {
            lua.checkStack(args.length + 2); 
            
            // Push the function onto stack
            ((LuaValue)fn).push(lua);
            
            // Push all arguments
            for (Object arg : args) {
                lua.push(arg, Lua.Conversion.SEMI);
            }
            
            // Call with proper error handling
            lua.pCall(args.length, 1);
            
            // Get return value if any
            if (lua.getTop() > 0) {
                return lua.get();
            }
            return null;
        } catch (Exception e) {
            // Handle error but don't throw from here
            Core.getInstance().profile.logError(e);
            return null;
        } finally {
            luaLock.unlock();
        }
    }

    @Override
    public <A, B, R> MethodWrapper<A, B, R, LuajScriptContext> methodToJava(LuaFunction luaFunction) {
        return new LuaMethodWrapper<>(luaFunction, true, ctx);
    }

    @Override
    public <A, B, R> MethodWrapper<A, B, R, LuajScriptContext> methodToJavaAsync(LuaFunction luaFunction) {
        return new LuaMethodWrapper<>(luaFunction, false, ctx);
    }
    
    @Override
    public void stop() {
        ctx.closeContext();
    }

    private class LuaMethodWrapper<T, U, R> extends MethodWrapper<T, U, R, LuajScriptContext> {
        private final LuaFunction fn;
        private final boolean await;

        LuaMethodWrapper(LuaFunction fn, boolean await, LuajScriptContext ctx) {
            super(ctx);
            this.fn = fn;
            this.await = await;
        }

        private void internal_accept(Runnable accepted, boolean await) {
            if (await) {
                internal_apply(() -> {
                    accepted.run();
                    return null;
                });
                return;
            }

            Thread th = new Thread(() -> {
                ctx.bindThread(Thread.currentThread());
                try {
                    accepted.run();
                } catch (Throwable ex) {
                    Core.getInstance().profile.logError(ex);
                } finally {
                    ctx.releaseBoundEventIfPresent(Thread.currentThread());
                    ctx.unbindThread(Thread.currentThread());
                    Core.getInstance().profile.joinedThreadStack.remove(Thread.currentThread());
                }
            });
            
            th.setName("LuaJava-Async-" + System.currentTimeMillis());
            th.start();
        }

        private <A> A internal_apply(Supplier<A> supplier) {
            if (ctx.getBoundThreads().contains(Thread.currentThread())) {
                return supplier.get();
            }
            try {
                ctx.bindThread(Thread.currentThread());
                if (Core.getInstance().profile.checkJoinedThreadStack()) {
                    Core.getInstance().profile.joinedThreadStack.add(Thread.currentThread());
                }
                return supplier.get();
            } catch (Throwable ex) {
                throw new RuntimeException(ex);
            } finally {
                ctx.releaseBoundEventIfPresent(Thread.currentThread());
                ctx.unbindThread(Thread.currentThread());
                Core.getInstance().profile.joinedThreadStack.remove(Thread.currentThread());
            }
        }

        @Override
        public void accept(T t) {
            internal_accept(() -> {
                callFunction(fn, t);
            }, await);
        }

        @Override
        public void accept(T t, U u) {
            internal_accept(() -> {
                callFunction(fn, t, u);
            }, await);
        }

        @Override
        public R apply(T t) {
            return internal_apply(() -> {
                LuaValue result = callFunction(fn, t);
                return (R) (result != null ? result.toJavaObject() : null);
            });
        }

        @Override
        public R apply(T t, U u) {
            return internal_apply(() -> {
                LuaValue result = callFunction(fn, t, u);
                return (R) (result != null ? result.toJavaObject() : null);
            });
        }

        @Override
        public boolean test(T t) {
            return internal_apply(() -> {
                LuaValue result = callFunction(fn, t);
                if (result == null) {
                    return false;
                }
                return result.toBoolean();
            });
        }

        @Override
        public boolean test(T t, U u) {
            return internal_apply(() -> {
                LuaValue result = callFunction(fn, t, u);
                if (result == null) {
                    return false;
                }
                return result.toBoolean();
            });
        }

        @Override
        public void run() {
            internal_accept(() -> {
                callFunction(fn);
            }, await);
        }

        @Override
        public int compare(T o1, T o2) {
            return internal_apply(() -> {
                LuaValue result = callFunction(fn, o1, o2);
                if (result == null) {
                    return 0;
                }
                return (int) result.toNumber();
            });
        }

        @Override
        public R get() {
            return internal_apply(() -> {
                LuaValue result = callFunction(fn);
                return (R) (result != null ? result.toJavaObject() : null);
            });
        }
    }
}