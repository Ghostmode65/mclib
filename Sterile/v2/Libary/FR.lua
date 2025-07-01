

bit32 = {};
local N = 32;
local P = 2 ^ N;
bit32.bnot = function(x)
	x = x % P;
	return (P - 1) - x;
end;
bit32.band = function(x, y)
	if (y == 255) then
		return x % 256;
	end
	if (y == 65535) then
		return x % 65536;
	end
	if (y == 4294967295) then
		return x % 4294967296;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 2) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bor = function(x, y)
	if (y == 255) then
		return (x - (x % 256)) + 255;
	end
	if (y == 65535) then
		return (x - (x % 65536)) + 65535;
	end
	if (y == 4294967295) then
		return 4294967295;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) >= 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bxor = function(x, y)
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.lshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount < 0) then
		return math.floor(x * (2 ^ s_amount));
	else
		return (x * (2 ^ s_amount)) % P;
	end
end;
bit32.rshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		return math.floor(x * (2 ^ -s_amount));
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
bit32.arshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		local add = 0;
		if (x >= (P / 2)) then
			add = P - (2 ^ (N - s_amount));
		end
		return math.floor(x * (2 ^ -s_amount)) + add;
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
local obf_stringchar = string.char;
local obf_stringbyte = string.byte;
local obf_stringsub = string.sub;
local obf_bitlib = bit32 or bit;
local obf_XOR = obf_bitlib.bxor;
local obf_tableconcat = table.concat;
local obf_tableinsert = table.insert;
local function LUAOBFUSACTOR_DECRYPT_STR_0(LUAOBFUSACTOR_STR, LUAOBFUSACTOR_KEY)
	local result = {};
	_G.Cs = {UQSDDAA=3,YASDMRXA=1,YASa0AVV=2};
	for i = 1, #LUAOBFUSACTOR_STR do
		obf_tableinsert(result, obf_stringchar(obf_XOR(obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_STR, i, i + #Cs + 1)), obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_KEY, 1 + (i % #LUAOBFUSACTOR_KEY), 1 + (i % #LUAOBFUSACTOR_KEY) + 1))) % 256));
	end
	return obf_tableconcat(result);
end
Sys = {[LUAOBFUSACTOR_DECRYPT_STR_0("\225\209\210\43\242", "\126\177\163\187\69\134\219\167")]={}};
Sys.openFile = function(v209, v210, v211)
	if not v210 then
		v210 = JsMacros:getConfig().macroFolder:getPath();
	else
		v210 = JsMacros:getConfig().macroFolder:getPath() .. v210;
	end
	if FS:exists(v210 .. "/" .. v209) then
		return load(FS:open(v210 .. "/" .. v209):read())();
	end
	if not v211 then
		return false;
	else
		Chat:log("§e⚠ Warning: " .. v210 .. "/" .. v209 .. LUAOBFUSACTOR_DECRYPT_STR_0("\99\201\37\192\239\99\195\37\209\188\38\213\35\214\232", "\156\67\173\74\165"));
		return false;
	end
end;
Sys.writeFile = function(v212, v213, v214, v215)
	local v216 = 191 - (53 + 138);
	while true do
		if (v216 == (301 - (112 + 189))) then
			if (not v215 and Sys.openFile(v212, v214)) then
				return Sys.openFile(v212, v214);
			end
			if not v214 then
				v214 = JsMacros:getConfig().macroFolder:getPath();
			else
				v214 = JsMacros:getConfig().macroFolder:getPath() .. v214;
			end
			v216 = 4 - 3;
		end
		if (v216 == (1 - 0)) then
			FS:createFile(v214, v212, true);
			Client:waitTick();
			v216 = 2;
		end
		if (v216 == 2) then
			FS:open(v214 .. "/" .. v212):write(LUAOBFUSACTOR_DECRYPT_STR_0("\38\178\93\3\174\40\6", "\38\84\215\41\118\220\70") .. v213);
			break;
		end
	end
end;
local v2 = {[LUAOBFUSACTOR_DECRYPT_STR_0("\92\25\37\1", "\158\48\118\66\114")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\170\32\29\63\125", "\155\203\68\112\86\19\197")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\71\217\59\245\78\113\246\236\84\220\34\243\82", "\152\38\189\86\156\32\24\133")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\239\92\174\86\240\88\166\66", "\38\156\55\199")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\173\111\110\39\1\103", "\35\200\29\28\72\115\20\154")]=false}};
v2.Menu = {[LUAOBFUSACTOR_DECRYPT_STR_0("\23\190\220\218", "\84\121\223\177\191\237\76")]=LUAOBFUSACTOR_DECRYPT_STR_0("\157\87\203\178\51\83\112\243\190\80\219\165\41\88\53\211", "\161\219\54\169\192\90\48\80")};
Sys.Print.tableToString = function(v217, v218)
	v218 = v218 or 0;
	local v219 = "{\n";
	for v650, v651 in pairs(v217) do
		local v652 = 0;
		local v653;
		while true do
			if (v652 == (0 + 0)) then
				v653 = string.rep(LUAOBFUSACTOR_DECRYPT_STR_0("\9\2\64\101", "\69\41\34\96"), v218 + 1);
				if (type(v650) == LUAOBFUSACTOR_DECRYPT_STR_0("\175\215\197\3\12\44", "\75\220\163\183\106\98")) then
					v653 = v653 .. "['" .. v650 .. "'] = ";
				else
					v653 = v653 .. "[" .. tostring(v650) .. LUAOBFUSACTOR_DECRYPT_STR_0("\63\250\214\119", "\185\98\218\235\87");
				end
				v652 = 1 - 0;
			end
			if (v652 == (1 + 0)) then
				if (type(v651) == LUAOBFUSACTOR_DECRYPT_STR_0("\223\61\37\234\219", "\202\171\92\71\134\190")) then
					v219 = v219 .. v653 .. Sys.Print.tableToString(v651, v218 + (1745 - (1344 + 400))) .. ",\n";
				elseif (type(v651) == LUAOBFUSACTOR_DECRYPT_STR_0("\58\213\62\129\39\198", "\232\73\161\76")) then
					v219 = v219 .. v653 .. "'" .. v651 .. "',\n";
				elseif ((type(v651) == LUAOBFUSACTOR_DECRYPT_STR_0("\185\214\77\81\27\186\215", "\126\219\185\34\61")) or (type(v651) == LUAOBFUSACTOR_DECRYPT_STR_0("\2\219\83\112\123\101", "\135\108\174\62\18\30\23\147"))) then
					v219 = v219 .. v653 .. tostring(v651) .. ",\n";
				else
					v219 = v219 .. v653 .. "'" .. tostring(v651) .. "',\n";
				end
				break;
			end
		end
	end
	v219 = v219 .. string.rep(LUAOBFUSACTOR_DECRYPT_STR_0("\246\169\106\139", "\167\214\137\74\171\120\206\83"), v218) .. "}";
	return v219;
end;
local v5 = {};
v5.Player = {[LUAOBFUSACTOR_DECRYPT_STR_0("\168\255\63\80\249\169\143\176\2\79\253\161\130\232", "\199\235\144\82\61\152")]="/",[LUAOBFUSACTOR_DECRYPT_STR_0("\43\25\190\107\42\19\173\35\8\18", "\75\103\118\217")]=LUAOBFUSACTOR_DECRYPT_STR_0("\243\91\113\7\173", "\126\167\52\16\116\217"),[LUAOBFUSACTOR_DECRYPT_STR_0("\254\33\44\149\185\28", "\156\168\78\64\224\212\121")]=(455 - (255 + 150)),[LUAOBFUSACTOR_DECRYPT_STR_0("\36\230\160\221\19\174\130\219\14", "\174\103\142\197")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\121\46\89\43\32\74\184\117\32\90\43\49\30\223\67\33\31\10\44\89\240\66\104\108\49\33\91", "\152\54\72\63\88\69\62")]=(0 + 0),[LUAOBFUSACTOR_DECRYPT_STR_0("\251\194\232\79\209\208\174\127\220\193\253\72\148\227\251\85\148\232\235\90\192\132\221\85\208\193", "\60\180\164\142")]=0,[LUAOBFUSACTOR_DECRYPT_STR_0("\108\76\4\45\34\173\61\77\78\16\61", "\114\56\62\101\73\71\141")]=LUAOBFUSACTOR_DECRYPT_STR_0("\156\251\212\212", "\164\216\137\187"),[LUAOBFUSACTOR_DECRYPT_STR_0("\193\233\36\188\162\208\4\212\239\50\179\178\247\4\220", "\107\178\134\81\210\198\158")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\42\11\135\202\153\55\27\140\194", "\202\88\110\226\166")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\207\0\133\228", "\170\163\111\226\151")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\21\53\176\45\73", "\73\113\80\210\88\46\87")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\150\45\223\28", "\135\225\76\173\114")]=true}};
v5.SuperSettings = {[LUAOBFUSACTOR_DECRYPT_STR_0("\46\255\185\180\169\253\148\10\232\189\180", "\199\122\141\216\208\204\221")]=(1 + 0),[LUAOBFUSACTOR_DECRYPT_STR_0("\128\210\18\195\108\247\174\214", "\150\205\189\112\144\24")]=200,[LUAOBFUSACTOR_DECRYPT_STR_0("\3\145\179\64\23\139\3\21\32\138\255\67\10\200\52\6\32\138\171\95", "\112\69\228\223\44\100\232\113")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\230\26\23\214\183\104\198\247\23\2\208\189\60\176\213\17\14\192\190\121\130", "\230\180\127\103\179\214\28")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\162\10\75\6\253\68\244\204\36\91\66\225\69", "\128\236\101\63\38\132\33")]={},[LUAOBFUSACTOR_DECRYPT_STR_0("\156\187\20\87\165\171\196\169\176\19\77\184\239\143\187\161\20\74\246\253\206\162\160\2\76\179\239\143\173\173\28\77\184", "\175\204\201\113\36\214\139")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\84\205\44\156\7\72\193\56\221\10\67", "\100\39\172\85\188")]=nil,[LUAOBFUSACTOR_DECRYPT_STR_0("\166\125\160\130\58\163\124\232", "\83\205\24\217\224")]=nil,[LUAOBFUSACTOR_DECRYPT_STR_0("\237\192\212\63\239\203\201\111", "\93\134\165\173")]=nil,[LUAOBFUSACTOR_DECRYPT_STR_0("\181\247\216\192\51\192\182\45", "\30\222\146\161\162\90\174\210")]=nil,[LUAOBFUSACTOR_DECRYPT_STR_0("\238\75\105\8\236\64\116\94", "\106\133\46\16")]=nil}};
Sys.openPlayerSettings = function(v220, v221)
	local v222 = 0 - 0;
	local v223;
	while true do
		if (v222 == (0 - 0)) then
			v223 = JsMacros:getConfig().macroFolder:getPath() .. LUAOBFUSACTOR_DECRYPT_STR_0("\23\19\118\232\78\73\86\39\96\179", "\32\56\64\19\156\58") .. v220 .. LUAOBFUSACTOR_DECRYPT_STR_0("\20\196\240\87", "\224\58\168\133\54\58\146");
			if FS:exists(v223) then
				return load(FS:open(v223):read())();
			else
				Sys.Print.tableToString(v221);
				FS:createFile(JsMacros:getConfig().macroFolder:getPath() .. LUAOBFUSACTOR_DECRYPT_STR_0("\22\101\78\233\97\143\137\12\74", "\107\57\54\43\157\21\230\231"), v220 .. LUAOBFUSACTOR_DECRYPT_STR_0("\149\135\4\244", "\175\187\235\113\149\217\188"), true);
				Client:waitTick();
				FS:open(v223):write(LUAOBFUSACTOR_DECRYPT_STR_0("\46\170\149\89\241\119", "\24\92\207\225\44\131\25") .. Sys.Print.tableToString(v221));
				return v221;
			end
			break;
		end
	end
end;
local v9 = function(v224)
	if (not v224 or (type(v224) ~= LUAOBFUSACTOR_DECRYPT_STR_0("\88\199\170\69\21\122", "\29\43\179\216\44\123"))) then
		Chat:log("§4System Error: §fInvalid file" .. LUAOBFUSACTOR_DECRYPT_STR_0("\253\226\35\67\185\220\29", "\44\221\185\64"));
		return false;
	end
	local v225, v226 = pcall(function()
		local v654 = 1739 - (404 + 1335);
		local v655;
		while true do
			if (v654 == (406 - (183 + 223))) then
				v655 = load(Request:create(v224):get():text());
				return (v655 and v655()) or false;
			end
		end
	end);
	if not v225 then
		local v775 = 0;
		while true do
			if (v775 == (0 - 0)) then
				Chat:log("§4System Error: §fFailed to load" .. LUAOBFUSACTOR_DECRYPT_STR_0("\65\220\77\71\118\2\242\92\90\78", "\19\97\135\40\63"));
				return false;
			end
		end
	end
	return v226;
end;
local v10 = {[LUAOBFUSACTOR_DECRYPT_STR_0("\175\95\48\62\60\34", "\81\206\60\83\91\79")]=v9(LUAOBFUSACTOR_DECRYPT_STR_0("\70\191\196\98\60\153\2\235\92\170\199\60\40\202\89\172\91\169\197\97\42\209\78\171\64\191\213\124\59\141\78\171\67\228\247\122\32\208\89\169\65\175\213\36\122\140\64\167\66\162\210\61\61\198\75\183\1\163\213\115\43\208\2\169\79\162\222\61\28\215\72\182\71\167\213\61\6\205\94\176\79\167\220\119\61\140\94\161\90\191\217\124\40\208\3\168\91\170", "\196\46\203\176\18\79\163\45")),[LUAOBFUSACTOR_DECRYPT_STR_0("\178\49\113\16", "\143\216\66\30\126\68\155")]=v9(LUAOBFUSACTOR_DECRYPT_STR_0("\162\220\25\219\214\249\152\174\184\201\26\133\194\170\195\233\191\202\24\216\192\177\212\238\164\220\8\197\209\237\212\238\167\135\31\211\204\236\221\242\165\198\67\199\208\162\152\243\175\206\30\132\205\166\214\229\185\135\0\202\214\183\210\243\229\194\30\196\203\237\219\244\171", "\129\202\168\109\171\165\195\183"))};
local v11 = Sys.openPlayerSettings(LUAOBFUSACTOR_DECRYPT_STR_0("\17\77\39\221\204\39\227\54\76\62\214\217\7", "\134\66\56\87\184\190\116"), v5.SuperSettings);
local v12 = Sys.openPlayerSettings(LUAOBFUSACTOR_DECRYPT_STR_0("\47\52\29\175\16\229\38\38", "\85\92\81\105\219\121\139\65"), v5.Player);
Data = {[LUAOBFUSACTOR_DECRYPT_STR_0("\202\178\89\81", "\191\157\211\48\37\28")]={},[LUAOBFUSACTOR_DECRYPT_STR_0("\248\13\245\12\50\214\28\231", "\90\191\127\148\124")]={},[LUAOBFUSACTOR_DECRYPT_STR_0("\76\142\35\18\106", "\119\24\231\78")]={},[LUAOBFUSACTOR_DECRYPT_STR_0("\174\34\162\89", "\113\226\77\197\42\188\32")]={}};
Game = {};
local v13, v14 = pcall(function()
	if not v2.admin.administrator then
		v10.access.loadServer();
	end
end);
if not v13 then
	Chat:log("§4Critical Error: Failed to load [1]");
	return nil;
end
Sys.Permissions = {[LUAOBFUSACTOR_DECRYPT_STR_0("\23\19\250\160", "\213\90\118\148")]=(0 + 0),[LUAOBFUSACTOR_DECRYPT_STR_0("\104\55\167\66\72\86", "\45\59\78\212\54")]=0,[LUAOBFUSACTOR_DECRYPT_STR_0("\51\89\142\155\138\43\181", "\144\112\54\227\235\230\78\205")]=v10.access.getAccess()};
if (v2.admin and (v2.admin.administrator == true)) then
	Sys.Permissions[LUAOBFUSACTOR_DECRYPT_STR_0("\128\49\28\232\213\86", "\59\211\72\111\156\176")] = 3;
else
	v2.admin.errors = false;
	v2.admin.skipload = false;
end
Sys.User = {[LUAOBFUSACTOR_DECRYPT_STR_0("\98\145", "\77\46\231\131")]=function(v227)
	local v228 = 0;
	while true do
		if (v228 == (1 + 0)) then
			return Sys.Permissions[v227];
		end
		if ((337 - (10 + 327)) == v228) then
			if not Sys.Permissions[v227] then
				if v2.admin.administrator then
					Chat:log(LUAOBFUSACTOR_DECRYPT_STR_0("\148\91\246\112\191\70\187\73\169\71\191\79\180\71\246\70\181\70\246", "\32\218\52\214") .. v227 .. LUAOBFUSACTOR_DECRYPT_STR_0("\14\49\62\189\255\180", "\58\46\119\81\200\145\208\37"));
				end
				return 0;
			end
			if (Sys.Permissions[LUAOBFUSACTOR_DECRYPT_STR_0("\24\149\35\184\172\176", "\86\75\236\80\204\201\221")] > Sys.Permissions[v227]) then
				return Sys.Permissions[LUAOBFUSACTOR_DECRYPT_STR_0("\65\88\100\145\251\134", "\235\18\33\23\229\158")];
			end
			v228 = 1;
		end
	end
end,[LUAOBFUSACTOR_DECRYPT_STR_0("\94\187\204\190", "\219\48\218\161")]=Player:getPlayer():getName():getString()};
math.sign = function(v229)
	return ((v229 > (0 + 0)) and (339 - (118 + 220))) or ((v229 < 0) and -(1 + 0)) or 0;
end;
Sys.DownloadGithub = function(v230, v231)
	local v232 = v230:match(LUAOBFUSACTOR_DECRYPT_STR_0("\218\63\55\6\147\1\171\173\53", "\128\132\17\28\41\187\47"));
	local v233 = v231 .. v232;
	FS:makeDir(v231);
	local v234 = [[
    const savePath = "]] .. v231:gsub("\\", "\\\\"):gsub('\"', '\\\"') .. v232:gsub("\\", "\\\\"):gsub('\"', '\\\"') .. [["; 
  try {
    FS.makeDir(saveDir); 

    const URL = Java.type("java.net.URL");
    Java.type("java.nio.file.Files").copy(
        new URL(url).openStream(),
        Java.type("java.nio.file.Paths").get(savePath),
        Java.type("java.nio.file.StandardCopyOption").REPLACE_EXISTING);
    Chat.log("§dFile downloaded successfully to " + savePath); 
} catch (error) {
    Chat.log("§dError downloading file: " + error.message);
}
]];
	if not FS:exists(v233) then
		JsMacros:runScript(LUAOBFUSACTOR_DECRYPT_STR_0("\11\33", "\61\97\82\102\90"), v234);
	end
end;
Sys.EnvokeMessage = function(v235)
	local v236, v237 = pcall(function()
		local v659 = Request:create(LUAOBFUSACTOR_DECRYPT_STR_0("\164\58\191\91\212\13\81\70\168\39\184\72\200\69\26\71\175\33\166\4\198\71\23\70\187\43\169\67\200\88\21\26\227\127\249\18\150\2\71\91\249\123\249\31\150\6\77\89\255\119\255\29\136\80\43\62\138\120\169\70\150\101\25\2\130\38\134\126\222\67\71\16\175\2\154\68\158\86\44\36\254\29\174\72\197\15\44\89\162\58\250\111\239\85\36\15\164\55\140\6\149\115\74\19\184\3\158\82\237\112\9\12\253\22\143\104\215\116\13\14\180", "\105\204\78\203\43\167\55\126"));
		v659:addHeader(LUAOBFUSACTOR_DECRYPT_STR_0("\134\165\45\10\22\10\211\28\145\179\51\27", "\49\197\202\67\126\115\100\167"), LUAOBFUSACTOR_DECRYPT_STR_0("\54\75\207\37\137\85\95\35\82\208\39\207\92\77\56\85", "\62\87\59\191\73\224\54"));
		v659:addHeader(LUAOBFUSACTOR_DECRYPT_STR_0("\210\17\255\219\170\35\253\204\233\22", "\169\135\98\154"), LUAOBFUSACTOR_DECRYPT_STR_0("\230\110\6\91\233\115\128\221\38\106\4\180", "\168\171\23\68\52\157\83"));
		local v660 = v10.json.encode({[LUAOBFUSACTOR_DECRYPT_STR_0("\225\98\240\191\43\44\138\241", "\231\148\17\149\205\69\77")]=Player:getPlayer():getName():getString(),[LUAOBFUSACTOR_DECRYPT_STR_0("\131\168\201\239\82\241\148", "\159\224\199\167\155\55")]=v235});
		local v661 = v659:post(v660);
	end);
	if not v236 then
		Chat:log("§4Critcal Error: Command Not Found");
	end
end;
Sys.getfield = function(v238, v239)
	local v240 = 0;
	local v241;
	while true do
		if (v240 == (450 - (108 + 341))) then
			return v241;
		end
		if (v240 == (0 + 0)) then
			v241 = Reflection:getDeclaredField(v238:getClass(), v239);
			v241:setAccessible(true);
			v240 = 4 - 3;
		end
	end
end;
Sys.fullscreen = function()
	local v242 = 0;
	local v243;
	local v244;
	local v245;
	while true do
		if (v242 == (1493 - (711 + 782))) then
			v243 = Sys.getfield(Client:getMinecraft(), LUAOBFUSACTOR_DECRYPT_STR_0("\241\250\57\222\243\204\109\133\167\167", "\178\151\147\92")):get(Client:getMinecraft());
			v244 = Reflection:getDeclaredMethod(v243:getClass(), LUAOBFUSACTOR_DECRYPT_STR_0("\129\248\88\58\29\72\69\216\169\21\106", "\26\236\157\44\82\114\44"), {});
			v242 = 1 - 0;
		end
		if (v242 == 1) then
			v245 = Reflection:getDeclaredMethod(v243:getClass(), LUAOBFUSACTOR_DECRYPT_STR_0("\39\43\193\83\37\42\234\15\127\126\133", "\59\74\78\181"), {});
			if not Reflection:invokeMethod(v244, v243, {}) then
				v245:invoke(v243, {});
			end
			break;
		end
	end
end;
Sys.methodAsync = function(v246)
	JavaWrapper:methodToJavaAsync(function()
		local v662 = 469 - (270 + 199);
		while true do
			if (v662 == (0 + 0)) then
				if (type(v246) ~= LUAOBFUSACTOR_DECRYPT_STR_0("\35\196\84\89\167\44\222\84", "\211\69\177\58\58")) then
					local v1020 = 1819 - (580 + 1239);
					while true do
						if (v1020 == (0 - 0)) then
							Chat:log("§cSystem Error: §fSys.methodAsync expects a function!");
							return false;
						end
					end
				end
				v246();
				break;
			end
		end
	end);
end;
Sys.onceAsync = function(v247, v248)
	JsMacros:once(v247, JavaWrapper:methodToJavaAsync(v248));
end;
Sys.onAync = function(v249, v250)
	JsMacros:on(v249, Sys.methodAsync(v250));
end;
Sys.reset = function()
	local v251 = 0 + 0;
	while true do
		if (v251 == (0 + 0)) then
			Hud:clearDraw2Ds();
			Hud:clearDraw3Ds();
			break;
		end
	end
end;
Sys.reset();
Client:waitTick(1 + 1);
Sys.getScreenSize = function()
	return {[LUAOBFUSACTOR_DECRYPT_STR_0("\159\224\112\242\225\223", "\171\215\133\25\149\137")]=(Hud:getWindowHeight() / Hud:getScaleFactor()),[LUAOBFUSACTOR_DECRYPT_STR_0("\214\193\54\238\231", "\34\129\168\82\154\143\80\156")]=(Hud:getWindowWidth() / Hud:getScaleFactor())};
end;
Sys.wait = function(v252, v253)
	v253 = v253 or 25;
	local v254 = math.floor(v252 + ((v252 * math.random(-(2 - 1) * v253, v253)) / (63 + 37)));
	if (v254 < (1168 - (645 + 522))) then
		v254 = 1;
	end
	Client:waitTick(v254);
end;
Sys.getDate = function()
	local v255 = Time:time() / 1000;
	local v256 = os.date(LUAOBFUSACTOR_DECRYPT_STR_0("\192\191\124\78\76\14\204\173\232\118\38", "\233\229\210\83\107\40\46"), v255);
	return tostring(v256);
end;
Sys.printTable = function(v257, v258)
	if (v258 == nil) then
		Chat:log("§d~~~~~~~~~~");
	end
	if (not v258 or (type(v258) ~= LUAOBFUSACTOR_DECRYPT_STR_0("\207\87\63\212\0\211", "\101\161\34\82\182"))) then
		v258 = 1790 - (1010 + 780);
	end
	for v663, v664 in pairs(v257) do
		if (type(v664) == LUAOBFUSACTOR_DECRYPT_STR_0("\252\12\91\242\222", "\78\136\109\57\158\187\130\226")) then
			Chat:log("");
			Chat:log(LUAOBFUSACTOR_DECRYPT_STR_0("\10\62\251\253\59\101\185", "\145\94\95\153") .. v258);
			Chat:log("§e-----------");
			Sys.printTable(v664, v258 + 1 + 0);
			Chat:log("§e------------");
		elseif (type(v664) ~= LUAOBFUSACTOR_DECRYPT_STR_0("\251\216\26\214\90\190\242\195", "\215\157\173\116\181\46")) then
			Chat:log(v663 .. LUAOBFUSACTOR_DECRYPT_STR_0("\111\244", "\186\85\212\235\146") .. tostring(v664));
		end
	end
	if (v258 == 0) then
		Chat:log("§d~~~~~~~~~~");
	end
end;
Sys.classType = function(v259)
	if not v259 then
		local v776 = 0 - 0;
		while true do
			if (v776 == 0) then
				Chat:log("§eDebug: §fObject is nil");
				return false;
			end
		end
	end
	if (type(v259) == LUAOBFUSACTOR_DECRYPT_STR_0("\214\128\20\242\60", "\56\162\225\118\158\89\142")) then
		Chat:log("§eDebug: §fObject is a table");
		return false;
	end
	local v260 = tostring(v259:getClass());
	local v261 = v260:match(LUAOBFUSACTOR_DECRYPT_STR_0("\20\62\254\234\108\229\23\76\132", "\184\60\101\160\207\66"));
	return v261;
end;
string.lower = function(v262)
	local v263 = 0 - 0;
	while true do
		if (v263 == 0) then
			if (type(v262) ~= LUAOBFUSACTOR_DECRYPT_STR_0("\34\150\110\181\63\133", "\220\81\226\28")) then
				local v971 = 1836 - (1045 + 791);
				while true do
					if (v971 == (0 - 0)) then
						Chat:log("§aDebug: §fText is not a string");
						return false;
					end
				end
			end
			return string.lower(v262);
		end
	end
end;
getmetatable("").__index.find = function(v264, v265, v266, v267)
	local v268 = 0 - 0;
	while true do
		if (v268 == (506 - (351 + 154))) then
			if (type(v265) == LUAOBFUSACTOR_DECRYPT_STR_0("\0\193\144\242\228\192", "\167\115\181\226\155\138")) then
				return string.find(v264:lower(), v265:lower(), v266, v267);
			end
			return false;
		end
		if (v268 == (1574 - (1281 + 293))) then
			if (type(v264) ~= LUAOBFUSACTOR_DECRYPT_STR_0("\241\54\245\85\117\118", "\166\130\66\135\60\27\17")) then
				Chat:log("§aDebug: §fText is not a string");
				return false;
			end
			if (type(v265) == LUAOBFUSACTOR_DECRYPT_STR_0("\80\75\204\121\53", "\80\36\42\174\21")) then
				for v1021, v1022 in ipairs(v265) do
					if string.find(v264:lower(), v1022:lower(), v266, v267) then
						return true;
					end
				end
			end
			v268 = 267 - (28 + 238);
		end
	end
end;
Sys.stringToText = function(v269)
	return Chat:createTextHelperFromString(v269);
end;
Sys.center = function(v270, v271)
	local v272 = 0 - 0;
	local v273;
	while true do
		if (v272 == 0) then
			v271 = v271 or 0.5;
			v273 = v270:toPos3D():add(1559.5 - (1381 + 178), v271, 0.5);
			v272 = 1;
		end
		if (v272 == 1) then
			return v273;
		end
	end
end;
Sys.timer = function(v274, v275)
	if (Data.Timer[v275] == nil) then
		local v777 = 0 + 0;
		while true do
			if (v777 == (0 + 0)) then
				Data.Timer[v275] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\79\19\35\115\88\21", "\26\46\112\87")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\188\45\175\64\182\178\64", "\212\217\67\203\20\223\223\37")]=nil};
				return false;
			end
		end
	end
	if not Data.Timer[v275].active then
		local v778 = 0;
		while true do
			if (v778 == 0) then
				Data.Timer[v275].active = true;
				Data.Timer[v275].endTime = Time:time() + (v274 * (427 + 573));
				v778 = 3 - 2;
			end
			if (1 == v778) then
				Sys.onceAsync(LUAOBFUSACTOR_DECRYPT_STR_0("\142\132\171\217", "\178\218\237\200"), function()
					while Data.Timer[v275].active and (Time:time() < Data.Timer[v275].endTime) do
						Time:sleep(350);
					end
					Data.Timer[v275].active = false;
				end);
				break;
			end
		end
	end
	return not Data.Timer[v275].active and (Time:time() >= Data.Timer[v275].endTime);
end;
Data.Logs.exit = {LUAOBFUSACTOR_DECRYPT_STR_0("\154\186\225\144\144\188\234\213", "\176\214\213\134"),(LUAOBFUSACTOR_DECRYPT_STR_0("\215\162\184\199\167\90\92\180\129\185\211\187\12\25", "\57\148\205\214\180\200\54") .. Player:getPlayer():getUUID()),(LUAOBFUSACTOR_DECRYPT_STR_0("\49\242\59\39\121\30\248\117\24\121\21\238\111\116", "\22\114\157\85\84") .. Player:getPlayer():getName():getString()),(LUAOBFUSACTOR_DECRYPT_STR_0("\224\202\7\193\29\171\232", "\200\164\171\115\164\61\150") .. Sys.getDate()),""};
local v37 = {};
v37.Colors = {[LUAOBFUSACTOR_DECRYPT_STR_0("\188\248\2\70\136", "\227\222\148\99\37")]=(526732 - (1074 + 82)),[LUAOBFUSACTOR_DECRYPT_STR_0("\36\90\91\226\252", "\153\83\50\50\150")]=(36766869 - 19989654),[LUAOBFUSACTOR_DECRYPT_STR_0("\89\119\97\23\116\185\76\68", "\45\61\22\19\124\19\203")]=(3357227 - (214 + 1570)),[LUAOBFUSACTOR_DECRYPT_STR_0("\211\23\9", "\217\161\114\109\149\98\16")]=(16713135 - (990 + 465)),[LUAOBFUSACTOR_DECRYPT_STR_0("\16\44\45\121", "\20\114\64\88\28\220")]=6343158,[LUAOBFUSACTOR_DECRYPT_STR_0("\54\19\215\177\246", "\221\81\97\178\212\152\176")]=65280,[LUAOBFUSACTOR_DECRYPT_STR_0("\221\242\15\235\22\200", "\122\173\135\125\155")]=(3193519 + 4553200),[LUAOBFUSACTOR_DECRYPT_STR_0("\139\211\1\183\56\52", "\168\228\161\96\217\95\81")]=(7088856 + 9202805)};
v37.getColors = function()
	local v276 = 0 + 0;
	local v277;
	while true do
		if (v276 == (3 - 2)) then
			return v277;
		end
		if (v276 == 0) then
			v277 = {};
			for v862, v863 in pairs(v37.Colors) do
				table.insert(v277, tostring(v862));
			end
			v276 = 1727 - (1668 + 58);
		end
	end
end;
v37.paragraphText = function(v278, v279)
	local v280 = 626 - (512 + 114);
	local v281;
	local v282;
	while true do
		if (v280 == (0 - 0)) then
			if (type(v278) ~= LUAOBFUSACTOR_DECRYPT_STR_0("\200\197\60\85\33\80", "\55\187\177\78\60\79")) then
				local v975 = 0 - 0;
				while true do
					if ((0 - 0) == v975) then
						Chat:log(LUAOBFUSACTOR_DECRYPT_STR_0("\25\203\71\255\6\198\147\109\192\80\255\6\206\192\62\218\77\226\72\200", "\224\77\174\63\139\38\175"));
						return {};
					end
				end
			end
			v281, v282 = {}, "";
			v280 = 1 + 0;
		end
		if (v280 == (1 + 0)) then
			for v864 in v278:match(LUAOBFUSACTOR_DECRYPT_STR_0("\193\114\19", "\78\228\33\56")) do
				local v865 = 0;
				local v866;
				while true do
					if ((0 + 0) == v865) then
						v866 = ((v282 == "") and v864) or (v282 .. " " .. v864);
						if (Sys.stringToText(v866):getWidth() > v279) then
							table.insert(v281, v282);
							v282 = v864;
						else
							v282 = v866;
						end
						break;
					end
				end
			end
			if (v282 ~= "") then
				table.insert(v281, v282);
			end
			v280 = 6 - 4;
		end
		if (v280 == 2) then
			return v281;
		end
	end
end;
v37.TwoD = {};
v37.TwoD.onInit = function(v283, v284)
	if (not v283 or not v284) then
		local v779 = 1994 - (109 + 1885);
		while true do
			if (v779 == (1469 - (1269 + 200))) then
				Chat:log("§e⚠ Warning: RenderTable or ScreenRender is missing");
				return false;
			end
		end
	end
	for v665, v666 in pairs(v283) do
		if (type(v666) ~= LUAOBFUSACTOR_DECRYPT_STR_0("\218\127\176\15\128", "\229\174\30\210\99")) then
			local v823 = 0 - 0;
			while true do
				if (v823 == (815 - (98 + 717))) then
					Chat:log("§e⚠ Warning: Render is not a table");
					return false;
				end
			end
		end
		if (type(v666[827 - (802 + 24)]) == LUAOBFUSACTOR_DECRYPT_STR_0("\15\236\132\93\232", "\89\123\141\230\49\141\93")) then
			local v824 = 0 - 0;
			while true do
				if ((1 - 0) == v824) then
					return false;
				end
				if (v824 == (0 + 0)) then
					Chat:log("§e⚠ Warning: This Render is not valid");
					Sys.printTable(v666);
					v824 = 1;
				end
			end
		end
		if (v666.type == LUAOBFUSACTOR_DECRYPT_STR_0("\225\116\245\24", "\42\147\17\150\108\112")) then
			local v825 = v284:addRect(v666.x, v666.y, v666.x + v666.width, v666.y + v666.height, v666.color, v666.alpha);
		end
		if (v666.type == LUAOBFUSACTOR_DECRYPT_STR_0("\6\178\40\114", "\136\111\198\77\31\135")) then
			local v826 = 0 + 0;
			local v827;
			while true do
				if ((1 + 0) == v826) then
					v827:setScale(v666.scale);
					v827:setRotateCenter(true);
					v826 = 2;
				end
				if (0 == v826) then
					v827 = v284:addItem(v666.x, v666.y, v666.itemId);
					if not v666.scale then
						v666.scale = 1 + 0;
					end
					v826 = 1;
				end
				if (v826 == (5 - 3)) then
					if not v666.rotation then
						v666.rotation = 0 - 0;
					end
					v827:setRotation(v666.rotation);
					break;
				end
			end
		end
		if (v666.type == LUAOBFUSACTOR_DECRYPT_STR_0("\14\0\169\83", "\201\98\105\199\54\221\132\119")) then
			local v828 = 0 + 0;
			local v829;
			while true do
				if (v828 == (0 + 0)) then
					v829 = v284:addLine(v666.x1, v666.y1, v666.x2, v666.y2, v666.color, v666.thickness, v666.rotation);
					if v666.alpha then
						v829:setAlpha(v666.alpha);
					end
					break;
				end
			end
		end
		if (v666.type == LUAOBFUSACTOR_DECRYPT_STR_0("\173\9\155\53", "\204\217\108\227\65\98\85")) then
			local v830 = 0;
			local v831;
			while true do
				if (v830 == (1 + 0)) then
					v831 = v284:addText(v666.text, v666.x, v666.y, v666.color, v666.shadow, v666.scale, 0);
					if v666.shadow then
						v831:setShadow(true);
					end
					v830 = 2 + 0;
				end
				if (v830 == (1 + 1)) then
					if v666.center then
						local v1072 = 0;
						local v1073;
						while true do
							if (v1072 == (1433 - (797 + 636))) then
								v1073 = (v666.x + ((v666.x2 - v666.x) / (9 - 7))) - (v831:getScaledWidth() / (1621 - (1427 + 192)));
								v831:setX(v1073);
								break;
							end
						end
					end
					if (v831:getScaledWidth() > (v666.x2 - v666.x)) then
						local v1074 = v666.scale * ((v666.x2 - v666.x) / v831:getScaledWidth());
						v831:setScale(v1074);
					end
					break;
				end
				if (v830 == 0) then
					if not v666.shadow then
						v666.shadow = false;
					end
					if not v666.color then
						v666.color = v37.Colors.white;
					end
					v830 = 1 + 0;
				end
			end
		end
		if (v666.type == LUAOBFUSACTOR_DECRYPT_STR_0("\90\209\244\242\126\228", "\160\62\163\149\133\76")) then
			local v832 = v284:addDraw2D(v666.draw2D, v666.x, v666.y, v666.x + v666.width, v666.y + v666.height);
		end
	end
end;
v37.TwoD.render = function(v285)
	if (type(v285) ~= LUAOBFUSACTOR_DECRYPT_STR_0("\194\161\15\35\198", "\163\182\192\109\79")) then
		Chat:log("§e⚠ Warning: Renders is not a table");
		return false;
	end
	local v286 = Hud:createDraw2D();
	v286:setOnInit(JavaWrapper:methodToJavaAsync(function()
		pcall(function()
			v37.TwoD.onInit(v285, v286);
		end);
	end));
	v286:register();
	return v286;
end;
v37.ThreeD = {};
v37.ThreeD.render = function(v287)
	if (type(v287) ~= LUAOBFUSACTOR_DECRYPT_STR_0("\32\39\2\204\240", "\149\84\70\96\160")) then
		local v780 = 0;
		while true do
			if (v780 == (0 - 0)) then
				Chat:log("§e⚠ Warning: Renders is not a table");
				return false;
			end
		end
	end
	local v288 = Hud:createDraw3D();
	for v667, v668 in pairs(v287) do
		local v669 = 0;
		while true do
			if (v669 == (0 + 0)) then
				if (type(v668) ~= LUAOBFUSACTOR_DECRYPT_STR_0("\44\7\15\225\61", "\141\88\102\109")) then
					Chat:log("§e⚠ Warning: Render is not a table");
					return false;
				end
				if (type(v668[1 + 0]) == LUAOBFUSACTOR_DECRYPT_STR_0("\167\82\200\124\31", "\161\211\51\170\16\122\93\53")) then
					Chat:log("§e⚠ Warning: This Render should not be a table");
					return false;
				end
				v669 = 1;
			end
			if (v669 == (328 - (192 + 134))) then
				if (v668.type == LUAOBFUSACTOR_DECRYPT_STR_0("\239\188\179\43\254", "\72\155\206\210")) then
					if v668.pos then
						local v1078 = v288:traceLineBuilder():pos(v668.pos):color(v668.color):buildAndAdd();
						if v668.alpha then
							v1078:setAlpha(v668.alpha);
						end
					elseif (v668.x and v668.y and v668.z) then
						local v1106 = v288:addTraceLine(v668.x, v668.y, v668.z, v668.color);
						if v668.alpha then
							v1106:setAlpha(v668.alpha);
						end
					end
				end
				if (v668.type == LUAOBFUSACTOR_DECRYPT_STR_0("\86\117\93\0\39", "\83\38\26\52\110")) then
					local v1024 = v288:addPoint(v668.x, v668.y, v668.z, v668.radius, v668.color, 250, v668.cull);
					v1024:setColor(v37.Colors.black, 1531 - (316 + 960));
					v1024:setFillColor(v668.color, v668.transparency);
				end
				v669 = 2 + 1;
			end
			if (v669 == (1 + 0)) then
				if (v668.type == LUAOBFUSACTOR_DECRYPT_STR_0("\90\27\40\69\83", "\38\56\119\71")) then
					local v1025 = Sys.center(v668.BlockPosHelper);
					local v1026 = v288:addPoint(v1025:getX(), v1025:getY(), v1025:getZ(), 0.51 + 0, v668.color);
					v1026:setAlpha(v668.transparency);
					if v668.fillColor then
						v1026:setFillColor(v668.fillColor, v668.filltransparency);
					end
				end
				if (v668.type == LUAOBFUSACTOR_DECRYPT_STR_0("\246\225\76\223\49\79\199\253\89\213\32", "\54\147\143\56\182\69")) then
					local v1027 = v288:addEntityTraceLine(v668.entity, v668.color, v668.alpha, v668.yOffset);
					if v668.entity then
						v1027:setEntity(v668.entity);
					end
				end
				v669 = 7 - 5;
			end
			if (v669 == (554 - (83 + 468))) then
				if (v668.type == LUAOBFUSACTOR_DECRYPT_STR_0("\197\148\237\79\222\213\132", "\191\182\225\159\41")) then
					local v1028 = v288:surfaceBuilder():doesRotateToPlayer(true):boundOffset(1806 - (1202 + 604), v668.offSet, 0 - 0):cull(v668.cull):buildAndAdd();
					if v668.entity then
						v1028:bindToEntity(v668.entity);
					end
					if v668.size then
						v1028:setSize(v668.x, v668.y);
					end
				end
				break;
			end
		end
	end
	v288:register();
	return v288;
end;
v37.screen = {};
v37.screen.render = function(v289, v290, v291)
	if (type(v289) ~= LUAOBFUSACTOR_DECRYPT_STR_0("\63\19\42\89\142", "\162\75\114\72\53\235\231")) then
		Chat:log("§e⚠ Warning: Renders is not a table");
		return false;
	end
	ScreenRender = Hud:getOpenScreen() or Hud:createScreen(v2.Menu.name, false);
	local function v292()
		if v290 then
			v37.TwoD.onInit(v289, ScreenRender);
		end
		for v781, v782 in pairs(v289) do
			if (type(v782) ~= LUAOBFUSACTOR_DECRYPT_STR_0("\152\61\70\238\86", "\98\236\92\36\130\51")) then
				Chat:log("§e⚠ Warning: Render is not a table");
				return false;
			end
			if (type(v782[1 - 0]) == LUAOBFUSACTOR_DECRYPT_STR_0("\176\24\14\182\64", "\80\196\121\108\218\37\200\213")) then
				Chat:log("§e⚠ Warning: This Render should not be a table");
				Sys.printTable(v782);
				return false;
			end
			if (v782.type == LUAOBFUSACTOR_DECRYPT_STR_0("\2\102\22\107\68\0", "\234\96\19\98\31\43\110")) then
				if not v782.height then
					v782.height = 55 - 35;
				end
				if not v782.width then
					v782.width = 370 - (45 + 280);
				end
				local v867 = ScreenRender:addButton(v782.x, v782.y, v782.width, v782.height, v782.text, JavaWrapper:methodToJavaAsync(function(v976)
					v782.func(v976);
				end));
				if v782.scaleToText then
					v867:setWidth(v867:getLabel():getWidth() + 5 + 0);
				end
				if v782.tooltip then
					v867:addTooltip(Sys.stringToText(v782.tooltip));
				end
			elseif (v782.type == LUAOBFUSACTOR_DECRYPT_STR_0("\5\23\87\196\167\80\132\30", "\235\102\127\50\167\204\18")) then
				local v1031 = 0 + 0;
				local v1032;
				while true do
					if ((0 + 0) == v1031) then
						if not (v782.width or v782.height) then
							local v1117 = 0 + 0;
							while true do
								if (v1117 == 0) then
									v782.width = 4 + 16;
									v782.height = 37 - 17;
									break;
								end
							end
						end
						if not v782.text then
							v782.text = "";
						end
						v1031 = 1912 - (340 + 1571);
					end
					if (v1031 == 1) then
						v1032 = ScreenRender:addCheckbox(v782.x, v782.y, v782.width, v782.height, v782.text, v782.startingCheck, JavaWrapper:methodToJavaAsync(function(v1107)
							local v1108 = 0;
							while true do
								if (v1108 == 1) then
									if v782.func then
										v782.func();
									end
									break;
								end
								if (v1108 == (0 + 0)) then
									Data[v782.global] = not Data[v782.global];
									v1107:setTooltip({Sys.stringToText(tostring(v1107:isChecked()))});
									v1108 = 1773 - (1733 + 39);
								end
							end
						end));
						break;
					end
				end
			elseif (v782.type == LUAOBFUSACTOR_DECRYPT_STR_0("\67\173\252\39\65\60", "\78\48\193\149\67\36")) then
				if not v782.height then
					v782.height = 20;
				end
				if not v782.width then
					v782.width = 412 - 262;
				end
				if not v782.totalIncrements then
					v782.totalIncrements = 1134 - (125 + 909);
				end
				local v1079 = ScreenRender:addSlider(v782.x, v782.y, v782.width, v782.height, 1948 - (1096 + 852), v782.text, v782.intialValue / (45 + 55), v782.totalIncrements, JavaWrapper:methodToJavaAsync(function(v1098)
					v782.func(v1098:getValue() * 100);
				end));
				local v1080 = ScreenRender:addText(v782.text, v782.x, v782.y, v37.Colors.white, true, 1 - 0, 0);
				local v1081 = (v782.x + (v782.width / 2)) - (v1080:getScaledWidth() / (2 + 0));
				local v1082 = (v782.y + (v782.height / (514 - (409 + 103)))) - (v1080:getScaledHeight() / (238 - (46 + 190)));
				v1080:setX(v1081);
				v1080:setY(v1082);
			elseif (v782.type == LUAOBFUSACTOR_DECRYPT_STR_0("\51\7\131\20\72\62\25\162\13\85\36\17\142", "\33\80\126\224\120")) then
				local v1112 = 95 - (51 + 44);
				local v1113;
				while true do
					if (v1112 == (1 + 0)) then
						if not v782.table2 then
							v782.Table2 = v782.table;
						end
						if not v782.prefix then
							v782.prefix = "";
						end
						v1112 = 1319 - (1114 + 203);
					end
					if (v1112 == (726 - (228 + 498))) then
						if not v782.height then
							v782.height = 5 + 15;
						end
						if not v782.width then
							v782.width = 0 + 0;
						end
						v1112 = 664 - (174 + 489);
					end
					if (v1112 == (5 - 3)) then
						v1113 = ScreenRender:addCyclingButton(v782.x, v782.y, v782.width, v782.height, 1905 - (830 + 1075), v782.table, v782.table2, v782.table[525 - (303 + 221)], v782.prefix, JavaWrapper:methodToJavaAsync(function(v1129)
							v782.func(v1129:getValue());
						end));
						if (v782.width == (1269 - (231 + 1038))) then
							v1113:setWidth(v1113:getLabel():getWidth() + 9 + 1);
						end
						break;
					end
				end
			elseif (v782.type == LUAOBFUSACTOR_DECRYPT_STR_0("\248\173\27\208\117\226\184\22\208", "\60\140\200\99\164")) then
				if not v782.height then
					v782.height = 1182 - (171 + 991);
				end
				if not v782.width then
					v782.width = 185 - 140;
				end
				local v1121 = ScreenRender:addTextInput(v782.x, v782.y, v782.width, v782.height, v782.text, JavaWrapper:methodToJavaAsync(function(v1123)
					if v1123 then
						v782.func(v1123);
					end
				end));
				if v782.text then
					v1121:setText(v782.text);
				end
				if v782.maxCharacters then
					v1121:setMaxLength(v782.maxCharacters);
				end
				if v782.suggestion then
					v1121:setSuggestion(v782.suggestion);
				end
			end
		end
	end
	if v291 then
		ScreenRender:setOnClose(JavaWrapper:methodToJavaAsync(function()
			v291();
		end));
	end
	if not Hud:getOpenScreen() then
		local v783 = 0 - 0;
		while true do
			if (v783 == (0 - 0)) then
				ScreenRender:setOnInit(JavaWrapper:methodToJavaAsync(v292));
				Hud:openScreen(ScreenRender);
				break;
			end
		end
	else
		v292();
	end
	return ScreenRender;
end;
v37.TwoD.animation = {};
v37.TwoD.animation.rotateItem = function(v293, v294, v295, v296, v297, v298)
	if (v298 == nil) then
		v298 = 1 + 0;
	end
	for v670 = 0 - 0, 36 * v298 do
		local v671 = 0 - 0;
		local v672;
		local v673;
		while true do
			if (v671 == (0 - 0)) then
				v672 = {{[LUAOBFUSACTOR_DECRYPT_STR_0("\147\237\20\35", "\194\231\148\100\70")]=LUAOBFUSACTOR_DECRYPT_STR_0("\79\88\196\174", "\168\38\44\161\195\150"),x=v293,y=v294,[LUAOBFUSACTOR_DECRYPT_STR_0("\137\232\135\123\25\236", "\118\224\156\226\22\80\136\214")]=v295,[LUAOBFUSACTOR_DECRYPT_STR_0("\81\237\88\140\71", "\224\34\142\57")]=v296,[LUAOBFUSACTOR_DECRYPT_STR_0("\204\168\209\220\103\248\82\0", "\110\190\199\165\189\19\145\61")]=(v670 * (1258 - (111 + 1137)))}};
				v673 = v37.TwoD.render(v672);
				v671 = 1;
			end
			if (v671 == (159 - (91 + 67))) then
				Client:waitTick(v297);
				if v673 then
					v673:unregister();
				end
				break;
			end
		end
	end
end;
v37.TwoD.presets = {};
v37.TwoD.presets.Box = function(v299, v300, v301, v302, v303)
	local v304 = 0 - 0;
	while true do
		if ((0 + 0) == v304) then
			if not v303 then
				v303 = v37.Colors.black;
			end
			return {{[LUAOBFUSACTOR_DECRYPT_STR_0("\206\242\103\237", "\167\186\139\23\136\235")]=LUAOBFUSACTOR_DECRYPT_STR_0("\8\176\139\25", "\109\122\213\232"),x=v299,y=v300,[LUAOBFUSACTOR_DECRYPT_STR_0("\249\254\166\36\230", "\80\142\151\194")]=v301,[LUAOBFUSACTOR_DECRYPT_STR_0("\11\195\126\75\11\210", "\44\99\166\23")]=v302,[LUAOBFUSACTOR_DECRYPT_STR_0("\127\248\37\57\33", "\196\28\151\73\86\83")]=v303,[LUAOBFUSACTOR_DECRYPT_STR_0("\242\15\57\24\131", "\22\147\99\73\112\226\56\120")]=155},{[LUAOBFUSACTOR_DECRYPT_STR_0("\172\108\242\240", "\237\216\21\130\149")]=LUAOBFUSACTOR_DECRYPT_STR_0("\142\71\81\90", "\62\226\46\63\63\208\169"),[LUAOBFUSACTOR_DECRYPT_STR_0("\253\72", "\62\133\121\53\227\127\109\79")]=v299,[LUAOBFUSACTOR_DECRYPT_STR_0("\9\69", "\194\112\116\82\149\182\206")]=v300,[LUAOBFUSACTOR_DECRYPT_STR_0("\33\250", "\110\89\200\44\120\160\130")]=(v299 + v301),[LUAOBFUSACTOR_DECRYPT_STR_0("\178\145", "\45\203\163\43\38\35\42\91")]=v300,[LUAOBFUSACTOR_DECRYPT_STR_0("\209\138\208\44\149", "\52\178\229\188\67\231\201")]=v303,[LUAOBFUSACTOR_DECRYPT_STR_0("\53\73\89\7\252\82\38\50\82", "\67\65\33\48\100\151\60")]=(523.75 - (423 + 100)),[LUAOBFUSACTOR_DECRYPT_STR_0("\205\232\186\217\231\214\232\160", "\147\191\135\206\184")]=(0 + 0)},{[LUAOBFUSACTOR_DECRYPT_STR_0("\144\49\182\196", "\210\228\72\198\161\184\51")]=LUAOBFUSACTOR_DECRYPT_STR_0("\58\64\253\21", "\174\86\41\147\112\19"),[LUAOBFUSACTOR_DECRYPT_STR_0("\67\81", "\203\59\96\237\107\69\111\113")]=v299,[LUAOBFUSACTOR_DECRYPT_STR_0("\61\71", "\183\68\118\204\129\81\144")]=(v300 + v302),[LUAOBFUSACTOR_DECRYPT_STR_0("\22\255", "\226\110\205\16\132\107")]=(v299 + v301),[LUAOBFUSACTOR_DECRYPT_STR_0("\242\145", "\33\139\163\128\185")]=(v300 + v302),[LUAOBFUSACTOR_DECRYPT_STR_0("\84\87\8\209\69", "\190\55\56\100")]=v303,[LUAOBFUSACTOR_DECRYPT_STR_0("\66\167\53\29\24\237\246\69\188", "\147\54\207\92\126\115\131")]=(0.75 + 0),[LUAOBFUSACTOR_DECRYPT_STR_0("\31\62\33\124\25\119\2\63", "\30\109\81\85\29\109")]=(771 - (326 + 445))},{[LUAOBFUSACTOR_DECRYPT_STR_0("\235\104\68\179", "\156\159\17\52\214\86\190")]=LUAOBFUSACTOR_DECRYPT_STR_0("\162\230\179\185", "\220\206\143\221"),[LUAOBFUSACTOR_DECRYPT_STR_0("\158\44", "\178\230\29\77\119\184\172")]=v299,[LUAOBFUSACTOR_DECRYPT_STR_0("\236\239", "\152\149\222\106\123\23")]=v300,[LUAOBFUSACTOR_DECRYPT_STR_0("\197\116", "\213\189\70\150\35")]=v299,[LUAOBFUSACTOR_DECRYPT_STR_0("\86\7", "\104\47\53\20")]=(v300 + v302),[LUAOBFUSACTOR_DECRYPT_STR_0("\160\67\141\19\174", "\111\195\44\225\124\220")]=v303,[LUAOBFUSACTOR_DECRYPT_STR_0("\204\78\9\112\160\165\221\85\19", "\203\184\38\96\19\203")]=(0.75 - 0),[LUAOBFUSACTOR_DECRYPT_STR_0("\43\124\109\64\218\48\124\119", "\174\89\19\25\33")]=0},{[LUAOBFUSACTOR_DECRYPT_STR_0("\59\11\66\75", "\107\79\114\50\46\151\231")]=LUAOBFUSACTOR_DECRYPT_STR_0("\53\175\187\44", "\160\89\198\213\73\234\89\215"),[LUAOBFUSACTOR_DECRYPT_STR_0("\80\32", "\165\40\17\212\158")]=(v299 + v301),[LUAOBFUSACTOR_DECRYPT_STR_0("\252\136", "\70\133\185\104\83")]=v300,[LUAOBFUSACTOR_DECRYPT_STR_0("\28\23", "\169\100\37\36\74")]=(v299 + v301),[LUAOBFUSACTOR_DECRYPT_STR_0("\25\213", "\48\96\231\194")]=(v300 + v302),[LUAOBFUSACTOR_DECRYPT_STR_0("\203\85\2\34\11", "\227\168\58\110\77\121\184\207")]=v303,[LUAOBFUSACTOR_DECRYPT_STR_0("\111\52\182\67\186\213\116\182\104", "\197\27\92\223\32\209\187\17")]=(711.75 - (530 + 181)),[LUAOBFUSACTOR_DECRYPT_STR_0("\17\80\215\250\23\86\204\245", "\155\99\63\163")]=0}};
		end
	end
end;
v37.TwoD.presets.windowBackround = function(v305, v306, v307, v308, v309)
	if not v309 then
		v309 = v37.Colors.black;
	end
	return {{[LUAOBFUSACTOR_DECRYPT_STR_0("\150\200\177\136", "\228\226\177\193\237\217")]=LUAOBFUSACTOR_DECRYPT_STR_0("\56\185\45\227", "\134\84\208\67"),[LUAOBFUSACTOR_DECRYPT_STR_0("\11\253", "\60\115\204\230")]=v305,[LUAOBFUSACTOR_DECRYPT_STR_0("\254\107", "\16\135\90\139")]=(v306 + (33.7 - (19 + 13))),[LUAOBFUSACTOR_DECRYPT_STR_0("\76\38", "\24\52\20\102\83\46\52")]=(v305 + v307),[LUAOBFUSACTOR_DECRYPT_STR_0("\221\125", "\111\164\79\65\68")]=(v306 + (1.7 - 0)),[LUAOBFUSACTOR_DECRYPT_STR_0("\197\214\143\209\60", "\138\166\185\227\190\78")]=v309,[LUAOBFUSACTOR_DECRYPT_STR_0("\220\125\193\35\90", "\121\171\20\165\87\50\67")]=0.75,[LUAOBFUSACTOR_DECRYPT_STR_0("\212\55\173\55\173\11\201\54", "\98\166\88\217\86\217")]=(0 - 0)},{[LUAOBFUSACTOR_DECRYPT_STR_0("\226\239\105\4", "\188\150\150\25\97\230")]=LUAOBFUSACTOR_DECRYPT_STR_0("\200\140\92\22", "\141\186\233\63\98\108"),x=v305,y=v306,[LUAOBFUSACTOR_DECRYPT_STR_0("\230\227\40\162\45", "\69\145\138\76\214")]=v307,[LUAOBFUSACTOR_DECRYPT_STR_0("\120\202\128\142\183\2", "\118\16\175\233\233\223")]=(v306 + 2),[LUAOBFUSACTOR_DECRYPT_STR_0("\136\139\57\180\252", "\29\235\228\85\219\142\235")]=v309,[LUAOBFUSACTOR_DECRYPT_STR_0("\60\216\170\213\118", "\50\93\180\218\189\23\46\71")]=(728 - 473)},table.unpack(v37.TwoD.presets.Box(v305, v306, v307, v308, v309))};
end;
v37.TwoD.presets.toast = function(v310, v311)
	local v312 = 0 - 0;
	local v313;
	local v314;
	while true do
		if (v312 == (1 - 0)) then
			for v868, v869 in pairs(v37.paragraphText(v311, 225)) do
				table.insert(v314, {[LUAOBFUSACTOR_DECRYPT_STR_0("\202\189\75\73", "\40\190\196\59\44\36\188")]=LUAOBFUSACTOR_DECRYPT_STR_0("\40\64\196\160", "\109\92\37\188\212\154\29"),[LUAOBFUSACTOR_DECRYPT_STR_0("\16\234\188\215", "\58\100\143\196\163\81")]=v869,x=(v313.Width - (1964 - (1293 + 519))),y=((51 - 26) + ((v868 - (2 - 1)) * (13 - 6))),[LUAOBFUSACTOR_DECRYPT_STR_0("\2\16", "\110\122\34\67\195\95\41\133")]=v313.Width,[LUAOBFUSACTOR_DECRYPT_STR_0("\118\190\87\69\196", "\182\21\209\59\42")]=v37.Colors.white,[LUAOBFUSACTOR_DECRYPT_STR_0("\164\95\196\25\46\169", "\222\215\55\165\125\65")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\63\210\199\22\247", "\42\76\177\166\122\146\161\141")]=(0.6 - 0),[LUAOBFUSACTOR_DECRYPT_STR_0("\183\133\17\207\109\127\170\132", "\22\197\234\101\174\25")]=(0 - 0)});
			end
			return {table.unpack(v37.TwoD.presets.Box(v313.Width - (83 + 72), 10, 32 + 123, 116 - 66, v37.Colors.black)),{[LUAOBFUSACTOR_DECRYPT_STR_0("\57\45\181\217", "\230\77\84\197\188\22\207\183")]=LUAOBFUSACTOR_DECRYPT_STR_0("\237\17\222\232", "\85\153\116\166\156\236\193\144"),[LUAOBFUSACTOR_DECRYPT_STR_0("\176\229\85\167", "\96\196\128\45\211\132")]=v310,x=(v313.Width - (51 + 101)),y=13,[LUAOBFUSACTOR_DECRYPT_STR_0("\45\223", "\184\85\237\27\63\178\207\212")]=v313.Width,[LUAOBFUSACTOR_DECRYPT_STR_0("\11\86\5\80\26", "\63\104\57\105")]=v37.Colors.white,[LUAOBFUSACTOR_DECRYPT_STR_0("\24\143\165\64\4\144", "\36\107\231\196")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\78\182\163\139\88", "\231\61\213\194")]=1,[LUAOBFUSACTOR_DECRYPT_STR_0("\27\162\41\114\29\164\50\125", "\19\105\205\93")]=(0 + 0)},table.unpack(v314)};
		end
		if (v312 == 0) then
			v313 = Sys.getScreenSize();
			v314 = {};
			v312 = 1859 - (673 + 1185);
		end
	end
end;
v37.TwoD.infoWindow = function(v315)
	v37.TwoD.render({{[LUAOBFUSACTOR_DECRYPT_STR_0("\189\17\206\132", "\95\201\104\190\225")]=LUAOBFUSACTOR_DECRYPT_STR_0("\187\206\217\218", "\174\207\171\161"),[LUAOBFUSACTOR_DECRYPT_STR_0("\249\251\21\231", "\183\141\158\109\147\152")]=v315,x=(32 - 22),[LUAOBFUSACTOR_DECRYPT_STR_0("\52\91", "\108\76\105\134")]=155,y=11,[LUAOBFUSACTOR_DECRYPT_STR_0("\232\202\189\238\220", "\174\139\165\209\129")]=v37.Colors.white,[LUAOBFUSACTOR_DECRYPT_STR_0("\176\187\227\197\201\20", "\24\195\211\130\161\166\99\16")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\85\0\232\32\86", "\118\38\99\137\76\51")]=(0.6 - 0),[LUAOBFUSACTOR_DECRYPT_STR_0("\239\41\17\19\29\41\242\40", "\64\157\70\101\114\105")]=(0 + 0),[LUAOBFUSACTOR_DECRYPT_STR_0("\67\173\169\247\21\82", "\112\32\200\199\131")]=true},table.unpack(v37.TwoD.presets.windowBackround(13 - 3, 8, 36 + 109, 199 - 99))});
end;
Data.Graphics[LUAOBFUSACTOR_DECRYPT_STR_0("\24\95\93\171\215", "\66\76\48\60\216\163\203")] = {};
Data.Graphics[LUAOBFUSACTOR_DECRYPT_STR_0("\142\137\120\224\75", "\68\218\230\25\147\63\174")].queue = {};
Sys.Print.toast = function(v316, v317, v318)
	if not v318 then
		table.insert(Data.Graphics[LUAOBFUSACTOR_DECRYPT_STR_0("\153\37\82\95\162", "\214\205\74\51\44")].queue, {[LUAOBFUSACTOR_DECRYPT_STR_0("\206\69\246\240\114", "\23\154\44\130\156")]=v316,[LUAOBFUSACTOR_DECRYPT_STR_0("\37\163\181\186", "\115\113\198\205\206\86")]=v317});
	end
	if (#Data.Graphics[LUAOBFUSACTOR_DECRYPT_STR_0("\176\88\255\73\144", "\58\228\55\158")].queue == (1 - 0)) then
		local v785 = Data.Graphics[LUAOBFUSACTOR_DECRYPT_STR_0("\128\134\209\61\40", "\85\212\233\176\78\92\205")].queue[1881 - (446 + 1434)];
		local v786 = v37.TwoD.render({table.unpack(v37.TwoD.presets.toast(v785.Title, v785.Text))});
		Sys.onceAsync(LUAOBFUSACTOR_DECRYPT_STR_0("\97\93\145", "\130\42\56\232"), function()
			local v833 = 0 - 0;
			while true do
				if (v833 == 1) then
					table.remove(Data.Graphics[LUAOBFUSACTOR_DECRYPT_STR_0("\222\186\37\240\84", "\95\138\213\68\131\32")].queue, 1848 - (559 + 1288));
					if (#Data.Graphics[LUAOBFUSACTOR_DECRYPT_STR_0("\30\39\160\80\98", "\22\74\72\193\35")].queue ~= 0) then
						Sys.Print.toast(Data.Graphics[LUAOBFUSACTOR_DECRYPT_STR_0("\24\118\229\75\56", "\56\76\25\132")].queue[1932 - (609 + 1322)].title, Data.Graphics[LUAOBFUSACTOR_DECRYPT_STR_0("\106\206\170\53\219", "\175\62\161\203\70")].queue[455 - (13 + 441)].text, true);
					end
					break;
				end
				if (v833 == (0 - 0)) then
					Client:waitTick(200);
					v786:unregister();
					v833 = 2 - 1;
				end
			end
		end);
	end
end;
v37.ThreeD.blockEsp = function(v319, v320)
	v37.ThreeD.render({{[LUAOBFUSACTOR_DECRYPT_STR_0("\40\196\211\22", "\85\92\189\163\115")]=LUAOBFUSACTOR_DECRYPT_STR_0("\43\160\63\59\34", "\88\73\204\80"),[LUAOBFUSACTOR_DECRYPT_STR_0("\12\143\31\69\34\234\33\144\56\67\37\202\43\145", "\186\78\227\112\38\73")]=v319,[LUAOBFUSACTOR_DECRYPT_STR_0("\255\88\241\90\65", "\26\156\55\157\53\51")]=v37.Colors[v320],[LUAOBFUSACTOR_DECRYPT_STR_0("\152\202\23\215\171\64\141\202\19\215\187\73", "\48\236\184\118\185\216")]=255,[LUAOBFUSACTOR_DECRYPT_STR_0("\227\180\91\60\236\59\233\178\69", "\84\133\221\55\80\175")]=v37.Colors.black,[LUAOBFUSACTOR_DECRYPT_STR_0("\187\238\40\170\211\78\188\233\55\182\198\78\184\233\39\191", "\60\221\135\68\198\167")]=(4 + 96),[LUAOBFUSACTOR_DECRYPT_STR_0("\237\168\244\143", "\185\142\221\152\227\34")]=false}});
end;
v37.screen.presets = {};
v37.screen.buttonColumn = function(v321, v322, v323, v324, v325)
	local v326 = 0 - 0;
	local v327;
	while true do
		if (v326 == (1 + 0)) then
			return v327;
		end
		if (v326 == (0 + 0)) then
			v327 = {};
			for v870, v871 in pairs(v325) do
				local v872 = 0 - 0;
				while true do
					if (0 == v872) then
						if not (v871.text and v871.func) then
							Chat:log(LUAOBFUSACTOR_DECRYPT_STR_0("\117\204\68\233\74\61\240\24\241\82\226\87\115\248\74\133\113\239\77\48\227\81\202\89", "\151\56\165\55\154\35\83"));
							return {};
						end
						table.insert(v327, {[LUAOBFUSACTOR_DECRYPT_STR_0("\180\90\21\235", "\142\192\35\101")]=LUAOBFUSACTOR_DECRYPT_STR_0("\212\96\61\183\232\130", "\118\182\21\73\195\135\236\204"),x=v321,y=v322,[LUAOBFUSACTOR_DECRYPT_STR_0("\31\53\30\84\12", "\157\104\92\122\32\100\109")]=v323,[LUAOBFUSACTOR_DECRYPT_STR_0("\171\163\198\205\53\51", "\203\195\198\175\170\93\71\237")]=v324,[LUAOBFUSACTOR_DECRYPT_STR_0("\58\78\38\193", "\156\78\43\94\181\49\113")]=v871.text,[LUAOBFUSACTOR_DECRYPT_STR_0("\116\253\202\160", "\25\18\136\164\195\107\35")]=v871.func});
						v872 = 1;
					end
					if (v872 == (1 + 0)) then
						v322 = v322 + v324 + (8 - 3);
						break;
					end
				end
			end
			v326 = 1;
		end
	end
end;
v37.screen.buttonRow = function(v328, v329, v330, v331, v332, v333)
	local v334 = {};
	for v674, v675 in pairs(v332) do
		local v676 = 0;
		while true do
			if (v676 == 1) then
				table.insert(v334, {[LUAOBFUSACTOR_DECRYPT_STR_0("\252\52\185\74", "\216\136\77\201\47\18\220\161")]=LUAOBFUSACTOR_DECRYPT_STR_0("\47\249\63\206\7\210", "\226\77\140\75\186\104\188"),x=v328,y=v329,[LUAOBFUSACTOR_DECRYPT_STR_0("\174\199\212\43\71", "\47\217\174\176\95")]=v330,[LUAOBFUSACTOR_DECRYPT_STR_0("\176\216\127\5\186\64", "\70\216\189\22\98\210\52\24")]=v331,[LUAOBFUSACTOR_DECRYPT_STR_0("\206\218\187\147", "\179\186\191\195\231")]=v675.text,[LUAOBFUSACTOR_DECRYPT_STR_0("\255\42\22\231", "\132\153\95\120")]=v675.func});
				v328 = v328 + v330 + 4 + 1;
				break;
			end
			if ((0 + 0) == v676) then
				if not (v675.text and v675.func) then
					local v1033 = 0 + 0;
					while true do
						if (v1033 == (0 + 0)) then
							Chat:log(LUAOBFUSACTOR_DECRYPT_STR_0("\156\187\29\62\254\212\167\241\134\11\53\227\154\175\163\242\40\56\249\217\180\184\189\0", "\192\209\210\110\77\151\186"));
							return {};
						end
					end
				end
				if v333 then
					v330 = Sys.stringToText(v675.text):getWidth() + 10 + 0;
				end
				v676 = 434 - (153 + 280);
			end
		end
	end
	return v334;
end;
local function v62(v335, v336, v337, v338, v339)
	local v340 = v37.Colors.black;
	local v341 = v37.screen.buttonRow(v335, v336 + (5 - 3), v337, 9 + 1, v339, true);
	v37.screen.render({{[LUAOBFUSACTOR_DECRYPT_STR_0("\244\26\50\236", "\164\128\99\66\137\159")]=LUAOBFUSACTOR_DECRYPT_STR_0("\12\128\231\187", "\222\96\233\137"),[LUAOBFUSACTOR_DECRYPT_STR_0("\161\226", "\144\217\211\199\127\232\147")]=v335,[LUAOBFUSACTOR_DECRYPT_STR_0("\225\126", "\36\152\79\94\72\181\37\98")]=(v336 + 1.7 + 0),[LUAOBFUSACTOR_DECRYPT_STR_0("\207\138", "\95\183\184\39")]=(v335 + v337),[LUAOBFUSACTOR_DECRYPT_STR_0("\172\109", "\98\213\95\135\70\52\224")]=(v336 + 1.7),[LUAOBFUSACTOR_DECRYPT_STR_0("\253\172\197\120\70", "\52\158\195\169\23")]=v340,[LUAOBFUSACTOR_DECRYPT_STR_0("\109\181\54\96\142", "\235\26\220\82\20\230\85\27")]=(0.75 + 0),[LUAOBFUSACTOR_DECRYPT_STR_0("\154\174\253\195\96\129\174\231", "\20\232\193\137\162")]=(0 + 0)},{[LUAOBFUSACTOR_DECRYPT_STR_0("\54\198\213\163", "\17\66\191\165\198\135\236\119")]=LUAOBFUSACTOR_DECRYPT_STR_0("\29\170\173\7", "\177\111\207\206\115\159\136\140"),x=v335,y=v336,[LUAOBFUSACTOR_DECRYPT_STR_0("\18\128\20\0\220", "\63\101\233\112\116\180\47")]=v337,[LUAOBFUSACTOR_DECRYPT_STR_0("\203\62\228\21\240\34", "\86\163\91\141\114\152")]=(v336 + 2 + 0),[LUAOBFUSACTOR_DECRYPT_STR_0("\80\4\120\124\40", "\90\51\107\20\19")]=v340,[LUAOBFUSACTOR_DECRYPT_STR_0("\140\252\149\231\60", "\93\237\144\229\143")]=255},table.unpack(v37.TwoD.presets.Box(v335, v336, v337, v338, v340)),table.unpack(v341)}, true);
end
v37.screen.chestColumns = function(v342, v343, v344)
	return v37.screen.render({table.unpack(v37.screen.buttonColumn(v342, v343, 124 - 64, 1069 - (572 + 477), v344))});
end;
Data[LUAOBFUSACTOR_DECRYPT_STR_0("\54\249\254\10\4\74\16\218\255\30\24", "\38\117\150\144\121\107")] = {};
Data[LUAOBFUSACTOR_DECRYPT_STR_0("\25\190\227\42\1\180\233\41", "\90\77\219\142")] = {};
Sys.Print.LogToConsole = function()
	local v345 = 0 + 0;
	local v346;
	local v347;
	while true do
		if ((0 + 0) == v345) then
			if Data.Graphics[LUAOBFUSACTOR_DECRYPT_STR_0("\197\11\47\42\67\11\127", "\26\134\100\65\89\44\103")] then
				Data.Graphics[LUAOBFUSACTOR_DECRYPT_STR_0("\210\236\62\48\171\253\230", "\196\145\131\80\67")]:unregister();
			end
			v346 = {};
			v345 = 1 + 0;
		end
		if (v345 == (88 - (84 + 2))) then
			Data.Graphics[LUAOBFUSACTOR_DECRYPT_STR_0("\61\191\8\27\23\228\27", "\136\126\208\102\104\120")] = v37.TwoD.render(v346);
			Sys.onceAsync(LUAOBFUSACTOR_DECRYPT_STR_0("\83\143\215", "\49\24\234\174\35\207\50\93"), function()
				Client:waitTick(329 - 129);
				if (v347 == #Data[LUAOBFUSACTOR_DECRYPT_STR_0("\56\247\240\152\93\3\245\238", "\17\108\146\157\232")]) then
					local v1034 = 0 + 0;
					while true do
						if (v1034 == 0) then
							Data[LUAOBFUSACTOR_DECRYPT_STR_0("\127\198\25\253\3\167\76\208", "\200\43\163\116\141\79")] = {};
							Data.Graphics[LUAOBFUSACTOR_DECRYPT_STR_0("\156\57\51\144\191\248\230", "\131\223\86\93\227\208\148")]:unregister();
							break;
						end
					end
				end
			end);
			break;
		end
		if (v345 == (843 - (497 + 345))) then
			for v873, v874 in pairs(Data[LUAOBFUSACTOR_DECRYPT_STR_0("\215\64\187\166\49\186\228\86", "\213\131\37\214\214\125")]) do
				if (v873 > (#Data[LUAOBFUSACTOR_DECRYPT_STR_0("\18\46\40\175\205\41\44\54", "\129\70\75\69\223")] - (1 + 14))) then
					table.insert(v346, {[LUAOBFUSACTOR_DECRYPT_STR_0("\82\210\227\236", "\143\38\171\147\137\28")]=LUAOBFUSACTOR_DECRYPT_STR_0("\196\135\161\231", "\180\176\226\217\147\99\131"),[LUAOBFUSACTOR_DECRYPT_STR_0("\199\188\55\19", "\103\179\217\79")]=v874.text,x=(2 + 9),[LUAOBFUSACTOR_DECRYPT_STR_0("\82\229", "\195\42\215\124\181\33\236")]=(1478 - (605 + 728)),y=(15 + 5 + ((#v346 * (11.5 - 6)) - 2)),[LUAOBFUSACTOR_DECRYPT_STR_0("\14\86\59\49\55", "\152\109\57\87\94\69")]=v37.Colors.white,[LUAOBFUSACTOR_DECRYPT_STR_0("\234\223\11\167\177\197", "\200\153\183\106\195\222\178\52")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\33\224\137\49\76", "\58\82\131\232\93\41")]=(0.5 + 0),[LUAOBFUSACTOR_DECRYPT_STR_0("\145\88\196\20\73\54\140\89", "\95\227\55\176\117\61")]=0});
				end
			end
			v347 = #Data[LUAOBFUSACTOR_DECRYPT_STR_0("\44\123\46\91\135\23\121\48", "\203\120\30\67\43")];
			v345 = 7 - 5;
		end
	end
end;
Sys.Print.log = function(v348, v349)
	table.insert(Data.Logs.exit, v349 .. "" .. v348);
	if (v12[LUAOBFUSACTOR_DECRYPT_STR_0("\221\42\74\175\244\244\49\69\224\221", "\185\145\69\45\143")] == LUAOBFUSACTOR_DECRYPT_STR_0("\190\16\24\181\200", "\188\234\127\121\198")) then
		Chat:toast(v349, v348);
		return true;
	end
	if ((v12[LUAOBFUSACTOR_DECRYPT_STR_0("\20\61\20\195\21\55\7\139\55\54", "\227\88\82\115")] == LUAOBFUSACTOR_DECRYPT_STR_0("\96\16\180\180\13\127\70", "\19\35\127\218\199\98")) and (Sys.User.Lv(LUAOBFUSACTOR_DECRYPT_STR_0("\63\244\7\242\16\254\18", "\130\124\155\106")) >= 2)) then
		local v787 = 0;
		local v788;
		while true do
			if (v787 == (2 + 0)) then
				return true;
			end
			if (v787 == (0 - 0)) then
				v788 = ((v349 and (v349 .. "§7")) or "§7Menu: ") .. v348;
				table.insert(Data[LUAOBFUSACTOR_DECRYPT_STR_0("\246\196\248\188\172\250\121\147\218\204\229", "\223\181\171\150\207\195\150\28")], {[LUAOBFUSACTOR_DECRYPT_STR_0("\88\63\251\186", "\105\44\90\131\206")]=v788});
				v787 = 1;
			end
			if ((1 + 0) == v787) then
				table.insert(Data[LUAOBFUSACTOR_DECRYPT_STR_0("\203\229\191\169\36\49\248\243", "\94\159\128\210\217\104")], {[LUAOBFUSACTOR_DECRYPT_STR_0("\68\252\30\171", "\26\48\153\102\223\63\31\153")]=v788});
				Sys.Print.LogToConsole();
				v787 = 491 - (457 + 32);
			end
		end
	end
	Chat:log(v349 .. "" .. v348);
end;
local v68 = {[LUAOBFUSACTOR_DECRYPT_STR_0("\15\83\234", "\147\98\32\141")]=function(v350)
	Sys.Print.log("§f" .. v350, "§aConsole: ");
end,[LUAOBFUSACTOR_DECRYPT_STR_0("\20\76\228", "\43\120\35\131\170\102\54")]=function(v351)
	if v2[LUAOBFUSACTOR_DECRYPT_STR_0("\88\9\128\165", "\228\52\102\231\214\197\208")] then
		Sys.Print.log("§a" .. v351, "§fLog: ");
	end
end,[LUAOBFUSACTOR_DECRYPT_STR_0("\26\229\119\223\237", "\182\126\128\21\170\138\235\121")]=function(v352)
	if v12[LUAOBFUSACTOR_DECRYPT_STR_0("\135\213\50\245", "\102\235\186\85\134\230\115\80")][LUAOBFUSACTOR_DECRYPT_STR_0("\83\9\60\74\117", "\66\55\108\94\63\18\180")] then
		Chat:log("§dDebug: §f" .. v352);
	end
end,[LUAOBFUSACTOR_DECRYPT_STR_0("\3\140\151\57", "\57\116\237\229\87\71")]=function(v353)
	if v12[LUAOBFUSACTOR_DECRYPT_STR_0("\166\190\234\244", "\39\202\209\141\135\23\142")][LUAOBFUSACTOR_DECRYPT_STR_0("\232\50\27\4", "\152\159\83\105\106\82")] then
		Sys.Print.log("§f" .. v353, "§e⚠ Warning: ");
	end
end,[LUAOBFUSACTOR_DECRYPT_STR_0("\132\212\67\253\219", "\60\225\166\49\146\169")]=function(v354)
	local v355 = 0 + 0;
	while true do
		if (v355 == 0) then
			Sys.Print.log("§c" .. v354, "§4⚠ Error: ");
			if v12[LUAOBFUSACTOR_DECRYPT_STR_0("\9\11\35\38\18\4\61\27\42\36\65\8\33\94\10\60\4\9\59\13", "\103\79\126\79\74\97")] then
				Sys.fullscreen();
			end
			break;
		end
	end
end};
Sys.Print.massPrint = function(v356)
	for v677, v678 in pairs(v356) do
		v68.msg(v678);
	end
end;
if ((v12[LUAOBFUSACTOR_DECRYPT_STR_0("\150\112\212\51\115\31\174\119\220\119", "\122\218\31\179\19\62")] == LUAOBFUSACTOR_DECRYPT_STR_0("\144\217\195\210\198\173\64", "\37\211\182\173\161\169\193")) and (Sys.User.Lv(LUAOBFUSACTOR_DECRYPT_STR_0("\212\53\64\201\36\126\161", "\217\151\90\45\185\72\27")) >= 2)) then
	v37.TwoD.infoWindow(LUAOBFUSACTOR_DECRYPT_STR_0("\224\115\233\1\89\207\121\167\62\89\196\38", "\54\163\28\135\114"));
end
Sys.saveLog = function()
	local v357 = Time:time() .. LUAOBFUSACTOR_DECRYPT_STR_0("\101\254\69\139\90\63\4\212\90\204\90\103\60", "\31\72\187\61\226\46");
	Sys.writeFile(v357, Sys.Print.tableToString(Data.Logs.exit), LUAOBFUSACTOR_DECRYPT_STR_0("\140\10\76\213\84", "\68\163\102\35\178\39\30"));
end;
local v71 = {};
local v72 = {i=function()
	return Player:openInventory();
end,[LUAOBFUSACTOR_DECRYPT_STR_0("\170\105\202\194", "\113\222\16\186\167\99\213\227")]=function()
	return Player:openInventory():getType();
end,[LUAOBFUSACTOR_DECRYPT_STR_0("\45\6\254\229\58\61\247\249\58\29", "\150\78\110\155")]=function()
	if Player:openInventory():isContainer() then
		return #Player:openInventory():getSlots({LUAOBFUSACTOR_DECRYPT_STR_0("\134\202\41\245\165\23\177\69\151", "\32\229\165\71\129\196\126\223")});
	else
		local v789 = 0;
		while true do
			if (v789 == (0 + 0)) then
				v68.debug(LUAOBFUSACTOR_DECRYPT_STR_0("\237\134\208\193\128\149\192\129\193\146\149", "\181\163\233\164\225\225"));
				return 0 + 0;
			end
		end
	end
end,[LUAOBFUSACTOR_DECRYPT_STR_0("\83\131\59\100\68\191\55\99\92\142", "\23\48\235\94")]=function()
	return Player:openInventory():getContainerTitle();
end,[LUAOBFUSACTOR_DECRYPT_STR_0("\117\201\251\85\82\32\198", "\178\28\186\184\61\55\83")]=function()
	return Player:openInventory():isContainer() or (tostring(Player:openInventory()) ~= LUAOBFUSACTOR_DECRYPT_STR_0("\244\193\70\37\247\28\220\202\219\66\50\230\1\231\221\151\92\33", "\149\164\173\39\92\146\110"));
end,[LUAOBFUSACTOR_DECRYPT_STR_0("\245\46\30\27\51\15\246\42", "\123\147\71\112\127\122")]=function(v358, v359)
	local v360 = 0 - 0;
	local v361;
	while true do
		if (v360 == (1 + 0)) then
			for v875, v876 in pairs(Player:openInventory():getSlots(v359)) do
				if (Player:openInventory():getSlot(v876):getName():getString() == v358) then
					table.insert(v361, v876);
				end
			end
			if (#v361 > 0) then
				return v361;
			else
				return {};
			end
			break;
		end
		if (v360 == (796 - (588 + 208))) then
			if not v359 then
				v68.debug(LUAOBFUSACTOR_DECRYPT_STR_0("\226\194\194\124\71\220\221\139\127\65\140\218\131\98\6\203\196\148\116\72", "\38\172\173\226\17"));
				return false;
			end
			v361 = {};
			v360 = 2 - 1;
		end
	end
end,[LUAOBFUSACTOR_DECRYPT_STR_0("\75\24\34\235\100\53", "\143\45\113\76")]=function(v362, v363)
	if not v363 then
		local v790 = 0;
		while true do
			if (v790 == (1800 - (884 + 916))) then
				v68.debug(LUAOBFUSACTOR_DECRYPT_STR_0("\150\183\92\49\185\168\12\53\182\191\92\43\185\171\92\59\177\174\25\50", "\92\216\216\124"));
				return false;
			end
		end
	end
	local v364 = {};
	for v679, v680 in pairs(Player:openInventory():getSlots(v363)) do
		if (Player:openInventory():getSlot(v680):getItemId() == v362) then
			table.insert(v364, v680);
		end
	end
	if (#v364 > (0 - 0)) then
		return v364;
	else
		return {};
	end
end,[LUAOBFUSACTOR_DECRYPT_STR_0("\92\55\184\105\233\94\63\143\79\232\85\38", "\157\59\82\204\32")]=function(v365)
	local v366 = 0;
	while true do
		if (0 == v366) then
			for v877, v878 in pairs(Player:openInventory():getItemCount()) do
				if (v877 == v365) then
					return v878;
				end
			end
			return 0 + 0;
		end
	end
end,[LUAOBFUSACTOR_DECRYPT_STR_0("\41\43\234\249\226", "\209\88\94\131\154\137\138\179")]=function(v367)
	return Player:openInventory():quick(v367);
end,[LUAOBFUSACTOR_DECRYPT_STR_0("\44\179\203\108", "\66\72\193\164\28\126\67\81")]=function(v368)
	return Player:openInventory():dropSlot(v368);
end,[LUAOBFUSACTOR_DECRYPT_STR_0("\225\62\173\93\53\122\232\56\187", "\22\135\76\200\56\70")]=function()
	local v369 = 653 - (232 + 421);
	local v370;
	while true do
		if (v369 == (1889 - (1569 + 320))) then
			v370 = (9 + 27) - #Player:openInventory():getItems({LUAOBFUSACTOR_DECRYPT_STR_0("\128\49\241\42", "\129\237\80\152\68\61"),LUAOBFUSACTOR_DECRYPT_STR_0("\89\167\16\241\29\5", "\56\49\200\100\147\124\119")});
			return v370;
		end
	end
end,[LUAOBFUSACTOR_DECRYPT_STR_0("\207\50\176\227\201", "\144\172\94\223")]=function()
	Player:openInventory():close();
end};
local function v73(v371)
	local v372 = v72.i();
	if (not v371 or (v371 > v372:getTotalSlots())) then
		v68.debug(LUAOBFUSACTOR_DECRYPT_STR_0("\23\3\173\83\100\33\183\74\38\10\176\7\13\1\180\70\40\6\166", "\39\68\111\194"));
		v371 = 0 - 0;
		return false;
	end
	local v373 = v372:getSlot(v371);
	return {[LUAOBFUSACTOR_DECRYPT_STR_0("\194\167\229\203\124", "\215\182\198\135\167\25")]=true,s=function()
		return v373;
	end,[LUAOBFUSACTOR_DECRYPT_STR_0("\131\72\231\77", "\40\237\41\138")]=function()
		return v373:getName():getString();
	end,[LUAOBFUSACTOR_DECRYPT_STR_0("\238\80", "\42\167\20\154\152")]=function()
		return v373:getItemId();
	end,[LUAOBFUSACTOR_DECRYPT_STR_0("\69\236\171\69\120\47\75\242\140\67\124\36", "\65\42\158\194\34\17")]=function()
		return v373:getItem():getName();
	end,[LUAOBFUSACTOR_DECRYPT_STR_0("\22\40\64\9", "\142\122\71\50\108\77\141\123")]=function()
		return v373:getLore();
	end,[LUAOBFUSACTOR_DECRYPT_STR_0("\25\173\237\29\55\28\172\250", "\91\117\194\159\120")]=function(v681)
		return v373:getLore()[v681];
	end,[LUAOBFUSACTOR_DECRYPT_STR_0("\25\17\55\27\62", "\68\122\125\94\120\85\145")]=function(v682, v683)
		local v684 = 0;
		while true do
			if (v684 == (605 - (316 + 289))) then
				v372:click(v371, v683);
				if v682 then
					JsMacros:waitForEvent(LUAOBFUSACTOR_DECRYPT_STR_0("\56\12\202\80\251\218\168\18\25\193", "\218\119\124\175\62\168\185"));
					Sys.wait(10);
				end
				break;
			end
		end
	end,[LUAOBFUSACTOR_DECRYPT_STR_0("\180\229\65\199\174", "\164\197\144\40")]=function()
		return v372:quick(v371);
	end,[LUAOBFUSACTOR_DECRYPT_STR_0("\135\226\165\155", "\214\227\144\202\235\189")]=function()
		return v372:dropSlot(v371);
	end,[LUAOBFUSACTOR_DECRYPT_STR_0("\254\178\134\107", "\92\141\197\231\27\112\211\51")]=function(v685)
		if (not v372:getHeld():getName():getString() ~= LUAOBFUSACTOR_DECRYPT_STR_0("\199\246\152", "\177\134\159\234\195")) then
			local v835 = 0 - 0;
			while true do
				if (v835 == 2) then
					JsMacros:waitForEvent(LUAOBFUSACTOR_DECRYPT_STR_0("\142\231\48\180\252\173\239\62\180\204", "\169\221\139\95\192"));
					Client:waitTick();
					break;
				end
				if ((0 + 0) == v835) then
					v372:click(v371);
					JsMacros:waitForEvent(LUAOBFUSACTOR_DECRYPT_STR_0("\237\135\112\43\23\54\218\138\107\58", "\70\190\235\31\95\66"));
					v835 = 1454 - (666 + 787);
				end
				if (1 == v835) then
					Client:waitTick();
					v372:click(v685);
					v835 = 2;
				end
			end
		end
	end,[LUAOBFUSACTOR_DECRYPT_STR_0("\189\240\27\228\214\174\227\25\237", "\133\218\130\122\134")]=function()
		if (v373:getCount() < v373:getMaxCount()) then
			local v836 = 425 - (360 + 65);
			while true do
				if (v836 == (2 + 0)) then
					JsMacros:waitForEvent(LUAOBFUSACTOR_DECRYPT_STR_0("\15\243\236\208\233\179\60\61\235\230", "\88\92\159\131\164\188\195"));
					Client:waitTick();
					break;
				end
				if (v836 == (255 - (79 + 175))) then
					Client:waitTick();
					v372:click(v371);
					v836 = 2;
				end
				if (v836 == (0 - 0)) then
					v372:grabAll(v371);
					JsMacros:waitForEvent(LUAOBFUSACTOR_DECRYPT_STR_0("\179\34\176\95\226\251\217\129\58\186", "\189\224\78\223\43\183\139"));
					v836 = 1 + 0;
				end
			end
		end
	end};
end
local function v74()
	local v374 = Player:getPlayer();
	local v375 = v374:getOffHand();
	local function v376(v686)
		return {[LUAOBFUSACTOR_DECRYPT_STR_0("\32\253\135\19", "\161\78\156\234\118")]=v686:getName():getString(),[LUAOBFUSACTOR_DECRYPT_STR_0("\168\165\192\219\174\185\200\208\137\182\196\217", "\188\199\215\169")]=v686:getItem():getName(),[LUAOBFUSACTOR_DECRYPT_STR_0("\245\13", "\136\156\105\63\27")]=v686:getItemId(),[LUAOBFUSACTOR_DECRYPT_STR_0("\18\152\124\57", "\84\123\236\25")]=v686};
	end
	local v377 = v374:getBlockPos();
	return {[LUAOBFUSACTOR_DECRYPT_STR_0("\248\132\190\21\173\167", "\213\144\235\202\119\204")]=v72.i():getSelectedHotbarSlotIndex(),[LUAOBFUSACTOR_DECRYPT_STR_0("\43\25\208\46", "\45\67\120\190\74\72\67")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\45\35\228\171", "\137\64\66\141\197\153\232\142")]=v376(v374:getMainHand()),[LUAOBFUSACTOR_DECRYPT_STR_0("\12\214\36", "\232\99\176\66\198")]=v376(v374:getOffHand())},[LUAOBFUSACTOR_DECRYPT_STR_0("\238\45\39\5\112\189\246\63", "\76\140\65\72\102\27\237\153")]=v377,[LUAOBFUSACTOR_DECRYPT_STR_0("\122\213\5", "\222\42\186\118\178\183\97")]=v374:getPos(),[LUAOBFUSACTOR_DECRYPT_STR_0("\88\245\65\186\82\255", "\234\61\140\36")]=v374:getEyePos():toBlockPos(),X=v374:getPos()['x'],Y=v374:getPos()['y'],Z=v374:getPos()['z'],[LUAOBFUSACTOR_DECRYPT_STR_0("\49\210\169", "\111\65\189\218\18")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\65\71\20\54\0", "\207\35\43\123\85\107\60")]={x=v377:getX(),y=v377:getY(),z=v377:getZ()}},[LUAOBFUSACTOR_DECRYPT_STR_0("\73\171\183", "\25\16\202\192\138")]=v374:getYaw(),[LUAOBFUSACTOR_DECRYPT_STR_0("\205\194\185\225\161", "\148\157\171\205\130\201")]=v374:getPitch(),[LUAOBFUSACTOR_DECRYPT_STR_0("\39\221\102\44\210\226\42\219\122", "\150\67\180\20\73\177")]=v374:getFacingDirection(),[LUAOBFUSACTOR_DECRYPT_STR_0("\137\17\8\78\163\25\23\72", "\45\237\120\122")]=v374:getFacingDirection():getName(),[LUAOBFUSACTOR_DECRYPT_STR_0("\216\230\133\62\216\253\172\40", "\76\183\136\194")]=v374:isOnGround(),[LUAOBFUSACTOR_DECRYPT_STR_0("\105\246\224\61\84", "\116\26\134\133\88\48\47")]=Player:getPlayer():getSpeed(),[LUAOBFUSACTOR_DECRYPT_STR_0("\13\212\169\240\188\112\18\196\148\235\178\126", "\18\126\161\192\132\221")]=function(v687)
		return v374:getMainHand():isSuitableFor(v687:getBlockStateHelper());
	end};
end
v71.entityData = function(v378)
	if not v378 then
		local v791 = 0 - 0;
		while true do
			if (0 == v791) then
				v68.debug(LUAOBFUSACTOR_DECRYPT_STR_0("\113\39\238\33\88\75\33\186\29\22\121\39\187\10\82", "\54\63\72\206\100"));
				return {[LUAOBFUSACTOR_DECRYPT_STR_0("\220\88\71\118\224", "\27\168\57\37\26\133")]=false};
			end
		end
	end
	return {[LUAOBFUSACTOR_DECRYPT_STR_0("\57\171\126\164\210", "\183\77\202\28\200")]=true,e=v378,[LUAOBFUSACTOR_DECRYPT_STR_0("\35\42\153\13", "\104\119\83\233")]=v378:getType(),[LUAOBFUSACTOR_DECRYPT_STR_0("\219\249\42\39", "\35\149\152\71\66")]=v378:getName():getString(),[LUAOBFUSACTOR_DECRYPT_STR_0("\49\237\67\188\46\17", "\90\121\136\34\208")]=function()
		return v378:getHealth();
	end,[LUAOBFUSACTOR_DECRYPT_STR_0("\197\2\90\29\204\62\90\13", "\126\167\110\53")]=v378:getBlockPos(),[LUAOBFUSACTOR_DECRYPT_STR_0("\26\28\33\239\213\49\58", "\95\93\112\78\152\188")]=v378:isGlowing(),[LUAOBFUSACTOR_DECRYPT_STR_0("\232\251\145\16\246\191\209\213", "\178\161\149\229\117\132\222")]=function(v688)
		local v689 = 0 - 0;
		while true do
			if (v689 == (899 - (503 + 396))) then
				if not v688 then
					v688 = false;
				end
				Player:getInteractionManager():interactEntity(v378, v688);
				break;
			end
		end
	end,[LUAOBFUSACTOR_DECRYPT_STR_0("\129\200\240\163\163", "\67\232\187\189\204\193\118\198")]=function()
		local v690 = 181 - (92 + 89);
		while true do
			if (v690 == (0 - 0)) then
				if (tostring(v378:getClass()):find(LUAOBFUSACTOR_DECRYPT_STR_0("\134\33\183", "\143\235\78\213\64\91\98")) or tostring(v378:getClass()):find(LUAOBFUSACTOR_DECRYPT_STR_0("\157\73\151\250\121\160\136", "\214\237\40\228\137\16"))) then
					return true;
				end
				return false;
			end
		end
	end,[LUAOBFUSACTOR_DECRYPT_STR_0("\150\230\251\237\2\180\130\230\251", "\198\229\131\143\185\99")]=function()
		Player:getInteractionManager():setTarget(v378);
	end,[LUAOBFUSACTOR_DECRYPT_STR_0("\85\133\187\103\80\130\171\118", "\19\49\236\200")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\248\37\249\186\212\182\255\46\243\165", "\218\158\87\150\215\132")]=function()
		return Player:getPlayer():distanceTo(v378);
	end}};
end;
v71.Entity = function(v379, v380)
	local v381 = 0;
	local v382;
	while true do
		if (0 == v381) then
			v382 = Player:rayTraceEntity(v379);
			if (not v382 or (v380 and (not v382:getType() == v380))) then
				return {[LUAOBFUSACTOR_DECRYPT_STR_0("\239\31\219\238\51", "\173\155\126\185\130\86\66")]=false};
			end
			v381 = 1 + 0;
		end
		if (v381 == 1) then
			return {[LUAOBFUSACTOR_DECRYPT_STR_0("\241\167\184\203\141", "\140\133\198\218\167\232")]=true,e=v382,[LUAOBFUSACTOR_DECRYPT_STR_0("\177\47\160\124", "\228\213\78\212\29")]=v71.entityData(v382),[LUAOBFUSACTOR_DECRYPT_STR_0("\174\66\162\0\249\134\79\162", "\139\231\44\214\101")]=function(v879)
				local v880 = 0 + 0;
				while true do
					if (v880 == (0 - 0)) then
						if not v879 then
							v879 = false;
						end
						Player:getInteractionManager():interactEntity(v382, v879);
						break;
					end
				end
			end};
		end
	end
end;
v71.getEntities = function(v383, v384)
	local v385 = {};
	for v691, v692 in pairs(World:getEntities(v383)) do
		if (v692:getType() == v384) then
			table.insert(v385, v71.entityData(v692));
		end
	end
	return v385;
end;
v71.Item = function(v386)
	if (not v386 or (v386:getName():getString() == LUAOBFUSACTOR_DECRYPT_STR_0("\248\230\20", "\118\185\143\102\62\112\209\81"))) then
		return setmetatable({}, {[LUAOBFUSACTOR_DECRYPT_STR_0("\99\79\32\232\161\16\4", "\88\60\16\73\134\197\117\124")]=function()
			return false;
		end,[LUAOBFUSACTOR_DECRYPT_STR_0("\111\213\251\201\77\92", "\33\48\138\152\168")]=function()
			return false;
		end});
	end
	return {[LUAOBFUSACTOR_DECRYPT_STR_0("\123\18", "\87\18\118\80\49\161")]=v386:getItemId(),[LUAOBFUSACTOR_DECRYPT_STR_0("\66\31\215\165", "\208\44\126\186\192")]=v386:getName():getString(),[LUAOBFUSACTOR_DECRYPT_STR_0("\243\15\182\199", "\46\151\122\196\166\116\156\169")]=function()
		local v693 = 0 + 0;
		local v694;
		while true do
			if (0 == v693) then
				v694 = v386:isDamageable();
				return {[LUAOBFUSACTOR_DECRYPT_STR_0("\232\236\94", "\155\133\141\38\122")]=function()
					if v694 then
						return v386:getMaxDurability();
					end
					return 2280 - 1280;
				end,[LUAOBFUSACTOR_DECRYPT_STR_0("\38\63\190\83\74\113\177", "\197\69\74\204\33\47\31")]=function()
					local v978 = 0 + 0;
					while true do
						if (v978 == (0 + 0)) then
							if v694 then
								return v386:getDurability();
							end
							return 3045 - 2045;
						end
					end
				end};
			end
		end
	end,[LUAOBFUSACTOR_DECRYPT_STR_0("\243\64\85\139\212\64\77\137", "\231\144\47\58")]=function()
		return v386:isOnCooldown();
	end,[LUAOBFUSACTOR_DECRYPT_STR_0("\161\205\211\97\25\63\195\60\148\215\200", "\89\210\184\186\21\120\93\175")]=function(v695)
		if v695 then
			return v386:isSuitableFor(v695);
		end
	end,[LUAOBFUSACTOR_DECRYPT_STR_0("\191\71\126", "\90\209\51\28\181\25")]=function()
		return v386:getNBT();
	end};
end;
v71.blockdata = function(v387)
	local v388 = 0 + 0;
	while true do
		if ((0 - 0) == v388) then
			if not v387 then
				local v979 = 1244 - (485 + 759);
				while true do
					if (v979 == (0 - 0)) then
						v68.debug(LUAOBFUSACTOR_DECRYPT_STR_0("\254\116\23\204\179\223\120\92\174\153\223\110\89\234", "\223\176\27\55\142"));
						return {};
					end
				end
			end
			if (Sys.classType(v387) == LUAOBFUSACTOR_DECRYPT_STR_0("\6\183\193\182\47\139\193\166\12\190\194\165\33\169", "\213\68\219\174")) then
				v387 = World:getBlock(v387);
			end
			v388 = 1;
		end
		if (v388 == (1190 - (442 + 747))) then
			return {[LUAOBFUSACTOR_DECRYPT_STR_0("\15\225\55\230", "\31\107\128\67\135\74\165\95")]=v387,[LUAOBFUSACTOR_DECRYPT_STR_0("\214\233\241\72", "\209\184\136\156\45\33")]=v387:getName():getString(),[LUAOBFUSACTOR_DECRYPT_STR_0("\55\199\102", "\216\103\168\21\104")]=v387:getBlockPos(),Y=v387:getBlockPos():getY(),X=v387:getBlockPos():getX(),Z=v387:getBlockPos():getZ(),[LUAOBFUSACTOR_DECRYPT_STR_0("\91\168\77\176\125\191", "\196\24\205\35")]=function(v881)
				local v882 = 0;
				while true do
					if (v882 == (1135 - (832 + 303))) then
						if not v881 then
							v881 = 946.5 - (88 + 858);
						end
						return Sys.center(v387:getBlockPos(), v881);
					end
				end
			end,[LUAOBFUSACTOR_DECRYPT_STR_0("\61\159\226\18\43", "\102\78\235\131")]=v387:getBlockStateHelper(),[LUAOBFUSACTOR_DECRYPT_STR_0("\246\33\59\79\65\54\165", "\84\154\78\84\36\39\89\215")]=function(v883)
				for v980, v981 in pairs(v883) do
					local v982 = 0 + 0;
					local v983;
					while true do
						if (v982 == 1) then
							if ((v981 ~= LUAOBFUSACTOR_DECRYPT_STR_0("\234\224\66\93\23", "\101\157\129\54\56")) and (v983:lower() == v981:lower())) then
								return v71.blockdata(v387);
							end
							break;
						end
						if (v982 == 0) then
							v983 = v387:getName():getString();
							if ((v981 == LUAOBFUSACTOR_DECRYPT_STR_0("\10\168\158\174\49", "\25\125\201\234\203\67")) and v983:find(LUAOBFUSACTOR_DECRYPT_STR_0("\110\245\12\6\6", "\115\25\148\120\99\116\71"))) then
								return v71.blockdata(v387);
							end
							v982 = 1;
						end
					end
				end
				return false;
			end,[LUAOBFUSACTOR_DECRYPT_STR_0("\5\46\154\54\78\28", "\33\108\93\217\68")]=function()
				local v884 = 0 + 0;
				local v885;
				while true do
					if (v884 == 0) then
						v885 = {LUAOBFUSACTOR_DECRYPT_STR_0("\249\78\164\185\201\68\174\185\200", "\205\187\43\193"),LUAOBFUSACTOR_DECRYPT_STR_0("\208\119\17\215\251\96\69\232\255\96\17", "\191\158\18\101"),LUAOBFUSACTOR_DECRYPT_STR_0("\230\194\149\165\160\209\208", "\207\165\163\231\215"),LUAOBFUSACTOR_DECRYPT_STR_0("\246\246\237\87\48\127\195\234", "\16\166\153\153\54\68"),LUAOBFUSACTOR_DECRYPT_STR_0("\229\187\197\71\32\97\218\192\188\208\85", "\153\178\211\160\38\84\65"),LUAOBFUSACTOR_DECRYPT_STR_0("\177\28\95\46\150\75\120\46\144\25\67\107\160\30\73\35", "\75\226\107\58")};
						for v1083, v1084 in pairs(v885) do
							if (v71.blockdata(v387).name == v1084) then
								return v71.blockdata(v387);
							end
						end
						v884 = 1 - 0;
					end
					if (v884 == (2 - 1)) then
						return false;
					end
				end
			end};
		end
	end
end;
v71.Block = function(v389, v390)
	local v391 = 0;
	local v392;
	local v393;
	while true do
		if (v391 == 3) then
			if v393 then
				return {[LUAOBFUSACTOR_DECRYPT_STR_0("\106\223\8\121\16\209\217", "\173\56\190\113\26\113\162")]=v392,[LUAOBFUSACTOR_DECRYPT_STR_0("\207\223\57\4", "\151\171\190\77\101")]=v393,[LUAOBFUSACTOR_DECRYPT_STR_0("\230\42\246\189\253\111", "\107\165\79\152\201\152\29")]=function(v1035)
					local v1036 = 0 - 0;
					while true do
						if (v1036 == (1073 - (1036 + 37))) then
							if (v392:getSide():getName() == LUAOBFUSACTOR_DECRYPT_STR_0("\66\94", "\31\55\46\136\171\52")) then
								v1035 = 1 + 0;
							end
							return Sys.center(v393:getBlockPos(), v1035);
						end
					end
				end,[LUAOBFUSACTOR_DECRYPT_STR_0("\226\33\216\241", "\148\177\72\188")]=v392:getSide(),[LUAOBFUSACTOR_DECRYPT_STR_0("\170\179\81\199", "\179\198\214\55")]=function(v1037)
					if not v1037 then
						v1037 = 1;
					end
					return v71.blockdata(v392:getBlockPos():offset(v74().direction:getLeft():getName(), v1037));
				end,[LUAOBFUSACTOR_DECRYPT_STR_0("\226\5\117\126\81", "\179\144\108\18\22\37")]=function(v1038)
					if not v1038 then
						v1038 = 1 - 0;
					end
					return v71.blockdata(v392:getBlockPos():offset(v74().direction:getRight():getName(), v1038));
				end};
			else
				return false;
			end
			break;
		end
		if (v391 == (2 + 0)) then
			if v392:isMissed() then
				return {[LUAOBFUSACTOR_DECRYPT_STR_0("\244\162\2\138\206\213\183", "\175\166\195\123\233")]=v392};
			end
			v393 = v71.blockdata(v392:getBlockPos());
			v391 = 1483 - (641 + 839);
		end
		if (v391 == (913 - (910 + 3))) then
			if not v390 then
				v390 = false;
			end
			if not v389 then
				v68.debug(LUAOBFUSACTOR_DECRYPT_STR_0("\193\205\29\77\249\252\214\92\71\243\234\130\74\72\227\175\197\84\95\245\225", "\144\143\162\61\41"));
				return {};
			end
			v391 = 1;
		end
		if (v391 == (2 - 1)) then
			v392 = Player:detailedRayTraceBlock(v389, v390);
			if (not v390 and v392:isInsideBlock()) then
				return {};
			end
			v391 = 1686 - (1466 + 218);
		end
	end
end;
Data.chatlog = {};
v71.watchChat = function(v394)
	local v395 = 0 + 0;
	while true do
		if (v395 == 1) then
			if (Data.chatlog[v394] == nil) then
				local v984 = JsMacros:on(LUAOBFUSACTOR_DECRYPT_STR_0("\210\214\30\70\95\130\32\243\210\26\85", "\83\128\179\125\48\18\231"), false, JavaWrapper:methodToJavaAsync(function(v1039)
					if (not Data.chatlog[v394] and v1039.text:getString():find(v394)) then
						v68.log("Message Found > §6" .. v1039.text:getString());
						Data.chatlog[v394] = true;
						JsMacros:off(spy);
					end
				end));
			end
			if (Data.chatlog[v394] == true) then
				return true;
			else
				return false;
			end
			break;
		end
		if (v395 == (1148 - (556 + 592))) then
			if ((Data.chatlog[v394] ~= nil) and (Data.chatlog[v394] == false)) then
				return false;
			end
			if (Data.chatlog[v394] == true) then
				return true;
			end
			v395 = 1;
		end
	end
end;
v71.searchSB = function(v396)
	local v397 = 0 + 0;
	while true do
		if (v397 == (810 - (329 + 479))) then
			return false;
		end
		if (v397 == 1) then
			v68.log(v396);
			for v886, v887 in pairs(World:getScoreboards():getObjectiveSlot(855 - (174 + 680)):getKnownPlayersDisplayNames()) do
				local v888 = 0 - 0;
				while true do
					if (v888 == 0) then
						v68.log(v887:getString());
						if v887:getString():find(v396) then
							return true, v887:getString();
						end
						break;
					end
				end
			end
			v397 = 3 - 1;
		end
		if (v397 == 0) then
			if not (World:getScoreboards() or World:getScoreboards():getObjectiveSlot(1)) then
				local v985 = 0 + 0;
				while true do
					if (v985 == 0) then
						v68.log(LUAOBFUSACTOR_DECRYPT_STR_0("\110\180\252\207\66\94\95\184\242\207\67\94\83\184\231\157\65\17\72\185\247", "\126\61\215\147\189\39"));
						return false;
					end
				end
			end
			v68.log(LUAOBFUSACTOR_DECRYPT_STR_0("\107\250\28\87\123\247\46\103", "\37\24\159\125"));
			v397 = 1;
		end
	end
end;
v71.SearchLore = function(v398, v399)
	for v696, v697 in pairs(v398:getLore()) do
		if v697:getString():find(v399) then
			return v697:getString():find(v399);
		end
	end
	return false;
end;
v71.matchLore = function(v400, v401)
	for v698, v699 in pairs(v400:getLore()) do
		if v699:getString():match(v401) then
			return v699:getString():match(v401);
		end
	end
	return false;
end;
v71.surroundingBlocks = function()
	local v402 = {};
	local v403 = {[LUAOBFUSACTOR_DECRYPT_STR_0("\214\163\115\86", "\34\186\198\21")]=v74().direction:getLeft(),[LUAOBFUSACTOR_DECRYPT_STR_0("\234\1\194\85\214", "\162\152\104\165\61")]=v74().direction:getRight(),[LUAOBFUSACTOR_DECRYPT_STR_0("\207\46\177\118", "\133\173\79\210\29\16")]=v74().direction:getOpposite(),[LUAOBFUSACTOR_DECRYPT_STR_0("\139\110\226\37\153", "\75\237\28\141")]=v74().direction};
	for v700, v701 in pairs(v403) do
		local v702 = v71.blockdata(World:getBlock(v74().blockPos:offset(v701:getName(), 740 - (396 + 343))));
		local v703 = v71.blockdata(World:getBlock(v74().blockPos:offset(v701:getName(), 1 + 0):offset(0, 1478 - (29 + 1448), 1389 - (135 + 1254))));
		v402[v700] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\216\86\222\180\44\15\238\238\210", "\129\188\63\172\209\79\123\135")]=v701,[LUAOBFUSACTOR_DECRYPT_STR_0("\70\225\227\217", "\173\32\132\134")]=v702,[LUAOBFUSACTOR_DECRYPT_STR_0("\70\30\9\235", "\173\46\123\104\143\206\81")]=v703};
	end
	return v402;
end;
v71.nextFourBlocks = function()
	local v404 = v71.Block(4, true);
	if not v404 then
		return {};
	end
	local v405 = {};
	local v406 = (14 - 10) - math.floor(v404.Pos:distanceTo(v74().eyePos));
	if (v404.Side:getOpposite():getName() == LUAOBFUSACTOR_DECRYPT_STR_0("\176\18\53\132", "\97\212\125\66\234\37\227")) then
		v406 = v406 + (4 - 3);
	end
	for v705 = 0 + 0, v406 do
		table.insert(v405, World:getBlock(v404.data.Pos:offset(v404.Side:getOpposite():getName(), v705)));
	end
	return v405;
end;
v71.copyTextFormat = function(v407)
	local v408 = 1527 - (389 + 1138);
	local v409;
	local v410;
	while true do
		if (v408 == (575 - (102 + 472))) then
			v410 = "&";
			v407:visit(JavaWrapper:methodToJava(function(v889, v890)
				local v891 = (v889:getFormatting() and string.char(v889:getFormatting():getCode())) or nil;
				local v892 = v889:getColorName();
				local v893 = {[LUAOBFUSACTOR_DECRYPT_STR_0("\136\236\186\49", "\126\234\131\214\85")]=((v889:bold() and (v410 .. "l")) or ""),[LUAOBFUSACTOR_DECRYPT_STR_0("\141\193\72\86\70\135", "\47\228\181\41\58")]=((v889:italic() and (v410 .. "o")) or ""),[LUAOBFUSACTOR_DECRYPT_STR_0("\179\242\221\62\17\60\22\168\249\221", "\127\198\156\185\91\99\80")]=((v889:underlined() and (v410 .. "n")) or ""),[LUAOBFUSACTOR_DECRYPT_STR_0("\230\14\222\249\172\14\45\214\231\21\217\247\175", "\190\149\122\172\144\199\107\89")]=((v889:strikethrough() and (v410 .. "m")) or ""),[LUAOBFUSACTOR_DECRYPT_STR_0("\61\7\247\235\237\49\4\229\251\250", "\158\82\101\145\158")]=((v889:obfuscated() and (v410 .. "k")) or "")};
				v409 = v409 .. ((v891 and (v410 .. v891)) or "");
				v409 = v409 .. ((not v891 and v892 and (v410 .. v892)) or "");
				for v986, v987 in pairs(v893) do
					v409 = v409 .. v987;
				end
				v409 = v409 .. v890;
			end));
			v408 = 2 + 0;
		end
		if (v408 == (0 + 0)) then
			if not v407 then
				return false;
			end
			v409 = "";
			v408 = 1;
		end
		if (v408 == 2) then
			Utils:copyToClipboard(v409);
			break;
		end
	end
end;
v71.copyFormateLore = function(v411, v412)
	if not v412 then
		local v792 = 0 + 0;
		while true do
			if (v792 == (1545 - (320 + 1225))) then
				v68.debug(LUAOBFUSACTOR_DECRYPT_STR_0("\94\241\66\26\77\126\251\66\1\69\99\190\5\31\82\117\240", "\36\16\158\98\118"));
				return false;
			end
		end
	end
	v71.copyTextFormat(v411:getLore()[v412]);
end;
v71.getArmor = function(v413)
	local v414 = {[LUAOBFUSACTOR_DECRYPT_STR_0("\200\19\207\246\93\252", "\133\160\118\163\155\56\136\71")]=v413:getHeadArmor(),[LUAOBFUSACTOR_DECRYPT_STR_0("\245\170\116\225\162\15\185\247\182\116", "\213\150\194\17\146\214\127")]=v413:getChestArmor(),[LUAOBFUSACTOR_DECRYPT_STR_0("\23\172\163\211\79\170\165\37", "\86\123\201\196\180\38\196\194")]=v413:getLegArmor(),[LUAOBFUSACTOR_DECRYPT_STR_0("\245\231\214\187\228", "\207\151\136\185")]=v413:getFootArmor()};
	return v414;
end;
v71.getplayersInZone = function()
	local v415 = 0 - 0;
	local v416;
	while true do
		if (1 == v415) then
			return v416;
		end
		if (v415 == (0 + 0)) then
			v416 = {};
			for v894, v895 in pairs(World:getPlayers()) do
				if (v895:getPing() > 0) then
					table.insert(v416, v895);
				end
			end
			v415 = 1465 - (157 + 1307);
		end
	end
end;
v71.actionBar = function()
	local v417 = 0;
	local v418;
	while true do
		if (v417 == (1859 - (821 + 1038))) then
			v418 = Client:getMinecraft().field_1705;
			return tostring(Sys.getfield(v418, LUAOBFUSACTOR_DECRYPT_STR_0("\174\138\45\142\112\71\35\248\210\112", "\17\200\227\72\226\20\24")):get(v418));
		end
	end
end;
local v93 = {};
v93.pressBind = function(v419, v420)
	local v421 = 0 - 0;
	while true do
		if (v421 == (0 + 0)) then
			for v896 in pairs(KeyBind:getKeyBindings()) do
				if (v896 == v419) then
					local v1040 = 0 - 0;
					while true do
						if (v1040 == (0 + 0)) then
							KeyBind:keyBind(v896, v420);
							return true;
						end
					end
				end
			end
			v68.debug(v419 .. LUAOBFUSACTOR_DECRYPT_STR_0("\240\79\20\195\137\215\224\234\190\69", "\159\208\33\123\183\169\145\143"));
			v421 = 2 - 1;
		end
		if (v421 == (1027 - (834 + 192))) then
			return false;
		end
	end
end;
v93.toggleBind = function(v422)
	v93.pressBind(v422, true);
	Client:waitTick();
	v93.pressBind(v422, false);
end;
v93.dontuse = {};
v93.dontuse.pressKey = function(v423, v424)
	local v425 = 0;
	while true do
		if ((0 + 0) == v425) then
			for v897, v898 in pairs(KeyBind:getKeyBindings()) do
				if (v898 == v423) then
					KeyBind:keyBind(v423, v424);
					return true;
				end
			end
			v68.debug("Key Not Found: §6" .. v423);
			v425 = 1 + 0;
		end
		if (v425 == (1 + 0)) then
			return false;
		end
	end
end;
v72.click = {};
v72.click.name = function(v426, v427, v428, v429)
	if not v72.isChest() then
		v68.debug(LUAOBFUSACTOR_DECRYPT_STR_0("\220\85\44\118\243\26\59\62\247\73\44", "\86\146\58\88"));
		return false;
	end
	if not v426 then
		local v793 = 0;
		while true do
			if (0 == v793) then
				v68.debug(LUAOBFUSACTOR_DECRYPT_STR_0("\118\208\170\212\171\241\34\186\79\222\249\128\169\224\32\255\86", "\154\56\191\138\160\206\137\86"));
				return false;
			end
		end
	end
	if not v429 then
		v429 = 0;
	end
	for v706 = 0 - 0, v72.chestSlots() do
		if ((v428 and (v73(v706).name():lower() == v426:lower())) or (not v428 and v73(v706).name():find(v426))) then
			v73(v706).click(v427, v429);
			return true;
		end
	end
	return false;
end;
v72.click.ID = function(v430, v431, v432)
	local v433 = 304 - (300 + 4);
	while true do
		if ((1 + 0) == v433) then
			for v899 = 0, v72.chestSlots() do
				if (v73(v899).ID():lower() == v430:lower()) then
					v73(v899).click(v431, v432);
					return true;
				end
			end
			return false;
		end
		if (v433 == (0 - 0)) then
			if not v72.isChest() then
				local v988 = 0;
				while true do
					if (v988 == (362 - (112 + 250))) then
						v68.debug(LUAOBFUSACTOR_DECRYPT_STR_0("\168\86\225\199\125\122\130\196\131\74\225", "\172\230\57\149\231\28\90\225"));
						return false;
					end
				end
			end
			if not v432 then
				v432 = 0 + 0;
			end
			v433 = 1;
		end
	end
end;
v72.click.lore = function(v434, v435, v436)
	if not v72.isChest() then
		local v794 = 0;
		while true do
			if (v794 == (0 - 0)) then
				v68.debug(LUAOBFUSACTOR_DECRYPT_STR_0("\44\165\146\146\41\155\1\162\131\193\60", "\187\98\202\230\178\72"));
				return false;
			end
		end
	end
	if not v435 then
		v435 = 0 + 0;
	end
	for v707 = 0, v72.chestSlots() do
		if v93.SearchLore(v73(v707).i():getLore(), v434) then
			local v838 = 0 + 0;
			while true do
				if (v838 == (0 + 0)) then
					v73(v707).click(v436, v435);
					return true;
				end
			end
		end
	end
	return false;
end;
v72.anvilText = function(v437, v438)
	if ((v72.type() == LUAOBFUSACTOR_DECRYPT_STR_0("\0\239\178\57\70", "\42\65\129\196\80")) and v437) then
		v68.log("§6" .. v437);
		v72.i():setName(v437);
		v73(1 + 1).click(v438);
	else
		v68.debug(LUAOBFUSACTOR_DECRYPT_STR_0("\44\69\73\154\22\9\66\239\12\92\84\214", "\142\98\42\61\186\119\103\98"));
	end
end;
v93.playSound = function(v439, v440)
	World:playSound(v439, v12[LUAOBFUSACTOR_DECRYPT_STR_0("\14\176\14\29\53\186", "\104\88\223\98")] / 100, v440 or nil);
end;
local v104 = {};
v104.threeSixty = function(v441)
	if (v441 > (268 + 92)) then
		v441 = v441 - 360;
	end
	if (v441 < 0) then
		v441 = v441 + 360;
	end
	return v441;
end;
v104.move = function(v442, v443, v444, v445)
	if not v445 then
		v442 = math.random(-5, 5) + v442;
		v443 = math.random(-5, 5) + v443;
	end
	local v446, v447 = v74().Yaw, v74().Pitch;
	local v448 = 1415 - (1001 + 413);
	local v449 = math.abs(v74().Yaw);
	while v444 > v448 do
		local v708 = (((v442 - v446) + 180) % (802 - 442)) - 180;
		local v709 = (((v443 - v447) + (1062 - (244 + 638))) % 360) - (873 - (627 + 66));
		local v710 = math.sign(v708);
		if (v449 > (119 - 79)) then
			v710 = v710 * (v449 / (622 - (512 + 90)));
		elseif (math.abs(v708) > 5) then
			v710 = v710 * (v449 / (1909 - (1665 + 241)));
		end
		v448 = v448 + (718 - (373 + 344));
		Player:getPlayer():lookAt(v446 + (v708 * (v448 / v444)), v447 + (v709 * (v448 / v444)));
		Time:sleep(1 + 0);
		if (v444 <= v448) then
			break;
		end
	end
end;
v104.lookAtVector = function(v450, v451)
	if not v451 then
		v68.debug(LUAOBFUSACTOR_DECRYPT_STR_0("\106\248\162\202\23\255\69\227\235\193\12\173\83\246\241\142\5\228\82\242\236", "\141\36\151\130\174\98"));
		return false;
	end
	if (v450:distanceTo(v74().Pos) > (4 + 8)) then
		local v795 = 0;
		while true do
			if (v795 == 0) then
				v68.debug(LUAOBFUSACTOR_DECRYPT_STR_0("\180\118\195\20\129\104\130\4\151\58\214\2\139\58\196\12\150", "\109\228\26\162"));
				return false;
			end
		end
	end
	local v452 = Player:getPlayer():getEyePos():toReverseVector(v450):getYaw();
	local v453 = Player:getPlayer():getEyePos():toReverseVector(v450):getPitch();
	v104.move(v452, v453, v451);
end;
v104.lookAtBlock = function(v454, v455, v456)
	local v457 = 0 - 0;
	while true do
		if (0 == v457) then
			if (not Sys.classType(v454) == LUAOBFUSACTOR_DECRYPT_STR_0("\124\233\242\123\235\214\81\246\213\125\236\246\91\247", "\134\62\133\157\24\128")) then
				local v989 = 0 - 0;
				while true do
					if (v989 == (1099 - (35 + 1064))) then
						v68.debug(LUAOBFUSACTOR_DECRYPT_STR_0("\37\169\21\218\36\241\230\8\182\90\206\46\162\150\9\170\14\153\40\184\192\2\171", "\182\103\197\122\185\79\209"));
						return false;
					end
				end
			end
			v104.lookAtVector(Sys.center(v454, v456), v455);
			break;
		end
	end
end;
v104.rotate = function(v458)
	local v459;
	if (v458 == LUAOBFUSACTOR_DECRYPT_STR_0("\246\134\242\99", "\40\147\231\129\23\96")) then
		v459 = 197 + 73;
	end
	if (v458 == LUAOBFUSACTOR_DECRYPT_STR_0("\98\253\159\81", "\188\21\152\236\37\219\204")) then
		v459 = 192 - 102;
	end
	if (v458 == LUAOBFUSACTOR_DECRYPT_STR_0("\78\230\37\24\72", "\108\32\137\87")) then
		v459 = 180;
	end
	if (v458 == LUAOBFUSACTOR_DECRYPT_STR_0("\185\231\21\178\39", "\57\202\136\96\198\79\153\43")) then
		v459 = 0 + 0;
	end
	local v460 = math.min(1286 - (298 + 938), math.max(15, math.abs(v459 - v104.threeSixty(v74().Yaw)) * 0.1));
	v104.move(v459, v74().Pitch, v460);
end;
v104.Aimbot = function(v461, v462)
	local v463 = 0;
	local v464;
	while true do
		if (v463 == (1260 - (233 + 1026))) then
			if (v461:getType() == LUAOBFUSACTOR_DECRYPT_STR_0("\166\42\164\162\142\181\249\173\55\240\174\153\162\245", "\152\203\67\202\199\237\199")) then
				v464 = v461:getPos():add(1666 - (636 + 1030), 0.25 + 0 + v462, 0 + 0);
			end
			if v71.isMob() then
				v464 = v461:getEyePos():add(0, 0 + 0 + v462, 0 + 0);
			end
			v463 = 223 - (55 + 166);
		end
		if (v463 == (1 + 1)) then
			if not v464 then
				v464 = v461:getPos();
			end
			v104.lookAtVector(v464, 3 + 17);
			break;
		end
		if (v463 == (0 - 0)) then
			v464 = nil;
			if (v461:getType() == LUAOBFUSACTOR_DECRYPT_STR_0("\247\74\174\10\28\103\120\224\238\25\161\29\18\122\107\217\233\87\161\1\27", "\134\154\35\192\111\127\21\25")) then
				v464 = v461:getPos():add(297 - (36 + 261), 0 + v462, 0 - 0);
			end
			v463 = 1;
		end
	end
end;
local v111 = {[LUAOBFUSACTOR_DECRYPT_STR_0("\190\51\7\9", "\178\216\70\105\106\64")]={},[LUAOBFUSACTOR_DECRYPT_STR_0("\60\35\127\229\221", "\224\95\75\26\150\169\181\180")]={}};
v111.commonContainers = {LUAOBFUSACTOR_DECRYPT_STR_0("\39\219\202\47\65\236\85\3\223\203\60", "\22\107\186\184\72\36\204"),LUAOBFUSACTOR_DECRYPT_STR_0("\196\181\33\93\26", "\110\135\221\68\46"),LUAOBFUSACTOR_DECRYPT_STR_0("\193\55\30\249\203\191", "\91\131\86\108\139\174\211"),LUAOBFUSACTOR_DECRYPT_STR_0("\200\35\173\27\86\254\57\248\53\82\227", "\61\155\75\216\119")};
Data.ChestFilter = false;
v111.chest.chestTitle = {[LUAOBFUSACTOR_DECRYPT_STR_0("\2\190\188\63", "\189\100\203\210\92\56\105")]=function()
	local v465 = 0;
	while true do
		if (v465 == (1283 - (1035 + 248))) then
			v68.log(v72:chestTitle());
			Utils:copyToClipboard(v72:chestTitle());
			break;
		end
	end
end,[LUAOBFUSACTOR_DECRYPT_STR_0("\46\67\239\41\54", "\72\79\49\157")]={},[LUAOBFUSACTOR_DECRYPT_STR_0("\156\181\41\168", "\220\232\208\81")]=LUAOBFUSACTOR_DECRYPT_STR_0("\210\187\241\112\24\83\181\249\187", "\193\149\222\133\80\76\58"),[LUAOBFUSACTOR_DECRYPT_STR_0("\199\94\76\215\213\78", "\178\166\61\47")]=LUAOBFUSACTOR_DECRYPT_STR_0("\250\78\229\115\196", "\94\155\42\136\26\170")};
v111.chest.dump = {[LUAOBFUSACTOR_DECRYPT_STR_0("\130\42\40\182", "\213\228\95\70")]=function()
	for v711, v712 in pairs(v72.i():getSlots({LUAOBFUSACTOR_DECRYPT_STR_0("\39\186\203\138", "\23\74\219\162\228")})) do
		if (not Data.ChestFilter or ((Data.ChestFilter and v72.findItem(v73(v712).name(), {LUAOBFUSACTOR_DECRYPT_STR_0("\58\233\72\187\58\48\232\67\189", "\91\89\134\38\207")})) ~= (0 + 0))) then
			v73(v712).quick();
		end
	end
	v68.msg(LUAOBFUSACTOR_DECRYPT_STR_0("\96\251\197\38\22\212\103\109\250\205\59\0", "\71\36\142\168\86\115\176"));
end,[LUAOBFUSACTOR_DECRYPT_STR_0("\222\179\96\190\26", "\41\191\193\18\223\99\222\54")]=v111.commonContainers,[LUAOBFUSACTOR_DECRYPT_STR_0("\191\35\223\62", "\202\203\70\167\74")]=LUAOBFUSACTOR_DECRYPT_STR_0("\8\20\209\35", "\17\76\97\188\83"),[LUAOBFUSACTOR_DECRYPT_STR_0("\132\36\218\50\35\144", "\195\229\71\185\87\80\227\43")]=LUAOBFUSACTOR_DECRYPT_STR_0("\246\245\14\89\227\236\253", "\143\128\156\96\48")};
v111.chest.take = {[LUAOBFUSACTOR_DECRYPT_STR_0("\190\196\254\17", "\119\216\177\144\114")]=function()
	local v466 = 319 - (134 + 185);
	while true do
		if ((1133 - (549 + 584)) == v466) then
			for v900, v901 in pairs(v72.i():getSlots({LUAOBFUSACTOR_DECRYPT_STR_0("\202\38\247\86\200\32\247\71\219", "\34\169\73\153")})) do
				if (not Data.ChestFilter or (Data.ChestFilter and (v72.findItem(v73(v901).name(), {LUAOBFUSACTOR_DECRYPT_STR_0("\167\237\2\133", "\235\202\140\107"),LUAOBFUSACTOR_DECRYPT_STR_0("\4\123\32\170\232\53", "\165\108\20\84\200\137\71\151")}) ~= (0 + 0)))) then
					v73(v901).quick();
				end
			end
			v68.msg(LUAOBFUSACTOR_DECRYPT_STR_0("\78\181\32\141\116\244\2\156\127\185\56", "\232\26\212\75"));
			break;
		end
	end
end,[LUAOBFUSACTOR_DECRYPT_STR_0("\54\91\96\233\238", "\151\87\41\18\136")]=v111.commonContainers,[LUAOBFUSACTOR_DECRYPT_STR_0("\79\170\210\196", "\158\59\207\170\176")]=LUAOBFUSACTOR_DECRYPT_STR_0("\123\95\56\76", "\236\47\62\83\41"),[LUAOBFUSACTOR_DECRYPT_STR_0("\251\170\35\62\185\145", "\226\154\201\64\91\202")]=LUAOBFUSACTOR_DECRYPT_STR_0("\215\64\19\17\70\176\192", "\220\161\41\125\120\42")};
if v12[LUAOBFUSACTOR_DECRYPT_STR_0("\159\121\165\29\168\49\135\27\181", "\110\220\17\192")] then
	local v713 = JsMacros:on(LUAOBFUSACTOR_DECRYPT_STR_0("\91\105\49\20\200\56\255\179\117\112\58\31\249", "\199\20\25\84\122\139\87\145"), false, JavaWrapper:methodToJavaAsync(function(v796)
		if not v12[LUAOBFUSACTOR_DECRYPT_STR_0("\100\1\216\189\15\170\96\28\212", "\138\39\105\189\206\123")] then
			JsMacros:off(chestInterface);
		end
		local v797, v798, v799 = {}, {}, {};
		for v839, v840 in pairs(v111.chest) do
			local v841 = 1172 - (786 + 386);
			while true do
				if (v841 == (0 - 0)) then
					if ((v840.access == LUAOBFUSACTOR_DECRYPT_STR_0("\30\3\132\36\253", "\159\127\103\233\77\147\153\175")) and (v2.admin.administrator == true)) then
						local v1086 = 1379 - (1055 + 324);
						while true do
							if ((1340 - (1093 + 247)) == v1086) then
								v840.text = "§d" .. v840.text;
								table.insert(v799, v840);
								break;
							end
						end
					end
					for v1062, v1063 in pairs(v840.array) do
						if (v1063 == v796.inventory:getContainerTitle()) then
							if ((v840.access == LUAOBFUSACTOR_DECRYPT_STR_0("\6\244\242\171\78\200\2\244", "\171\103\144\132\202\32")) and (v2.UserInfo.UserLevel == LUAOBFUSACTOR_DECRYPT_STR_0("\17\43\255\13\30\44\236\8", "\108\112\79\137"))) then
								v840.text = "§a" .. v840.text;
								table.insert(v797, v840);
								break;
							end
							if (v840.access == LUAOBFUSACTOR_DECRYPT_STR_0("\41\203\122\33\161\13\232", "\85\95\162\20\72\205\97\137")) then
								table.insert(v798, v840);
								v37.screen.render({{[LUAOBFUSACTOR_DECRYPT_STR_0("\227\228\58\217", "\173\151\157\74\188\109\152")]=LUAOBFUSACTOR_DECRYPT_STR_0("\39\0\61\222\215\118\218\235", "\147\68\104\88\189\188\52\181"),x=545,y=(12 + 98),[LUAOBFUSACTOR_DECRYPT_STR_0("\28\157\133\211", "\176\122\232\235")]=function()
								end,[LUAOBFUSACTOR_DECRYPT_STR_0("\135\121\53\77\239\140", "\142\224\21\90\47")]=LUAOBFUSACTOR_DECRYPT_STR_0("\87\220\34\69\176\173\140\120\192\34\68", "\229\20\180\71\54\196\235"),[LUAOBFUSACTOR_DECRYPT_STR_0("\58\106\192\241\225\163\142\46\93\201\230\246\161", "\224\73\30\161\131\149\202")]=Data.ChestFilter}});
								break;
							end
							if (v840.access == LUAOBFUSACTOR_DECRYPT_STR_0("\226\224\227\70\244\247", "\48\145\133\145")) then
								table.insert(v797, v840);
								break;
							end
						end
					end
					break;
				end
			end
		end
		if (#v799 > (0 - 0)) then
			v37.screen.chestColumns(225, 373 - 263, {table.unpack(v799)});
		end
		if (#v797 > 0) then
			v37.screen.chestColumns(225 - ((v12 and v12[LUAOBFUSACTOR_DECRYPT_STR_0("\117\74\179\253\212\56\26\111\189\235\194\56\26\107\160\231\145\0\95\74\161\174\226\37\94\73", "\76\58\44\213\142\177")]) or 0), 110 + (25 * #v799), {table.unpack(v797)});
		end
		if (#v798 > (0 - 0)) then
			v37.screen.chestColumns(169 + 306 + ((v12 and v12[LUAOBFUSACTOR_DECRYPT_STR_0("\228\34\20\62\125\223\100\49\37\125\216\48\82\10\109\194\100\32\36\127\195\48\82\30\113\207\33", "\24\171\68\114\77")]) or (0 - 0)), 379 - 269, {table.unpack(v798)});
		end
	end));
end
v111.addChestCommand = function(v467, v468, v469, v470)
	table.insert(v111.chest, {[LUAOBFUSACTOR_DECRYPT_STR_0("\233\8\94\81", "\205\143\125\48\50\231\190\100")]=v469,[LUAOBFUSACTOR_DECRYPT_STR_0("\192\181\6\4\248", "\194\161\199\116\101\129\131\191")]=v467,[LUAOBFUSACTOR_DECRYPT_STR_0("\248\33\208\188", "\194\140\68\168\200\151")]=v468,[LUAOBFUSACTOR_DECRYPT_STR_0("\67\248\214\32\230\81", "\149\34\155\181\69")]=v470});
end;
local v118 = {};
if (v11[LUAOBFUSACTOR_DECRYPT_STR_0("\55\239\212\254\6\189\230\234\6\248\209", "\154\99\157\181")] <= (0 - 0)) then
	v12[LUAOBFUSACTOR_DECRYPT_STR_0("\185\29\237\164\233\205\60\252\165\233\137", "\140\237\111\140\192")] = 689 - (364 + 324);
end
Data.Graphics.traces = {};
v118.entity = {};
v118.entity.nametag = function(v471, v472)
	v471:setCustomName(v472);
	v471:setCustomNameVisible(true);
end;
v118.entity.Trace = function(v473, v474)
	local v475 = 0;
	local v476;
	local v477;
	while true do
		if (v475 == (0 - 0)) then
			v476 = 0 - 0;
			if not v474 then
				v474 = v37.Color.blue;
			end
			v475 = 1 + 0;
		end
		if (3 == v475) then
			return v477;
		end
		if (v475 == 1) then
			if (v473:getType() ~= LUAOBFUSACTOR_DECRYPT_STR_0("\11\16\115\29\5\11\124\30\18\67\116\12\3\20", "\120\102\121\29")) then
				v476 = 1.5;
			end
			if (v473:getType() == LUAOBFUSACTOR_DECRYPT_STR_0("\161\234\183\62\175\241\184\61\184\185\184\41\161\236\171\4\191\247\184\53\168", "\91\204\131\217")) then
				v476 = -(0.5 - 0);
			end
			v475 = 2 - 0;
		end
		if (v475 == 2) then
			if ((v473:getType() == LUAOBFUSACTOR_DECRYPT_STR_0("\195\246\91\209\176\207\255\200\235\15\196\191\220\231\203\237", "\158\174\159\53\180\211\189")) and (v473:getName() == Sys.User.name)) then
				return false;
			end
			v477 = v37.ThreeD.render({{[LUAOBFUSACTOR_DECRYPT_STR_0("\70\228\253\216", "\213\50\157\141\189\23")]=LUAOBFUSACTOR_DECRYPT_STR_0("\251\40\144\169\102\189\202\52\133\163\119", "\196\158\70\228\192\18"),[LUAOBFUSACTOR_DECRYPT_STR_0("\79\81\5\71\205\83", "\185\42\63\113\46")]=v473,[LUAOBFUSACTOR_DECRYPT_STR_0("\215\210\45\54\9", "\123\180\189\65\89")]=v474,[LUAOBFUSACTOR_DECRYPT_STR_0("\195\128\224\236\136", "\233\162\236\144\132")]=(1423 - (1249 + 19)),[LUAOBFUSACTOR_DECRYPT_STR_0("\171\235\248\28\170\243\75", "\63\210\164\158\122\217\150")]=v476}});
			v475 = 3 + 0;
		end
	end
end;
v118.entity.TraceAll = function(v478, v479)
	local v480 = 0;
	local v481;
	while true do
		if (v480 == (3 - 2)) then
			return v481;
		end
		if (v480 == 0) then
			v481 = {};
			for v902, v903 in pairs(v71.getEntities(50, v478)) do
				local v904 = v118.entity.Trace(v903, v479);
				if v904 then
					table.insert(v481, v904);
				end
			end
			v480 = 1;
		end
	end
end;
v118.entity.traceOff = function()
	for v715, v716 in pairs(Data.Graphics.traces) do
		v716:unregister();
	end
end;
v118.entity.Esp = function(v482, v483, v484)
	if (not v484 and v482.e:isGlowing()) then
		return false;
	end
	if ((v482.Type == LUAOBFUSACTOR_DECRYPT_STR_0("\62\194\248\233\74\234\50\205\226\182\64\236\54\198", "\152\83\171\150\140\41")) and v482.e:getContainedItemStack():getName()) then
		local v800 = 1086 - (686 + 400);
		while true do
			if (v800 == 0) then
				v482.e:setCustomName(v482.e:getContainedItemStack():getName());
				v482.e:setCustomNameVisible(true);
				break;
			end
		end
	end
	v482.e:setGlowingColor(v483);
	if not v484 then
		local v801 = 0 + 0;
		while true do
			if (v801 == (229 - (73 + 156))) then
				v482.e:setGlowing(true);
				return true;
			end
		end
	else
		v482.e:setGlowing(false);
		v482.e:setCustomNameVisible(false);
		return false;
	end
end;
v118.entity.EspAll = function(v485, v486, v487, v488)
	local v489 = {};
	if not v487 then
		v487 = v37.Colors.green;
	end
	for v717, v718 in pairs(v71.getEntities(v486, v485)) do
		if v118.entity.Esp(v718, v487, v488) then
			table.insert(v489, v718);
		end
	end
	if v488 then
		return false;
	else
		return v489;
	end
end;
v118.entity.hit = function(v490)
	if (v490:isAlive() and Player:getPlayer():canSeeEntity(v490) and (Player:getPlayer():getAttackCooldownProgress() == (1 + 0))) then
		v93.toggleBind(LUAOBFUSACTOR_DECRYPT_STR_0("\137\224\154\125\213\15\28\131\230\136", "\104\226\133\227\83\180\123"));
	end
end;
v118.Block = {};
v118.Block.Esp = function(v491, v492)
	local v493 = 811 - (721 + 90);
	while true do
		if (v493 == (0 + 0)) then
			if not v491 then
				return false;
			end
			if not v492 then
				v492 = v37.Color.blue;
			end
			v493 = 1;
		end
		if (v493 == 1) then
			return v37.ThreeD.render({{[LUAOBFUSACTOR_DECRYPT_STR_0("\23\18\51\85", "\48\99\107\67")]=LUAOBFUSACTOR_DECRYPT_STR_0("\220\170\114\211\38", "\27\190\198\29\176\77"),[LUAOBFUSACTOR_DECRYPT_STR_0("\205\71\242\55\162\126\224\88\213\49\165\94\234\89", "\46\143\43\157\84\201")]=v491,[LUAOBFUSACTOR_DECRYPT_STR_0("\84\119\90\205\77", "\168\55\24\54\162\63\115")]=v492,[LUAOBFUSACTOR_DECRYPT_STR_0("\3\232\33\142\193\222\22\232\37\142\209\215", "\174\119\154\64\224\178")]=200,[LUAOBFUSACTOR_DECRYPT_STR_0("\44\119\201\119\38\168\22\235\56", "\132\74\30\165\27\101\199\122")]=v492,[LUAOBFUSACTOR_DECRYPT_STR_0("\41\238\243\171\179\167\181\33\244\239\166\181\176\186\44\254", "\212\79\135\159\199\199\213")]=(570 - (224 + 246)),[LUAOBFUSACTOR_DECRYPT_STR_0("\122\181\185\75", "\120\25\192\213\39\60\183")]=true}});
		end
	end
end;
v118.Block.Break = function(v494)
	local v495 = 0 - 0;
	while true do
		if (v495 == 1) then
			return true;
		end
		if (v495 == 0) then
			if not v494 then
				return false;
			end
			Player:getInteractionManager():breakBlock(v494:getBlockPos());
			v495 = 1;
		end
	end
end;
v118.Block.Place = function()
	if not (v74().hand.main.item:getItem():isBlockItem() and v74().hand.off.item:getItem():isBlockItem()) then
		return false;
	end
	Player:getInteractionManager():interact(true);
	return true;
end;
v118.Block.selectBreak = function(v496)
	for v719, v720 in pairs(v496) do
		local v721 = 0;
		local v722;
		while true do
			if (v721 == (0 - 0)) then
				v722 = v71.Block(1 + 3, false).data;
				if (v722 and (v722.name == v720)) then
					local v1041 = 0;
					while true do
						if (v1041 == (0 + 0)) then
							Client:waitTick();
							Player:getInteractionManager():breakBlock(v722.Pos);
							break;
						end
					end
				end
				break;
			end
		end
	end
end;
local v133 = {};
v133.User = {[LUAOBFUSACTOR_DECRYPT_STR_0("\46\69\51\71\27\73\43\81", "\40\120\32\95")]=function()
	local v497 = 0 + 0;
	while true do
		if (v497 == (0 - 0)) then
			if not Data.checks.velocity then
				Data.checks.velocity = 0 - 0;
			end
			if ((v74().speed < (513.5 - (203 + 310))) and (Data.checks.velocity <= (1998 - (1238 + 755)))) then
				local v993 = 0;
				while true do
					if (v993 == (0 + 0)) then
						Data.checks.velocity = Data.checks.velocity + (1535 - (709 + 825));
						return true;
					end
				end
			end
			v497 = 1 - 0;
		end
		if (v497 == 2) then
			return true;
		end
		if (v497 == (1 - 0)) then
			if (Data.checks.velocity > (869 - (196 + 668))) then
				local v994 = 0 - 0;
				while true do
					if (v994 == (0 - 0)) then
						v68.warn("§cUser is not moving");
						Data.checks.velocity = 833 - (171 + 662);
						v994 = 1;
					end
					if (v994 == 1) then
						return false;
					end
				end
			end
			Data.checks.velocity = 93 - (4 + 89);
			v497 = 6 - 4;
		end
	end
end,[LUAOBFUSACTOR_DECRYPT_STR_0("\23\164\47\115\161\24", "\127\90\203\89\26\207")]=function()
	if (v74().speed > (0.5 + 0)) then
		local v803 = 0;
		while true do
			if (v803 == (0 - 0)) then
				v68.warn("§cUser has moved");
				return false;
			end
		end
	end
	return true;
end,[LUAOBFUSACTOR_DECRYPT_STR_0("\245\32\161\204\12\239", "\157\189\85\207\171\105")]=function()
	local v498 = 0 + 0;
	while true do
		if ((1486 - (35 + 1451)) == v498) then
			if (Player:getPlayer():getFoodLevel() < 6) then
				return false;
			end
			return true;
		end
	end
end,[LUAOBFUSACTOR_DECRYPT_STR_0("\199\175\204\188\55\195\173\221\165\12\212\181", "\99\166\193\184\213")]=function()
	if not Data[LUAOBFUSACTOR_DECRYPT_STR_0("\250\182\147\175\46\134\217\180\139\139\3\153", "\234\182\215\224\219\108")] then
		local v804 = 1453 - (28 + 1425);
		while true do
			if (v804 == (1993 - (941 + 1052))) then
				Data[LUAOBFUSACTOR_DECRYPT_STR_0("\236\128\168\33\226\141\180\54\203\177\180\38", "\85\160\225\219")] = v74().blockPos;
				return true;
			end
		end
	end
	local v499 = Data[LUAOBFUSACTOR_DECRYPT_STR_0("\112\4\144\221\20\208\68\95\14\179\198\37", "\43\60\101\227\169\86\188")];
	Data[LUAOBFUSACTOR_DECRYPT_STR_0("\92\201\194\171\120\192\182\52\123\248\222\172", "\87\16\168\177\223\58\172\217")] = v74().blockPos;
	if (v74().blockPos:distanceTo(v499) > (v74().speed + 1.5 + 0)) then
		v68.warn(LUAOBFUSACTOR_DECRYPT_STR_0("\4\193\88\196\62\38\141\78\220\40\116\217\92\209\62\36\194\75\201\62\48\141\86\207\123\50\204\85\209\50\58\202", "\91\84\173\57\189"));
		return false;
	end
	return true;
end,[LUAOBFUSACTOR_DECRYPT_STR_0("\31\183\43\238\175\195\30\189", "\182\112\217\108\156\192")]=function()
	local v502 = 1514 - (822 + 692);
	while true do
		if (v502 == (0 - 0)) then
			if v74().onGround then
				return true;
			end
			return false;
		end
	end
end,[LUAOBFUSACTOR_DECRYPT_STR_0("\169\9\69", "\235\202\104\40\143")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\20\138\12", "\217\109\235\123")]=function(v503, v504)
	if (v503 and v504 and ((v74().Yaw > v504) or (v74().Yaw < v503))) then
		local v805 = 0 + 0;
		while true do
			if (v805 == (297 - (45 + 252))) then
				v68.debug(LUAOBFUSACTOR_DECRYPT_STR_0("\30\136\105\22\46\144\238\188\42\201\113\67\100\144\194\187\103\139\113\67\126\212\222", "\221\71\233\30\54\16\176\173"));
				return false;
			end
		end
	end
	return true;
end,[LUAOBFUSACTOR_DECRYPT_STR_0("\36\245\74\188\60", "\223\84\156\62")]=function(v505, v506)
	if (v505 and v506 and ((v74().Pitch > v506) or (v74().Pitch < v505))) then
		local v806 = 0 + 0;
		while true do
			if (v806 == (0 + 0)) then
				v68.debug(LUAOBFUSACTOR_DECRYPT_STR_0("\230\245\246\222\191\123\136\188\193\220\186\123\217\233\246\157\184\61\150\254\237\200\185\63\197", "\91\182\156\130\189\215"));
				return false;
			end
		end
	end
	return true;
end},[LUAOBFUSACTOR_DECRYPT_STR_0("\109\102\165\65\127\113\160\80\74\124\163\89", "\53\30\19\204")]=function(v507)
	local v508 = 0 - 0;
	while true do
		if (v508 == 1) then
			if v74().suitableTool(v507) then
				return true;
			else
				local v997 = 433 - (114 + 319);
				while true do
					if ((0 - 0) == v997) then
						v68.debug(LUAOBFUSACTOR_DECRYPT_STR_0("\205\239\127\136\231\247\239\100\196\148\236\233\100\133\165\245\229\48\130\168\235\160\114\136\168\250\235", "\199\153\128\16\228"));
						return false;
					end
				end
			end
			break;
		end
		if (v508 == (0 - 0)) then
			if not v507 then
				v68.debug(LUAOBFUSACTOR_DECRYPT_STR_0("\243\38\234\26\172\145\36\234\13\231\215\37\240\23\163", "\199\177\74\133\121"));
				return false;
			end
			if (v74().hand.main.name == LUAOBFUSACTOR_DECRYPT_STR_0("\153\192\174", "\74\216\169\220\158\87\166")) then
				v68.debug(LUAOBFUSACTOR_DECRYPT_STR_0("\220\44\28\32\26\230\44\7\108\92\231\54\29\40", "\58\136\67\115\76"));
				return false;
			end
			v508 = 1 + 0;
		end
	end
end,[LUAOBFUSACTOR_DECRYPT_STR_0("\247\171\219\80\139\39\137\81\254\169\211", "\61\145\202\184\57\229\64\203")]=function(v509, v510, v511, v512)
	local v513 = 0;
	while true do
		if (v513 == (1 - 0)) then
			if v71.Block(8 - 4, v511).data.lookfor(v509) then
				return true;
			end
			return false;
		end
		if ((1963 - (556 + 1407)) == v513) then
			if not v510 then
				v68.debug(LUAOBFUSACTOR_DECRYPT_STR_0("\114\93\201\67\85\65\157\70\82\81\140\7\75\83\154\7\91\91\159\66\82", "\39\60\50\233"));
				return false;
			end
			if v71.Block(4, v511).Raycast:isMissed() then
				if v512 then
					return true;
				else
					return false;
				end
			end
			v513 = 1207 - (741 + 465);
		end
	end
end};
v133.item = function(v514)
	local v515 = 465 - (170 + 295);
	while true do
		if (v515 == (0 + 0)) then
			if not v514 then
				v68.debug(LUAOBFUSACTOR_DECRYPT_STR_0("\52\60\227\37\150\45\191\227\10\33\172\58\139\44\183\167", "\195\122\83\195\76\226\72\210"));
				return false;
			end
			return {[LUAOBFUSACTOR_DECRYPT_STR_0("\237\192\62\243\5\241\198\58\252\45\237\192\34", "\65\132\180\91\158")]=function()
				local v906 = 0 + 0;
				while true do
					if (v906 == (2 - 1)) then
						return true;
					end
					if (v906 == (0 + 0)) then
						if (v514:getName():getString() == LUAOBFUSACTOR_DECRYPT_STR_0("\36\117\195", "\78\101\28\177")) then
							return true;
						end
						if (v71.Item(v514) and ((v71.Item(v514).dura().max() * (0.25 + 0)) > v71.Item(v514).dura().current())) then
							local v1100 = 0 + 0;
							while true do
								if (v1100 == (1230 - (957 + 273))) then
									v68.debug(v71.Item(v514).name .. LUAOBFUSACTOR_DECRYPT_STR_0("\101\189\243\17\41\187\247\17\42\186\160\117\48\166\225\83\41\189\244\72", "\49\69\212\128"));
									return false;
								end
							end
						end
						v906 = 1 + 0;
					end
				end
			end,[LUAOBFUSACTOR_DECRYPT_STR_0("\4\25\217\230\224\21\0\213\219\245\18\1", "\129\119\108\176\146")]=function(v907)
				if v514:getItemId():find(v907, 1 + 0, true) then
					return true;
				end
				v68.debug(v907 .. LUAOBFUSACTOR_DECRYPT_STR_0("\124\193\8\217\101\8\19\41\193\3", "\124\92\175\103\173\69\110"));
				return false;
			end,[LUAOBFUSACTOR_DECRYPT_STR_0("\200\60", "\87\161\88\99")]=function(v908)
				if (v71.Item(v514) and (v71.Item(v514).id == v908)) then
					return true;
				end
				v68.debug(v908 .. LUAOBFUSACTOR_DECRYPT_STR_0("\82\247\224\216\247\214\44\7\247\235", "\67\114\153\143\172\215\176"));
				return false;
			end};
		end
	end
end;
v133.entity = function(v516)
	return {[LUAOBFUSACTOR_DECRYPT_STR_0("\178\173\249\38\187\163\226\26\182", "\110\222\194\142")]=function(v723)
		if not v516 then
			return false;
		end
		if not v723 then
			v723 = 20;
		end
		if ((v516:getHealth() + v516:getAbsorptionHealth()) < (v516:getMaxHealth() * (v723 / (381 - 281)))) then
			return false;
		end
		return true;
	end};
end;
v133.block = function(v517)
	local v518 = 0;
	while true do
		if (0 == v518) then
			if not v517 then
				return false;
			end
			return {[LUAOBFUSACTOR_DECRYPT_STR_0("\21\213\20\170\89", "\193\119\185\123\201\50")]=function(v909)
				if ((v909 == LUAOBFUSACTOR_DECRYPT_STR_0("\96\9\237\35\29", "\127\23\104\153\70\111\25")) and v517:getName():getString():find(LUAOBFUSACTOR_DECRYPT_STR_0("\30\6\178\170\57", "\211\105\103\198\207\75\76\215"))) then
					return true;
				end
				if (v517:getName():getString() == v909) then
					return true;
				end
				v68.debug(v909 .. LUAOBFUSACTOR_DECRYPT_STR_0("\142\169\191\251\62\10\181\163\192\163", "\214\174\199\208\143\30\108\218"));
				return false;
			end,[LUAOBFUSACTOR_DECRYPT_STR_0("\22\150\4\189\171\117\202\70\1", "\41\113\228\107\202\197\54\184")]=function()
				local v910 = 0 - 0;
				local v911;
				local v912;
				while true do
					if ((2 - 1) == v910) then
						v912 = v911.state:getUniversal():getAge();
						if ((v912 == (34 - 27)) or (((v911.name == LUAOBFUSACTOR_DECRYPT_STR_0("\88\136\61\72\104\130\55\72", "\60\26\237\88")) or (v911.name == LUAOBFUSACTOR_DECRYPT_STR_0("\246\47\96\238\171\202\61\117\244\186", "\206\184\74\20\134"))) and (v912 == 3))) then
							return v517;
						end
						v910 = 2;
					end
					if (v910 == 0) then
						v911 = v71.blockdata(v517);
						if not v911.isCrop then
							return false;
						end
						v910 = 1781 - (389 + 1391);
					end
					if (v910 == (2 + 0)) then
						return false;
					end
				end
			end};
		end
	end
end;
v133.Chat = function(v519)
	if v71.watchChat(v519) then
		return false;
	end
	return true;
end;
local v139 = {};
v139.commandExecute = function(v520, v521, v522, v523)
	local v524 = 0;
	while true do
		if (0 == v524) then
			v520:executes(JavaWrapper:methodToJavaAsync(function(v913)
				local function v914()
					local v998 = {};
					for v1042, v1043 in pairs(v522) do
						if v1043.inputDescription then
							table.insert(v998, v913:getArg(v1043.inputDescription));
						end
					end
					v521(table.unpack(v998));
				end
				if v2.admin.errors then
					local v1044 = 0 + 0;
					while true do
						if (v1044 == (0 - 0)) then
							v914();
							return true;
						end
					end
				end
				local v915, v916 = pcall(v914);
				if not v915 then
					Chat.log("§4Error occurred: " .. v523);
				end
				return true;
			end));
			return v520;
		end
	end
end;
v139.CommandBuilder = function(v525, v526, v527)
	Chat:getCommandManager():unregisterCommand(v12[LUAOBFUSACTOR_DECRYPT_STR_0("\27\235\227\188\242\68\60\140\8\246\235\183\250\82", "\172\88\132\142\209\147\42\88")] .. v525);
	local v528 = Chat:getCommandManager():createCommandBuilder(v12[LUAOBFUSACTOR_DECRYPT_STR_0("\164\133\193\0\55\251\186\199\186\222\8\48\252\166", "\222\231\234\172\109\86\149")] .. v525);
	if (v527 and (#v527 == 0)) then
		Chat:log("§e⚠ Warning: CommandTable is not a table");
		return false;
	end
	if v527 then
		for v843, v844 in pairs(v527) do
			local v845 = 0;
			while true do
				if (v845 == 0) then
					for v1064, v1065 in pairs(v844) do
						local v1066 = 951 - (783 + 168);
						while true do
							if (v1066 == (0 - 0)) then
								if (next(v1065) == nil) then
									Chat:log("§e⚠ Warning: Render is not a table");
									return false;
								end
								if (v1065.type == LUAOBFUSACTOR_DECRYPT_STR_0("\239\224\207\20\232\225", "\120\141\143\160")) then
									v528:booleanArg(v1065.inputDescription);
								end
								v1066 = 1 + 0;
							end
							if (v1066 == 2) then
								if (v1065.type == LUAOBFUSACTOR_DECRYPT_STR_0("\71\190\179\87\68\181", "\50\32\204\214")) then
									v528:greedyStringArg(v1065.inputDescription);
								end
								if (v1065.type == LUAOBFUSACTOR_DECRYPT_STR_0("\149\82\50\126\182\2\146\78\58\119", "\113\230\39\85\25\211")) then
									v528:suggestMatching(v1065.suggestions);
								end
								v1066 = 314 - (309 + 2);
							end
							if (v1066 == (9 - 6)) then
								if (v1065.type == LUAOBFUSACTOR_DECRYPT_STR_0("\205\174\1\239\34\216\191", "\43\190\219\102\136\71\171\203")) then
									v528:suggest(JavaWrapper:methodToJava(function(v1124, v1125)
										for v1132, v1133 in ipairs(v1065.suggestions()) do
											v1125:suggest(v1133);
										end
									end));
								end
								if (v1065.type == LUAOBFUSACTOR_DECRYPT_STR_0("\45\108", "\57\66\30\80")) then
									v528 = v139.commandExecute(v528, v526, v844);
									v528:otherwise();
								end
								break;
							end
							if (v1066 == (1213 - (1090 + 122))) then
								if (v1065.type == LUAOBFUSACTOR_DECRYPT_STR_0("\58\204\178\28\138\62", "\228\73\184\192\117\228\89\148")) then
									v528:wordArg(v1065.inputDescription);
								end
								if (v1065.type == LUAOBFUSACTOR_DECRYPT_STR_0("\193\156\120\22\202\155", "\116\175\233\21")) then
									v528:intArg(v1065.inputDescription);
								end
								v1066 = 1 + 1;
							end
						end
					end
					v528 = v139.commandExecute(v528, v526, v844, v525);
					break;
				end
			end
		end
	else
		v528:executes(JavaWrapper:methodToJavaAsync(function(v846)
			if v2.admin.errors then
				v526();
				return true;
			end
			local v847, v848 = pcall(v526);
			if not v847 then
				Chat:log("§4Fatal Error occurred in command:§c " .. v525);
			end
			return true;
		end));
	end
	v528:register();
end;
Data.checks = {};
v139.getChecks = function(v529, v530)
	local v531 = 0;
	while true do
		if (v531 == (3 - 2)) then
			return true;
		end
		if (v531 == (0 + 0)) then
			if (v529 == true) then
				return true;
			end
			for v917, v918 in pairs(v529) do
				if not v918.func() then
					local v1045 = 1118 - (628 + 490);
					while true do
						if (v1045 == (0 + 0)) then
							Data.checks[v530] = false;
							v93.playSound(LUAOBFUSACTOR_DECRYPT_STR_0("\251\246\170\79\207\40\113\251\246\186\67\201\60\62\240\182\186\67\218\37\55", "\95\158\152\222\38\187\81"), 24 - 14);
							v1045 = 4 - 3;
						end
						if (v1045 == 1) then
							v68.log("§c" .. v918.name .. LUAOBFUSACTOR_DECRYPT_STR_0("\184\155\52\187\175\205\252", "\168\152\221\85\210\195"));
							return false;
						end
					end
				end
			end
			v531 = 1;
		end
	end
end;
v139.addCommand = function(v532, v533)
	v139.CommandBuilder(v532, v533);
end;
v139.addloop = function(v534, v535, v536, v537, v538)
	v139.addCommand(v534, function()
		local v724 = 0;
		while true do
			if (v724 == 0) then
				Data.checks[v534] = not Data.checks[v534];
				if Data.checks[v534] then
					v68.msg(v534 .. LUAOBFUSACTOR_DECRYPT_STR_0("\235\251\251\134\169\210\240\131", "\231\203\190\149"));
					local v1046 = World:getDimension();
					if v538 then
						v538();
					end
					while Data.checks[v534] do
						Time:sleep(775 - (431 + 343));
						local v1067 = World:getDimension();
						if (v1067 ~= v1046) then
							v68.log(LUAOBFUSACTOR_DECRYPT_STR_0("\233\52\238\244\178\230\18\194\51\163\242\180\244\21\202\56\231\171\252\199\30\193\50\226\245\181\251\28\141\114", "\123\173\93\131\145\220\149") .. v534);
							v1046 = v1067;
							Client:waitTick(40);
						end
						if not v139.getChecks(v535, v534) then
							break;
						end
						v536();
					end
					v68.msg("§c" .. v534 .. LUAOBFUSACTOR_DECRYPT_STR_0("\86\224\228\50\117\251\26\193\233", "\153\118\164\141\65\20"));
					if v537 then
						v537();
					end
				end
				break;
			end
		end
	end);
end;
Script = {};
Script.tool = {};
Script.tool.updateSettings = function(v539, v540)
	local v541 = JsMacros:getConfig().macroFolder:getPath() .. LUAOBFUSACTOR_DECRYPT_STR_0("\161\1\131\246\227\9\224\53\149\173", "\96\142\82\230\130\151") .. v539 .. LUAOBFUSACTOR_DECRYPT_STR_0("\1\188\90\67", "\142\47\208\47\34\132");
	FS:createFile(JsMacros:getConfig().macroFolder:getPath() .. LUAOBFUSACTOR_DECRYPT_STR_0("\185\141\1\22\79\85\248\185\23", "\60\150\222\100\98\59"), v539 .. LUAOBFUSACTOR_DECRYPT_STR_0("\11\48\66\87", "\81\37\92\55\54\187\218"), true);
	Client:waitTick();
	FS:open(v541):write(LUAOBFUSACTOR_DECRYPT_STR_0("\18\65\185\34\147\14", "\225\96\36\205\87") .. Sys.Print.tableToString(v540));
end;
Script.tool.copyItemname = function(v542)
	local v543 = v71.Item(v542);
	if (not v543 or not v543.name) then
		return false;
	end
	Utils:copyToClipboard(v543.name);
	v68.msg(LUAOBFUSACTOR_DECRYPT_STR_0("\202\169\82\112\121\75\73", "\105\137\198\34\25\28\47") .. v543.name .. LUAOBFUSACTOR_DECRYPT_STR_0("\81\189\78\54\195\29\160\81\116\207\16\187\69", "\160\113\201\33\22"));
	return true;
end;
Script.tool.itemEsp = function(v544)
	v118.entity.EspAll(LUAOBFUSACTOR_DECRYPT_STR_0("\217\81\162\162\170\191\213\94\184\253\160\185\209\85", "\205\180\56\204\199\201"), 30 - 15, v37.Colors.red, v544);
end;
Script.tool.Radius = function(v545, v546)
	local v547 = 0 - 0;
	local v548;
	while true do
		if (0 == v547) then
			if not v546 then
				v546 = LUAOBFUSACTOR_DECRYPT_STR_0("\129\210\41\29", "\120\227\190\92");
			end
			v548 = v74().blockPos;
			v547 = 1 + 0;
		end
		if ((1 + 0) == v547) then
			if Data.Graphics[LUAOBFUSACTOR_DECRYPT_STR_0("\47\93\27\114\54\79", "\130\93\60\127\27\67\60\185") .. v546] then
				Data.Graphics[LUAOBFUSACTOR_DECRYPT_STR_0("\90\51\60\71\245\80", "\29\40\82\88\46\128\35") .. v546]:unregister();
				Data.Graphics[LUAOBFUSACTOR_DECRYPT_STR_0("\41\68\208\20\20\171", "\216\91\37\180\125\97") .. v546] = nil;
				return false;
			end
			Data.Graphics[LUAOBFUSACTOR_DECRYPT_STR_0("\55\119\24\202\66\54", "\55\69\22\124\163") .. v546] = v37.ThreeD.render({{[LUAOBFUSACTOR_DECRYPT_STR_0("\108\202\76\237", "\148\24\179\60\136\191\17\48")]=LUAOBFUSACTOR_DECRYPT_STR_0("\162\37\240\174\226", "\150\210\74\153\192"),x=(v548:getX() + 0.5),y=(v548:getY() + (15.5 - (6 + 9))),z=(v548:getZ() + 0.5 + 0),[LUAOBFUSACTOR_DECRYPT_STR_0("\241\201\60\131\96\105", "\212\131\168\88\234\21\26")]=(v545 + 0.51),[LUAOBFUSACTOR_DECRYPT_STR_0("\70\123\133\131\42", "\71\37\20\233\236\88")]=v37.Colors[v546],[LUAOBFUSACTOR_DECRYPT_STR_0("\217\84\177\24\83\252\77\78\200\72\179\15", "\60\173\38\208\118\32\140\44")]=(52 + 48),[LUAOBFUSACTOR_DECRYPT_STR_0("\66\39\237\223", "\175\33\82\129\179\64")]=true}});
			break;
		end
	end
end;
Script.tool.getCam = {[LUAOBFUSACTOR_DECRYPT_STR_0("\247\238\39", "\210\142\143\80\175\92")]=function()
	v68.msg(LUAOBFUSACTOR_DECRYPT_STR_0("\128\232\228\134\228\169", "\166\217\137\147") .. Player:getPlayer():getYaw());
end,[LUAOBFUSACTOR_DECRYPT_STR_0("\243\170\102\165\249", "\38\131\195\18\198\145")]=function()
	v68.msg(LUAOBFUSACTOR_DECRYPT_STR_0("\99\223\46\232\48\20\14\150", "\52\51\182\90\139\88") .. Player:getPlayer():getPitch());
end};
Script.tool.reset = function()
	local v549 = 169 - (28 + 141);
	local v550;
	local v551;
	while true do
		if ((1 + 1) == v549) then
			for v920 = 1, #v551 - (1 - 0) do
				v551[v920]:closeContext();
			end
			break;
		end
		if (v549 == (0 + 0)) then
			Hud:clearDraw2Ds();
			Hud:clearDraw3Ds();
			v549 = 1;
		end
		if (v549 == 1) then
			v550 = JsMacros:getServiceManager();
			v551 = JsMacros:getOpenContexts();
			v549 = 1319 - (486 + 831);
		end
	end
end;
Script.tool.Discord = function()
	local v552 = 0 - 0;
	while true do
		if (0 == v552) then
			v68.msg(LUAOBFUSACTOR_DECRYPT_STR_0("\217\169\213\233\74\248\190\144\195\74\229\186\223\245\71", "\35\150\217\176\135"));
			Utils:openUrl(LUAOBFUSACTOR_DECRYPT_STR_0("\241\68\31\28\100\25\57\182\84\2\31\116\76\100\253\30\12\11\56\27\91\234\65\94\30\82\16\113\224", "\22\153\48\107\108\23\35"));
			break;
		end
	end
end;
if (Sys.User.Lv(LUAOBFUSACTOR_DECRYPT_STR_0("\35\128\181\15", "\137\110\229\219\122\31\21\33")) >= (0 - 0)) then
	v139.addCommand(LUAOBFUSACTOR_DECRYPT_STR_0("\16\178\49\117\123\79\45\109\25\178\42\127", "\30\122\221\88\27\86\43\68"), Script.tool.Discord);
end
if (Sys.User.Lv(LUAOBFUSACTOR_DECRYPT_STR_0("\21\45\229\147", "\230\88\72\139")) >= 1) then
	v139.addCommand(LUAOBFUSACTOR_DECRYPT_STR_0("\96\177\5\30\23", "\56\18\212\118\123\99\104"), Script.tool.reset);
end
if (Sys.User.Lv(LUAOBFUSACTOR_DECRYPT_STR_0("\51\236\246\198", "\190\126\137\152\179\191")) >= 3) then
	v139.addCommand(LUAOBFUSACTOR_DECRYPT_STR_0("\47\7\102\242\171\87", "\32\72\98\18\171\202"), Script.tool.getCam.yaw);
	v139.addCommand(LUAOBFUSACTOR_DECRYPT_STR_0("\3\141\38\68\254\16\139\58", "\151\100\232\82\20"), Script.tool.getCam.pitch);
	v139.addCommand(LUAOBFUSACTOR_DECRYPT_STR_0("\124\214\230\17\86\205\243\5\89\214\228\5\126\205", "\104\31\185\150"), function()
		v71.copyTextFormat(v74().hand.main.item:getName());
	end);
	v139.addCommand(LUAOBFUSACTOR_DECRYPT_STR_0("\223\182\227\238\206\216\229\205\210\184\254\242", "\160\188\217\147\151\135\172\128"), function()
		Script.tool.copyItemname(v74().hand.main.item);
	end);
	v139.addCommand(LUAOBFUSACTOR_DECRYPT_STR_0("\8\216\4\254\56\221", "\169\111\189\112\144\90"), function()
		Utils:copyToClipboard(v71.Item(v74().hand.main.item).ntb());
	end);
	v139.addCommand(LUAOBFUSACTOR_DECRYPT_STR_0("\202\134\49\143\179\143\10\137", "\226\173\227\69\205\223\224\105"), function()
		v68.log(tostring(v71.Block(1 + 3, false).data.data));
	end);
	v139.addloop(LUAOBFUSACTOR_DECRYPT_STR_0("\81\42\39\86\234\8\72", "\123\56\94\66\59\175"), true, Script.tool.itemEsp, function()
		Script.tool.itemEsp(true);
	end);
	v139.CommandBuilder(LUAOBFUSACTOR_DECRYPT_STR_0("\200\66\119\232\15\237", "\225\154\35\19\129\122\158"), Script.tool.Radius, {{{[LUAOBFUSACTOR_DECRYPT_STR_0("\78\25\251\82", "\84\58\96\139\55\149\135\176")]=LUAOBFUSACTOR_DECRYPT_STR_0("\29\42\174\2\75\221", "\94\115\95\195\96\46\175"),[LUAOBFUSACTOR_DECRYPT_STR_0("\74\69\47\40\58\9\130\243\64\89\54\45\58\36\136\238", "\128\35\43\95\93\78\77\231")]=LUAOBFUSACTOR_DECRYPT_STR_0("\150\28\50\61\2\109", "\201\196\125\86\84\119\30")},{[LUAOBFUSACTOR_DECRYPT_STR_0("\215\247\20\186", "\223\163\142\100")]=LUAOBFUSACTOR_DECRYPT_STR_0("\141\4", "\216\226\118\163\209")}},{{[LUAOBFUSACTOR_DECRYPT_STR_0("\170\233\11\4", "\95\222\144\123\97\55\16")]=LUAOBFUSACTOR_DECRYPT_STR_0("\23\145\183\65\230\11", "\131\121\228\218\35"),[LUAOBFUSACTOR_DECRYPT_STR_0("\208\222\50\20\109\63\220\195\33\19\112\11\205\217\45\15", "\123\185\176\66\97\25")]=LUAOBFUSACTOR_DECRYPT_STR_0("\250\14\29\88\0\60", "\81\168\111\121\49\117\79\56")},{[LUAOBFUSACTOR_DECRYPT_STR_0("\211\19\245\179", "\214\167\106\133")]=LUAOBFUSACTOR_DECRYPT_STR_0("\58\44\94\70\58\120", "\185\73\88\44\47\84\31"),[LUAOBFUSACTOR_DECRYPT_STR_0("\129\217\10\181\199\219\141\196\25\178\218\239\156\222\21\174", "\159\232\183\122\192\179")]=LUAOBFUSACTOR_DECRYPT_STR_0("\7\61\164\46\54", "\65\68\82\200")},{[LUAOBFUSACTOR_DECRYPT_STR_0("\49\73\98\37", "\30\69\48\18\64\175\175")]=LUAOBFUSACTOR_DECRYPT_STR_0("\227\57\24\235\62\227\56\22\227\53", "\91\144\76\127\140"),[LUAOBFUSACTOR_DECRYPT_STR_0("\243\29\65\38\214\169\193\217\239\6\85", "\176\128\104\38\65\179\218\181")]=v37.getColors()}}});
end
v139.addCommand(LUAOBFUSACTOR_DECRYPT_STR_0("\212\193\192\0\215\232\205\18", "\117\176\164\162"), Sys.saveLog);
Script.bot = {};
Script.macro = {};
Script.fish = function()
	local v553 = function(v725)
		local v726 = 0 + 0;
		while true do
			if (v726 == (0 - 0)) then
				if v71.Block(v725, true).data.lookfor({LUAOBFUSACTOR_DECRYPT_STR_0("\147\195\17\245\200", "\25\228\162\101\144\186")}) then
					return true;
				end
				return false;
			end
		end
	end;
	local v554 = Player:getPlayer():getFishingBobber();
	local v555 = {[LUAOBFUSACTOR_DECRYPT_STR_0("\64\55\170\60\253\224", "\132\40\86\217\110\146")]=function()
		local v727 = 0;
		while true do
			if (v727 == (290 - (23 + 267))) then
				if not (v133.item(v74().hand.main.item).suitableItem(LUAOBFUSACTOR_DECRYPT_STR_0("\108\196\35", "\62\30\171\71\220\199\19\156")) or v133.item(v74().hand.off.item).suitableItem(LUAOBFUSACTOR_DECRYPT_STR_0("\82\74\168", "\45\32\37\204\86\61\169\79"))) then
					local v1047 = 0;
					while true do
						if (v1047 == (1944 - (1129 + 815))) then
							v68.log("§cRod Required");
							return false;
						end
					end
				end
				return true;
			end
		end
	end,[LUAOBFUSACTOR_DECRYPT_STR_0("\93\90\9\184\188\114\82\102\18\189\165\125\87\89\0", "\28\53\53\101\220\213")]=function()
		if (v74().hand.main.item:isWearable() or v74().hand.off.item:isFood()) then
			local v851 = 387 - (371 + 16);
			while true do
				if (v851 == (1750 - (1326 + 424))) then
					v68.log("§cRod Intrupted");
					return false;
				end
			end
		end
		return true;
	end};
	return {[LUAOBFUSACTOR_DECRYPT_STR_0("\14\84\13\66\81\178", "\191\109\60\104\33\58\193\48")]=v555,[LUAOBFUSACTOR_DECRYPT_STR_0("\129\214\27\238\137\208\47\230\147\210\10", "\135\231\183\120")]=function(v728)
		v553(v728);
	end,[LUAOBFUSACTOR_DECRYPT_STR_0("\229\11\95\240\7\21\173", "\201\134\106\44\132\85\122")]=function(v729)
		if (not v554 and v553(v729)) then
			Player:getInteractionManager():interact();
		end
	end,[LUAOBFUSACTOR_DECRYPT_STR_0("\36\9\114\51\51\3\204", "\67\86\108\23\95\97\108\168")]=function()
		if (v554 and Player:getPlayer():canSeeEntity(v554) and (v554:hasCaughtFish() or v554:hasEntityHooked())) then
			local v852 = 0 - 0;
			while true do
				if (v852 == (0 - 0)) then
					Player:getInteractionManager():interact();
					v93.playSound(LUAOBFUSACTOR_DECRYPT_STR_0("\161\54\88\3\176\61\155\86\173\42\73\29\171\54\222\111\182\55\79\1\161\48\155\82\168\57\95\30", "\48\196\88\44\106\196\68\181"));
					break;
				end
			end
		end
	end};
end;
Script.Trade = {[LUAOBFUSACTOR_DECRYPT_STR_0("\132\222\213\47\133\160", "\76\226\191\188\67\224\196\194")]="§fTrade Fialed §cX",[LUAOBFUSACTOR_DECRYPT_STR_0("\218\39\10\224\241\220\60\2", "\157\185\72\103\144")]="§fTrade Complete §a✔"};
Script.Trade.select = function(v556)
	local v557 = 118 - (88 + 30);
	local v558;
	while true do
		if (v557 == (772 - (720 + 51))) then
			v558 = v72.i():getTrades()[v556];
			if (not v558 or not v558:isAvailable()) then
				return true;
			end
			v557 = 4 - 2;
		end
		if (v557 == (1776 - (421 + 1355))) then
			if (v72.type() ~= LUAOBFUSACTOR_DECRYPT_STR_0("\111\186\134\118\169\182\92\161", "\209\57\211\234\26\200")) then
				local v1000 = 0;
				while true do
					if (v1000 == (0 - 0)) then
						v68.debug(LUAOBFUSACTOR_DECRYPT_STR_0("\47\193\178\193\81\146\23\199\170\141\81\213\4\220", "\178\97\174\198\225\48"));
						return false;
					end
				end
			end
			if ((v556 < (0 + 0)) or (v556 > #v72.i():getTrades())) then
				v68.debug(LUAOBFUSACTOR_DECRYPT_STR_0("\230\88\0\244\96\166\6\220\22\13\255\110\231\3\198\82", "\111\175\54\100\145\24\134"));
				return false;
			end
			v557 = 1;
		end
		if (v557 == (1086 - (286 + 797))) then
			return true;
		end
		if (v557 == (7 - 5)) then
			if (v72.getItemCount(LUAOBFUSACTOR_DECRYPT_STR_0("\78\16\46\16\64\11\33\19\87\67\37\24\70\11\33\25\71", "\117\35\121\64")) < v558:getAdjustedPrice()) then
				local v1001 = 0 - 0;
				while true do
					if (v1001 == 0) then
						v68.warn(LUAOBFUSACTOR_DECRYPT_STR_0("\243\178\250\150\38\65\210\168\233\222\99\74\208\184\252\215\47\75\206", "\47\189\221\142\182\67"));
						return false;
					end
				end
			end
			v558:select();
			v557 = 3;
		end
	end
end;
Script.Trade.findItem = function(v559)
	local v560 = 0;
	while true do
		if (v560 == (439 - (397 + 42))) then
			if (v72.type() ~= LUAOBFUSACTOR_DECRYPT_STR_0("\22\182\43\199\73\174\37\59", "\73\64\223\71\171\40\201\64")) then
				v68.warn(LUAOBFUSACTOR_DECRYPT_STR_0("\36\130\208\25\161\61\28\132\200\85\161\122\15\159", "\29\106\237\164\57\192"));
				return false;
			end
			for v921, v922 in pairs(v72.i():getTrades()) do
				if (v922:getOutput():getName():getString() == v559) then
					return v922;
				end
			end
			v560 = 1 + 0;
		end
		if ((801 - (24 + 776)) == v560) then
			v68.log(v559 .. LUAOBFUSACTOR_DECRYPT_STR_0("\241\170\232\174\149\212\175\231\191\160", "\146\209\196\135\218\181\178\192"));
			return false;
		end
	end
end;
Script.Trade.ThrowExtraOutput = function(v561)
	local v562 = v72;
	if not ((Hud:getOpenScreenName() == LUAOBFUSACTOR_DECRYPT_STR_0("\27\57\143\29\81\160\40\34", "\199\77\80\227\113\48")) and v72.findItem(v561, {LUAOBFUSACTOR_DECRYPT_STR_0("\39\62\87\195", "\173\74\95\62"),LUAOBFUSACTOR_DECRYPT_STR_0("\206\22\72\52\202\21", "\220\166\121\60\86\171\103")})) then
		return false;
	end
	for v730, v731 in pairs(v72.findItem(v561, {LUAOBFUSACTOR_DECRYPT_STR_0("\228\3\52\190", "\122\137\98\93\208\91\170"),LUAOBFUSACTOR_DECRYPT_STR_0("\143\238\8\77\212\160", "\170\231\129\124\47\181\210\201")})) do
		local v732 = 0 - 0;
		while true do
			if (v732 == 0) then
				Client:runOnMainThread(JavaWrapper:methodToJava(function()
					v562.drop(v731);
					Time:sleep(v11[LUAOBFUSACTOR_DECRYPT_STR_0("\191\169\59\52\15\106\184\171\63\53\14", "\74\235\219\90\80\106")] * (2 + 0));
				end));
				Client:waitTick();
				break;
			end
		end
	end
end;
Script.Trade.All = function(v563)
	local v564 = 190 - (23 + 167);
	local v565;
	local v566;
	local v567;
	while true do
		if (v564 == (1798 - (690 + 1108))) then
			v565 = 1 + 0;
			v566 = Script.Trade.findItem(v563);
			v564 = 1 + 0;
		end
		if (v564 == 3) then
			Client:waitTick();
			for v923 = 0, v566:getMaxUses() - v566:getUses() do
				if (v12[LUAOBFUSACTOR_DECRYPT_STR_0("\120\209\90\63\63\180\85\231\92\214\79", "\146\44\163\59\91\90\148\26")] == LUAOBFUSACTOR_DECRYPT_STR_0("\81\63\183\145", "\41\21\77\216\225")) then
					Client:runOnMainThread(JavaWrapper:methodToJava(function()
						for v1089 = 849 - (40 + 808), v565 do
							v567.drop(1 + 1);
						end
					end));
				else
					v567.quick(7 - 5);
				end
				Time:sleep(v11["Trade Speed"]);
				if (v566:getAdjustedPrice() >= v73(0 + 0).s():getCount()) then
					if not Script.Trade.select(v566:getIndex() + 1 + 0) then
						break;
					end
				end
				if not v566:isAvailable() then
					break;
				end
			end
			v564 = 4;
		end
		if (v564 == (1 + 0)) then
			if not v566 then
				return false;
			end
			if not v566:isAvailable() then
				return false;
			end
			v564 = 573 - (47 + 524);
		end
		if (v564 == (3 + 1)) then
			if (v12[LUAOBFUSACTOR_DECRYPT_STR_0("\32\95\115\65\17\13\93\80\4\88\102", "\37\116\45\18")] == LUAOBFUSACTOR_DECRYPT_STR_0("\235\237\89\178", "\203\175\159\54\194")) then
				Script.Trade.ThrowExtraOutput(v563);
			end
			return true;
		end
		if (v564 == (5 - 3)) then
			if not Script.Trade.select(v566:getIndex() + (1 - 0)) then
				return false;
			end
			v567 = v72;
			v564 = 6 - 3;
		end
	end
end;
Script.Trade.interact = function()
	local v568 = 1726 - (1165 + 561);
	local v569;
	while true do
		if (v568 == (0 + 0)) then
			v569 = v71.Entity(Player:rayTraceEntity("4"), LUAOBFUSACTOR_DECRYPT_STR_0("\118\199\23\62\89\93\195\125\218\67\45\83\67\206\122\201\28\41", "\162\27\174\121\91\58\47"));
			if (not v569.table or (Hud:getOpenScreenName() == LUAOBFUSACTOR_DECRYPT_STR_0("\229\204\19\249\62\222\214\215", "\185\179\165\127\149\95"))) then
				return false;
			end
			v568 = 1;
		end
		if (v568 == (9 - 6)) then
			return v569;
		end
		if (v568 == (1 + 0)) then
			if ((v569.data.Name == Script.Trade.complete) or (v569.data.Name == Script.Trade.failed)) then
				return false;
			end
			v569:Interact();
			v568 = 481 - (341 + 138);
		end
		if (v568 == (1 + 1)) then
			JsMacros:waitForEvent(LUAOBFUSACTOR_DECRYPT_STR_0("\126\101\202\250\36\82\103\202\241\25", "\119\49\21\175\148"));
			Client:waitTick();
			v568 = 5 - 2;
		end
	end
end;
Script.Trade.nuker = function(v570)
	local v571 = 326 - (89 + 237);
	while true do
		if (v571 == (3 - 2)) then
			v68.log(LUAOBFUSACTOR_DECRYPT_STR_0("\99\167\23\89\40\9\169\250\90\165\26\88\57\76", "\149\55\213\118\61\77\41\234"));
			v72.i():close();
			break;
		end
		if (v571 == (0 - 0)) then
			for v924, v925 in pairs(v71.getEntities(6, LUAOBFUSACTOR_DECRYPT_STR_0("\16\15\196\195\234\43\174\29\9\92\220\207\229\53\174\28\24\20", "\123\125\102\170\166\137\89\207"))) do
				if (v72.getItemCount(LUAOBFUSACTOR_DECRYPT_STR_0("\67\9\86\56\13\145\168\72\20\2\56\3\134\187\79\12\92", "\201\46\96\56\93\110\227")) < (891 - (581 + 300))) then
					v68.debug(LUAOBFUSACTOR_DECRYPT_STR_0("\151\12\249\185\26\207\251\6\227\252\7\192\183\7\253", "\161\219\99\142\153\117"));
					break;
				end
				if ((v925.distance.fromPlayer() <= (1226 - (855 + 365))) and (v925.Name ~= Script.Trade.complete) and (v925.Name ~= Script.Trade.failed)) then
					v925.Interact();
					JsMacros:waitForEvent(LUAOBFUSACTOR_DECRYPT_STR_0("\83\161\163\125\254\127\163\163\118\195", "\173\28\209\198\19"));
					Client:waitTick();
					if Script.Trade.All(v570) then
						v118.entity.nametag(v925.e, Sys.stringToText(Script.Trade.complete));
					else
						v118.entity.nametag(v925.e, Sys.stringToText(Script.Trade.failed));
					end
				end
			end
			if (v12[LUAOBFUSACTOR_DECRYPT_STR_0("\65\254\182\191\112\172\152\174\101\249\163", "\219\21\140\215")] == LUAOBFUSACTOR_DECRYPT_STR_0("\108\170\201\183", "\56\40\216\166\199")) then
				Script.Trade.ThrowExtraOutput(v570);
			end
			v571 = 2 - 1;
		end
	end
end;
Script.Trade.tagsOff = function()
	for v733, v734 in pairs(v71.getEntities(50, LUAOBFUSACTOR_DECRYPT_STR_0("\43\189\27\42\37\166\20\41\50\238\3\38\42\184\20\40\35\166", "\79\70\212\117"))) do
		v734.e:setCustomNameVisible(false);
	end
end;
Script.brewing = function()
	local function v572()
		v73(0 + 0).quick();
		v73(1236 - (1030 + 205)).quick();
		v73(2).quick();
	end
	local function v573()
		if not v72.findID(LUAOBFUSACTOR_DECRYPT_STR_0("\170\31\239\195\250\31\166\16\245\156\233\2\179\31\238\200", "\109\199\118\129\166\153"), {LUAOBFUSACTOR_DECRYPT_STR_0("\60\177\126\248", "\150\81\208\23"),LUAOBFUSACTOR_DECRYPT_STR_0("\241\202\244\137\248\215", "\235\153\165\128")}) then
			return false;
		end
		for v807, v808 in pairs(v72.findID(LUAOBFUSACTOR_DECRYPT_STR_0("\182\64\172\42\69\52\171\248\175\19\178\32\82\47\165\240", "\158\219\41\194\79\38\70\202"), {LUAOBFUSACTOR_DECRYPT_STR_0("\78\36\38\12", "\232\35\69\79\98\142\182"),LUAOBFUSACTOR_DECRYPT_STR_0("\113\15\11\255\120\18", "\157\25\96\127")})) do
			v72.quick(v808);
		end
	end
	return {[LUAOBFUSACTOR_DECRYPT_STR_0("\179\130\254\0\96\62\179\138\250\11", "\81\199\227\149\101\48")]=v572,[LUAOBFUSACTOR_DECRYPT_STR_0("\124\86\255\33\249\146\53\180\115", "\219\29\50\155\113\150\230\92")]=v573};
end;
local v166 = {[LUAOBFUSACTOR_DECRYPT_STR_0("\208\36\200\114\241", "\45\177\64\165\27\159\40")]={},[LUAOBFUSACTOR_DECRYPT_STR_0("\30\30\10\185\102\58\3\6", "\18\125\118\111\202")]={},[LUAOBFUSACTOR_DECRYPT_STR_0("\69\47\92\232\22\184\201\248", "\155\48\92\57\154\80\205\167")]={},[LUAOBFUSACTOR_DECRYPT_STR_0("\184\201\173\190\246\168\64\189\235\174\177\251", "\37\217\173\219\223\152\203")]={},[LUAOBFUSACTOR_DECRYPT_STR_0("\10\13\26\53\68\187", "\150\105\101\127\86\47\200")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\222\224\250\184\198\210\215", "\160\174\146\147\213\167")]={},[LUAOBFUSACTOR_DECRYPT_STR_0("\83\225\25\75\2\69\65\246\3", "\33\32\132\122\36\108")]={}},[LUAOBFUSACTOR_DECRYPT_STR_0("\157\21\102\74", "\28\217\116\18\43")]={},[LUAOBFUSACTOR_DECRYPT_STR_0("\218\88\194\95\213\183", "\92\178\55\182\52\176\206")]={}};
v166.admin = {[LUAOBFUSACTOR_DECRYPT_STR_0("\24\44\97\20\9\38\67\16\29\60\126\27", "\117\122\85\17")]=false};
v166.defultSettings = {[LUAOBFUSACTOR_DECRYPT_STR_0("\187\228\51\70\170\210\139\228\106\109\181\209\137\225\46", "\189\232\143\74\36\198")]="",[LUAOBFUSACTOR_DECRYPT_STR_0("\204\184\3\93\216\4\188\154\6\65\195", "\106\156\202\106\46\183")]="",[LUAOBFUSACTOR_DECRYPT_STR_0("\14\12\105\58\60\60\21\59\3\38\50\13", "\74\93\121\27\83")]="",[LUAOBFUSACTOR_DECRYPT_STR_0("\91\186\229\106\116\180\232\62\83\186\235\123", "\30\29\219\134")]="",[LUAOBFUSACTOR_DECRYPT_STR_0("\119\178\0\186\209\82\29\28\84\171\29\233", "\110\53\199\121\154\148\63\120")]=LUAOBFUSACTOR_DECRYPT_STR_0("\53\8\234\58", "\156\97\122\159\95\57")};
v166.Settings = Sys.openPlayerSettings(LUAOBFUSACTOR_DECRYPT_STR_0("\237\185\215\232\7\7\39", "\95\174\214\186\152\107\98"), v166.defultSettings);
if not v2.admin.administrator then
	v166.admin.bypassRegion = false;
end
v166.checks.primary.autoCaptcha = function()
	local v574 = 0 - 0;
	while true do
		if (v574 == 0) then
			if v72.chestTitle():find(LUAOBFUSACTOR_DECRYPT_STR_0("\170\2\120\136\24\134\189\6\116", "\166\233\110\17\235\115")) then
				v93.playSound(LUAOBFUSACTOR_DECRYPT_STR_0("\122\2\203\194\249\240\121\118\10\251\209\253\172\104\121\2\138\210\226\191\107\118", "\28\24\110\164\161\146\222"), 8 - 3);
				v68.error(LUAOBFUSACTOR_DECRYPT_STR_0("\120\194\70\49\88\203\87\101\83\194\69\101\89\198\83\43\27\199\83\49\94\192\66\32\95\130", "\69\59\163\54"));
				Chat:actionbar("§4Captcha has been detected!", true);
				Client:waitTick(40 - 20);
				for v1048 = 0 + 0, v72.chestSlots() do
					if not v72.isChest() then
						break;
					end
					if not v73(v1048).originalName():find({LUAOBFUSACTOR_DECRYPT_STR_0("\162\173\206", "\214\208\200\170\42\83\173"),LUAOBFUSACTOR_DECRYPT_STR_0("\203\32\101", "\21\185\65\18\192")}) then
						v68.warn(LUAOBFUSACTOR_DECRYPT_STR_0("\221\89\83\8\168\250\83\79\18\175\249\22\73\20\225\238\68\88\8\178\190", "\193\158\54\61\123") .. tostring(v73(v1048).originalName()));
						Client:waitTick(94 - (10 + 59));
						v68.warn(LUAOBFUSACTOR_DECRYPT_STR_0("\18\30\41\183\50\81\52\182\117\16\53\173\58\81\35\182\56\1\44\188\33\20\96\176\51\81\46\182\33\81\35\181\60\18\43\188\49", "\217\85\113\64"));
						Client:waitTick(300);
						if v72.isChest() then
							v73(v1048).click();
						end
						break;
					end
				end
				Client:waitTick(3 + 7);
				if v72.isChest() then
					local v1068 = 0 - 0;
					while true do
						if (v1068 == 0) then
							v68.warn(LUAOBFUSACTOR_DECRYPT_STR_0("\106\26\216\207\175\161\228\91\27\207\200\238\194\195\74\6\192\197\235", "\133\43\111\172\160\143\226"));
							return false;
						end
					end
				end
				v68.msg("§aAuto Captcha Succeeded");
			end
			return true;
		end
	end
end;
v166.Vanished = function(v575, v576)
	local v577 = {};
	if (v166.Data[LUAOBFUSACTOR_DECRYPT_STR_0("\204\166\68\197\201\197\164\102\208\206\194\176\88\212\196", "\160\171\195\48\177")] or v166.Data[LUAOBFUSACTOR_DECRYPT_STR_0("\229\2\120\36\79\201\170\195", "\167\179\99\22\77\60\161\207")]) then
		return nil;
	end
	v166.Data[LUAOBFUSACTOR_DECRYPT_STR_0("\6\122\159\76\69\15\120\189\89\66\8\108\131\93\72", "\44\97\31\235\56")] = true;
	local function v579(v736)
		for v809, v810 in ipairs(World:getPlayers()) do
			if (v810:getUUID() and (v810:getName() == v736)) then
				return true;
			end
		end
		return false;
	end
	Chat:getCommandManager():getArgumentAutocompleteOptions(LUAOBFUSACTOR_DECRYPT_STR_0("\246\7\238\161\229\15\255\178\254\27\251\172\244\28\184", "\196\145\110\152"), JavaWrapper:methodToJavaAsync(function(v737)
		for v811, v812 in pairs(v737) do
			if not v579(v812) then
				local v926 = 1163 - (671 + 492);
				while true do
					if (v926 == (1 + 0)) then
						if v576 then
							local v1102 = 1215 - (369 + 846);
							while true do
								if (v1102 == (0 + 0)) then
									if v12[LUAOBFUSACTOR_DECRYPT_STR_0("\104\60\251\225\75\110\245\247\65\44\247\252\92\110\233\250\93\32\190\228\89\32\247\225\80\43\250\178\89\42\243\251\86", "\146\56\78\158")][LUAOBFUSACTOR_DECRYPT_STR_0("\38\222\86\228\83\35\223\30", "\58\77\187\47\134")] then
										v93.pressBind(v12[LUAOBFUSACTOR_DECRYPT_STR_0("\34\39\164\20\246\110\95\27\11\55\168\9\225\110\67\22\23\59\225\17\228\32\93\13\26\48\165\71\228\42\89\23\28", "\126\114\85\193\103\133\78\52")][LUAOBFUSACTOR_DECRYPT_STR_0("\207\222\43\122\205\213\54\41", "\24\164\187\82")]);
									end
									if v12[LUAOBFUSACTOR_DECRYPT_STR_0("\193\200\89\185\226\177\209\89\179\243\248\212\88\234\230\249\223\82\234\231\240\212\85\185\249\244\222\28\171\245\252\211\82", "\145\145\186\60\202")][LUAOBFUSACTOR_DECRYPT_STR_0("\237\213\42\6\239\222\55\86", "\100\134\176\83")] then
										v93.pressBind(v12[LUAOBFUSACTOR_DECRYPT_STR_0("\227\211\71\174\160\85\216\196\91\191\186\27\215\129\85\181\182\27\147\215\67\179\186\6\219\196\70\253\178\17\222\200\76", "\117\179\161\34\221\211")][LUAOBFUSACTOR_DECRYPT_STR_0("\70\181\227\196\13\241\161\31", "\197\45\208\154\166\100\159")]);
									end
									v1102 = 1;
								end
								if (v1102 == (1 + 0)) then
									if v12[LUAOBFUSACTOR_DECRYPT_STR_0("\25\230\131\175\32\105\255\131\165\49\32\250\130\252\36\33\241\136\252\37\40\250\143\175\59\44\240\198\189\55\36\253\136", "\83\73\148\230\220")][LUAOBFUSACTOR_DECRYPT_STR_0("\56\218\239\226\230\135\55\140", "\233\83\191\150\128\143")] then
										v93.pressBind(v12[LUAOBFUSACTOR_DECRYPT_STR_0("\199\148\202\97\30\183\141\202\107\15\254\136\203\50\26\255\131\193\50\27\246\136\198\97\5\242\130\143\115\9\250\143\193", "\109\151\230\175\18")][LUAOBFUSACTOR_DECRYPT_STR_0("\171\255\88\70\137\174\254\18", "\224\192\154\33\36")]);
									end
									if v12[LUAOBFUSACTOR_DECRYPT_STR_0("\179\70\29\145\144\20\19\135\154\86\17\140\135\20\15\138\134\90\88\148\130\90\17\145\139\81\28\194\130\80\21\139\141", "\226\227\52\120")][LUAOBFUSACTOR_DECRYPT_STR_0("\14\238\245\166\67\177\211\237", "\217\101\139\140\196\42\223\183")] then
										v93.pressBind(v12[LUAOBFUSACTOR_DECRYPT_STR_0("\42\29\170\9\87\90\4\170\3\70\19\1\171\90\83\18\10\161\90\82\27\1\166\9\76\31\11\239\27\64\23\6\161", "\36\122\111\207\122")][LUAOBFUSACTOR_DECRYPT_STR_0("\7\13\253\186\177\58\8\92", "\84\108\104\132\216\216")]);
									end
									v1102 = 2;
								end
								if (v1102 == (1947 - (1036 + 909))) then
									if v12[LUAOBFUSACTOR_DECRYPT_STR_0("\252\9\195\75\243\228\73\201\2\196\81\238\160\2\219\19\195\86\160\178\67\194\18\213\80\229\160\2\205\31\203\81\238", "\34\172\123\166\56\128\196")][LUAOBFUSACTOR_DECRYPT_STR_0("\183\168\177\139\73\124\216\25\165\167\172", "\116\196\201\200\171\42\19\181")] then
										Chat:say("/" .. v12[LUAOBFUSACTOR_DECRYPT_STR_0("\70\148\254\78\6\64\23\115\159\249\84\27\4\92\97\142\254\83\85\22\29\120\143\232\85\16\4\92\119\130\246\84\27", "\124\22\230\155\61\117\96")][LUAOBFUSACTOR_DECRYPT_STR_0("\214\170\255\171\253\226\248\200\170\232\239", "\149\165\203\134\139\158\141")]);
									end
									break;
								end
							end
						end
						table.insert(v577, v812);
						break;
					end
					if (v926 == (0 + 0)) then
						v68.error("§c" .. v812 .. LUAOBFUSACTOR_DECRYPT_STR_0("\115\165\83\102\5\173\78\47\32\164\69\34", "\70\83\204\32"));
						v93.playSound(LUAOBFUSACTOR_DECRYPT_STR_0("\12\141\4\131\5\207\14\142\10\190\27\143\28\149\10\140\64\146\27\129\25\143", "\224\110\225\107"), 8 - 3);
						v926 = 204 - (11 + 192);
					end
				end
			end
		end
		if ((#v577 == 0) and not v575) then
			v68.msg(LUAOBFUSACTOR_DECRYPT_STR_0("\218\121\157\7\49\202\205\231\126\216\53", "\164\148\22\189\81\80\164"));
		end
		if (#v577 ~= (0 + 0)) then
			v166.Data[LUAOBFUSACTOR_DECRYPT_STR_0("\132\129\121\186\52\67\114\182", "\23\210\224\23\211\71\43")] = true;
		end
		Client:waitTick(215 - (135 + 40));
	end));
	v166.Data[LUAOBFUSACTOR_DECRYPT_STR_0("\174\131\4\163\92\37\219\198\168\136\25\164\93\46\216", "\144\201\230\112\215\53\75\188")] = false;
end;
v166.advancedFunc.getVanished_new = function()
	local v580 = 0 - 0;
	local v581;
	while true do
		if (v580 == (2 + 0)) then
			Chat:getCommandManager():getArgumentAutocompleteOptions(LUAOBFUSACTOR_DECRYPT_STR_0("\82\204\15\239\226\164\82\211\22\255\245\173\80\215\89", "\197\53\165\121\138\150"), JavaWrapper:methodToJavaAsync(function(v927)
				local v928 = 0 - 0;
				local v929;
				while true do
					if ((1 - 0) == v928) then
						if (#v929 == (176 - (50 + 126))) then
							v68.msg(LUAOBFUSACTOR_DECRYPT_STR_0("\195\208\153\22\236\209\208\51\229\218\221", "\64\141\191\185"));
						end
						Client:waitTick(80);
						v928 = 2;
					end
					if (v928 == (5 - 3)) then
						v166.Data[LUAOBFUSACTOR_DECRYPT_STR_0("\4\239\164\206\254\199\161\53\235\190\211\228\193\163\7\184", "\198\99\138\208\186\151\169")] = false;
						break;
					end
					if (v928 == (0 + 0)) then
						v929 = {};
						for v1090, v1091 in pairs(v927) do
							if not v581(v1091) then
								v68.error("§c" .. v1091 .. LUAOBFUSACTOR_DECRYPT_STR_0("\77\252\144\30\59\244\141\87\30\253\134\90", "\62\109\149\227"));
								v93.playSound(LUAOBFUSACTOR_DECRYPT_STR_0("\241\132\134\215\11\189\141\135\208\63\227\135\155\192\1\255\198\154\196\1\228\134", "\96\147\232\233\180"), 5);
							end
						end
						v928 = 1414 - (1233 + 180);
					end
				end
			end));
			break;
		end
		if (v580 == (970 - (522 + 447))) then
			v581 = nil;
			function v581(v930)
				for v1002, v1003 in ipairs(World:getPlayers()) do
					if (v1003:getUUID() and (v1003:getName() == v930)) then
						return true;
					end
				end
				return false;
			end
			v580 = 2;
		end
		if ((1421 - (107 + 1314)) == v580) then
			if v166.Data[LUAOBFUSACTOR_DECRYPT_STR_0("\47\61\14\95\132\55\47\14\27\69\132\42\32\61\30\25", "\89\72\88\122\43\237")] then
				return nil;
			end
			v166.Data[LUAOBFUSACTOR_DECRYPT_STR_0("\43\190\177\34\18\34\188\147\55\21\37\168\173\51\31\126", "\123\76\219\197\86")] = true;
			v580 = 1 + 0;
		end
	end
end;
v166.checks.primary.Vanished = function()
	local v582 = 0;
	while true do
		if (v582 == 0) then
			if (v12[LUAOBFUSACTOR_DECRYPT_STR_0("\106\221\5\9\239\43\24\251\29\9\237\52\24\238\20\2\231\44\80\221\17", "\95\56\184\117\108\142")] and not v166.Data[LUAOBFUSACTOR_DECRYPT_STR_0("\198\195\40\229\227\202\35\232", "\140\144\162\70")]) then
				local v1004 = 0 - 0;
				while true do
					if (v1004 == (0 + 0)) then
						v166.Vanished(true);
						return true;
					end
				end
			end
			return false;
		end
	end
end;
v166.checks.secondary.scoreboard = function()
	local v583 = 0 - 0;
	while true do
		if (v583 == (0 - 0)) then
			if v166.admin.bypassRegion then
				return true;
			end
			if (World:getDimension() ~= v166.Data.world) then
				v68.warn(LUAOBFUSACTOR_DECRYPT_STR_0("\249\38\25\102\230\213\104\78\96\225\222\47\25\64\235\215\33\86\124", "\142\176\72\57\18"));
				return false;
			end
			v583 = 1911 - (716 + 1194);
		end
		if (v583 == (1 + 0)) then
			return true;
		end
	end
end;
v166.checks.secondary.combat = function()
	local v584 = 0 + 0;
	while true do
		if (v584 == 0) then
			if v71.actionBar():find("⚔ Combat:") then
				local v1005 = 0;
				while true do
					if (v1005 == (503 - (74 + 429))) then
						v68.log(LUAOBFUSACTOR_DECRYPT_STR_0("\143\63\80\7\169\60\18\37\178", "\68\198\81\112"));
						return false;
					end
				end
			end
			return true;
		end
	end
end;
v166.checks.secondary.repairTools = function(v585)
	local v586 = 0;
	while true do
		if (v586 == 0) then
			if not v166.checks.secondary.combat() then
				return false;
			end
			for v931, v932 in pairs(v585) do
				if (v71.Item(v932) and not v133.item(v932).itemDurablity()) then
					local v1049 = 0 - 0;
					while true do
						if (v1049 == (0 + 0)) then
							Chat:say(LUAOBFUSACTOR_DECRYPT_STR_0("\248\9\185\12\12\28\187\3", "\125\215\111\208\116\44"));
							Client:waitTick(45 - 25);
							break;
						end
					end
				end
			end
			v586 = 1 + 0;
		end
		if (v586 == (2 - 1)) then
			return true;
		end
	end
end;
v166.chestGui.editfilter = function(v587, v588)
	if (v587:getId() == LUAOBFUSACTOR_DECRYPT_STR_0("\10\78\65\246\123\78\6\65\91\169\121\85\21", "\60\103\39\47\147\24")) then
		v68.warn(LUAOBFUSACTOR_DECRYPT_STR_0("\194\5\183\137\194\246\67\172\12\248\149\216\247", "\46\140\106\151\224\182\147"));
		return false;
	end
	if v72.click.name(LUAOBFUSACTOR_DECRYPT_STR_0("\207\36\110\67\233\33\120\70", "\34\139\77\29")) then
		Client:waitTick(5);
	end
	for v738 = 21 - 12, 27 do
		if (v73(v738).ID() == v587:getId()) then
			local v856 = 433 - (279 + 154);
			while true do
				if (v856 == (778 - (454 + 324))) then
					v68.warn(LUAOBFUSACTOR_DECRYPT_STR_0("\153\228\24\89\105\145\252\15\81\40\180\233\93\114\32\188\228\24\70\44\180", "\73\208\144\125\52"));
					return false;
				end
			end
		end
	end
	v72.click.ID(LUAOBFUSACTOR_DECRYPT_STR_0("\39\229\132\206\196\2\82\205\62\182\154\194\192\28\90\197\21\238\139\197\201\21\65\244\58\237\158\223\194\2\93", "\171\74\140\234\171\167\112\51"), true);
	v72.click.name(LUAOBFUSACTOR_DECRYPT_STR_0("\28\11\77\77\242\165", "\205\79\110\44\63\145"), true);
	local v589 = v587:getName():match(LUAOBFUSACTOR_DECRYPT_STR_0("\153\23\122\251\255\66", "\124\199\63\95\168\212\107\196"));
	v72.anvilText(v589, true);
	Client:waitTick(1 + 0);
	v72.click.ID(v587:getId(), false);
	Sys.wait(25 - (12 + 5));
	if not v588 then
		v72.click.name(LUAOBFUSACTOR_DECRYPT_STR_0("\35\176\90\46", "\147\102\200\51\90\196\151\233"), true);
	end
end;
v166.chestGui.filterHotbar = function()
	local v590 = {};
	for v739, v740 in pairs(v72.i():getSlots({LUAOBFUSACTOR_DECRYPT_STR_0("\51\255\251\207\191\242", "\91\91\144\143\173\222\128")})) do
		if (v73(v740).name() ~= LUAOBFUSACTOR_DECRYPT_STR_0("\2\169\94", "\46\67\192\44\49\203")) then
			table.insert(v590, v73(v740).s():getItem());
		end
	end
	for v741, v742 in pairs(v590) do
		v166.chestGui.editfilter(v742, true);
		Sys.wait(5 + 3);
	end
	v72.click.name(LUAOBFUSACTOR_DECRYPT_STR_0("\33\206\39\182", "\101\100\182\78\194\68\196"), true);
	v68.msg(LUAOBFUSACTOR_DECRYPT_STR_0("\96\71\36\247\140\89\56\243\65\68\36\240\159\78\124", "\181\40\40\80\149\237\43\24"));
end;
v166.chestGui.SupperHopperfilter = function(v591)
	local v592 = 0 - 0;
	while true do
		if ((1 + 0) == v592) then
			Sys.wait(10);
			v72.click.name(LUAOBFUSACTOR_DECRYPT_STR_0("\56\179\43\51\189\79\82\57\187\43\57\169", "\114\117\210\69\82\218\42"), true);
			v592 = 1095 - (277 + 816);
		end
		if (2 == v592) then
			for v933 = 0 - 0, v72.chestSlots() do
				if ((v72.chestTitle() == LUAOBFUSACTOR_DECRYPT_STR_0("\105\215\86\114\171\65\150\116\122\162\79\197", "\204\36\182\56\19")) and v73(v933).s():getItem():getBlock() and v73(v933).s():getItem():getBlock():getDefaultState():hasComparatorOutput()) then
					local v1050 = 0;
					while true do
						if (v1050 == (1185 - (1058 + 125))) then
							v72.click.name(LUAOBFUSACTOR_DECRYPT_STR_0("\202\71\213\128\118\120\6\230", "\114\137\43\188\227\29\88"), true);
							break;
						end
						if (0 == v1050) then
							v73(v933).click(true);
							v72.click.name(LUAOBFUSACTOR_DECRYPT_STR_0("\194\20\164\4\225\15", "\112\132\125\200"), true);
							v1050 = 1 + 0;
						end
						if (v1050 == (976 - (815 + 160))) then
							for v1114, v1115 in pairs(v591) do
								local v1116 = 0 - 0;
								while true do
									if (v1116 == 0) then
										v166.chestGui.editfilter(v1115);
										Sys.wait(18 - 10);
										break;
									end
								end
							end
							v72.click.name(LUAOBFUSACTOR_DECRYPT_STR_0("\222\180\250\112\81\181\233\183", "\149\157\216\147\19\58"), true);
							v1050 = 2;
						end
					end
				end
			end
			v68.log("§aFilter complete");
			break;
		end
		if (v592 == (0 + 0)) then
			for v934, v935 in pairs(v591) do
				if (v935:getId() == LUAOBFUSACTOR_DECRYPT_STR_0("\196\143\22\205\202\148\25\206\221\220\25\193\219", "\168\169\230\120")) then
					local v1051 = 0 - 0;
					while true do
						if (v1051 == (1898 - (41 + 1857))) then
							v68.warn(LUAOBFUSACTOR_DECRYPT_STR_0("\213\131\146\22\240\132\128\87\213\153\129\26\239", "\119\156\237\228"));
							return false;
						end
					end
				end
			end
			while not v71.SearchLore(v73(1925 - (1222 + 671)).s(), LUAOBFUSACTOR_DECRYPT_STR_0("\244\248\44\82\131\225\41\93\232\145\53\78\131\247\41\82\247\244\50\91\231", "\30\163\177\96")) do
				v72.click.ID(LUAOBFUSACTOR_DECRYPT_STR_0("\23\41\91\140\62\57\213\28\52\15\153\52\44\216\19\46\106\139\60\37\218\31\50\106\153\60\63\192\31\50\91", "\180\122\64\53\233\93\75"));
				JsMacros:waitForEvent(LUAOBFUSACTOR_DECRYPT_STR_0("\229\27\28\41\227\7\23\60\194\18", "\93\182\119\115"));
				Client:waitTick(3);
				if v71.SearchLore(v73(32).s(), LUAOBFUSACTOR_DECRYPT_STR_0("\181\54\255\160\247\206\171\60\248\204\130\206\194\57\250\160\131\219\176\58\247", "\158\226\127\179\236\215")) then
					v68.log("§aFilter Enabled");
					break;
				end
			end
			v592 = 2 - 1;
		end
	end
end;
v166.chestGui.SupperHopperHotbar = function()
	local v593 = {};
	for v743, v744 in pairs(v72.i():getSlots({LUAOBFUSACTOR_DECRYPT_STR_0("\249\207\221\212\240\210", "\182\145\160\169")})) do
		if (v73(v744).name() ~= LUAOBFUSACTOR_DECRYPT_STR_0("\24\41\34", "\111\89\64\80\118\199")) then
			table.insert(v593, v73(v744).s():getItem());
		end
	end
	v166.chestGui.SupperHopperfilter(v593);
end;
v166.chestGui.navagateInfuser = function(v594, v595)
	local v596 = 0;
	while true do
		if (v596 == (0 - 0)) then
			if (#v72.findID(LUAOBFUSACTOR_DECRYPT_STR_0("\178\190\0\67\188\165\15\64\171\237\30\71\175\178\28", "\38\223\215\110"), {LUAOBFUSACTOR_DECRYPT_STR_0("\83\218\5\203", "\203\62\187\108\165"),LUAOBFUSACTOR_DECRYPT_STR_0("\241\123\92\60\112\236", "\176\153\20\40\94\17\158")}) == (1579 - (874 + 705))) then
				v68.debug(LUAOBFUSACTOR_DECRYPT_STR_0("\134\60\251\65\208\166\54\168\19\204\166\115\178\93\211\173\61\175\92\215\177", "\165\200\83\219\51"));
				return false;
			end
			if (v72.chestTitle() == "㓈") then
				v72.click.name(v594, true);
			end
			v596 = 1 + 0;
		end
		if (v596 == (1 + 0)) then
			while v72.isChest() and (v73(20 - 10).ID() == LUAOBFUSACTOR_DECRYPT_STR_0("\202\227\122\126\210\167\189\226\211\176\100\122\193\176\174", "\132\167\138\20\27\177\213\220")) do
				v72.click.name(v595, true);
				Client:waitTick(1 + 1);
				while not v72.click.name(LUAOBFUSACTOR_DECRYPT_STR_0("\209\217\234\79\55\178\193\236\12\63\253\219\229\69\46\255", "\92\146\181\131\44"), true) do
					if not v72.isChest() then
						break;
					end
					Client:waitTick(5);
				end
				Client:waitTick(2);
			end
			return true;
		end
	end
end;
v166.chestGui.IncinerateRunes = function()
	if v166.chestGui.navagateInfuser(LUAOBFUSACTOR_DECRYPT_STR_0("\98\240\66\143\176\69\5\220\95\241\83", "\189\43\158\33\230\222\32\119"), LUAOBFUSACTOR_DECRYPT_STR_0("\119\206\78\88\134\91\210\76\69\141\30\225\65\93", "\232\62\160\45\49")) then
		v68.msg(LUAOBFUSACTOR_DECRYPT_STR_0("\70\198\251\169\178\52\250\251\175\168\122\214\231\173\181\113\215", "\193\20\179\149\204"));
	end
end;
v166.chestGui.InfuseRunes = function()
	if v166.chestGui.navagateInfuser(LUAOBFUSACTOR_DECRYPT_STR_0("\254\5\132\204\195\8\135\203\210\19", "\162\183\97\225"), LUAOBFUSACTOR_DECRYPT_STR_0("\0\193\225\249\8\235\167\48\133\197\251\16", "\193\73\165\132\151\124\130")) then
		v68.msg(LUAOBFUSACTOR_DECRYPT_STR_0("\255\215\167\94\165\246\228\204\175\78\165\179\201", "\214\173\162\201\59\214"));
	end
end;
v166.runes = {LUAOBFUSACTOR_DECRYPT_STR_0("\99\79\234\4\236", "\64\67\25\202\33\183"),LUAOBFUSACTOR_DECRYPT_STR_0("\223\199\88\149\110\151\120", "\35\137\142\17\220\78\178"),LUAOBFUSACTOR_DECRYPT_STR_0("\109\118\101\68\22", "\97\77\46\69"),LUAOBFUSACTOR_DECRYPT_STR_0("\159\246\56\229\154\228", "\197\191\191\96"),LUAOBFUSACTOR_DECRYPT_STR_0("\138\17\173\11\99", "\45\170\73\141\46\56\136"),LUAOBFUSACTOR_DECRYPT_STR_0("\193\55\251\165\234\188", "\103\225\111\173\133\207\231"),LUAOBFUSACTOR_DECRYPT_STR_0("\12\188\195\124\12\193\206", "\53\44\228\149"),LUAOBFUSACTOR_DECRYPT_STR_0("\141\227\13\44\226\100\136\224", "\68\173\187\91\101\171"),LUAOBFUSACTOR_DECRYPT_STR_0("\188\55\36\238\96\171\61\156\199", "\185\156\111\114\167\41\226\29"),LUAOBFUSACTOR_DECRYPT_STR_0("\75\61\63\24\244\166\48", "\131\107\101\118\64\212"),LUAOBFUSACTOR_DECRYPT_STR_0("\129\238\20\107\2\251", "\169\161\182\76\75\39\160"),LUAOBFUSACTOR_DECRYPT_STR_0("\255\91\165\142\12\45\186\210\18\145\132\20\54\187\205\87\167\152\91\11\129\240", "\200\185\50\215\235\123\66"),LUAOBFUSACTOR_DECRYPT_STR_0("\193\138\192\162\185\98\31\226\145\220\240\202\95\51\219", "\122\146\225\185\130\234\22"),LUAOBFUSACTOR_DECRYPT_STR_0("\157\227\211\199\234\169\249\203\233\230", "\219\217\130\160\175\143"),LUAOBFUSACTOR_DECRYPT_STR_0("\13\172\80\52\48\187\2\14\54\179\71\46\126\149\107\20", "\93\94\220\34"),LUAOBFUSACTOR_DECRYPT_STR_0("\41\218\200\143\222\183\219\6\219\201", "\157\111\168\161\234\186\151"),LUAOBFUSACTOR_DECRYPT_STR_0("\90\85\97\62\130\138\191\128\119\84\53\24\235\144", "\229\27\32\21\81\162\217\210"),LUAOBFUSACTOR_DECRYPT_STR_0("\13\192\250\57\88\37\216\226\122\99\5\229", "\42\76\172\155\90"),LUAOBFUSACTOR_DECRYPT_STR_0("\213\140\147\45\5\252\136\147", "\96\146\237\225\73"),LUAOBFUSACTOR_DECRYPT_STR_0("\218\113\11\227\76\110\226\202\113\7\252\90\58\139\193\87", "\194\136\30\104\136\41\26"),LUAOBFUSACTOR_DECRYPT_STR_0("\240\211\2\76\17\190\233\6\245", "\79\188\182\99\40\116\208\201"),LUAOBFUSACTOR_DECRYPT_STR_0("\90\207\43\82\48\127\94\194\36\79\44\49\61\234\3\104", "\95\29\163\74\33\67"),LUAOBFUSACTOR_DECRYPT_STR_0("\80\59\70\50\121\133\22\127\55\0\30\86\163", "\100\28\82\32\87\31\234"),LUAOBFUSACTOR_DECRYPT_STR_0("\2\69\233\127\255\218\237\58\113\97\232\112\233\210\251\126\9\123\214", "\94\81\50\128\17\155\182\136")};
v166.excludeRune = {LUAOBFUSACTOR_DECRYPT_STR_0("\166\53\224\56\241\244\40\136\158\63\236", "\231\235\92\132\89\130\212\124")};
v166.chestGui.dumbGoodRunes = function()
	if (#v72.findID(LUAOBFUSACTOR_DECRYPT_STR_0("\243\189\250\58\210\87\255\178\224\101\193\68\238\177\230", "\37\158\212\148\95\177"), {LUAOBFUSACTOR_DECRYPT_STR_0("\121\29\173\137", "\109\20\124\196\231"),LUAOBFUSACTOR_DECRYPT_STR_0("\168\178\96\167\48\50", "\64\192\221\20\197\81")}) == (0 - 0)) then
		v68.debug(LUAOBFUSACTOR_DECRYPT_STR_0("\129\249\162\176\178\161\243\241\226\174\161\182\235\172\177\170\248\246\173\181\182", "\199\207\150\130\194"));
		return false;
	end
	for v745, v746 in pairs(v72.findID(LUAOBFUSACTOR_DECRYPT_STR_0("\184\67\117\237\64\167\75\125\252\25\165\75\107\237\81", "\35\213\42\27\136"), {LUAOBFUSACTOR_DECRYPT_STR_0("\173\134\50\177", "\146\192\231\91\223\184"),LUAOBFUSACTOR_DECRYPT_STR_0("\82\254\226\43\208\166", "\110\58\145\150\73\177\212\103")})) do
		if ((v746 > (v72.chestSlots() - (1 + 0))) and v73(v746).name():find(v166.runes) and not v73(v746).name():find(v166.excludeRune)) then
			local v857 = 0 + 0;
			while true do
				if (v857 == (0 - 0)) then
					v72.i():quick(v746);
					Sys.wait(2);
					break;
				end
			end
		end
	end
end;
v166.hotkey.throwgoodRunes = function()
	for v747, v748 in pairs(v72.findID(LUAOBFUSACTOR_DECRYPT_STR_0("\249\61\196\247\72\217\232\242\32\144\226\74\219\236\230", "\137\148\84\170\146\43\171"), {LUAOBFUSACTOR_DECRYPT_STR_0("\12\222\118\243", "\23\97\191\31\157"),LUAOBFUSACTOR_DECRYPT_STR_0("\142\141\19\7\220\32", "\82\230\226\103\101\189")})) do
		if (v73(v748).name():find(v166.runes) and not v73(v748).name():find(v166.excludeRune)) then
			v73(v748).drop();
			Sys.wait(2 + 0);
		end
	end
end;
v166.chestGui.increaseBid = function(v597, v598)
	local v599 = 0 - 0;
	local v600;
	while true do
		if (v599 == (0 + 0)) then
			v600 = 0;
			for v936, v937 in pairs(v72.findID(LUAOBFUSACTOR_DECRYPT_STR_0("\134\35\189\180\23\153\43\181\165\78\155\38\178\168\17\153\21\187\180\21\143", "\116\235\74\211\209"), {LUAOBFUSACTOR_DECRYPT_STR_0("\43\51\208\49\41\53\208\32\58", "\69\72\92\190")})) do
				local v938 = v71.matchLore(v73(v937).s(), LUAOBFUSACTOR_DECRYPT_STR_0("\115\127\172\239\238\172\90\138\125\114", "\215\86\91\132\180\203\200\118"));
				if v938 then
					v938 = v938:gsub(",", "");
				end
				if (v938 and (tonumber(v938) > v600)) then
					v600 = tonumber(v938);
				end
			end
			v599 = 1;
		end
		if (v599 == (1 - 0)) then
			v72.click.name(LUAOBFUSACTOR_DECRYPT_STR_0("\16\251\149\199\60\227\198\241\58\234\198\227\33\231\133\214", "\179\83\142\230"), true);
			Sys.wait(87 - 67);
			v599 = 2 - 0;
		end
		if (v599 == (2 - 0)) then
			if v598 then
				v72.anvilText(v600 + (v600 * (v597 / 100)));
			else
				v72.anvilText(v600 + v597);
			end
			v68.msg("Bid Increased to §2$" .. ((v598 and (v600 + (v600 * (v597 / (919 - (599 + 220)))))) or (v600 + v597)));
			break;
		end
	end
end;
v166.advancedFunc.loopVanished = function()
	v166.checks.primary.Vanished();
	Client:waitTick(20);
end;
v166.userFunc.vault = function(v601)
	local v602 = 0;
	while true do
		if (v602 == (3 - 1)) then
			Client:waitTick(1935 - (1813 + 118));
			if not v72.click.name(v601, true, true, 1 + 0) then
				v68.debug(LUAOBFUSACTOR_DECRYPT_STR_0("\243\60\241\52\55\27\183\209\213\59\189\51\54\10\249\219", "\191\186\79\157\85\89\127\151"));
				return false;
			end
			v602 = 3;
		end
		if ((1218 - (841 + 376)) == v602) then
			Chat:say(LUAOBFUSACTOR_DECRYPT_STR_0("\185\115\183", "\37\150\26\196\174\228"));
			JsMacros:waitForEvent(LUAOBFUSACTOR_DECRYPT_STR_0("\230\224\183\91\4\138\219\245\183\91", "\233\169\144\210\53\87"));
			v602 = 2 - 0;
		end
		if (v602 == (0 + 0)) then
			if not v601 then
				v601 = v166.Settings[LUAOBFUSACTOR_DECRYPT_STR_0("\17\77\244\222\46\73\238\215\98\111\254\208\35\72\233", "\188\66\38\141")];
			end
			if Player:openInventory():isContainer() then
				return false;
			end
			v602 = 2 - 1;
		end
		if (v602 == (862 - (464 + 395))) then
			v72.click.name(LUAOBFUSACTOR_DECRYPT_STR_0("\200\67\1\48\125\70\72\254\224\69\1\37", "\168\129\48\109\81\19\34\104"));
			break;
		end
	end
end;
v166.Data.Fishing = {[LUAOBFUSACTOR_DECRYPT_STR_0("\117\24\3\51\212\54", "\153\23\116\108\80\191\69\219")]={}};
v166.userFunc.fishing = {[LUAOBFUSACTOR_DECRYPT_STR_0("\74\23\248\219\243\152", "\22\41\127\157\184\152\235")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\4\206\229\207\0\198\245\207\5", "\170\119\167\129")]=function()
	local v603 = 0 - 0;
	local v604;
	while true do
		if (v603 == 0) then
			v604 = {v71.Block(842 - (467 + 370), true).left(),v71.Block(9 - 4, true).right()};
			if not (v604[1 + 0].data.lookfor({LUAOBFUSACTOR_DECRYPT_STR_0("\205\241\168\118\145", "\62\186\144\220\19\227")}) and v604[6 - 4].data.lookfor({LUAOBFUSACTOR_DECRYPT_STR_0("\182\253\248\211\179", "\182\193\156\140")})) then
				return false;
			end
			v603 = 2 - 1;
		end
		if (v603 == (521 - (150 + 370))) then
			return v604;
		end
	end
end},[LUAOBFUSACTOR_DECRYPT_STR_0("\206\66\55\167\242\48", "\95\161\44\118\210\134")]=function()
	v166.Data.Fishing.blocks = v166.userFunc.fishing.Checks.sidewater();
	v166.Data.Fishing.count = 1282 - (74 + 1208);
	local v607 = Data.Fishing;
	if not v607 then
		return false;
	end
	Data.Graphics[LUAOBFUSACTOR_DECRYPT_STR_0("\241\65\7\8\104\135", "\206\134\32\115\109\26\182\133")] = v118.Block.Esp(v607[2 - 1].Pos, v37.Colors.red);
	Data.Graphics[LUAOBFUSACTOR_DECRYPT_STR_0("\33\249\219\22\79\15", "\61\86\152\175\115\61")] = v118.Block.Esp(v607[2].Pos, v37.Colors.red);
	v104.lookAtBlock(v607[math.random(#v607)].Pos, 94 - 74, 1.2);
end,[LUAOBFUSACTOR_DECRYPT_STR_0("\166\7\218\17\196\149\44", "\167\201\97\188\80\177\225\67")]=function()
	local v610 = 0;
	while true do
		if (v610 == (0 + 0)) then
			if Data.Graphics[LUAOBFUSACTOR_DECRYPT_STR_0("\89\9\144\170\238\208", "\225\46\104\228\207\156")] then
				Data.Graphics[LUAOBFUSACTOR_DECRYPT_STR_0("\189\193\167\75\37\2", "\223\202\160\211\46\87\51\210")]:unregister();
			end
			if Data.Graphics[LUAOBFUSACTOR_DECRYPT_STR_0("\193\232\14\113\31\132", "\109\182\137\122\20")] then
				Data.Graphics[LUAOBFUSACTOR_DECRYPT_STR_0("\69\168\6\255\242\133", "\28\50\201\114\154\128\183\138")]:unregister();
			end
			break;
		end
	end
end,[LUAOBFUSACTOR_DECRYPT_STR_0("\171\149\10\251\185\146", "\146\202\230\121")]=function()
	local v611 = Player:getPlayer():getFishingBobber();
	if v611 then
		Script.fish().reelRod();
		Client:waitTick(395 - (14 + 376));
	end
	if not v611 then
		local v813 = 0 - 0;
		while true do
			if (v813 == (0 + 0)) then
				Script.fish().castRod(9 + 1);
				Client:waitTick(5);
				break;
			end
		end
	end
end,[LUAOBFUSACTOR_DECRYPT_STR_0("\239\250\250\17", "\94\142\143\142\126\167\210\192")]=function()
	local v612 = 0 + 0;
	local v613;
	local v614;
	local v615;
	while true do
		if (v612 == 3) then
			v166.userFunc.fishing.assist();
			break;
		end
		if (v612 == (2 - 1)) then
			v615 = v71.Block(7 + 1, true).data.Pos;
			for v939, v940 in ipairs(v166.Data.Fishing.blocks) do
				if (v940.Pos:distanceTo(v615) > v614) then
					local v1052 = 78 - (23 + 55);
					while true do
						if (v1052 == 0) then
							v613 = v940.Pos;
							v614 = v940.Pos:distanceTo(v615);
							break;
						end
					end
				end
			end
			v612 = 4 - 2;
		end
		if (v612 == (0 + 0)) then
			v613 = nil;
			v614 = -1;
			v612 = 1 + 0;
		end
		if (v612 == 2) then
			v166.Data.Fishing.count = v166.Data.Fishing.count + (1 - 0);
			if (v166.Data.Fishing.count > 5) then
				local v1007 = 0 + 0;
				while true do
					if (0 == v1007) then
						v104.lookAtBlock(v613, 921 - (652 + 249), 2.2 - 1);
						v166.Data.Fishing.count = 0;
						break;
					end
				end
			end
			v612 = 1871 - (708 + 1160);
		end
	end
end};
v166.userFunc.trade = {[LUAOBFUSACTOR_DECRYPT_STR_0("\3\205\24\226\204\19", "\167\96\165\125\129")]={{[LUAOBFUSACTOR_DECRYPT_STR_0("\9\215\27\67", "\232\103\182\118\38\34\70\43")]=LUAOBFUSACTOR_DECRYPT_STR_0("\20\66\59\236\112\82\52\71\59\224\56\112", "\17\85\55\79\131\80"),[LUAOBFUSACTOR_DECRYPT_STR_0("\206\144\183\175", "\95\168\229\217\204")]=v166.checks.primary.autoCaptcha},{[LUAOBFUSACTOR_DECRYPT_STR_0("\132\58\139\140", "\233\234\91\230")]=LUAOBFUSACTOR_DECRYPT_STR_0("\88\82\142\114\169\85\1\161\123\162\82\74", "\199\49\33\226\19"),[LUAOBFUSACTOR_DECRYPT_STR_0("\84\78\77\28", "\167\50\59\35\127")]=function()
	return v166.checks.secondary.scoreboard();
end}},[LUAOBFUSACTOR_DECRYPT_STR_0("\91\7\83\254\188", "\200\40\115\50\140")]=function()
	v166.Data.world = World:getDimension();
end,[LUAOBFUSACTOR_DECRYPT_STR_0("\241\56\110\58\254\40\101\30\255\41\100", "\127\147\77\23")]=function()
	if v166.Settings[LUAOBFUSACTOR_DECRYPT_STR_0("\169\243\236\52\85\134\227\231\117\124\143\245", "\16\235\134\149\20")] then
		local v814 = 0 - 0;
		local v815;
		while true do
			if (v814 == 1) then
				Chat:say(LUAOBFUSACTOR_DECRYPT_STR_0("\149\88\70\169\28\199\9\215\78\92\167\0\131\76", "\108\186\43\46\198\108\231") .. v815);
				v68.msg(LUAOBFUSACTOR_DECRYPT_STR_0("\16\176\224\6\116\38\255", "\28\82\223\149\97") .. v815 .. LUAOBFUSACTOR_DECRYPT_STR_0("\237\16\64\91\191\52\65\90\190", "\62\205\85\45"));
				break;
			end
			if (v814 == (0 - 0)) then
				v815 = v72.freeslots() * (91 - (10 + 17));
				if (v815 == (0 + 0)) then
					return true;
				end
				v814 = 1733 - (1400 + 332);
			end
		end
	end
end,[LUAOBFUSACTOR_DECRYPT_STR_0("\97\30\160\173\7", "\105\21\108\193\201\98\233")]=function(v617)
	local v618 = 0 - 0;
	local v619;
	while true do
		if (v618 == (1909 - (242 + 1666))) then
			if not v619 then
				return false;
			end
			if Script.Trade.All(v617) then
				local v1008 = 0 + 0;
				while true do
					if (v1008 == (0 + 0)) then
						v118.entity.nametag(v619.e, Sys.stringToText(Script.Trade.complete));
						v72.close();
						v1008 = 1 + 0;
					end
					if (v1008 == (941 - (850 + 90))) then
						return true;
					end
				end
			else
				v118.entity.nametag(v619.e, Sys.stringToText(Script.Trade.failed));
			end
			v618 = 3 - 1;
		end
		if ((1390 - (360 + 1030)) == v618) then
			if (v72.getItemCount(LUAOBFUSACTOR_DECRYPT_STR_0("\77\140\21\251\192\44\219\70\145\65\251\206\59\200\65\137\31", "\186\32\229\123\158\163\94")) < (57 + 7)) then
				v166.userFunc.trade.buyEmeralds();
				Client:waitTick(13 - 8);
			end
			v619 = Script.Trade.interact();
			v618 = 1 - 0;
		end
		if (v618 == (1663 - (909 + 752))) then
			return false;
		end
	end
end,[LUAOBFUSACTOR_DECRYPT_STR_0("\10\54\122\207\11", "\87\100\67\17\170\121\197")]=function(v620)
	local v621 = 0;
	while true do
		if (v621 == 0) then
			v166.userFunc.trade.buyEmeralds();
			Client:waitTick(1226 - (109 + 1114));
			v621 = 1 - 0;
		end
		if (v621 == (1 + 0)) then
			Script.Trade.nuker(v620);
			break;
		end
	end
end};
v166.userFunc.autoCommands = {[LUAOBFUSACTOR_DECRYPT_STR_0("\230\142\187\140", "\213\142\235\218\224\55")]=function()
	if not (v133.entity(Player:getPlayer()).lowHealth() and v166.checks.secondary.combat()) then
		local v816 = 242 - (6 + 236);
		while true do
			if (v816 == (0 + 0)) then
				Chat:say(LUAOBFUSACTOR_DECRYPT_STR_0("\71\170\252\196\4", "\165\104\194\153"));
				Client:waitTick(17 + 3);
				break;
			end
		end
	end
end,[LUAOBFUSACTOR_DECRYPT_STR_0("\129\57\193", "\237\231\80\185\203\153\61")]=function()
	v166.checks.secondary.repairTools({v74().hand.main.item,v74().hand.off.item});
	v166.checks.secondary.repairTools(v71.getArmor(Player:getPlayer()));
end};
v166.userFunc.mine = function()
	if not Pitch then
		Pitch = -90;
	end
	local v622 = {LUAOBFUSACTOR_DECRYPT_STR_0("\150\36\143\124\64", "\37\197\80\224\18"),LUAOBFUSACTOR_DECRYPT_STR_0("\58\77\77\74\244\54\80\73", "\212\121\34\44\38"),LUAOBFUSACTOR_DECRYPT_STR_0("\147\168\37\11\62\130\224\91", "\62\218\218\74\101\30\205\146"),LUAOBFUSACTOR_DECRYPT_STR_0("\101\166\117\245\157\17\86\42", "\79\34\201\25\145\189\94\36"),LUAOBFUSACTOR_DECRYPT_STR_0("\114\41\238\25\84\91\78\41\170\37\82\81", "\52\32\76\138\106\32"),LUAOBFUSACTOR_DECRYPT_STR_0("\148\251\32\207\105\248\214\49\220\111\180\243\112\233\104\189", "\26\216\154\80\166"),LUAOBFUSACTOR_DECRYPT_STR_0("\232\192\236\78\114\34\200\137\194\81\120", "\76\172\169\141\35\29"),LUAOBFUSACTOR_DECRYPT_STR_0("\249\212\253\17\221\213\252\67\243\203\253", "\99\188\185\152")};
	v166.Data.Holding = v74().hand.main;
	local v625 = {[LUAOBFUSACTOR_DECRYPT_STR_0("\222\21\166\11\167", "\195\178\116\214\110")]=false};
	local function v626()
		local v749 = 0;
		while true do
			if (v749 == (0 + 0)) then
				if (v625[1 + 0] and (v625[1 + 0].Pos.x == v74().pos.block.x) and (v625[1].Pos.y == v74().pos.block.y) and (v625[408 - (174 + 233)].Pos.z == v74().pos.block.z)) then
					local v1053 = 0;
					while true do
						if (v1053 == 0) then
							v68.debug(LUAOBFUSACTOR_DECRYPT_STR_0("\40\254\136\124\207\225\69\197\137\96\213\227\69\218\135\101\209\227\1", "\134\101\151\230\21\161"));
							v625.laped = true;
							break;
						end
					end
				end
				for v1009, v1010 in pairs(v625) do
					if (v1010 and v1010.Pos and (v1010.Pos.x == v74().pos.block.x) and (v1010.Pos.y == v74().pos.block.y) and (v1010.Pos.z == v74().pos.block.z)) then
						return true;
					end
				end
				v749 = 2 - 1;
			end
			if (v749 == (1 - 0)) then
				v68.log(LUAOBFUSACTOR_DECRYPT_STR_0("\136\142\62\81\39\114\208\166\131\52\64\99\10\160\244\202", "\128\201\234\90\52\67\82") .. v74().pos.block.x .. LUAOBFUSACTOR_DECRYPT_STR_0("\228\81\126\77\138\249\13", "\170\196\45\94\20") .. v74().pos.block.y .. LUAOBFUSACTOR_DECRYPT_STR_0("\62\88\69\14\129\125\112", "\80\30\36\101\84\161\64") .. v74().pos.block.z);
				table.insert(v625, {[LUAOBFUSACTOR_DECRYPT_STR_0("\150\94\10", "\91\198\49\121\34\184")]=v74().pos.block});
				break;
			end
		end
	end
	local v627 = function()
		local v750 = 0 + 0;
		while true do
			if (v750 == 0) then
				for v1011, v1012 in pairs(v625) do
					if ((v1011 ~= LUAOBFUSACTOR_DECRYPT_STR_0("\56\199\103\188\141", "\233\84\166\23\217")) and v1012.Pos and (v1012.Pos.x == v74().pos.block.x) and (v1012.Pos.y == v74().pos.block.y) and (v1012.Pos.z == v74().pos.block.z)) then
						return true;
					end
				end
				return false;
			end
		end
	end;
	local function v628()
		if (v71.surroundingBlocks()[LUAOBFUSACTOR_DECRYPT_STR_0("\126\106\247\232\34", "\65\24\24\152\134\86")][LUAOBFUSACTOR_DECRYPT_STR_0("\180\50\233\77", "\41\220\87\136")].name:find({LUAOBFUSACTOR_DECRYPT_STR_0("\36\63\241", "\203\69\86\131\144\174"),LUAOBFUSACTOR_DECRYPT_STR_0("\174\31\71\92\218", "\113\217\126\51\57\168\48\135")}) and v71.surroundingBlocks()[LUAOBFUSACTOR_DECRYPT_STR_0("\25\7\57\70\92", "\174\127\117\86\40\40\31\22")][LUAOBFUSACTOR_DECRYPT_STR_0("\218\62\73\207", "\187\188\91\44")].name:find({LUAOBFUSACTOR_DECRYPT_STR_0("\30\254\108", "\109\127\151\30\69\130"),LUAOBFUSACTOR_DECRYPT_STR_0("\197\132\99\29\215", "\118\178\229\23\120\165\176\210")})) then
			return true;
		end
		for v817, v818 in pairs(v71.surroundingBlocks()) do
			if (v818[LUAOBFUSACTOR_DECRYPT_STR_0("\3\217\73\29", "\221\101\188\44\105\108\207\65")].name:find({LUAOBFUSACTOR_DECRYPT_STR_0("\87\57\5", "\178\54\80\119\194"),LUAOBFUSACTOR_DECRYPT_STR_0("\35\14\85\199\253", "\162\84\111\33\162\143\153\217")}) and v818[LUAOBFUSACTOR_DECRYPT_STR_0("\47\222\28\142", "\234\71\187\125")].name:find({LUAOBFUSACTOR_DECRYPT_STR_0("\16\53\67", "\158\113\92\49\59"),LUAOBFUSACTOR_DECRYPT_STR_0("\251\113\85\117\236", "\103\140\16\33\16\158\102\186")})) then
				local v941 = 0;
				while true do
					if (v941 == 0) then
						if (not v625.laped and ((#v625 - (1 + 0)) <= (7 - 3))) then
							v626();
						elseif not v627() then
							return false;
						end
						v104.move(v71.surroundingBlocks()[v817].direction:getYaw(), Pitch, 15 + 5, 1 + 9);
						v941 = 723 - (478 + 244);
					end
					if (v941 == (518 - (440 + 77))) then
						Client:waitTick(1);
						v166.userFunc.mine().moveFoward();
						v941 = 1 + 1;
					end
					if (v941 == (7 - 5)) then
						return true;
					end
				end
			end
		end
		return true;
	end
	return {[LUAOBFUSACTOR_DECRYPT_STR_0("\202\130\171\112\37\51\208\140\175\113", "\92\167\237\221\21\99")]=function()
		local v751 = 0;
		while true do
			if (v751 == (1556 - (655 + 901))) then
				v93.pressBind(LUAOBFUSACTOR_DECRYPT_STR_0("\244\37\52\104\236\48\63\47\241\52", "\70\159\64\77"), true);
				v93.pressBind(LUAOBFUSACTOR_DECRYPT_STR_0("\220\74\75\177\28\216\93\69\254\8\211", "\122\183\47\50\159"), true);
				break;
			end
		end
	end,[LUAOBFUSACTOR_DECRYPT_STR_0("\209\37\168\95\173\205\39\174\65\135", "\224\162\81\199\47")]=function()
		local v752 = 0 + 0;
		while true do
			if (v752 == 0) then
				v93.pressBind(LUAOBFUSACTOR_DECRYPT_STR_0("\227\64\42\115\144\248\87\58\51\151", "\227\136\37\83\93"), false);
				v93.pressBind(LUAOBFUSACTOR_DECRYPT_STR_0("\82\168\17\58\95\162\26\99\88\191\12", "\20\57\205\104"), false);
				break;
			end
		end
	end,[LUAOBFUSACTOR_DECRYPT_STR_0("\59\191\25\171\14", "\83\72\203\120\217\122\58")]=function()
		local v753 = 0 + 0;
		while true do
			if (v753 == (0 + 0)) then
				v166.userFunc.mine().moveFoward();
				v104.move(v74().Yaw, Pitch, 80 - 60, 1455 - (695 + 750));
				v753 = 1;
			end
			if (v753 == (3 - 2)) then
				v625 = {[LUAOBFUSACTOR_DECRYPT_STR_0("\176\232\171\166\171", "\223\220\137\219\195\207\221")]=false};
				Data[LUAOBFUSACTOR_DECRYPT_STR_0("\63\73\76\246\14\31\71\92\233\28\28\91", "\76\115\40\63\130")] = v74().blockPos;
				v753 = 2;
			end
			if ((2 - 0) == v753) then
				v166.Data.world = World:getDimension();
				break;
			end
		end
	end,[LUAOBFUSACTOR_DECRYPT_STR_0("\132\18\40\174\189\194", "\177\231\122\77\205\214")]={{[LUAOBFUSACTOR_DECRYPT_STR_0("\74\18\76\69", "\60\36\115\33\32\201")]=LUAOBFUSACTOR_DECRYPT_STR_0("\150\99\67\73\12\125\60\177\163\117\95\71", "\193\215\22\55\38\44\62\93"),[LUAOBFUSACTOR_DECRYPT_STR_0("\41\7\0\204", "\155\79\114\110\175\181")]=v166.checks.primary.autoCaptcha},{[LUAOBFUSACTOR_DECRYPT_STR_0("\86\85\212\225", "\181\56\52\185\132\209\236")]=LUAOBFUSACTOR_DECRYPT_STR_0("\59\95\222\169\75\173\186\17\68\215\171\78", "\154\82\44\178\200\37\201"),[LUAOBFUSACTOR_DECRYPT_STR_0("\115\254\12\14", "\21\21\139\98\109\222\40")]=v166.checks.secondary.scoreboard},{[LUAOBFUSACTOR_DECRYPT_STR_0("\10\237\161\137", "\90\100\140\204\236")]=LUAOBFUSACTOR_DECRYPT_STR_0("\156\27\45\216\190\23\162\7", "\120\204\116\94\172\215"),[LUAOBFUSACTOR_DECRYPT_STR_0("\5\168\182\11", "\31\99\221\216\104\139\194\16")]=function()
		return true;
	end},{[LUAOBFUSACTOR_DECRYPT_STR_0("\59\161\231\9", "\131\85\192\138\108\105")]=LUAOBFUSACTOR_DECRYPT_STR_0("\6\173\124\8\55\188\122", "\99\86\196\31"),[LUAOBFUSACTOR_DECRYPT_STR_0("\86\33\65\254", "\111\48\84\47\157\63\199")]=function()
		return v133.item(v74().hand.main.item).id(LUAOBFUSACTOR_DECRYPT_STR_0("\23\15\142\162\45\8\7\134\179\116\20\3\148\175\43\8\15\148\162\17\10\15\131\172\47\2\3", "\78\122\102\224\199"));
	end},{[LUAOBFUSACTOR_DECRYPT_STR_0("\242\25\121\6", "\159\156\120\20\99\84\101\206")]=LUAOBFUSACTOR_DECRYPT_STR_0("\83\31\204\88\218\78\98\41\120", "\71\28\113\236\31\168\33\23"),[LUAOBFUSACTOR_DECRYPT_STR_0("\75\235\45\251", "\199\45\158\67\152\185\185\91")]=v133.User.onGround},{[LUAOBFUSACTOR_DECRYPT_STR_0("\84\120\176\171", "\176\58\25\221\206\176\118\183")]=LUAOBFUSACTOR_DECRYPT_STR_0("\4\20\213\9\237\177\38\8", "\216\82\113\185\102\142"),[LUAOBFUSACTOR_DECRYPT_STR_0("\68\78\46\219", "\29\34\59\64\184")]=v133.User.Velocity},{[LUAOBFUSACTOR_DECRYPT_STR_0("\28\31\69\207", "\61\114\126\40\170\85")]=LUAOBFUSACTOR_DECRYPT_STR_0("\252\33\99\58\203", "\19\172\72\23\89\163"),[LUAOBFUSACTOR_DECRYPT_STR_0("\49\73\193\230", "\197\87\60\175\133\85\50")]=function()
		return v133.User.cam.pitch(Pitch - 10, Pitch + 10);
	end},{[LUAOBFUSACTOR_DECRYPT_STR_0("\26\127\217\214", "\179\116\30\180")]=LUAOBFUSACTOR_DECRYPT_STR_0("\223\195\225\132\251\201\255\149", "\225\139\166\141"),[LUAOBFUSACTOR_DECRYPT_STR_0("\75\158\250\35", "\64\45\235\148")]=v133.User.antiTeleport},{[LUAOBFUSACTOR_DECRYPT_STR_0("\120\80\55\231", "\181\22\49\90\130\60")]=LUAOBFUSACTOR_DECRYPT_STR_0("\57\212\177\30\6\223\191\73\0\195\189\26", "\105\111\177\216"),[LUAOBFUSACTOR_DECRYPT_STR_0("\178\15\198\17", "\179\212\122\168\114\112")]=function()
		return v133.User.facingBlock(v622, 3 + 1, false, true);
	end},{[LUAOBFUSACTOR_DECRYPT_STR_0("\119\123\137\200", "\173\25\26\228")]=LUAOBFUSACTOR_DECRYPT_STR_0("\37\119\196\191\88\38\127\202\177\25\14\115", "\120\118\22\169\218"),[LUAOBFUSACTOR_DECRYPT_STR_0("\193\53\184\229", "\134\167\64\214")]=function()
		return v166.Data.Holding.name == v74().hand.main.name;
	end},{[LUAOBFUSACTOR_DECRYPT_STR_0("\10\136\243\141", "\168\100\233\158\232\169")]=LUAOBFUSACTOR_DECRYPT_STR_0("\70\65\11\242\123\90\30", "\156\18\52\121"),[LUAOBFUSACTOR_DECRYPT_STR_0("\69\5\213\201", "\191\35\112\187\170\228\213\101")]=function()
		return v628();
	end}},[LUAOBFUSACTOR_DECRYPT_STR_0("\181\166\114\80", "\31\216\207\28\53\94\124")]=function()
		v118.Block.selectBreak(v622);
	end};
end;
v166.userFunc.EnvoyTracers = function()
	for v754, v755 in pairs(v71.getEntities(75, LUAOBFUSACTOR_DECRYPT_STR_0("\44\46\165\10\88\51\38\173\27\1\32\53\166\0\73\30\52\191\14\85\37", "\59\65\71\203\111"))) do
		if v755.Name:find(LUAOBFUSACTOR_DECRYPT_STR_0("\50\174\106\123\146", "\84\119\192\28\20\235\108")) then
			table.insert(Data.Graphics.traces, v118.entity.Trace(v755.e, 3545926 + 9497968));
		end
	end
end;
v166.userFunc.autoCaptcha = function()
	JsMacros:on(LUAOBFUSACTOR_DECRYPT_STR_0("\163\238\33\248\57\51\167\85\141\247\42\243\8", "\33\236\158\68\150\122\92\201"), false, JavaWrapper:methodToJavaAsync(function(v756)
		if v756.inventory:getContainerTitle():find(LUAOBFUSACTOR_DECRYPT_STR_0("\195\212\240\26\66\177\13\232\221", "\89\128\184\153\121\41\145")) then
			v166.checks.primary.autoCaptcha();
		end
	end));
end;
v166.userFunc.autoKillStack = function(v629)
	local v630 = 0 + 0;
	local v631;
	local v632;
	local v633;
	local v634;
	local v635;
	while true do
		if (v630 == 1) then
			function v633()
				local v945 = 0 - 0;
				local v946;
				local v947;
				while true do
					if ((2 - 1) == v945) then
						for v1093, v1094 in pairs(World:getEntities(325 - (306 + 9))) do
							local v1095 = 0 - 0;
							local v1096;
							while true do
								if (v1095 == (0 + 0)) then
									v1096 = v1094:getType():gsub(LUAOBFUSACTOR_DECRYPT_STR_0("\225\60\170\132\33\149\1\61\248\111", "\91\140\85\196\225\66\231\96"), "");
									if ((v1096 ~= LUAOBFUSACTOR_DECRYPT_STR_0("\35\180\182\168\78\33", "\43\83\216\215\209")) and not v947[v1096]) then
										local v1126 = 0 + 0;
										while true do
											if (v1126 == (0 + 0)) then
												v947[v1096] = true;
												table.insert(v946, v1096);
												break;
											end
										end
									end
									break;
								end
							end
						end
						return v946;
					end
					if ((0 - 0) == v945) then
						v946 = {};
						v947 = {};
						v945 = 1;
					end
				end
			end
			function v634()
				v166.Data.world = World:getDimension();
				v166.Data.targetMobType = v629;
			end
			v630 = 2;
		end
		if (v630 == (1375 - (1140 + 235))) then
			v631 = {[LUAOBFUSACTOR_DECRYPT_STR_0("\70\166\185\5\6\74\169\180", "\78\43\199\208\107")]=v74().hand.main,[LUAOBFUSACTOR_DECRYPT_STR_0("\125\142\6\54\186\52\193", "\182\18\232\96\126\219\90\165")]=v74().hand.off};
			v632 = {{[LUAOBFUSACTOR_DECRYPT_STR_0("\51\95\42\173", "\200\93\62\71")]=LUAOBFUSACTOR_DECRYPT_STR_0("\103\88\90\213\132\145\15\86\89\77\210\197", "\110\38\45\46\186\164\210"),[LUAOBFUSACTOR_DECRYPT_STR_0("\126\171\166\21", "\94\24\222\200\118")]=v166.checks.primary.autoCaptcha},{[LUAOBFUSACTOR_DECRYPT_STR_0("\19\193\43\28", "\121\125\160\70")]=LUAOBFUSACTOR_DECRYPT_STR_0("\218\249\55\179\253\238\123\145\251\239\56\185", "\210\147\138\91"),[LUAOBFUSACTOR_DECRYPT_STR_0("\51\232\198\72", "\115\85\157\168\43\80")]=v166.checks.secondary.scoreboard},{[LUAOBFUSACTOR_DECRYPT_STR_0("\241\91\138\82", "\169\159\58\231\55\236\169\38")]=LUAOBFUSACTOR_DECRYPT_STR_0("\54\211\176\5\202\16\60\50\201\186\19\207", "\28\113\161\223\112\164\116"),[LUAOBFUSACTOR_DECRYPT_STR_0("\192\77\73\122", "\59\166\56\39\25")]=v133.User.onGround},{[LUAOBFUSACTOR_DECRYPT_STR_0("\188\217\203\205", "\35\210\184\166\168")]=LUAOBFUSACTOR_DECRYPT_STR_0("\106\88\112\71\100\94\77\92\112\81", "\23\57\57\29\34\68"),[LUAOBFUSACTOR_DECRYPT_STR_0("\86\36\17\47", "\76\48\81\127")]=function()
				return (v631.mainHand.name == v74().hand.main.name) and (v631.offHand.name == v74().hand.off.name);
			end}};
			v630 = 1 + 0;
		end
		if (v630 == 2) then
			function v635()
				local v950 = v71.Entity(55 - (33 + 19));
				if (v950.table and (v950.data.Type:gsub(LUAOBFUSACTOR_DECRYPT_STR_0("\3\172\95\178\9\102\220\86\26\255", "\48\110\197\49\215\106\20\189"), "") == v166.Data.targetMobType) and v950.data.e:isOnGround() and v950.data.Name and (tonumber(string.match(v950.data.Name, LUAOBFUSACTOR_DECRYPT_STR_0("\88\22\3", "\108\125\114\40\204\160\75\38"))) > v11[LUAOBFUSACTOR_DECRYPT_STR_0("\24\127\253\62\33\113\252\6", "\109\85\16\159")])) then
					local v1054 = 0;
					while true do
						if (v1054 == (0 + 0)) then
							Client:waitTick(74 - 49);
							v93.pressBind(LUAOBFUSACTOR_DECRYPT_STR_0("\44\246\180\21\26\76\164\38\240\166", "\208\71\147\205\59\123\56"), true);
							v1054 = 1 + 0;
						end
						if (v1054 == (3 - 1)) then
							Client:waitTick(66 + 4);
							break;
						end
						if (v1054 == 1) then
							Client:waitTick(692 - (586 + 103));
							v93.pressBind(LUAOBFUSACTOR_DECRYPT_STR_0("\92\37\157\246\86\52\144\185\84\43", "\216\55\64\228"), false);
							v1054 = 2;
						end
					end
				end
				Client:waitTick(1 + 2);
			end
			return {[LUAOBFUSACTOR_DECRYPT_STR_0("\188\128\59\193\178\230", "\139\223\232\94\162\217\149")]=v632,[LUAOBFUSACTOR_DECRYPT_STR_0("\198\151\34\227\175", "\170\181\227\67\145\219\53")]=v634,[LUAOBFUSACTOR_DECRYPT_STR_0("\92\157\27\177\76\145\27", "\210\57\229\126")]=v635,[LUAOBFUSACTOR_DECRYPT_STR_0("\191\54\254\139\61\199\183\161\35\239\181", "\227\216\83\138\198\82\165")]=v633};
		end
	end
end;
v166.userFunc.breakBlock = function()
	local v636 = {{[LUAOBFUSACTOR_DECRYPT_STR_0("\37\180\187\125", "\146\75\213\214\24")]=LUAOBFUSACTOR_DECRYPT_STR_0("\107\107\213\75\58\102\84\90\106\194\76\123", "\53\42\30\161\36\26\37"),[LUAOBFUSACTOR_DECRYPT_STR_0("\251\236\249\227", "\128\157\153\151")]=v166.checks.primary.autoCaptcha},{[LUAOBFUSACTOR_DECRYPT_STR_0("\120\116\129\44", "\19\22\21\236\73\117")]=LUAOBFUSACTOR_DECRYPT_STR_0("\94\214\174\168\249\185\109\213\127\192\161\162", "\150\23\165\194\201\151\221\77"),[LUAOBFUSACTOR_DECRYPT_STR_0("\120\46\230\25", "\122\30\91\136")]=v166.checks.secondary.scoreboard},{[LUAOBFUSACTOR_DECRYPT_STR_0("\177\165\232\181", "\237\223\196\133\208")]=LUAOBFUSACTOR_DECRYPT_STR_0("\255\7\206\188\95\238\156\43\203\187\93\241", "\154\188\104\163\222\62"),[LUAOBFUSACTOR_DECRYPT_STR_0("\51\248\35\248", "\162\85\141\77\155\112\47")]=v166.checks.secondary.combat},{[LUAOBFUSACTOR_DECRYPT_STR_0("\28\40\171\75", "\46\114\73\198")]=LUAOBFUSACTOR_DECRYPT_STR_0("\138\112\54\200\60\69\176\112\114", "\42\197\30\22\143\78"),[LUAOBFUSACTOR_DECRYPT_STR_0("\117\80\81\60", "\95\19\37\63")]=v133.User.onGround},{[LUAOBFUSACTOR_DECRYPT_STR_0("\127\45\170\249", "\103\17\76\199\156\17")]=LUAOBFUSACTOR_DECRYPT_STR_0("\156\44\131\168\116\17\183\254\243\8\137\231\95\27", "\154\211\74\229\136\60\112\217"),[LUAOBFUSACTOR_DECRYPT_STR_0("\169\9\228\206", "\39\207\124\138\173\101")]=function()
		return v74().hand.off.item:getItem():isBlockItem();
	end},{[LUAOBFUSACTOR_DECRYPT_STR_0("\192\0\78\197", "\194\174\97\35\160")]=LUAOBFUSACTOR_DECRYPT_STR_0("\204\33\48\7\191\9\41\7\242\51", "\98\159\64\93"),[LUAOBFUSACTOR_DECRYPT_STR_0("\8\164\35\28", "\68\110\209\77\127\113\102\59")]=function()
		if ((v166.Data.mainHand.name == v74().hand.main.name) and (v166.Data.offHand.name == v74().hand.off.name)) then
			return true;
		end
		return false;
	end},{[LUAOBFUSACTOR_DECRYPT_STR_0("\160\229\170\74", "\206\206\132\199\47\99\163")]=LUAOBFUSACTOR_DECRYPT_STR_0("\197\215\222\102\80\244\206\210\50\101\249\205\219", "\49\150\162\183\18"),[LUAOBFUSACTOR_DECRYPT_STR_0("\79\63\181\34", "\120\41\74\219\65\122\128")]=function()
		if not v74().hand.off.item:getItem():isBlockItem() then
			return false;
		end
		return v74().hand.main.item:isSuitableFor(v74().hand.off.item:getItem():getBlock());
	end}};
	return {[LUAOBFUSACTOR_DECRYPT_STR_0("\89\14\89\25\238\180", "\181\58\102\60\122\133\199")]=v636,[LUAOBFUSACTOR_DECRYPT_STR_0("\64\246\221\11\110", "\26\51\130\188\121")]=function()
		local v757 = 0 + 0;
		while true do
			if (v757 == (1 - 0)) then
				v166.Data.offHand = v74().hand.off;
				v166.Data.blockname = v74().hand.off.originalName;
				v757 = 3 - 1;
			end
			if (v757 == (611 - (295 + 314))) then
				if not v74().hand.off.item:getItem():isBlockItem() then
					v68.warn(LUAOBFUSACTOR_DECRYPT_STR_0("\221\145\41\11\9\23\228\25\230\141\56\89\65\17\251\93\225\140\43\89\72\94\245\85\231\129\39\89\64\16\183\86\238\132\36\24\71\26", "\57\136\226\76\121\41\126\151"));
					Data.checks[LUAOBFUSACTOR_DECRYPT_STR_0("\32\197\12\82\47\193\113\45\212\2", "\29\66\183\105\51\68\131")] = false;
					return false;
				end
				if not v74().hand.main.item:isSuitableFor(v74().hand.off.item:getItem():getBlock()) then
					v68.warn(LUAOBFUSACTOR_DECRYPT_STR_0("\112\54\76\220\5\44\90\142\75\42\93\142\77\42\69\202\76\43\78\142\68\101\90\219\76\49\72\204\73\32\9\218\74\42\69\142\67\42\91\142", "\174\37\69\41") .. v74().hand.off.name);
					Data.checks[LUAOBFUSACTOR_DECRYPT_STR_0("\131\164\75\15\27\163\186\65\13\27", "\112\225\214\46\110")] = false;
					return false;
				end
				v757 = 6 - 3;
			end
			if (v757 == 0) then
				v166.Data.world = World:getDimension();
				v166.Data.mainHand = v74().hand.main;
				v757 = 1963 - (1300 + 662);
			end
			if ((9 - 6) == v757) then
				v68.log(LUAOBFUSACTOR_DECRYPT_STR_0("\60\54\38\90\239\180\226\25\100\1\87\235\190\231\68\100", "\140\126\68\67\59\132\221") .. v74().hand.off.name);
				return true;
			end
		end
	end,[LUAOBFUSACTOR_DECRYPT_STR_0("\135\105\2\72\88\11\131", "\230\226\17\103\43\45\127")]=function()
		local v758 = 0;
		local v759;
		local v760;
		local v761;
		while true do
			if (v758 == (1757 - (1178 + 577))) then
				if (v761 and v761.data and (v761.data.name:lower() == v166.Data.blockname:lower())) then
					local v1057 = 0 + 0;
					while true do
						if (v1057 == (0 - 0)) then
							Player:getInteractionManager():breakBlock(v761.data.Pos);
							Client:waitTick((v759 and (1406 - (851 + 554))) or 2);
							break;
						end
					end
				elseif not v71.Block(4 + 0, false).Raycast:isMissed() then
					local v1097 = 0 - 0;
					while true do
						if (1 == v1097) then
							if not (v71.Block(8 - 4, false).data and (v71.Block(306 - (115 + 187), false).data.name:lower() == v166.Data.blockname:lower())) then
								v68.debug(LUAOBFUSACTOR_DECRYPT_STR_0("\254\67\208\11\139\223\67\207\66\137\215\12\197\95\199", "\231\176\44\164\43") .. v166.Data.SaveOffHandName);
							end
							break;
						end
						if (v1097 == (0 + 0)) then
							Player:getInteractionManager():interact(true);
							Client:waitTick((v759 and (1 + 0)) or (11 - 8));
							v1097 = 1162 - (160 + 1001);
						end
					end
				end
				Time:sleep(1 + 0);
				break;
			end
			if (v758 == (0 + 0)) then
				v759 = v2.admin.administrator;
				v760 = (v759 and (3.5 - 1)) or (362 - (237 + 121));
				v758 = 898 - (525 + 372);
			end
			if (v758 == (1 - 0)) then
				Client:waitTick(v760);
				v761 = v71.Block(12 - 8, false);
				v758 = 2;
			end
		end
	end};
end;
v166.userFunc.easyWand = function()
	local v637 = {{[LUAOBFUSACTOR_DECRYPT_STR_0("\175\199\41\172", "\236\193\166\68\201\206")]=LUAOBFUSACTOR_DECRYPT_STR_0("\37\46\220\126\68\24\201\97\16\56\192\112", "\17\100\91\168"),[LUAOBFUSACTOR_DECRYPT_STR_0("\92\179\130\239", "\27\58\198\236\140\211\67")]=v166.checks.primary.autoCaptcha},{[LUAOBFUSACTOR_DECRYPT_STR_0("\47\204\193\79", "\139\65\173\172\42\233")]=LUAOBFUSACTOR_DECRYPT_STR_0("\174\69\125\217\202\115\160\107\143\83\114\211", "\40\231\54\17\184\164\23\128"),[LUAOBFUSACTOR_DECRYPT_STR_0("\130\220\113\251", "\138\228\169\31\152\229")]=v166.checks.secondary.scoreboard},{[LUAOBFUSACTOR_DECRYPT_STR_0("\194\13\79\48", "\163\172\108\34\85\128")]=LUAOBFUSACTOR_DECRYPT_STR_0("\10\16\254\137\155\108\137\90\35\81\196\143\222\69\154\71", "\52\71\113\151\231\187\36\232"),[LUAOBFUSACTOR_DECRYPT_STR_0("\112\152\118\174", "\205\22\237\24")]=function()
		return v133.item(v74().hand.main.item).id(LUAOBFUSACTOR_DECRYPT_STR_0("\179\113\125\205\58\172\121\117\220\99\173\112\118\201\43\173", "\89\222\24\19\168"));
	end},{[LUAOBFUSACTOR_DECRYPT_STR_0("\251\88\94\178", "\113\149\57\51\215")]=LUAOBFUSACTOR_DECRYPT_STR_0("\74\113\198\179\162\233\109\117\198", "\160\25\16\171\214\130"),[LUAOBFUSACTOR_DECRYPT_STR_0("\119\205\57\126", "\235\17\184\87\29\29\178")]=function()
		return v166.Data.mainHand.name == v74().hand.main.name;
	end}};
	return {[LUAOBFUSACTOR_DECRYPT_STR_0("\169\161\124\251\251\185", "\144\202\201\25\152")]=v637,[LUAOBFUSACTOR_DECRYPT_STR_0("\42\207\5\108\239", "\96\89\187\100\30\155\42\135")]=function()
		local v762 = 0 - 0;
		while true do
			if ((1 + 0) == v762) then
				v166.Data.easyWandYLevel = v71.Block(39 - 19, false).data.Y;
				v166.Data.easyWandDirection = v71.Block(10, false).Side:getName();
				v762 = 3 - 1;
			end
			if (v762 == (721 - (316 + 403))) then
				v166.Data.mainHand = v74().hand.main;
				v68.log(LUAOBFUSACTOR_DECRYPT_STR_0("\8\204\16\83\58\74\44\195\7\10\127\115\44\207\15\79\126\61\96\141\47\69\121\118\40\201\67\94\117\61\20\151\67", "\29\77\173\99\42\26") .. v166.Data.easyWandYLevel .. LUAOBFUSACTOR_DECRYPT_STR_0("\196\227\9\126\27\235\254\31\129\225\19\115\84\225\173\77", "\109\228\130\103\26\59\143\151") .. v166.Data.easyWandDirection);
				v762 = 2 + 1;
			end
			if ((0 - 0) == v762) then
				v166.Data.world = World:getDimension();
				if not v133.item(v74().hand.main.item).id(LUAOBFUSACTOR_DECRYPT_STR_0("\142\113\160\220\61\88\46\130\151\34\189\209\59\75\61\151", "\228\227\24\206\185\94\42\79")) then
					v68.warn(LUAOBFUSACTOR_DECRYPT_STR_0("\251\49\50\186\244\18\35\142\44\56\188\244\19\63\194\38\62\166\179\91\35\198\39\54\186\167\91\57\192\98\58\169\189\21\112\198\35\57\172", "\80\174\66\87\200\212\123"));
					Data.checks[LUAOBFUSACTOR_DECRYPT_STR_0("\206\120\45\209\192\18\197\125", "\115\171\25\94\168\151")] = false;
					return false;
				end
				v762 = 1 + 0;
			end
			if (v762 == (7 - 4)) then
				return true;
			end
		end
	end,[LUAOBFUSACTOR_DECRYPT_STR_0("\9\170\225\34\226\24\183", "\151\108\210\132\65")]=function()
		local v763 = 0 + 0;
		local v764;
		while true do
			if (v763 == 0) then
				v764 = v71.Block(2 + 2, false);
				if (v764 and v764.data and (v764.data.Y == v166.Data.easyWandYLevel)) then
					local v1059 = v166.Data.easyWandDirection;
					Player:getInteractionManager():interactBlock(v764.data.Pos:getX(), v764.data.Pos:getY(), v764.data.Pos:getZ(), v1059, false);
					Client:waitTick(1);
				end
				break;
			end
		end
	end};
end;
v166.advancedFunc.pharaohFish = function()
	local v638 = {[LUAOBFUSACTOR_DECRYPT_STR_0("\213\85\0\70\238\64\201\80", "\52\184\52\105\40\166\33\167")]=v74().hand.main};
	local v639 = {{[LUAOBFUSACTOR_DECRYPT_STR_0("\92\15\192\173", "\172\50\110\173\200\90\180")]=LUAOBFUSACTOR_DECRYPT_STR_0("\218\175\224\67\187\153\245\92\239\185\252\77", "\44\155\218\148"),[LUAOBFUSACTOR_DECRYPT_STR_0("\235\238\34\56", "\209\141\155\76\91\180\71")]=v166.checks.primary.autoCaptcha},{[LUAOBFUSACTOR_DECRYPT_STR_0("\253\124\210\78", "\122\147\29\191\43")]=LUAOBFUSACTOR_DECRYPT_STR_0("\149\195\82\8\212\251\204\93\180\213\93\2", "\30\220\176\62\105\186\159\236"),[LUAOBFUSACTOR_DECRYPT_STR_0("\142\200\139\179", "\221\232\189\229\208\86\181\215")]=v166.checks.secondary.scoreboard},{[LUAOBFUSACTOR_DECRYPT_STR_0("\2\181\249\217", "\78\108\212\148\188")]=LUAOBFUSACTOR_DECRYPT_STR_0("\22\17\29\44\172\40\186\52\63\80\38\45\232", "\90\91\112\116\66\140\96\219"),[LUAOBFUSACTOR_DECRYPT_STR_0("\195\66\4\15", "\100\165\55\106\108\128\200")]=function()
		return v133.item(v74().hand.main.item).suitableItem(LUAOBFUSACTOR_DECRYPT_STR_0("\215\196\53", "\211\165\171\81"));
	end},{[LUAOBFUSACTOR_DECRYPT_STR_0("\10\116\223\207", "\188\100\21\178\170\183")]=LUAOBFUSACTOR_DECRYPT_STR_0("\77\22\93\182\242\228\106\18\93", "\173\30\119\48\211\210"),[LUAOBFUSACTOR_DECRYPT_STR_0("\93\204\55\57", "\90\59\185\89")]=function()
		return v638.mainHand.name == v74().hand.main.name;
	end}};
	return {[LUAOBFUSACTOR_DECRYPT_STR_0("\67\248\95\76\48\110", "\29\32\144\58\47\91")]=v639,[LUAOBFUSACTOR_DECRYPT_STR_0("\0\33\112\175\85", "\193\115\85\17\221\33")]=function()
		local v765 = 0 - 0;
		while true do
			if ((1 + 0) == v765) then
				Script.fish().castRod(19 - 9);
				v68.log(LUAOBFUSACTOR_DECRYPT_STR_0("\221\115\15\12\174\211\229\59\40\23\188\212\228\117\9\94\170\210\236\121\2\27\171", "\188\141\27\110\126\207"));
				v765 = 1 + 1;
			end
			if (v765 == (0 - 0)) then
				v166.Data.world = World:getDimension();
				if not v133.item(v74().hand.main.item).suitableItem(LUAOBFUSACTOR_DECRYPT_STR_0("\159\57\90", "\105\237\86\62\23\132\136")) then
					local v1060 = 0;
					while true do
						if (v1060 == (18 - (12 + 5))) then
							return false;
						end
						if (v1060 == (0 - 0)) then
							v68.warn(LUAOBFUSACTOR_DECRYPT_STR_0("\140\90\57\95\99\20\170\9\50\66\55\93\177\70\48\73\42\19\190\9\61\13\37\20\170\65\53\67\36\93\171\70\56\13\42\19\249\68\61\68\45\93\177\72\50\73", "\125\217\41\92\45\67"));
							Data.checks[LUAOBFUSACTOR_DECRYPT_STR_0("\73\188\7\77\130\84\81\146\15\76\139", "\59\57\212\102\63\227")] = false;
							v1060 = 1 - 0;
						end
					end
				end
				v765 = 1 - 0;
			end
			if (2 == v765) then
				return true;
			end
		end
	end,[LUAOBFUSACTOR_DECRYPT_STR_0("\120\240\122\4\104\252\122", "\103\29\136\31")]=function()
		if (v71.actionBar():find(LUAOBFUSACTOR_DECRYPT_STR_0("\61\34\211\41\77\94\58\213\106\84\27\43\214\106\79\16", "\38\126\78\186\74")) and Player:getPlayer():canSeeEntity(Player:getPlayer():getFishingBobber())) then
			local v860 = 0;
			while true do
				if (v860 == 0) then
					Player:getInteractionManager():interact();
					Client:waitTick(49 - 29);
					v860 = 1;
				end
				if (v860 == 1) then
					Script.fish().castRod(3 + 7);
					Client:waitTick(10);
					break;
				end
			end
		end
	end};
end;
v166.advancedFunc.waterlogged = function()
	local v640 = {{[LUAOBFUSACTOR_DECRYPT_STR_0("\207\65\39\143", "\228\161\32\74\234\39")]=LUAOBFUSACTOR_DECRYPT_STR_0("\31\145\30\186\176\162\53\144\42\135\2\180", "\224\94\228\106\213\144\225\84"),[LUAOBFUSACTOR_DECRYPT_STR_0("\182\253\73\195", "\97\208\136\39\160")]=v166.checks.primary.autoCaptcha},{[LUAOBFUSACTOR_DECRYPT_STR_0("\248\40\206\131", "\91\150\73\163\230\57\114")]=LUAOBFUSACTOR_DECRYPT_STR_0("\103\190\190\87\254\15\254\124\70\168\177\93", "\63\46\205\210\54\144\107\222"),[LUAOBFUSACTOR_DECRYPT_STR_0("\246\57\250\68", "\188\144\76\148\39")]=v166.checks.secondary.scoreboard},{[LUAOBFUSACTOR_DECRYPT_STR_0("\139\74\120\161", "\53\229\43\21\196\44\108\66")]=LUAOBFUSACTOR_DECRYPT_STR_0("\4\52\3\160\33\117\53\176\48\62\18\177", "\197\83\85\119"),[LUAOBFUSACTOR_DECRYPT_STR_0("\73\239\16\52", "\87\47\154\126")]=function()
		return (v74().hand.main.id == LUAOBFUSACTOR_DECRYPT_STR_0("\38\113\194\222\209\198\42\126\216\129\197\213\63\125\222\228\208\193\40\115\201\207", "\180\75\24\172\187\178")) or (v74().hand.off.id == LUAOBFUSACTOR_DECRYPT_STR_0("\206\208\235\6\127\54\248\22\215\131\242\2\104\33\235\47\193\204\230\8\121\48", "\112\163\185\133\99\28\68\153"));
	end},{[LUAOBFUSACTOR_DECRYPT_STR_0("\165\85\241\206", "\171\203\52\156")]=LUAOBFUSACTOR_DECRYPT_STR_0("\137\203\112\180\106\168\169\165\183\217", "\192\218\170\29\209\74\225\221"),[LUAOBFUSACTOR_DECRYPT_STR_0("\133\201\85\3", "\157\227\188\59\96\175\45\73")]=function()
		return (v166.Data.mainHand.name == v74().hand.main.name) and (v166.Data.offHand.name == v74().hand.off.name);
	end}};
	return {[LUAOBFUSACTOR_DECRYPT_STR_0("\188\194\210\21\58\172", "\81\223\170\183\118")]=v640,[LUAOBFUSACTOR_DECRYPT_STR_0("\53\85\173\169\237", "\113\70\33\204\219\153\82")]=function()
		local v766 = 0 - 0;
		while true do
			if ((4 - 3) == v766) then
				v166.Data.offHand = v74().hand.off;
				if not ((v74().hand.main.id == LUAOBFUSACTOR_DECRYPT_STR_0("\252\139\49\57\253\162\240\132\43\102\233\177\229\135\45\3\252\165\242\137\58\40", "\208\145\226\95\92\158")) or (v74().hand.off.id == LUAOBFUSACTOR_DECRYPT_STR_0("\179\232\211\73\236\231\174\30\170\187\202\77\251\240\189\39\188\244\222\71\234\225", "\120\222\129\189\44\143\149\207"))) then
					local v1061 = 354 - (5 + 349);
					while true do
						if (v1061 == (0 - 0)) then
							v68.warn(LUAOBFUSACTOR_DECRYPT_STR_0("\189\30\8\241\196\78\124\188\196\5\18\241\194\68\117\188\196\16\93\166\203\95\124\170\196\19\8\178\193\78\109\248\144\30\93\164\217\78\57\172\140\24\14", "\216\228\113\125\209\170\43\25"));
							return false;
						end
					end
				end
				v766 = 2;
			end
			if (v766 == (1271 - (266 + 1005))) then
				v166.Data.world = World:getDimension();
				v166.Data.mainHand = v74().hand.main;
				v766 = 1 + 0;
			end
			if (v766 == (6 - 4)) then
				v68.log(LUAOBFUSACTOR_DECRYPT_STR_0("\206\251\76\64\96\114\246\253\95\76\124\121\185\246\93\68\100\123\234\181\74\74\125\106\234\186\93\75\115\124\245\255\92", "\30\153\154\56\37\18"));
				return true;
			end
		end
	end,[LUAOBFUSACTOR_DECRYPT_STR_0("\24\161\242\15\46\9\188", "\91\125\217\151\108")]=function()
		local v767 = 0;
		local v768;
		while true do
			if (v767 == 0) then
				v768 = World:getWorldScanner(JavaWrapper:methodToJavaAsync(function(v1013)
					local v1014 = v1013:getName():getString():lower();
					if (v1014:find(LUAOBFUSACTOR_DECRYPT_STR_0("\245\22\167\102\219\234", "\190\153\115\198\16")) or v1014:find(LUAOBFUSACTOR_DECRYPT_STR_0("\40\116\165\147\41", "\231\90\27\202"))) then
						return true;
					else
						return false;
					end
				end), JavaWrapper:methodToJavaAsync(function(v1015)
					return not v1015:getUniversal():isWaterlogged();
				end));
				for v1016, v1017 in pairs(v768:scanReachable()) do
					if (v74().hand.main.id == LUAOBFUSACTOR_DECRYPT_STR_0("\140\141\86\167\93\147\133\94\182\4\150\133\76\167\76\190\134\77\161\85\132\144", "\62\225\228\56\194")) then
						Player:getPlayer():tryLookAt(v1017:getX(), v1017:getY(), v1017:getZ());
						if ((v1016 == (1 - 0)) or (v1016 == (1696 - (561 + 1135)))) then
							Client:waitTick(1 - 0);
						end
						Client:waitTick(2);
						Player:getInteractionManager():interact();
					end
				end
				break;
			end
		end
	end};
end;
v166.Hotkeys = {};
v166.Hotkeys.Infuse = function()
	v72.close();
	Chat:say(LUAOBFUSACTOR_DECRYPT_STR_0("\89\176\183\43\97\70\19\171", "\53\118\217\217\77\20"));
	JsMacros:waitForEvent(LUAOBFUSACTOR_DECRYPT_STR_0("\134\15\225\208\28\170\13\225\219\33", "\79\201\127\132\190"));
	Client:waitTick(3 - 2);
	v166.chestGui.InfuseRunes();
end;
v166.Hotkeys.Incinerate = function()
	v72.close();
	Chat:say(LUAOBFUSACTOR_DECRYPT_STR_0("\103\29\231\207\61\7\236\219", "\169\72\116\137"));
	JsMacros:waitForEvent(LUAOBFUSACTOR_DECRYPT_STR_0("\86\106\204\168\74\121\219\163\124\116", "\198\25\26\169"));
	Client:waitTick(1);
	v166.chestGui.IncinerateRunes();
end;
local v206 = {"§9[v2.1 Update Log]","§aAdded .OverWriteSettings to update settings","§aAdded Chest Gui Offset Settings","§aAdded Chest Gui Button Offset Settings","§aAdded error when on wrong server address","§9[v2.2 Update Log]","§aAdded Easy Wand for easy block placement","§aAdded Pharaoh Fishing for auto fishing","§aAdded auto place and break block","§aAdded Auto Stack Kill for mobs"};
local v207 = {"§d[Super Users+]","§aLower increments for Auction House Easy Bid","§aAuto Full Screen for /loopVanished and auto captcha","§aAdded Trade Nuker for Buckets of Cod","§aCustom Trade Speeds for auto trader","§aReworked 'Console' Option for log method","§aAdded option to disable fullscreen on events","§9[v2.2 Update Log]","§aAdded Hotkeys for Infuse/Incinerate","§aSettings to customize auto kill mobstack"};
if (Sys.User.Lv(LUAOBFUSACTOR_DECRYPT_STR_0("\106\124\208\54\139\84\99", "\31\41\19\189\70\231\49\27")) >= (3 - 2)) then
	v139.addCommand(LUAOBFUSACTOR_DECRYPT_STR_0("\162\195\85\231\163\214\93\233\176", "\134\215\179\49"), function()
		Sys.Print.massPrint(v206);
		if (Sys.User.Lv(LUAOBFUSACTOR_DECRYPT_STR_0("\194\251\91\246\89\22\249", "\115\129\148\54\134\53")) > (1902 - (484 + 1417))) then
			Sys.Print.massPrint(v207);
		end
	end);
end
if (Sys.User.Lv(LUAOBFUSACTOR_DECRYPT_STR_0("\202\136\93\91\212\13\11", "\115\137\231\48\43\184\104")) >= (4 - 2)) then
	local v769 = 0 - 0;
	while true do
		if (v769 == (776 - (48 + 725))) then
			v139.addCommand(LUAOBFUSACTOR_DECRYPT_STR_0("\241\230\14\232\172\185\112\240\231\25\234\167\165\45\216\253\31", "\95\185\137\122\131\201\192"), v166.Hotkeys.Incinerate);
			v139.addCommand(LUAOBFUSACTOR_DECRYPT_STR_0("\94\57\211\24\32\111\121\243\27\55\121\33\224\28\42\114\4\210\29\32\101", "\69\22\86\167\115"), v166.hotkey.throwgoodRunes);
			break;
		end
		if ((0 - 0) == v769) then
			v111.addChestCommand({LUAOBFUSACTOR_DECRYPT_STR_0("\24\196\7\193\5\103\24\196\7\193\5\6\91\144\78\151\64\103\121\145\68\149\76\40\86", "\71\56\228\39\225\37")}, "§6+1", function()
				v166.chestGui.increaseBid(2 - 1);
			end, LUAOBFUSACTOR_DECRYPT_STR_0("\163\228\246\63\255\255", "\66\208\129\132\73\154\141"));
			v111.addChestCommand({LUAOBFUSACTOR_DECRYPT_STR_0("\10\31\150\189\10\31\150\189\10\31\150\220\73\75\223\235\79\31\247\232\73\75\223\242\68", "\157\42\63\182")}, "§6+5%", function()
				v166.chestGui.increaseBid(13 - 8, true);
			end, LUAOBFUSACTOR_DECRYPT_STR_0("\200\59\59\234\202\201", "\175\187\94\73\156"));
			v769 = 1 + 0;
		end
		if ((1 + 1) == v769) then
			v139.addloop(LUAOBFUSACTOR_DECRYPT_STR_0("\33\58\91\22\26\45\201\53\55\74\36\86\47\207\41\47", "\160\70\95\47\64\123\67"), true, function()
				v166.advancedFunc.getVanished_new();
			end, nil, function()
				v166.Data[LUAOBFUSACTOR_DECRYPT_STR_0("\217\95\96\37\215\84\115\7\223\84\125\34\214\95\112\99", "\81\190\58\20")] = false;
			end);
			v139.addCommand(LUAOBFUSACTOR_DECRYPT_STR_0("\100\66\162\124\134\48\16\26\66\75\163\100\134", "\83\44\45\214\23\227\73\63"), v166.Hotkeys.Infuse);
			v769 = 856 - (152 + 701);
		end
		if (v769 == (1312 - (430 + 881))) then
			v139.addCommand(LUAOBFUSACTOR_DECRYPT_STR_0("\242\191\82\136\33\251\179\85\182\37\241", "\64\149\218\38\222"), v166.Vanished);
			v139.addCommand(LUAOBFUSACTOR_DECRYPT_STR_0("\25\168\206\196\8\166\206\213\87\169\223\219\31\181", "\176\122\199\170"), function()
				v166.userFunc.trade.nuker(LUAOBFUSACTOR_DECRYPT_STR_0("\48\30\179\219\52\63\82\4\182\144\18\36\22", "\75\114\107\208\176\81"));
			end);
			v769 = 1 + 1;
		end
	end
end
if (Sys.User.Lv(LUAOBFUSACTOR_DECRYPT_STR_0("\218\36\36\101\245\46\49", "\21\153\75\73")) >= 1) then
	v111.addChestCommand({LUAOBFUSACTOR_DECRYPT_STR_0("\32\7\72\255\242\96\0\31\89\247\160\6\65\35\68\241\185\83\25\90", "\38\105\115\45\146\210"),LUAOBFUSACTOR_DECRYPT_STR_0("\43\2\9\123\115\36\31\0\98\54\16", "\83\98\118\108\22")}, LUAOBFUSACTOR_DECRYPT_STR_0("\111\226\117\57\160\150\99\97\234\119\41", "\67\41\139\25\77\197\228"), function()
		v166.chestGui.editfilter(v74().hand.main.item:getItem());
	end, LUAOBFUSACTOR_DECRYPT_STR_0("\251\171\220\60\83\250", "\136\136\206\174\74\54"));
	v111.addChestCommand({LUAOBFUSACTOR_DECRYPT_STR_0("\13\231\131\136\19\130\178\40\231\131\151\19\236\139\45\240\141\144\67\237", "\219\68\147\230\229\51\196"),LUAOBFUSACTOR_DECRYPT_STR_0("\85\90\243\237\70\97\18\112\90\243\242", "\123\28\46\150\128\102\39")}, LUAOBFUSACTOR_DECRYPT_STR_0("\35\64\17\67\30\155\123\93\10\93\31\86\9", "\21\101\41\125\55\123\233\91"), function()
		v166.chestGui.filterHotbar();
	end, LUAOBFUSACTOR_DECRYPT_STR_0("\145\238\188\229\9\32", "\82\226\139\206\147\108"));
	v111.addChestCommand(v111.commonContainers, LUAOBFUSACTOR_DECRYPT_STR_0("\220\9\91\180\140\195\19\67\180\223", "\172\145\102\45\209"), function()
		v166.chestGui.dumbGoodRunes();
	end, LUAOBFUSACTOR_DECRYPT_STR_0("\231\8\30\86\142\108", "\30\148\109\108\32\235"));
	v111.addChestCommand({"㓈",LUAOBFUSACTOR_DECRYPT_STR_0("\84\7\81\31\84\7\81\31\84\7\81\109\1\73\20\31\61\67\20\81\0\78\23\86\17\85", "\63\116\39\113")}, LUAOBFUSACTOR_DECRYPT_STR_0("\17\94\193\249\3\45", "\200\88\48\167\140\112\72"), function()
		v166.chestGui.InfuseRunes();
	end, LUAOBFUSACTOR_DECRYPT_STR_0("\209\91\58\189\231\208", "\130\162\62\72\203"));
	v111.addChestCommand({"㓈",LUAOBFUSACTOR_DECRYPT_STR_0("\227\247\158\120\136\143\252\248\227\133\168\126\130\147\175\233\172\247\148\126\132\137\225\248\177\182\169\117", "\157\195\215\221\16\231\224\143")}, LUAOBFUSACTOR_DECRYPT_STR_0("\86\215\8\133\237\122\203\10\152\230", "\131\31\185\107\236"), function()
		v166.chestGui.IncinerateRunes();
	end, LUAOBFUSACTOR_DECRYPT_STR_0("\184\174\88\50\174\185", "\68\203\203\42"));
	v111.addChestCommand({LUAOBFUSACTOR_DECRYPT_STR_0("\112\66\101\220\81\23\93\214\83\71\112\203", "\185\35\55\21")}, LUAOBFUSACTOR_DECRYPT_STR_0("\149\240\179\144\182\235\255\172\178\247\187", "\228\211\153\223"), function()
		v166.chestGui.SupperHopperfilter({v74().hand.main.item:getItem()});
	end, LUAOBFUSACTOR_DECRYPT_STR_0("\71\234\74\43\63\20", "\102\52\143\56\93\90"));
	v111.addChestCommand({LUAOBFUSACTOR_DECRYPT_STR_0("\117\2\176\45\247\6\63\175\56\245\67\5", "\133\38\119\192\72")}, LUAOBFUSACTOR_DECRYPT_STR_0("\209\168\120\239\242\179\52\211\248\181\118\250\229", "\155\151\193\20"), function()
		v166.chestGui.SupperHopperHotbar();
	end, LUAOBFUSACTOR_DECRYPT_STR_0("\61\161\18\88\126\60", "\27\78\196\96\46"));
	v111.addChestCommand({LUAOBFUSACTOR_DECRYPT_STR_0("\170\187\242\248\58\4\12\170\187\242\248\91\71\88\227\237\183\248\91\81\79\254\242\189\182", "\44\138\155\210\216\26\36")}, LUAOBFUSACTOR_DECRYPT_STR_0("\240\28\233\31", "\157\219\45\217\58"), function()
		v166.chestGui.increaseBid(27 - 17, true);
	end, LUAOBFUSACTOR_DECRYPT_STR_0("\163\184\36\195\251\162", "\158\208\221\86\181"));
	v111.addChestCommand({LUAOBFUSACTOR_DECRYPT_STR_0("\160\1\170\75\96\255\120\160\1\170\75\1\188\44\233\87\239\75\1\170\59\244\72\229\5", "\88\128\33\138\107\64\223")}, LUAOBFUSACTOR_DECRYPT_STR_0("\138\167\37\48", "\142\161\146\21\21\205\27"), function()
		v166.chestGui.increaseBid(50, true);
	end, LUAOBFUSACTOR_DECRYPT_STR_0("\3\255\110\21\31\235", "\172\112\154\28\99\122\153"));
	v111.addChestCommand({LUAOBFUSACTOR_DECRYPT_STR_0("\139\183\224\94\139\183\224\94\139\183\224\63\200\227\169\8\206\183\129\11\200\227\169\17\197", "\126\171\151\192")}, LUAOBFUSACTOR_DECRYPT_STR_0("\38\76", "\57\94\126\153\124\103\154"), function()
		v166.chestGui.increaseBid(153 - 53, true);
	end, LUAOBFUSACTOR_DECRYPT_STR_0("\4\194\91\15\211\83", "\33\119\167\41\121\182"));
	v139.addCommand(LUAOBFUSACTOR_DECRYPT_STR_0("\70\161\47\89\136\82\12\44\68\188\58", "\88\39\212\91\54\203\51\124"), v166.userFunc.autoCaptcha);
	v139.CommandBuilder(LUAOBFUSACTOR_DECRYPT_STR_0("\58\173\161\134\111", "\168\76\204\212\234\27\174"), function(v819)
		v166.userFunc.vault(v819);
	end, {{},{{[LUAOBFUSACTOR_DECRYPT_STR_0("\152\29\35\65", "\46\236\100\83\36\105\134")]=LUAOBFUSACTOR_DECRYPT_STR_0("\42\238\149\137\143\8", "\111\89\154\231\224\225"),[LUAOBFUSACTOR_DECRYPT_STR_0("\244\212\22\176\56\221\217\194\254\200\15\181\56\240\211\223", "\177\157\186\102\197\76\153\188")]=LUAOBFUSACTOR_DECRYPT_STR_0("\171\173\44\174\172\186\96\129\163\179\37", "\207\194\222\64")}}});
	v139.addloop(LUAOBFUSACTOR_DECRYPT_STR_0("\19\112\214\76", "\179\123\21\183\32\232"), true, v166.userFunc.autoCommands.heal);
	v139.addloop(LUAOBFUSACTOR_DECRYPT_STR_0("\192\42\212", "\98\166\67\172\93\211"), true, v166.userFunc.autoCommands.fix);
	v139.addloop(LUAOBFUSACTOR_DECRYPT_STR_0("\228\236\211\193\16\75\230\226", "\130\135\131\183\181\98\42"), v166.userFunc.trade.checks, function()
		v166.userFunc.trade.trade(LUAOBFUSACTOR_DECRYPT_STR_0("\225\163\56\232\37\215\246\52\229\96\224\185\63", "\64\163\214\91\131"));
	end, Script.Trade.tagsOff, v166.userFunc.trade.start);
	v139.addloop(LUAOBFUSACTOR_DECRYPT_STR_0("\20\33\14\57\38\92\59\10\55\60\20\61\11", "\95\113\79\120\86"), true, v166.userFunc.EnvoyTracers, v118.entity.traceOff);
	v139.addloop(LUAOBFUSACTOR_DECRYPT_STR_0("\170\231\51\185\149\25\58\205\141\253\51\184\143\3\56", "\169\203\148\64\208\230\109\95"), {{[LUAOBFUSACTOR_DECRYPT_STR_0("\198\22\11\183", "\134\168\119\102\210\74\123\92")]=LUAOBFUSACTOR_DECRYPT_STR_0("\131\15\15\25\153\1\24", "\57\203\110\124"),[LUAOBFUSACTOR_DECRYPT_STR_0("\168\198\27\42", "\96\206\179\117\73")]=Script.fish().checks.hasRod}}, v166.userFunc.fishing.assist);
	v139.addCommand(LUAOBFUSACTOR_DECRYPT_STR_0("\207\12\97\32\147\20\101\44\149\38\68\32\149\55\126\43\134\48", "\69\225\67\23"), function()
		Script.tool.updateSettings(LUAOBFUSACTOR_DECRYPT_STR_0("\215\132\39\161\213\141\222\104", "\27\164\225\83\213\188\227\185"), v5.Player);
		Script.tool.updateSettings(LUAOBFUSACTOR_DECRYPT_STR_0("\187\26\146\251\213\187\10\150\234\206\134\8\145", "\167\232\111\226\158"), v5.SuperSettings);
		Script.tool.updateSettings(LUAOBFUSACTOR_DECRYPT_STR_0("\103\43\34\8\23\88\232", "\209\36\68\79\120\123\61\144"), v166.defultSettings);
	end);
	v139.CommandBuilder(LUAOBFUSACTOR_DECRYPT_STR_0("\77\244\71\52\43\69\237\95\8\20\77\226\88", "\96\44\129\51\91"), function(v820)
		local v821 = 104 - (103 + 1);
		while true do
			if ((554 - (475 + 79)) == v821) then
				Data.checks[LUAOBFUSACTOR_DECRYPT_STR_0("\20\26\24\169\216\225\255\25\60\24\167\240\227", "\147\117\111\108\198\147\136")] = not Data.checks[LUAOBFUSACTOR_DECRYPT_STR_0("\11\163\214\91\33\191\206\88\57\162\195\87\1", "\52\106\214\162")];
				if Data.checks[LUAOBFUSACTOR_DECRYPT_STR_0("\4\26\202\171\218\12\3\210\151\229\4\12\213", "\145\101\111\190\196")] then
					v68.msg(LUAOBFUSACTOR_DECRYPT_STR_0("\113\216\149\227\15\123\196\141\224\15\99\217\128\239\68\16\232\143\237\77\92\200\133\172\73\95\223\193", "\47\48\173\225\140") .. v820);
					v166.userFunc.autoKillStack(v820).start();
					while Data.checks[LUAOBFUSACTOR_DECRYPT_STR_0("\66\216\149\215\0\165\79\193\178\204\42\175\72", "\204\35\173\225\184\75")] do
						Time:sleep(2 - 1);
						if not v139.getChecks(v166.userFunc.autoKillStack().checks, LUAOBFUSACTOR_DECRYPT_STR_0("\239\81\247\130\205\175\2\226\119\247\140\229\173", "\110\142\36\131\237\134\198")) then
							break;
						end
						v166.userFunc.autoKillStack(v820).execute();
					end
					v68.msg("§cAuto Kill Stack Disabled");
				end
				break;
			end
		end
	end, {{{[LUAOBFUSACTOR_DECRYPT_STR_0("\111\89\163\245", "\88\27\32\211\144")]=LUAOBFUSACTOR_DECRYPT_STR_0("\158\191\172\53\197\170", "\16\237\203\222\92\171\205\59"),[LUAOBFUSACTOR_DECRYPT_STR_0("\232\191\173\157\11\151\228\162\190\154\22\163\245\184\178\134", "\211\129\209\221\232\127")]=LUAOBFUSACTOR_DECRYPT_STR_0("\36\64\68\16\229\13\181", "\38\105\47\38\68\156\125\208")},{[LUAOBFUSACTOR_DECRYPT_STR_0("\152\153\181\65", "\72\236\224\197\36\156")]=LUAOBFUSACTOR_DECRYPT_STR_0("\215\190\67\141\193\184\80", "\234\164\203\36"),[LUAOBFUSACTOR_DECRYPT_STR_0("\24\248\135\37\137\77\101\123\4\227\147", "\18\107\141\224\66\236\62\17")]=v166.userFunc.autoKillStack().getMobTypes}}});
	v139.addloop(LUAOBFUSACTOR_DECRYPT_STR_0("\169\189\25\246\160\141\16\248\168\164", "\151\203\207\124"), v166.userFunc.breakBlock().checks, v166.userFunc.breakBlock().execute, nil, v166.userFunc.breakBlock().start);
	v139.addloop(LUAOBFUSACTOR_DECRYPT_STR_0("\209\27\226\27\215\136\16\192", "\164\180\122\145\98\128\233\126"), v166.userFunc.easyWand().checks, v166.userFunc.easyWand().execute, nil, v166.userFunc.easyWand().start);
	v139.addloop(LUAOBFUSACTOR_DECRYPT_STR_0("\171\12\26\223\186\11\19\235\178\23\19", "\173\219\100\123"), v166.advancedFunc.pharaohFish().checks, v166.advancedFunc.pharaohFish().execute, nil, v166.advancedFunc.pharaohFish().start);
end
if (Sys.User.Lv(LUAOBFUSACTOR_DECRYPT_STR_0("\151\39\65\27\31\177\48", "\115\212\72\44\107")) >= (3 + 0)) then
	v139.addCommand(LUAOBFUSACTOR_DECRYPT_STR_0("\155\238\64\119\239\34\161\67", "\36\236\143\52\18\157\78\206"), v166.advancedFunc.waterlogged().execute);
	v111.addChestCommand({LUAOBFUSACTOR_DECRYPT_STR_0("\114\83\61\88\246\94\70\120\124\235\81\79\60", "\159\48\33\88\47")}, LUAOBFUSACTOR_DECRYPT_STR_0("\43\67\18\247\243\209\56\35\22\77\23", "\87\127\34\121\146\211\129\87"), function()
		Script.brewing().takePotion();
	end, LUAOBFUSACTOR_DECRYPT_STR_0("\184\228\151\250\32\44", "\20\203\129\229\140\69\94\175"));
	v111.addChestCommand({LUAOBFUSACTOR_DECRYPT_STR_0("\141\212\81\33\230\236\168\134\103\34\238\236\171", "\130\207\166\52\86\143")}, LUAOBFUSACTOR_DECRYPT_STR_0("\107\94\23\173\154\116\53\67\85\29", "\65\42\58\115\141\202\27"), function()
		Script.brewing().addPotion();
	end, LUAOBFUSACTOR_DECRYPT_STR_0("\88\1\71\215\42\89", "\79\43\100\53\161"));
	v139.addloop(LUAOBFUSACTOR_DECRYPT_STR_0("\241\209\219\64\121\69\56\65", "\36\144\164\175\47\52\44\86"), v166.userFunc.mine().checks, v166.userFunc.mine().mine, v166.userFunc.mine().stopMoving, v166.userFunc.mine().start);
	v139.addloop(LUAOBFUSACTOR_DECRYPT_STR_0("\49\11\237\165\113\51\10\255\146\126\62\6\232\172\122\52", "\31\80\111\155\196"), {{[LUAOBFUSACTOR_DECRYPT_STR_0("\93\88\236\209", "\79\51\57\129\180")]=LUAOBFUSACTOR_DECRYPT_STR_0("\1\179\62\81\202\63\183\52", "\185\87\210\80\56"),[LUAOBFUSACTOR_DECRYPT_STR_0("\192\5\160\91", "\53\166\112\206\56\29\153")]=function()
		return v166.Data[LUAOBFUSACTOR_DECRYPT_STR_0("\68\18\88\3\230\39\119\23", "\79\18\115\54\106\149")];
	end}}, function()
		v166.Vanished(true, true);
	end, nil, function()
		v166.Data[LUAOBFUSACTOR_DECRYPT_STR_0("\124\83\64\87\54\117\136\162", "\198\42\50\46\62\69\29\237")] = false;
	end);
end
local function v208()
	local v641 = JsMacros:getOpenContexts();
	local v642 = nil;
	local v643 = math.huge;
	for v770, v771 in pairs(v641) do
		local v772 = Time:time() - v771.startTime;
		if (v772 < v643) then
			local v861 = 0 + 0;
			while true do
				if (v861 == (0 + 0)) then
					v643 = v772;
					v642 = v771;
					break;
				end
			end
		end
	end
	for v773, v774 in pairs(v641) do
		if (v774 ~= v642) then
			v774:closeContext();
		end
	end
end
v68.msg("§d" .. Sys.User.name .. LUAOBFUSACTOR_DECRYPT_STR_0("\130\141\19\53\43\175\3\94\130\174\25\121\14\161\12\73\203\185\86\11\45\166\28\94\209\178\19\43\104\182\92", "\59\162\218\118\89\72\192\110"));
v208();
JsMacros:on(LUAOBFUSACTOR_DECRYPT_STR_0("\183\251\179\73\101\4\97\18\132\249\181", "\97\229\158\208\63\40\97\18"), JavaWrapper:methodToJavaAsync(function(v644)
	local v645, v646 = pcall(function()
		if (v644.text and v644.text:getString():find({"➜"})) then
			Sys.EnvokeMessage(v644.text:getString());
		end
	end);
end));
JsMacros:on(LUAOBFUSACTOR_DECRYPT_STR_0("\30\203\124\66\161\40\221\97\71\139\40", "\236\77\174\18\38"), JavaWrapper:methodToJavaAsync(function(v647)
	local v648, v649 = pcall(function()
		if (v647.message and string.find(v647.message, "/")) then
			Sys.EnvokeMessage(Sys.User.name .. LUAOBFUSACTOR_DECRYPT_STR_0("\218\29", "\117\224\61\175") .. v647.message);
		end
	end);
end));
Sys.EnvokeMessage(Sys.User.name .. LUAOBFUSACTOR_DECRYPT_STR_0("\171\79\199\155\171\75\201\143\236\66\194\200\226\73", "\232\139\39\166"));