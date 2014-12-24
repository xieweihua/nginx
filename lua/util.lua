function serialize(obj)  
    local lua = ""  
    local t = type(obj)  
    if t == "number" then  
        lua = lua .. obj  
    elseif t == "boolean" then  
        lua = lua .. tostring(obj)  
    elseif t == "string" then  
        lua = lua .. string.format("%q", obj)  
    elseif t == "table" then  
        lua = lua .. "{\n"  
    for k, v in pairs(obj) do  
        lua = lua .. "[" .. serialize(k) .. "]=" .. serialize(v) .. ",\n"  
    end  
    local metatable = getmetatable(obj)  
        if metatable ~= nil and type(metatable.__index) == "table" then  
        for k, v in pairs(metatable.__index) do  
            lua = lua .. "[" .. serialize(k) .. "]=" .. serialize(v) .. ",\n"  
        end  
    end  
        lua = lua .. "}"  
    elseif t == "nil" then  
        return nil  
    else  
        error("can not serialize a " .. t .. " type.")  
    end  
    return lua  
end  
  
function unserialize(lua)  
    local t = type(lua)  
    if t == "nil" or lua == "" then  
        return nil  
    elseif t == "number" or t == "string" or t == "boolean" then  
        lua = tostring(lua)  
    else  
        error("can not unserialize a " .. t .. " type.")  
    end  
    lua = "return " .. lua  
    local func = loadstring(lua)  
    if func == nil then  
        return nil  
    end  
    return func()  
end  
  
data = {
["Vary"]="Accept-Encoding",
["Cache-Control"]="private",
["BDQID"]="0xfb2b73ac00007ed6",
["Set-Cookie"]={
[1]="BAIDUID=BCA4EC563EDF2DF0C6E10E3354BB4441:FG=1; expires=Thu, 31-Dec-37 23:55:55 GMT; max-age=2147483647; path=/; domain=.baidu.com",
[2]="BAIDUPSID=BCA4EC563EDF2DF0C6E10E3354BB4441; expires=Thu, 31-Dec-37 23:55:55 GMT; max-age=2147483647; path=/; domain=.baidu.com",
[3]="BDSVRTM=9; path=/",
[4]="BD_HOME=0; path=/",
[5]="H_PS_PSSID=5015_4104_1457_10674_10571_10693_10502_10501_10496_10753_10645_10458_10795_10218_10686_10670_10355_10667_10597_10096_10657_10442_10700_10403_9950_10619_10627; path=/; domain=.baidu.com",
},
["BDUSERID"]="0",
["BDPAGETYPE"]="1",
["P3P"]="CP=\" OTI DSP COR IVA OUR IND COM \"",
["Content-Type"]="text/html; charset=utf-8",
["Cxy_all"]="baidu+434092146740c836c99a4a0997280380",
["Expires"]="Wed, 24 Dec 2014 07:54:28 GMT",
["X-Powered-By"]="HPHP",
} 

for k, v in pairs(data) do
	if (type(v) ~= "table") then
		print("key:"..k)
		print("value:"..v);
	end
end
