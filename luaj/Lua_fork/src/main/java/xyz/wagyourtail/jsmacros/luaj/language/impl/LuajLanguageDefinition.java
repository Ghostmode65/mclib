package xyz.wagyourtail.jsmacros.luaj.language.impl;

import party.iroiro.luajava.Lua;
import party.iroiro.luajava.lua54.Lua54;
import xyz.wagyourtail.jsmacros.core.Core;
import xyz.wagyourtail.jsmacros.core.config.ScriptTrigger;
import xyz.wagyourtail.jsmacros.core.event.BaseEvent;
import xyz.wagyourtail.jsmacros.core.language.BaseLanguage;
import xyz.wagyourtail.jsmacros.core.language.EventContainer;
import xyz.wagyourtail.jsmacros.luaj.LuajExtension;
import xyz.wagyourtail.jsmacros.luaj.config.LuajConfig;

import java.io.File;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.concurrent.locks.ReentrantLock;

public class LuajLanguageDefinition extends BaseLanguage<Lua, LuajScriptContext> {
    
    // Use a shared Lua instance if global context is enabled
    private Lua globalLua = null;
    private final ReentrantLock globalLuaLock = new ReentrantLock();

    public LuajLanguageDefinition(LuajExtension extension, Core runner) {
        super(extension, runner);
    }
    
    private Lua getOrCreateGlobalLua() {
        globalLuaLock.lock();
        try {
            if (globalLua == null) {
                globalLua = new Lua54();
                globalLua.openLibraries();
                
                // Initialize any global state needed
                retrieveLibs(null).forEach((name, lib) -> {
                    globalLua.set(name, lib);
                });
            }
            return globalLua;
        } finally {
            globalLuaLock.unlock();
        }
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
            try {
                lua.set("event", event);
                lua.set("file", ctx.getCtx().getFile());
                lua.set("context", ctx);
                
                // Add per-execution libraries
                retrieveOnceLibs().forEach((name, lib) -> lua.set(name, lib));
                retrievePerExecLibs(ctx.getCtx()).forEach((name, lib) -> lua.set(name, lib));
                
                // Read and execute the file content
                String content = new String(Files.readAllBytes(ctx.getCtx().getFile().toPath()), StandardCharsets.UTF_8);
                ByteBuffer buffer = ByteBuffer.wrap(content.getBytes(StandardCharsets.UTF_8));
                
                String scriptName = ctx.getCtx().getFile().getName();
                lua.load(buffer, scriptName);
                lua.pCall(0, -1);
            } catch (Exception e) {
                throw new RuntimeException("Error executing Lua script", e);
            }
        });
    }

    @Override
    protected void exec(EventContainer<LuajScriptContext> ctx, String lang, String script, BaseEvent event) throws Exception {
        execContext(ctx, (lua) -> {
            try {
                lua.set("event", event);
                lua.set("file", ctx.getCtx().getFile());
                lua.set("context", ctx);
                
                ByteBuffer buffer = ByteBuffer.wrap(script.getBytes(StandardCharsets.UTF_8));
                String scriptName = "Lua_string";
                lua.load(buffer, scriptName);
                lua.pCall(0, -1);
            } catch (Exception e) {
                throw new RuntimeException("Error executing Lua script", e);
            }
        });
    }
    
    @Override
    public LuajScriptContext createContext(BaseEvent event, File file) {
        return new LuajScriptContext(event, file);
    }
    
    private interface Executor {
        void accept(Lua lua) throws Exception;
    }
    
    // Method to be called on close to clean up resources
    public void onClose() {
        globalLuaLock.lock();
        try {
            if (globalLua != null) {
                try {
                    globalLua.close();
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    globalLua = null;
                }
            }
        } finally {
            globalLuaLock.unlock();
        }
    }
}