package xyz.wagyourtail.jsmacros.luaj;

import com.google.common.collect.Sets;
import party.iroiro.luajava.Lua;
import party.iroiro.luajava.lua54.Lua54;
import party.iroiro.luajava.value.LuaValue;
import xyz.wagyourtail.jsmacros.core.Core;
import xyz.wagyourtail.jsmacros.core.extensions.Extension;
import xyz.wagyourtail.jsmacros.core.language.BaseLanguage;
import xyz.wagyourtail.jsmacros.core.language.BaseWrappedException;
import xyz.wagyourtail.jsmacros.core.library.BaseLibrary;
import xyz.wagyourtail.jsmacros.luaj.config.LuajConfig;
import xyz.wagyourtail.jsmacros.luaj.language.impl.LuajLanguageDefinition;
import xyz.wagyourtail.jsmacros.luaj.library.impl.FWrapper;

import java.io.File;
import java.util.Collections;
import java.util.Set;

public class LuajExtension implements Extension {

    private LuajLanguageDefinition languageDefinition;

    @Override
    public void init() {
        try {
            Core.getInstance().config.addOptions("lua", LuajConfig.class);
        } catch (IllegalAccessException | InstantiationException e) {
            throw new RuntimeException(e);
        }
    
        // pre-init Lua in a separate thread to avoid blocking
        Thread t = new Thread(() -> {
            try {
                try (Lua lua = new Lua54()) {
                    lua.openLibraries(); // Load standard libraries
                    lua.run("print(\"lua pre-loaded\")");
                }
            } catch(Exception e) {
                e.printStackTrace();
            }
        });
        
        t.setName("LuaJava-Preload");
        t.start();
    }

    @Override
    public int getPriority() {
        return 0;
    }

    @Override
    public String getLanguageImplName() {
        return "luajava";
    }

    @Override
    public ExtMatch extensionMatch(File file) {
        if (file.getName().endsWith(".lua")) {
            if (file.getName().contains(getLanguageImplName())) {
                return ExtMatch.MATCH_WITH_NAME;
            } else {
                return ExtMatch.MATCH;
            }
        }
        return ExtMatch.NOT_MATCH;
    }

    @Override
    public String defaultFileExtension() {
        return "lua";
    }

    @Override
    public BaseLanguage<?, ?> getLanguage(Core<?, ?> core) {
        if (languageDefinition == null) {
            ClassLoader originalClassLoader = Thread.currentThread().getContextClassLoader();
            try {
                // Ensure the correct classloader is used
                Thread.currentThread().setContextClassLoader(LuajLanguageDefinition.class.getClassLoader());
                languageDefinition = new LuajLanguageDefinition(this, core);
            } finally {
                // Always restore the original classloader
                Thread.currentThread().setContextClassLoader(originalClassLoader);
            }
        }
        return languageDefinition;
    }

    @Override
    public Set<Class<? extends BaseLibrary>> getLibraries() {
        return Sets.newHashSet(FWrapper.class);
    }

    @Override
    public BaseWrappedException<?> wrapException(Throwable ex) {
        if (ex instanceof party.iroiro.luajava.LuaException) {
            party.iroiro.luajava.LuaException luaEx = (party.iroiro.luajava.LuaException) ex;
            String error = luaEx.getMessage();
            
            File file = null; 
            int line = -1;
            
            String errorMsg = luaEx.getMessage();
            if (errorMsg != null && errorMsg.contains(":")) {
                String[] parts = errorMsg.split(":", 3);
                if (parts.length >= 2) {
                    file = new File(parts[0]);
                    try {
                        line = Integer.parseInt(parts[1].trim());
                    } catch (NumberFormatException e) {
                        // Parse failed, keep default -1
                    }
                }
            }
            
            BaseWrappedException.SourceLocation loc = null;
            if (file != null && file.exists()) {
                loc = new BaseWrappedException.GuestLocation(file, -1, -1, line, -1);
            }
            
            Throwable cause = ex.getCause();
            BaseWrappedException<?> causewrap = null;
            if (cause != null) {
                causewrap = Core.getInstance().wrapException(cause);
            }
            
            return new BaseWrappedException<>(ex, error, loc, causewrap);
        }
        return null;
    }

    @Override
    public boolean isGuestObject(Object o) {
        return o instanceof LuaValue;
    }
    
    // The getDependencies method is removed since it's not part of the Extension interface

    public void onClose() {
        if (languageDefinition != null) {
            languageDefinition.onClose();
        }
    }
}