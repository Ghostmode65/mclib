package xyz.wagyourtail.jsmacros.luaj.language.impl;

import party.iroiro.luajava.Lua;
import party.iroiro.luajava.lua54.Lua54;
import party.iroiro.luajava.value.LuaValue;
import xyz.wagyourtail.jsmacros.core.Core;
import xyz.wagyourtail.jsmacros.core.config.ScriptTrigger;
import xyz.wagyourtail.jsmacros.core.event.BaseEvent;
import xyz.wagyourtail.jsmacros.core.language.BaseLanguage;
import xyz.wagyourtail.jsmacros.core.language.BaseScriptContext;
import xyz.wagyourtail.jsmacros.core.language.EventContainer;
import xyz.wagyourtail.jsmacros.luaj.LuajExtension;
import xyz.wagyourtail.jsmacros.luaj.config.LuajConfig;

import java.io.File;
import java.nio.file.Files;

public class LuajLanguageDefinition extends BaseLanguage<Lua, LuajScriptContext> {
    
    // Use a shared Lua instance if global context is enabled
    private Lua globalLua = null;

    public LuajLanguageDefinition(LuajExtension extension, Core runner) {
        super(extension, runner);
    }
    
    private synchronized Lua getOrCreateGlobalLua() {
        if (globalLua == null) {
            globalLua = new Lua54();
            globalLua.openLibraries();
        }
        return globalLua;
    }
    
    protected void execContext(EventContainer<LuajScriptContext> ctx, Executor e) throws Exception {
        Lua lua;
        
        if (runner.config.getOptions(LuajConfig.class).useGlobalContext) {
            lua = getOrCreateGlobalLua();
        } else {
            lua = new Lua54();
            lua.openLibraries();
        }
        
        ctx.getCtx().setContext(lua);
        
        retrieveLibs(ctx.getCtx()).forEach((name, lib) -> {
            lua.set(name, lib);
        });
        
        e.accept(lua);
    }
    
    @Override
    protected void exec(EventContainer<LuajScriptContext> ctx, ScriptTrigger macro, BaseEvent event) throws Exception {
        execContext(ctx, (lua) -> {
            lua.set("event", event);
            lua.set("file", ctx.getCtx().getFile());
            lua.set("context", ctx);
            
            retrieveOnceLibs().forEach((name, lib) -> lua.set(name, lib));
            
            retrievePerExecLibs(ctx.getCtx()).forEach((name, lib) -> lua.set(name, lib));
            
            String scriptPath = ctx.getCtx().getFile().getCanonicalPath();
            lua.loadFile(scriptPath);
            lua.call(0, 0);
        });
    }

    @Override
    protected void exec(EventContainer<LuajScriptContext> ctx, String lang, String script, BaseEvent event) throws Exception {
        execContext(ctx, (lua) -> {
            lua.set("event", event);
            lua.set("file", ctx.getCtx().getFile());
            lua.set("context", ctx);
            
            lua.load(script);
            lua.call(0, 0);
        });
    }
    
    @Override
    public LuajScriptContext createContext(BaseEvent event, File file) {
        return new LuajScriptContext(event, file);
    }
    
    private interface Executor {
        void accept(Lua lua) throws Exception;
    }
    
    @Override
    public void onClose() {
        if (globalLua != null) {
            try {
                globalLua.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            globalLua = null;
        }
    }
}