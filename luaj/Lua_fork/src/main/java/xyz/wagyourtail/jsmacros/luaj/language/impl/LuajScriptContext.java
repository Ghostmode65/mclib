package xyz.wagyourtail.jsmacros.luaj.language.impl;

import party.iroiro.luajava.Lua;
import xyz.wagyourtail.jsmacros.core.event.BaseEvent;
import xyz.wagyourtail.jsmacros.core.language.BaseScriptContext;

import java.io.File;

public class LuajScriptContext extends BaseScriptContext<Lua> {
    
    private boolean closed = false;
    
    public LuajScriptContext(BaseEvent event, File file) {
        super(event, file);
    }

    @Override
    public boolean isMultiThreaded() {
        return true;
    }

    @Override
    public synchronized void closeContext() {
        // Prevent double closing
        if (!closed) {
            closed = true;
            
            Lua lua = getContext();
            if (lua != null) {
                try {
                    lua.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            super.closeContext();
        }
    }
    
    @Override
    public synchronized void setContext(Lua context) {
        super.setContext(context);
    }
    
    @Override
    public synchronized Lua getContext() {
        return super.getContext();
    }
}