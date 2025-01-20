const Setup = {};
const lua = "jsmacros-lua-1.2.2.jar"; //lastest version

Setup.lua = () => { //No lua extension installed
    const url = "https://github.com/JsMacros/JsMacros-Lua/releases/download/1.2.2/" + lua; 
    const dir = JsMacros.getConfig().configFolder.getPath() + "\\LanguageExtensions\\"; 
    const file = dir + lua; 

if (!FS.exists(file)) { 
try {
    FS.makeDir(dir);
    const URL = Java.type("java.net.URL");
    Java.type("java.nio.file.Files").copy(
        new URL(url).openStream(),Java.type("java.nio.file.Paths").get(file),Java.type("java.nio.file.StandardCopyOption").REPLACE_EXISTING);
        Chat.log("§dFile downloaded successfully to " + file); 
        Client.waitTick(5);
} catch (error) {Chat.log("§dError downloading file")};
}};

Setup.Config = () => {
    const url = "https://raw.githubusercontent.com/Ghostmode65/mclib/refs/heads/main/Sterile/Config/Loader.js"; 
    const response = Request.get(url);
    if (response.responseCode === 200) {
        return eval(Request.get(url).text());
    } else {
        throw new Error(`Failed to initialize files`);
    }
}


Setup.Loader = () => {
    const url = "https://raw.githubusercontent.com/Ghostmode65/mclib/refs/heads/main/Sterile/Installer/Loader.js";
    const response = Request.get(url);
    if (response.responseCode === 200) {
        return eval(Request.get(url).text());
    } else {
        throw new Error(`Failed to get loader`);
    }
};

Setup.lua();

try {
    JsMacros.runScript('lua', 'Chat:actionbar("§dLua Extension Loaded")');
    Client.waitTick(10);
Setup.Loader();
Chat.actionbar("§dGoing to Restart game soon, relaunch after exit");
Setup.Config();

} catch (error) {Chat.log("§dError loading lua" )};


