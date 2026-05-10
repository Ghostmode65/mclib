 
synapmc:repo():add("https://raw.githubusercontent.com/Ghostmode65/Synapcmc-Extension/refs/heads/main/repository/sub/lua/library.json",true)
Client:waitTick(1)
synapmc:repo("Luaj"):install():script("Roman Digits","library")
synapmc:repo("Luaj"):install():script("Lua Serpent","library")
synapmc:repo("Luaj"):install():script("Lua Json","library")

local _ , json = pcall(function() return load(synapmc:repo():getString("Lua Json",true))() end)
    if not json then Chat:log("&cFailed to get download config") return nil end
local config = json.decode(GlobalVars:getObject("Configuration"))

local downloadFiles = function()
local urls = {
    "Api.lua",
    "Assets.lua",
    "BoxRenders.lua",
    "CommandLine.lua",
    "Events.lua",
    "hud.lua",
    "settings.lua",
    "userprofile.lua",
    "webhook.lua"
}
    local main_irl = "https://raw.githubusercontent.com/Ghostmode65/mclib/refs/heads/main/Sterile/v3/"
        for i,url in pairs(urls) do
        synapmc:download(main_irl..url,"scripts/library/Sterile/")
    end
end

local ScriptTrigger = {}

ScriptTrigger.add = function(event)
local _ScriptTrigger = Reflection:getClass("xyz.wagyourtail.jsmacros.core.config.ScriptTrigger")
local TriggerType = Reflection:getClass("xyz.wagyourtail.jsmacros.core.config.ScriptTrigger$TriggerType")

local trigger = Reflection:newInstance(
    _ScriptTrigger,
    {
        (TriggerType["KEY_FALLING"]),
        event,
        "unified/Load-Fabric-Refresher.lua",
        true,
        false
    }
)
    JsMacros:getProfile():getRegistry():addScriptTrigger(trigger)
end

ScriptTrigger.remove = function()
local registry = JsMacros:getProfile():getRegistry()
local tiggers = registry:getScriptTriggers()
    if not tiggers then return nil end
    local key

    for i, v in ipairs(tiggers) do
        if v.scriptFile == "installer.js" then
            key = v.event
            registry:removeScriptTrigger(v)
        if config.user.deleteInstaller then FS:unlink("installer.js") end
            break
        end
    end
    if key then ScriptTrigger.add(key) end
end

Chat:actionbar("§dConfiguring Fabric Refresher...")

local link = "https://raw.githubusercontent.com/Ghostmode65/mclib/refs/heads/main/Sterile/Installer/Redirect/Load-Fabric-Refresher.lua"

synapmc:download(link,"scripts/macros/")
if config.user.unbindInstaller then ScriptTrigger.remove() end
downloadFiles()

GlobalVars:remove("Configuration")

local options = JsMacros:getConfig().options

local function configEdit(class,field,value)
    for name, instance in pairs(options) do
    if tostring(name) == "class "..class then
        local declaredfield = Reflection:getDeclaredField(name, field)
        declaredfield:setAccessible(true)
        declaredfield:set(instance, value)
    end
end
end

configEdit("xyz.wagyourtail.jsmacros.luaj.config.LuajConfig" , "useGlobalContext", true)
configEdit("xyz.wagyourtail.jsmacros.luaj.config.LuajConfig" , "splitGlobalContext", true)
configEdit("xyz.wagyourtail.jsmacros.synapmc.config.SynapMcConfig" , "silent", true)

JsMacros:getConfig():saveConfig()

local success, result = pcall(function()
    local script = GlobalContext:loadscript(Request:create(link):get():text(), "#1-load")
    if script then script() end end)

    if not success then Chat:actionbar("§cFailed to load into Fabric Refresher") end