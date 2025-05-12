package xyz.wagyourtail.jsmacros.luaj.library.impl;

import party.iroiro.luajava.Lua;
import party.iroiro.luajava.value.LuaFunction;
import party.iroiro.luajava.value.LuaValue;
import party.iroiro.luajava.AbstractLua;

import xyz.wagyourtail.jsmacros.core.Core;
import xyz.wagyourtail.jsmacros.core.MethodWrapper;
import xyz.wagyourtail.jsmacros.core.language.BaseScriptContext;
import xyz.wagyourtail.jsmacros.core.library.IFWrapper;
import xyz.wagyourtail.jsmacros.core.library.Library;
import xyz.wagyourtail.jsmacros.core.library.PerExecLanguageLibrary;
import xyz.wagyourtail.jsmacros.luaj.language.impl.LuajLanguageDefinition;
import xyz.wagyourtail.jsmacros.luaj.language.impl.LuajScriptContext;

import java.util.function.Supplier;

@Library(value = "JavaWrapper", languages = LuajLanguageDefinition.class)
public class FWrapper extends PerExecLanguageLibrary<party.iroiro.luajava.Lua, LuajScriptContext> implements IFWrapper<LuaFunction> {

    public FWrapper(LuajScriptContext context, Class language) {
        super(context, language);
    }

    // Helper method to call Lua functions with proper stack handling
    private LuaValue callFunction(LuaFunction fn, Lua lua, Object... args) {
        // Push function arguments to stack
        for (Object arg : args) {
            lua.push(arg);
        }
        
        // Call the function with args.length arguments and 1 return value
        int status = fn.invoke(lua, args.length);
        
        // Get the return value
        LuaValue result = null;
        if (lua.getTop() > 0) {
            result = lua.value(-1);
            lua.pop(1); // Pop the result from stack
        }
        
        return result;
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
                Lua lua = ctx.getContext();
                callFunction(fn, lua, t);
            }, await);
        }

        @Override
        public void accept(T t, U u) {
            internal_accept(() -> {
                Lua lua = ctx.getContext();
                callFunction(fn, lua, t, u);
            }, await);
        }

        @Override
        public R apply(T t) {
            return internal_apply(() -> {
                Lua lua = ctx.getContext();
                LuaValue result = callFunction(fn, lua, t);
                return (R) (result != null ? result.toJavaObject() : null);
            });
        }

        @Override
        public R apply(T t, U u) {
            return internal_apply(() -> {
                Lua lua = ctx.getContext();
                LuaValue result = callFunction(fn, lua, t, u);
                return (R) (result != null ? result.toJavaObject() : null);
            });
        }

        @Override
        public boolean test(T t) {
            return internal_apply(() -> {
                Lua lua = ctx.getContext();
                LuaValue result = callFunction(fn, lua, t);
                return result != null && 
                       result.type() == AbstractLua.LuaType.BOOLEAN && 
                       result.toBoolean();
            });
        }

        @Override
        public boolean test(T t, U u) {
            return internal_apply(() -> {
                Lua lua = ctx.getContext();
                LuaValue result = callFunction(fn, lua, t, u);
                return result != null && 
                       result.type() == AbstractLua.LuaType.BOOLEAN && 
                       result.toBoolean();
            });
        }

        @Override
        public void run() {
            internal_accept(() -> {
                Lua lua = ctx.getContext();
                callFunction(fn, lua);
            }, await);
        }

        @Override
        public int compare(T o1, T o2) {
            return internal_apply(() -> {
                Lua lua = ctx.getContext();
                LuaValue result = callFunction(fn, lua, o1, o2);
                return result != null ? (int) result.toNumber() : 0;
            });
        }

        @Override
        public R get() {
            return internal_apply(() -> {
                Lua lua = ctx.getContext();
                LuaValue result = callFunction(fn, lua);
                return (R) (result != null ? result.toJavaObject() : null);
            });
        }
    }
}