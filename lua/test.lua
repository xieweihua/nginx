
cjson = require "cjson"
ngx.header.content_type = 'text/plain';

--ngx.say(cjson.encode({dog = 5, cat = 6}))

--ngx.req.set_header("Content-Type", "application/json;charset=utf8");
--ngx.req.set_header("Accept", "application/json");

local res = ngx.location.capture('/proxy/https/www.google.co.jp/443/?gws_rd=ssl') --{
    --method = ngx.HTTP_POST,
    --body = body,
    --args = {hello = 'world'}
--});


for k, v in pairs(res.header) do
  if (type(v) ~= "table") then
    ngx.header[k] = v;
  else
  	for k_in, v_in in pairs(v) do
  		ngx.header[k] = v_in;
  	end
  end
end

ngx.say(res.body)

