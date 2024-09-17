local obf_stringchar = string.char;
local obf_stringbyte = string.byte;
local obf_stringsub = string.sub;
local obf_bitlib = bit32 or bit;
local obf_XOR = obf_bitlib.bxor;
local obf_tableconcat = table.concat;
local obf_tableinsert = table.insert;
local function LUAOBFUSACTOR_DECRYPT_STR_0(LUAOBFUSACTOR_STR, LUAOBFUSACTOR_KEY)
	local result = {};
	for i = 1, #LUAOBFUSACTOR_STR do
		obf_tableinsert(result, obf_stringchar(obf_XOR(obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_STR, i, i + 1)), obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_KEY, 1 + (i % #LUAOBFUSACTOR_KEY), 1 + (i % #LUAOBFUSACTOR_KEY) + 1))) % 256));
	end
	return obf_tableconcat(result);
end
local v0 = {LUAOBFUSACTOR_DECRYPT_STR_0("\148\248\243\32\234\171\194\12\148\254", "\126\177\163\187\69\134\219\167"),LUAOBFUSACTOR_DECRYPT_STR_0("\102\246\30\215\245\34\193\106\232\243\39\136\23", "\156\67\173\74\165"),LUAOBFUSACTOR_DECRYPT_STR_0("\113\140\100\25\184\35\84\53\163\70\4\249\27", "\38\84\215\41\118\220\70"),LUAOBFUSACTOR_DECRYPT_STR_0("\21\45\17\0\176\16\59\45\22\251\66\23\54\29\236\21\43", "\158\48\118\66\114"),LUAOBFUSACTOR_DECRYPT_STR_0("\238\31\35\36\61\229\214\164\32\85\11", "\155\203\68\112\86\19\197"),LUAOBFUSACTOR_DECRYPT_STR_0("\3\230\23\248\77\113\235\189\123", "\152\38\189\86\156\32\24\133"),LUAOBFUSACTOR_DECRYPT_STR_0("\185\108\148\84\178\23\134\66\241\94\169\3\193", "\38\156\55\199"),LUAOBFUSACTOR_DECRYPT_STR_0("\237\70\88\45\5\113\246\76\184\120\110\109\46", "\35\200\29\28\72\115\20\154"),LUAOBFUSACTOR_DECRYPT_STR_0("\92\132\254\200\131\41\38\92\130", "\84\121\223\177\191\237\76")};
local v1 = {[LUAOBFUSACTOR_DECRYPT_STR_0("\182\83\199\181\20\81\61\196", "\161\219\54\169\192\90\48\80")]=LUAOBFUSACTOR_DECRYPT_STR_0("\106\77\13\53\69\71\24\8\74\2\35\42\68\79\1\43\77\2\44\42\72\70\5\55", "\69\41\34\96"),[LUAOBFUSACTOR_DECRYPT_STR_0("\168\198\196\30\14\36\187\196\222\4\5", "\75\220\163\183\106\98")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\18\182\138\46\220\16\148\138\58\220", "\185\98\218\235\87")]=Player:getPlayer():getName():getString(),[LUAOBFUSACTOR_DECRYPT_STR_0("\222\47\34\244", "\202\171\92\71\134\190")]=LUAOBFUSACTOR_DECRYPT_STR_0("\39\206\34\157\58\196\62", "\232\73\161\76")};
local v2 = {[LUAOBFUSACTOR_DECRYPT_STR_0("\136\218\80\84\14\175\253\75\78\31\185\213\71\89", "\126\219\185\34\61")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\28\220\87\127\127\101\234\196\4\203\93\121\109", "\135\108\174\62\18\30\23\147")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\165\236\41\196\22\170\50\213\175\202\34\206\27\165\32", "\167\214\137\74\171\120\206\83")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\143\245\38\92\241\171\142\244\17\85\253\164\128\227", "\199\235\144\82\61\152")]=false};
local v3 = {[LUAOBFUSACTOR_DECRYPT_STR_0("\23\4\176\38\6\4\160\8\15\19\186\32\20", "\75\103\118\217")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\244\87\98\29\169\10\226\90\113\22\181\27\195", "\126\167\52\16\116\217")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\219\43\35\143\186\29\253\218\55\3\136\177\26\247\219", "\156\168\78\64\224\212\121")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\3\235\177\207\14\226\160\202\36\230\160\205\12\253", "\174\103\142\197")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\101\43\77\49\53\74\206\87\58", "\152\54\72\63\88\69\62")]=false};
local v4 = {[LUAOBFUSACTOR_DECRYPT_STR_0("\196\214\231\81\213\214\247\80\219\195\253", "\60\180\164\142")]=true};
Chat:toast("§fConsole Log:", LUAOBFUSACTOR_DECRYPT_STR_0("\113\88\69\48\40\248\82\89\76\0\105\41\226\6\24\89\0\61\51\228\28\95\30\38\33\38\249\82\85\91\22\58\38\234\23\75\30\17\33\34\227\82\84\81\4\45\103\249\26\93\30\2\40\42\232\82\79\87\17\33\40\248\6\24\83\10\45\52", "\114\56\62\101\73\71\141"));
local function v5(v13, v14)
	Chat:log(v14 .. v13);
end
local function v6(v15, v16, v17)
	if (v15 == LUAOBFUSACTOR_DECRYPT_STR_0("\189\251\201\203\170", "\164\216\137\187")) then
		v5("§4" .. v17, "§4" .. v15);
	end
	if ((v15 == LUAOBFUSACTOR_DECRYPT_STR_0("\198\227\34\166\138\241\12", "\107\178\134\81\210\198\158")) and v1.testlogging and v16) then
		v5("§a" .. v17, "§a" .. v15);
	end
	if ((v15 == LUAOBFUSACTOR_DECRYPT_STR_0("\61\28\144\201\184\20\1\133", "\202\88\110\226\166")) and v16) then
		v5("§c" .. v17, "§c" .. v15);
	end
	if (v15 == LUAOBFUSACTOR_DECRYPT_STR_0("\207\0\133", "\170\163\111\226\151")) then
		v5("§a" .. v17);
	end
end
local function v7(v18, v19)
	if (World:getScoreboards() and World:getScoreboards():getObjectiveSlot(1 - 0)) then
		for v29, v30 in pairs(World:getScoreboards():getObjectiveSlot(1 - 0):getKnownPlayersDisplayNames()) do
			if string.find(v30:getString(), v18) then
				return true, v30:getString();
			end
		end
		if v19 then
			v6(LUAOBFUSACTOR_DECRYPT_STR_0("\20\34\160\55\92\27\38\22", "\73\113\80\210\88\46\87"), v2.primaryChecks, LUAOBFUSACTOR_DECRYPT_STR_0("\180\63\200\0\167\136\63\141\29\233\193\59\223\29\233\134\108\228\1\235\128\34\201", "\135\225\76\173\114"));
		end
		return false, nil;
	else
		v6(LUAOBFUSACTOR_DECRYPT_STR_0("\31\255\170\191\190\145\168\29", "\199\122\141\216\208\204\221"), v2.primaryChecks, LUAOBFUSACTOR_DECRYPT_STR_0("\152\206\21\226\56\255\190\157\31\254\56\225\191\210\30\247\56\197\168\207\6\245\106\169", "\150\205\189\112\144\24"));
	end
end
local function v8(v20, v21)
	local v22 = 350 - (87 + 263);
	local v23;
	while true do
		if (v22 == 0) then
			v23 = Reflection:getDeclaredField(v20:getClass(), v21);
			v23:setAccessible(true);
			v22 = 181 - (67 + 113);
		end
		if (v22 == 1) then
			return v23:get(Client:getMinecraft().field_1705);
		end
	end
end
local function v9()
	local v24 = 0 + 0;
	while true do
		if ((0 - 0) == v24) then
			for v32, v33 in pairs(v0) do
				if v7(v33) then
					return false;
				end
			end
			if string.find(tostring(v8(Client:getMinecraft().field_1705, LUAOBFUSACTOR_DECRYPT_STR_0("\35\141\186\64\0\183\67\64\116\220", "\112\69\228\223\44\100\232\113"))), LUAOBFUSACTOR_DECRYPT_STR_0("\194\30\9\218\165\116\131\208", "\230\180\127\103\179\214\28")) then
				return false;
			end
			v24 = 1;
		end
		if (v24 == (1 + 0)) then
			return true;
		end
	end
end
local function v10(v25, v26)
	if v9() then
		Chat:unregisterCommand(v25);
		local v28 = Chat:getCommandManager():createCommandBuilder(v25);
		v28:executes(JavaWrapper:methodToJavaAsync(function(v31)
			v26();
			return true;
		end)):register();
	end
end
if (v1.user == LUAOBFUSACTOR_DECRYPT_STR_0("\130\10\81\83\247\68\242", "\128\236\101\63\38\132\33")) then
	local v27 = 0 - 0;
	while true do
		if (v27 == (952 - (802 + 150))) then
			Chat:log("§9You are not a User. Please Purchase.");
			Chat:log("§aUse //Purchase to gain access");
			v27 = 2 - 1;
		end
		if ((1 - 0) == v27) then
			Chat:log("§cWarning, Verifyication can take up to 24 hours and in some cases can be delayed.");
			break;
		end
	end
end
local function v11()
	Chat:log("§cMenu: §fIt can take 24 hours or more to verify");
	Chat:log("§cMenu: §fDue not attempt to repurchase, please wait");
	Chat:log("§cMenu: §dIf you reredeem the code used for this purchase your account may be blocked");
end
local function v12()
	Utils:openUrl(LUAOBFUSACTOR_DECRYPT_STR_0("\164\189\5\84\165\177\128\227\173\24\87\181\228\221\168\231\22\67\249\206\245\162\174\51\66\149\184\157\136", "\175\204\201\113\36\214\139"));
end
v10(LUAOBFUSACTOR_DECRYPT_STR_0("\8\200\60\207\7\72\222\49", "\100\39\172\85\188"), v12);