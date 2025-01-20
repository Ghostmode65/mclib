const Install = {};
const loaderText = "FabricRefresher.lua"

Install.Loader = () => {
    const url = "https://raw.githubusercontent.com/Ghostmode65/mclib/refs/heads/main/Sterile/Installer/Text-Loader.txt";
    const response = Request.get(url);

    if (response.responseCode === 200) {
        return response.text();
    } else {
        throw new Error(`Failed to fetch loader: ${response.getStatus()}`);
    }
};

Install.deleteOldFiles = () => {
    const macroFolder = JsMacros.getConfig().macroFolder.getPath() + "/";
    const files = FS.list(macroFolder);

    files.forEach(file => {
        if (file !== loaderText) {
            FS.unlink(file);
        }
    });
};

Install.addLoader = () => {
        const loaderFile = FS.open(loaderText).write(Install.Loader());
        Chat.actionbar("Added " + loaderText);
};


Install.addLoader()
Install.deleteOldFiles()