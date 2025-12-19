        local path = {}

        local js = [[
            const File = Java.type("java.io.File");
            const System = Java.type("java.lang.System");
            const roaming = new File(System.getenv("APPDATA"));
            GlobalVars.putString(".roaming", roaming.getAbsolutePath());
        ]]

        if not GlobalVars:getString(".roaming") then JsMacros:runScript("js", js)  Client:waitTick(3) end

        path.roaming =  GlobalVars:getString(".roaming")
        path.jsmacros = path.roaming .. "/.jsMacros"

        if not FS:exists(path.jsmacros) then Chat:log("Failed to find jsMacros folder") return nil end
        path.library = path.jsmacros .. "/scripts/library"
        if not FS:exists(path.library) then Chat:log("Failed to find jsMacros library folder") return nil end

        local folders = FS:list(path.library)

        local runFile = function(file,folder)
        local success, result = pcall(function()
            dofile(path.library .. "/"..folder.. "/".. file)
        end)

        if not success then Chat:log("§cFailed to load library: §d"..file) return nil end
            return true
        end

        if FS:exists(path.library .. "/main/") then
            for i, file in pairs(FS:list(path.library .. "/main/")) do
                if file:match("%.lua$") then runFile(file, "main") end
            end
        end

        local getFiles = function(folder)
            for i, file in pairs(FS:list(path.library .. "/"..folder.."/")) do
                if file:match("%.lua$") then runFile(file, folder) end
            end
        end

        for i, folder in pairs(folders) do
            if folder ~= "main" then getFiles(folder) end
        end