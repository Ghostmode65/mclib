local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v22,v23) local v24={};for v42=1066 -(68 + 997) , #v22 do v6(v24,v0(v4(v1(v2(v22,v42,v42 + (1271 -(226 + 1044)) )),v1(v2(v23,(4 -3) + (v42% #v23) ,(118 -(32 + 85)) + (v42% #v23) + 1 + 0 )))%(57 + 199) ));end return v5(v24);end local v8={v7("\148\248\243\32\234\171\194\12\148\254","\126\177\163\187\69\134\219\167"),v7("\102\246\30\215\245\34\193\106\232\243\39\136\23","\156\67\173\74\165"),v7("\113\140\100\25\184\35\84\53\163\70\4\249\27","\38\84\215\41\118\220\70"),v7("\21\45\17\0\176\16\59\45\22\251\66\23\54\29\236\21\43","\158\48\118\66\114"),v7("\238\31\35\36\61\229\214\164\32\85\11","\155\203\68\112\86\19\197"),v7("\3\230\23\248\77\113\235\189\123","\152\38\189\86\156\32\24\133"),v7("\185\108\148\84\178\23\134\66\241\94\169\3\193","\38\156\55\199"),v7("\237\70\88\45\5\113\246\76\184\120\110\109\46","\35\200\29\28\72\115\20\154"),v7("\92\132\254\200\131\41\38\92\130","\84\121\223\177\191\237\76")};local v9={[v7("\182\83\199\181\20\81\61\196","\161\219\54\169\192\90\48\80")]=v7("\106\77\13\53\69\71\24\8\74\2\35\42\68\79\1\43\77\2\44\42\72\70\5\55","\69\41\34\96"),[v7("\168\198\196\30\14\36\187\196\222\4\5","\75\220\163\183\106\98")]=false,[v7("\18\182\138\46\220\16\148\138\58\220","\185\98\218\235\87")]=Player:getPlayer():getName():getString(),[v7("\222\47\34\244","\202\171\92\71\134\190")]=v7("\39\206\34\157\58\196\62","\232\73\161\76")};local v10={[v7("\136\218\80\84\14\175\253\75\78\31\185\213\71\89","\126\219\185\34\61")]=false,[v7("\28\220\87\127\127\101\234\196\4\203\93\121\109","\135\108\174\62\18\30\23\147")]=true,[v7("\165\236\41\196\22\170\50\213\175\202\34\206\27\165\32","\167\214\137\74\171\120\206\83")]=false,[v7("\143\245\38\92\241\171\142\244\17\85\253\164\128\227","\199\235\144\82\61\152")]=false};local v11={[v7("\23\4\176\38\6\4\160\8\15\19\186\32\20","\75\103\118\217")]=true,[v7("\244\87\98\29\169\10\226\90\113\22\181\27\195","\126\167\52\16\116\217")]=true,[v7("\219\43\35\143\186\29\253\218\55\3\136\177\26\247\219","\156\168\78\64\224\212\121")]=false,[v7("\3\235\177\207\14\226\160\202\36\230\160\205\12\253","\174\103\142\197")]=false,[v7("\101\43\77\49\53\74\206\87\58","\152\54\72\63\88\69\62")]=false};local v12={[v7("\196\214\231\81\213\214\247\80\219\195\253","\60\180\164\142")]=true};Chat:toast("§fConsole Log:",v7("\113\88\69\48\40\248\82\89\76\0\105\41\226\6\24\89\0\61\51\228\28\95\30\38\33\38\249\82\85\91\22\58\38\234\23\75\30\17\33\34\227\82\84\81\4\45\103\249\26\93\30\2\40\42\232\82\79\87\17\33\40\248\6\24\83\10\45\52","\114\56\62\101\73\71\141"));local function v13(v25,v26) Chat:log(v26   .. v25 );end local function v14(v27,v28,v29) if (v27==v7("\189\251\201\203\170","\164\216\137\187")) then v13("§4"   .. v29 ,"§4"   .. v27 );end if ((v27==v7("\198\227\34\166\138\241\12","\107\178\134\81\210\198\158")) and v9.testlogging and v28) then v13("§a"   .. v29 ,"§a"   .. v27 );end if ((v27==v7("\61\28\144\201\184\20\1\133","\202\88\110\226\166")) and v28) then v13("§c"   .. v29 ,"§c"   .. v27 );end if (v27==v7("\207\0\133","\170\163\111\226\151")) then v13("§a"   .. v29 );end end local function v15(v30,v31) if (World:getScoreboards() and World:getScoreboards():getObjectiveSlot(351 -(87 + 263) )) then for v47,v48 in pairs(World:getScoreboards():getObjectiveSlot(181 -(67 + 113) ):getKnownPlayersDisplayNames()) do if string.find(v48:getString(),v30) then return true,v48:getString();end end if v31 then v14(v7("\20\34\160\55\92\27\38\22","\73\113\80\210\88\46\87"),v10.primaryChecks,v7("\180\63\200\0\167\136\63\141\29\233\193\59\223\29\233\134\108\228\1\235\128\34\201","\135\225\76\173\114"));end return false,nil;else local v44=0 + 0 ;while true do if (v44==(0 + 0)) then v14(v7("\31\255\170\191\190\145\168\29","\199\122\141\216\208\204\221"),v10.primaryChecks,v7("\152\206\21\226\56\255\190\157\31\254\56\225\191\210\30\247\56\197\168\207\6\245\106\169","\150\205\189\112\144\24"));return false;end end end end local function v16(v32,v33) if (World:getScoreboards() and World:getScoreboards():getObjectiveSlot(1 -0 )) then for v49,v50 in pairs(World:getScoreboards():getObjectiveSlot(2 -1 ):getKnownPlayersDisplayNames()) do if string.find(v50:getString(),v32) then return true,v50:getString();end end if (v33 and v33.island) then local v51=0 + 0 ;while true do if (v51==(0 -0)) then v14(v7("\32\150\173\67\22\164\30\23","\112\69\228\223\44\100\232\113"),v10.primaryChecks,v7("\225\12\2\193\246\117\149\148\16\9\147\161\110\137\218\24\71\250\165\112\135\218\27","\230\180\127\103\179\214\28"));return false,nil;end end end elseif (v33 and v33.server) then v14(v7("\137\23\77\73\246\109\239\139","\128\236\101\63\38\132\33"),v10.primaryChecks,v7("\153\186\20\86\246\226\220\236\166\31\4\161\249\192\162\174\81\119\179\249\217\169\187\78","\175\204\201\113\36\214\139"));return false,nil;end end local function v17(v34,v35) local v36=952 -(802 + 150) ;local v37;while true do if (v36==1) then return v37:get(Client:getMinecraft().field_1705);end if (v36==(0 -0)) then v37=Reflection:getDeclaredField(v34:getClass(),v35);v37:setAccessible(true);v36=773 -(201 + 571) ;end end end local function v18() local v38=0 -0 ;while true do if (v38==0) then for v52,v53 in pairs(v8) do if v15(v53) then return false;end end if string.find(tostring(v17(Client:getMinecraft().field_1705,v7("\65\197\48\208\0\120\158\101\141\92","\100\39\172\85\188"))),v7("\187\121\183\137\32\165\125\189","\83\205\24\217\224")) then return false;end v38=4 -3 ;end if (v38==(1 + 0)) then return true;end end end local function v19(v39,v40) Chat:unregisterCommand(v39);if (v18() and v16("ᴄᴏᴍᴘʟᴇx",{[v7("\245\192\223\43\227\215","\93\134\165\173")]=true})) then local v45=0;local v46;while true do if (v45==0) then v46=Chat:getCommandManager():createCommandBuilder(v39);v46:executes(JavaWrapper:methodToJavaAsync(function() v40();return true;end)):register();break;end end end end if (v9.user==v7("\176\253\207\215\41\203\160","\30\222\146\161\162\90\174\210")) then local v43=997 -(915 + 82) ;while true do if (v43==(2 -1)) then Chat:log("");Chat:log("§cWarning, verification can take up to 24 hours and in some cases can be delayed.");break;end if (v43==(0 -0)) then Chat:log("§9You are not a User. Please Purchase.");Chat:log("§aUse //discord to purchase access");v43=1 + 0 ;end end end local function v20() local v41=0 -0 ;while true do if (v41==(0 -0)) then Chat:log("§cMenu: §fIt can take 24 hours or more to verify");Chat:log("§cMenu: §fDue not attempt to repurchase, please wait");v41=1188 -(1069 + 118) ;end if (v41==(1 + 0)) then Chat:log("§cMenu: §dIf you reredeem the code used for this purchase your account may be blocked");break;end end end local function v21() Utils:openUrl(v7("\237\90\100\26\246\20\63\69\225\71\99\9\234\92\116\68\226\73\63\47\223\64\119\40\227\109\35\88\193","\106\133\46\16"));end v19(v7("\23\36\122\239\89\79\74\36","\32\56\64\19\156\58"),v21);