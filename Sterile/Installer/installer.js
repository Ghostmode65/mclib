const _synapmc = {
    url: "https://github.com/Ghostmode65/Synapcmc-Extension/releases/download/v1.0.2/", 
    jar: "synapmc-1.0.2.jar"
}

const _lua = {
    url: "https://github.com/Ghostmode65/JsMacros-Lua/releases/download/1.2.4/",
    jar: "jsmacros-lua-1.2.4.jar",
    remove: ["jsmacros-lua-1.2.2.jar"]
}
//Installer
const Installer = {};
const configFolder = JsMacros.getConfig().configFolder.getPath();
let doRefresh = false;

Installer.deleteOldJars = (jars, dir) => {
    jars.forEach(jar => {
        try {
            const file = FS.open(dir + jar);
            if (file.exists()) {
                file.delete();
                Chat.log("§dRemoved old jar: " + jar);
                doRefresh = true;
            }
        } catch (error) {
            Chat.log("§dFailed to remove " + jar + ": " + error);
        }
    });
};

Installer.downloadJar = (url, jar, dir) => {
try {
    FS.makeDir(dir);
    Java.type("java.nio.file.Files").copy(
        new (Java.type("java.net.URL"))(url + jar).openStream(),
        Java.type("java.nio.file.Paths").get(dir + jar),
        Java.type("java.nio.file.StandardCopyOption").REPLACE_EXISTING
    );
}   catch (error) {
    Chat.log("§dError Downloading" + jar);
    return false
}
    Chat.log("§dFile downloaded successfully to " + dir + jar);
    return true
};

Installer.hasLua = () => {
try {
    JsMacros.runScript('lua', 'Chat:actionbar("§dLua Extension Loaded")');
    return true;
} catch (error) {
    return false;
    }
}

if ((!Installer.hasLua() || doRefresh) &&
    Installer.downloadJar(_synapmc.url,_synapmc.jar,configFolder + "\\LanguageExtensions\\") &&
    Installer.downloadJar(_lua.url,_lua.jar,configFolder + "\\LanguageExtensions\\")) {
    Chat.actionbar("§dGoing to Restart game in 30 seconds, relaunch after exit");
    Client.waitTick(20*30);
    Client.exitGamePeacefully();
};

JsMacros.runScript('lua',`load(Request:create("https://raw.githubusercontent.com/Ghostmode65/mclib/refs/heads/main/Sterile/Installer/setup.lua"):get():text())()`)






