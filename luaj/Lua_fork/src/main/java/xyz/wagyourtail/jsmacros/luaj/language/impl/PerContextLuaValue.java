package xyz.wagyourtail.jsmacros.luaj.language.impl;

import party.iroiro.luajava.value.LuaValue;
import xyz.wagyourtail.jsmacros.core.Core;
import xyz.wagyourtail.jsmacros.core.language.BaseScriptContext;

import java.util.Map;
import java.util.WeakHashMap;

public class PerContextLuaValue {
    private Map<BaseScriptContext<?>, LuaValue> instances = new WeakHashMap<>();
    
    public PerContextLuaValue() {
    }
    
    public void addContext(BaseScriptContext<?> ctx, LuaValue javaInstance) {
        instances.put(ctx, javaInstance);
    }

    public LuaValue getForCurrentContext() {
        BaseScriptContext<?> ctx = getCurrentContext();
        return instances.computeIfAbsent(ctx, c -> LuaValue.NIL);
    }
    
    private BaseScriptContext<?> getCurrentContext() {
        return Core.getInstance().getContexts().stream()
            .filter(e -> e.getBoundThreads().contains(Thread.currentThread()))
            .findFirst()
            .orElseThrow(RuntimeException::new);
    }
    
    public Object toJavaObject() {
        return getForCurrentContext().toJavaObject();
    }
    
    public String asString() {
        return getForCurrentContext().toString();
    }
    
    public boolean asBoolean() {
        return getForCurrentContext().isBoolean() && getForCurrentContext().toBoolean();
    }
    
    public double asNumber() {
        return getForCurrentContext().toNumber();
    }
    
    public LuaValue call(Object... args) {
        return getForCurrentContext().call(args);
    }
    
    //Custom helper Functions
}