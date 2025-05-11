package xyz.wagyourtail.jsmacros.luaj.library.impl;

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

import java.util.function.Supplier;

@Library(value = "JavaWrapper", languages = LuajLanguageDefinition.class)
public class FWrapper extends PerExecLanguageLibrary<party.iroiro.luajava.Lua, LuajScriptContext> implements IFWrapper<LuaFunction> {

    public FWrapper(LuajScriptContext context, Class language) {
        super(context, language);
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

    private static class LuaMethodWrapper<T, U, R> extends MethodWrapper<T, U, R, LuajScriptContext> {
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
            internal_accept(() -> fn.call(t), await);
        }

        @Override
        public void accept(T t, U u) {
            internal_accept(() -> fn.call(t, u), await);
        }

        @Override
        public R apply(T t) {
            return internal_apply(() -> {
                LuaValue result = fn.call(t);
                return (R) result.toJavaObject();
            });
        }

        @Override
        public R apply(T t, U u) {
            return internal_apply(() -> {
                LuaValue result = fn.call(t, u);
                return (R) result.toJavaObject();
            });
        }

        @Override
        public boolean test(T t) {
            return internal_apply(() -> {
                LuaValue result = fn.call(t);
                return result.isBoolean() && result.toBoolean();
            });
        }

        @Override
        public boolean test(T t, U u) {
            return internal_apply(() -> {
                LuaValue result = fn.call(t, u);
                return result.isBoolean() && result.toBoolean();
            });
        }

        @Override
        public void run() {
            internal_accept(() -> fn.call(), await);
        }

        @Override
        public int compare(T o1, T o2) {
            return internal_apply(() -> {
                LuaValue result = fn.call(o1, o2);
                return (int) result.toNumber();
            });
        }

        @Override
        public R get() {
            return internal_apply(() -> {
                LuaValue result = fn.call();
                return (R) result.toJavaObject();
            });
        }
    }
}