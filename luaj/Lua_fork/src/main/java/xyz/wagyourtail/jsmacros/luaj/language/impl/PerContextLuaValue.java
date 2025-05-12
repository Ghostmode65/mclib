package xyz.wagyourtail.jsmacros.luaj.language.impl;

import party.iroiro.luajava.AbstractLua;
import party.iroiro.luajava.Lua;
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
        return instances.computeIfAbsent(ctx, c -> null);
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
        LuaValue value = getForCurrentContext();
        return isBoolean(value) && value.toBoolean();
    }
    
    public double asNumber() {
        return getForCurrentContext().toNumber();
    }
    
    public LuaValue call(Object... args) {
        LuaValue func = getForCurrentContext();
        if (func != null && isFunction(func)) {
            BaseScriptContext<?> ctx = getCurrentContext();
            if (ctx.getContext() instanceof Lua) {
                Lua lua = (Lua) ctx.getContext();
                return func.call(lua, args);
            }
        }
        return null;
    }
    
    // Type checking utility methods
    public boolean isBoolean(LuaValue value) {
        return value != null && value.type() == AbstractLua.LuaType.BOOLEAN;
    }
    
    public boolean isNumber(LuaValue value) {
        return value != null && value.type() == AbstractLua.LuaType.NUMBER;
    }
    
    public boolean isString(LuaValue value) {
        return value != null && value.type() == AbstractLua.LuaType.STRING;
    }
    
    public boolean isTable(LuaValue value) {
        return value != null && value.type() == AbstractLua.LuaType.TABLE;
    }
    
    public boolean isFunction(LuaValue value) {
        return value != null && value.type() == AbstractLua.LuaType.FUNCTION;
    }
    
    public boolean isNil(LuaValue value) {
        return value == null || value.type() == AbstractLua.LuaType.NIL;
    }
    
    public boolean isUserdata(LuaValue value) {
        return value != null && (value.type() == AbstractLua.LuaType.USERDATA || 
                                value.type() == AbstractLua.LuaType.LIGHTUSERDATA);
    }
}