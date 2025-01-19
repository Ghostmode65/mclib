const writeConfig = `
{
  "version": 3,
  "core": {
    "maxLockTime": 500,
    "defaultProfile": "default",
    "anythingIgnored": [
      "Sound",
      "Tick",
      "RecvPacket",
      "SendPacket"
    ],
    "profiles": {
      "default": [
        {
          "triggerType": "KEY_RISING",
          "event": "key.keyboard.keypad.6",
          "scriptFile": "FabricRefresh.lua",
          "enabled": true,
          "joined": false
        }
      ]
    },
    "services": {}
  },
  "client": {
    "sortMethod": "FileName",
    "sortServicesMethod": "Running",
    "showSlotIndexes": false,
    "disableKeyWhenScreenOpen": false,
    "editorTheme": {
      "constant": [
        33,
        180,
        62
      ],
      "string": [
        18,
        212,
        137
      ],
      "interpolation-punctuation": [
        204,
        120,
        50
      ],
      "builtin": [
        33,
        180,
        62
      ],
      "quantifier": [
        121,
        171,
        255
      ],
      "charset-negation": [
        204,
        120,
        50
      ],
      "operator": [
        216,
        216,
        216
      ],
      "class-name": [
        33,
        180,
        62
      ],
      "number": [
        121,
        171,
        255
      ],
      "regex": [
        18,
        212,
        137
      ],
      "boolean": [
        255,
        226,
        0
      ],
      "function-variable": [
        121,
        171,
        255
      ],
      "function": [
        162,
        234,
        34
      ],
      "punctuation": [
        216,
        216,
        216
      ],
      "charclass": [
        255,
        226,
        0
      ],
      "comment": [
        160,
        160,
        160
      ],
      "keyword": [
        204,
        120,
        50
      ],
      "charset-punctuation": [
        216,
        216,
        216
      ],
      "escape": [
        255,
        226,
        0
      ],
      "format-spec": [
        204,
        120,
        50
      ]
    },
    "editorLinterOverrides": {},
    "editorHistorySize": 500,
    "editorSuggestions": true,
    "editorFont": "jsmacros:monocraft",
    "externalEditor": false,
    "externalEditorCommand": "code %MacroFolder %File",
    "showRunningServices": false,
    "serviceAutoReload": false
  },
  "js": {
    "extraGraalOptions": {}
  },
  "lua": {
    "useGlobalContext": true
  }
}
`;

const macroFile = JsMacros.getConfig().configFolder.getPath() + "/options.json";

if (FS.exists(macroFile)) {
    Chat.actionbar("About to reload Files, closing Minecraft in 5 seconds");
    Client.waitTick(100)
    FS.open(macroFile).write(writeConfig);
    Client.exitGamePeacefully();
}