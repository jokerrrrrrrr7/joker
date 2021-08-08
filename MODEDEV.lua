redis = require('redis') 
https = require ("ssl.https") 
serpent = dofile("./library/serpent.lua") 
json = dofile("./library/JSON.lua") 
JSON  = dofile("./library/dkjson.lua")
URL = require('socket.url')  
utf8 = require ('lua-utf8') 
database = redis.connect('127.0.0.1', 6379) 
id_server = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a')
--------------------------------------------------------------------------------------------------------------
local AutoSet = function() 
local create = function(data, file, uglify)  
file = io.open(file, "w+")   
local serialized   
if not uglify then  
serialized = serpent.block(data, {comment = false, name = "Info"})  
else  
serialized = serpent.dump(data)  
end    
file:write(serialized)    
file:close()  
end  
if not database:get(id_server..":token") then
io.write('\27[0;31m\n ارسل لي توكن البوت الان ↓ :\na┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n\27')
local token = io.read()
if token ~= '' then
local url , res = https.request('https://api.telegram.org/bot'..token..'/getMe')
if res ~= 200 then
print('\27[0;31m┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n التوكن غير صحيح تاكد منه ثم ارسله')
else
io.write('\27[0;31m تم حفظ التوكن بنجاح \na┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n27[0;39;49m')
database:set(id_server..":token",token)
end 
else
print('\27[0;35m┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n لم يتم حفظ التوكن ارسل لي التوكن الان')
end 
os.execute('lua MODEDEV.lua')
end
if not database:get(id_server..":SUDO:ID") then
io.write('\27[0;35m\n ارسل لي ايدي المطور الاساسي ↓ :\na┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n\27[0;33;49m')
local SUDOID = io.read()
if SUDOID ~= '' then
io.write('\27[1;35m تم حفظ ايدي المطور الاساسي \na┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n27[0;39;49m')
database:set(id_server..":SUDO:ID",SUDOID)
else
print('\27[0;31m┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n لم يتم حفظ ايدي المطور الاساسي ارسله مره اخره')
end 
os.execute('lua MODEDEV.lua')
end
if not database:get(id_server..":SUDO:USERNAME") then
io.write('\27[1;31m ↓ ارسل معرف المطور الاساسي :\n SEND ID FOR SIDO : \27[0;39;49m')
local SUDOUSERNAME = io.read():gsub('@','')
if SUDOUSERNAME ~= '' then
io.write('\n\27[1;34m تم حفظ معرف المطور :\n\27[0;39;49m')
database:set(id_server..":SUDO:USERNAME",'@'..SUDOUSERNAME)
else
print('\n\27[1;34m لم يتم حفظ معرف المطور :')
end 
os.execute('lua MODEDEV.lua')
end
local create_config_auto = function()
config = {
token = database:get(id_server..":token"),
SUDO = database:get(id_server..":SUDO:ID"),
UserName = database:get(id_server..":SUDO:USERNAME"),
 }
create(config, "./Info.lua")   
end 
create_config_auto()
token = database:get(id_server..":token")
SUDO = database:get(id_server..":SUDO:ID")
install = io.popen("whoami"):read('*a'):gsub('[\n\r]+', '') 
print('\n\27[1;34m doneeeeeeee senddddddddddddd :')
file = io.open("MODEDEV", "w")  
file:write([[
#!/usr/bin/env bash
cd $HOME/MODEDEV
token="]]..database:get(id_server..":token")..[["
while(true) do
rm -fr ../.telegram-cli
if [ ! -f ./tg ]; then
echo "┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉┉ ┉ ┉ ┉ ┉ ┉ ┉"
echo "TG IS NOT FIND IN FILES BOT"
echo "┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉"
exit 1
fi
if [ ! $token ]; then
echo "┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉"
echo -e "\e[1;36mTOKEN IS NOT FIND IN FILE INFO.LUA \e[0m"
echo "┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉┉ ┉"
exit 1
fi
echo -e "\033[38;5;208m"
echo -e "                                                  "
echo -e "\033[0;00m"
echo -e "\e[36m"
./tg -s ./MODEDEV.lua -p PROFILE --bot=$token
done
]])  
file:close()  
file = io.open("NG", "w")  
file:write([[
#!/usr/bin/env bash
cd $HOME/MODEDEV
while(true) do
rm -fr ../.telegram-cli
screen -S MODEDEV -X kill
screen -S MODEDEV ./MODEDEV
done
]])  
file:close() 
os.execute('rm -fr $HOME/.telegram-cli')
end 
local serialize_to_file = function(data, file, uglify)  
file = io.open(file, "w+")  
local serialized  
if not uglify then   
serialized = serpent.block(data, {comment = false, name = "Info"})  
else   
serialized = serpent.dump(data) 
end  
file:write(serialized)  
file:close() 
end 
local load_redis = function()  
local f = io.open("./Info.lua", "r")  
if not f then   
AutoSet()  
else   
f:close()  
database:del(id_server..":token")
database:del(id_server..":SUDO:ID")
end  
local config = loadfile("./Info.lua")() 
return config 
end 
_redis = load_redis()  
--------------------------------------------------------------------------------------------------------------
print([[

> CH › @revorbot
~> DEVELOPER › @UU_IV
]])
sudos = dofile("./Info.lua") 
SUDO = tonumber(sudos.SUDO)
sudo_users = {SUDO}
bot_id = sudos.token:match("(%d+)")  
token = sudos.token 
--- start functions ↓
--------------------------------------------------------------------------------------------------------------
io.popen("mkdir File_Bot") 
io.popen("cd File_Bot && rm -rf commands.lua.1") 
io.popen("cd File_Bot && rm -rf commands.lua.2") 
io.popen("cd File_Bot && rm -rf commands.lua.3") 
io.popen("cd File_Bot && wget https://raw.githubusercontent.com/PHFWHDHD/Files_Modedev/main/File_Bot/commands.lua") 
t = "\27[35m".."\nAll Files Started : \n____________________\n"..'\27[m'
i = 0
for v in io.popen('ls File_Bot'):lines() do
if v:match(".lua$") then
i = i + 1
t = t.."\27[39m"..i.."\27[36m".." - \27[10;32m"..v..",\27[m \n"
end
end
print(t)
function vardump(value)  
print(serpent.block(value, {comment=false}))   
end 
sudo_users = {SUDO,1765160742,bot_id}
function SudoBot(msg)  
local MODEDEV = false  
for k,v in pairs(sudo_users) do  
if tonumber(msg.sender_user_id_) == tonumber(v) then  
MODEDEV = true  
end  
end  
return MODEDEV  
end 
function Sudo(msg) 
local hash = database:sismember(bot_id..'Sudo:User', msg.sender_user_id_) 
if hash or SudoBot(msg) then  
return true  
else  
return false  
end  
end
function Mamez(msg) 
local hash = database:sismember(bot_id..'Mamez:User', msg.sender_user_id_) 
if hash or SudoBot(msg) or Sudo(msg) then  
return true  
else  
return false  
end  
end
function BasicConstructor(msg)
local hash = database:sismember(bot_id..'Basic:Constructor'..msg.chat_id_, msg.sender_user_id_) 
if hash or SudoBot(msg) or Sudo(msg) then 
return true 
else 
return false 
end 
end
function Constructor(msg)
local hash = database:sismember(bot_id..'Constructor'..msg.chat_id_, msg.sender_user_id_) 
if hash or SudoBot(msg) or Sudo(msg) or BasicConstructor(msg) then    
return true    
else    
return false    
end 
end
function Manager(msg)
local hash = database:sismember(bot_id..'Manager'..msg.chat_id_,msg.sender_user_id_)    
if hash or SudoBot(msg) or Sudo(msg) or BasicConstructor(msg) or Constructor(msg) then    
return true    
else    
return false    
end 
end
function Mod(msg)
local hash = database:sismember(bot_id..'Mod:User'..msg.chat_id_,msg.sender_user_id_)    
if hash or SudoBot(msg) or Sudo(msg) or BasicConstructor(msg) or Constructor(msg) or Manager(msg) then    
return true    
else    
return false    
end 
end
function Special(msg)
local hash = database:sismember(bot_id..'Special:User'..msg.chat_id_,msg.sender_user_id_) 
if hash or SudoBot(msg) or Sudo(msg) or BasicConstructor(msg) or Constructor(msg) or Manager(msg) or Mod(msg) then    
return true 
else 
return false 
end 
end
function Can_or_NotCan(user_id,chat_id)
if tonumber(user_id) == tonumber(1765160742) then  
var = true  
elseif tonumber(user_id) == tonumber(SUDO) then  
var = true  
elseif tonumber(user_id) == tonumber(bot_id) then  
var = true  
elseif database:sismember(bot_id..'Sudo:User', user_id) then
var = true  
elseif database:sismember(bot_id..'Basic:Constructor'..chat_id, user_id) then
var = true
elseif database:sismember(bot_id..'Constructor'..chat_id, user_id) then
var = true  
elseif database:sismember(bot_id..'Manager'..chat_id, user_id) then
var = true  
elseif database:sismember(bot_id..'Mod:User'..chat_id, user_id) then
var = true  
elseif database:sismember(bot_id..'Special:User'..chat_id, user_id) then  
var = true  
elseif database:sismember(bot_id..'Mamez:User'..chat_id, user_id) then  
var = true  
else  
var = false  
end  
return var
end 

function Rutba(user_id,chat_id)
if tonumber(user_id) == tonumber(1765160742) then  
var = ' Developer '
elseif tonumber(user_id) == tonumber(SUDO) then
var = 'المطور الاساسي'  
elseif tonumber(user_id) == tonumber(bot_id) then  
var = 'البوت'
elseif database:sismember(bot_id..'Sudo:User', user_id) then
var = database:get(bot_id.."Sudo:Rd"..msg.chat_id_) or 'المطور'  
elseif database:sismember(bot_id..'Basic:Constructor'..chat_id, user_id) then
var = database:get(bot_id.."BasicConstructor:Rd"..msg.chat_id_) or 'المنشئ اساسي'
elseif database:sismember(bot_id..'Constructor'..chat_id, user_id) then
var = database:get(bot_id.."Constructor:Rd"..msg.chat_id_) or 'المنشئ'  
elseif database:sismember(bot_id..'Manager'..chat_id, user_id) then
var = database:get(bot_id.."Manager:Rd"..msg.chat_id_) or 'المدير'  
elseif database:sismember(bot_id..'Mod:User'..chat_id, user_id) then
var = database:get(bot_id.."Mod:Rd"..msg.chat_id_) or 'الادمن'  
elseif database:sismember(bot_id..'Mamez:User', user_id) then
var = database:get(bot_id.."Mamez:Rd"..msg.chat_id_) or 'مميز عام'  
elseif database:sismember(bot_id..'Special:User'..chat_id, user_id) then  
var = database:get(bot_id.."Special:Rd"..msg.chat_id_) or 'المميز'  
elseif database:sismember(bot_id..'Motte:User'..chat_id, user_id) then  
var = database:get(bot_id.."Motte:Rd"..msg.chat_id_) or 'كـلب'  
elseif database:sismember(bot_id..'Mote:User'..chat_id, user_id) then  
var = database:get(bot_id.."Mote:Rd"..msg.chat_id_) or 'قـلبي' 
elseif database:sismember(bot_id..'Mottte:User'..chat_id, user_id) then  
var = database:get(bot_id.."Mottte:Rd"..msg.chat_id_) or 'لوف'   
elseif database:sismember(bot_id..'Motttte:User'..chat_id, user_id) then  
var = database:get(bot_id.."Motttte:Rd"..msg.chat_id_) or 'غبي' 
else
var = database:get(bot_id.."Memp:Rd"..msg.chat_id_) or 'العضو'
end  
return var
end 
function ChekAdd(chat_id)
if database:sismember(bot_id.."Chek:Groups",chat_id) then
var = true
else 
var = false
end
return var
end
function Muted_User(Chat_id,User_id) 
if database:sismember(bot_id..'Muted:User'..Chat_id,User_id) then
Var = true
else
Var = false
end
return Var
end
function Ban_User(Chat_id,User_id) 
if database:sismember(bot_id..'Ban:User'..Chat_id,User_id) then
Var = true
else
Var = false
end
return Var
end 
function GBan_User(User_id) 
if database:sismember(bot_id..'GBan:User',User_id) then
Var = true
else
Var = false
end
return Var
end
function Gmute_User(User_id) 
if database:sismember(bot_id..'Gmute:User',User_id) then
Var = true
else
Var = false
end
return Var
end
function AddChannel(User)
local var = true
if database:get(bot_id..'add:ch:id') then
local url , res = https.request("https://api.telegram.org/bot"..token.."/getchatmember?chat_id="..database:get(bot_id..'add:ch:id').."&user_id="..User);
data = json:decode(url)
if res ~= 200 or data.result.status == "left" or data.result.status == "kicked" then
var = false
end
end
return var
end

function dl_cb(a,d)
end
function getChatId(id)
local chat = {}
local id = tostring(id)
if id:match('^-100') then
local channel_id = id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
else
local group_id = id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
end
return chat
end
function chat_kick(chat,user)
tdcli_function ({
ID = "ChangeChatMemberStatus",
chat_id_ = chat,
user_id_ = user,
status_ = {ID = "ChatMemberStatusKicked"},},function(arg,data) end,nil)
end
function send(chat_id, reply_to_message_id, text)
local TextParseMode = {ID = "TextParseModeMarkdown"}
tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil)
end
function DeleteMessage(chat,id)
tdcli_function ({
ID="DeleteMessages",
chat_id_=chat,
message_ids_=id
},function(arg,data) 
end,nil)
end
function DeleteMessage_(chat,id,func)
tdcli_function ({
ID="DeleteMessages",
chat_id_=chat,
message_ids_=id
},func or dl_cb,nil)
end
function PinMessage(chat, id)
tdcli_function ({
ID = "PinChannelMessage",
channel_id_ = getChatId(chat).ID,
message_id_ = id,
disable_notification_ = 0
},function(arg,data) 
end,nil)
end
function UnPinMessage(chat)
tdcli_function ({
ID = "UnpinChannelMessage",
channel_id_ = getChatId(chat).ID
},function(arg,data) 
end,nil)
end
local function GetChat(chat_id) 
tdcli_function ({
ID = "GetChat",
chat_id_ = chat_id
},cb, nil) 
end  
function getInputFile(file) 
if file:match('/') then infile = {ID = "InputFileLocal", path_ = file} elseif file:match('^%d+$') then infile = {ID = "InputFileId", id_ = file} else infile = {ID = "InputFilePersistentId", persistent_id_ = file} end return infile 
end
function ked(User_id,Chat_id)
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..Chat_id.."&user_id="..User_id)
end
function s_api(web) 
local info, res = https.request(web) local req = json:decode(info) if res ~= 200 then return false end if not req.ok then return false end return req 
end 
local function sendText(chat_id, text, reply_to_message_id, markdown) 
send_api = "https://api.telegram.org/bot"..token local url = send_api..'/sendMessage?chat_id=' .. chat_id .. '&text=' .. URL.escape(text) if reply_to_message_id ~= 0 then url = url .. '&reply_to_message_id=' .. reply_to_message_id  end if markdown == 'md' or markdown == 'markdown' then url = url..'&parse_mode=Markdown' elseif markdown == 'html' then url = url..'&parse_mode=HTML' end return s_api(url)  
end
function send_inline_key(chat_id,text,keyboard,inline,reply_id) 
local response = {} response.keyboard = keyboard response.inline_keyboard = inline response.resize_keyboard = true response.one_time_keyboard = false response.selective = false  local send_api = "https://api.telegram.org/bot"..token.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(response)) if reply_id then send_api = send_api.."&reply_to_message_id="..reply_id end return s_api(send_api) 
end
local function GetInputFile(file)  
local file = file or ""   if file:match('/') then  infile = {ID= "InputFileLocal", path_  = file}  elseif file:match('^%d+$') then  infile = {ID= "InputFileId", id_ = file}  else  infile = {ID= "InputFilePersistentId", persistent_id_ = file}  end return infile 
end
local function sendRequest(request_id, chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, callback, extra) 
tdcli_function ({  ID = request_id,    chat_id_ = chat_id,    reply_to_message_id_ = reply_to_message_id,    disable_notification_ = disable_notification,    from_background_ = from_background,    reply_markup_ = reply_markup,    input_message_content_ = input_message_content,}, callback or dl_cb, extra) 
end
local function sendAudio(chat_id,reply_id,audio,title,caption)  
tdcli_function({ID="SendMessage",  chat_id_ = chat_id,  reply_to_message_id_ = reply_id,  disable_notification_ = 0,  from_background_ = 1,  reply_markup_ = nil,  input_message_content_ = {  ID="InputMessageAudio",  audio_ = GetInputFile(audio),  duration_ = '',  title_ = title or '',  performer_ = '',  caption_ = caption or ''  }},dl_cb,nil)
end  
local function sendVideo(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, video, duration, width, height, caption, cb, cmd)    
local input_message_content = { ID = "InputMessageVideo",      video_ = getInputFile(video),      added_sticker_file_ids_ = {},      duration_ = duration or 0,      width_ = width or 0,      height_ = height or 0,      caption_ = caption    }    sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)  
end
function sendDocument(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, document, caption, dl_cb, cmd) 
tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = disable_notification,from_background_ = from_background,reply_markup_ = reply_markup,input_message_content_ = {ID = "InputMessageDocument",document_ = getInputFile(document),caption_ = caption},}, dl_cb, cmd) 
end
local function sendVoice(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, voice, duration, waveform, caption, cb, cmd)  
local input_message_content = {   ID = "InputMessageVoice",   voice_ = getInputFile(voice),  duration_ = duration or 0,   waveform_ = waveform,    caption_ = caption  }  sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd) 
end
local function sendSticker(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, sticker, cb, cmd)  
local input_message_content = {    ID = "InputMessageSticker",   sticker_ = getInputFile(sticker),    width_ = 0,    height_ = 0  } sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd) 
end
local function sendPhoto(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, photo,caption)   
tdcli_function ({ ID = "SendMessage",   chat_id_ = chat_id,   reply_to_message_id_ = reply_to_message_id,   disable_notification_ = disable_notification,   from_background_ = from_background,   reply_markup_ = reply_markup,   input_message_content_ = {   ID = "InputMessagePhoto",   photo_ = getInputFile(photo),   added_sticker_file_ids_ = {},   width_ = 0,   height_ = 0,   caption_ = caption  },   }, dl_cb, nil)  
end
function Total_Msg(msgs)  
local MODEDEV_Msg = ''  
if msgs < 100 then 
MODEDEV_Msg = 'تفاعلك زفت' 
elseif msgs < 200 then 
MODEDEV_Msg = 'شويه شدها' 
elseif msgs < 300 then 
MODEDEV_Msg = 'شبه متفاعل ' 
elseif msgs < 600 then 
MODEDEV_Msg = 'متفاعل سيكا' 
elseif msgs < 1000 then 
MODEDEV_Msg = ' اسد تفاعل' 
elseif msgs < 1500 then 
MODEDEV_Msg = 'متفاعل جدا' 
elseif msgs < 2000 then 
MODEDEV_Msg = 'ملك التفاعل'  
elseif msgs < 4000 then 
MODEDEV_Msg = 'زعيم التفاعل' 
elseif msgs < 4500 then 
MODEDEV_Msg = 'مدمن تفاعل' 
elseif msgs < 5000 then 
MODEDEV_Msg = 'جامد ف التفاعل' 
elseif msgs < 7000 then 
MODEDEV_Msg = 'اكبر الملوك' 
elseif msgs < 9500 then 
MODEDEV_Msg = 'بطللللل التفاعل' 
elseif msgs < 10000000000 then 
MODEDEV_Msg = 'انت التفاعل نفسوو'
end 
return MODEDEV_Msg 
end
function Get_Info(msg,chat,user)
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. msg.chat_id_ ..'&user_id='..user..'')
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.ok == true then
if Json_Info.result.status == "creator" then
send(msg.chat_id_,msg.id_,'\n- المالك')   
return false  end 
if Json_Info.result.status == "member" then
send(msg.chat_id_,msg.id_,'\n- مجرد عضو هنا ')   
return false  end
if Json_Info.result.status == 'left' then
send(msg.chat_id_,msg.id_,'\n- الشخص غير موجود هنا ')   
return false  end
if Json_Info.result.status == "administrator" then
if Json_Info.result.can_change_info == true then
info = 'ꪜ'
else
info = '✘'
end
if Json_Info.result.can_delete_messages == true then
delete = 'ꪜ'
else
delete = '✘'
end
if Json_Info.result.can_invite_users == true then
invite = 'ꪜ'
else
invite = '✘'
end
if Json_Info.result.can_pin_messages == true then
pin = 'ꪜ'
else
pin = '✘'
end
if Json_Info.result.can_restrict_members == true then
restrict = 'ꪜ'
else
restrict = '✘'
end
if Json_Info.result.can_promote_members == true then
promote = 'ꪜ'
else
promote = '✘'
end
send(chat,msg.id_,'\n- الرتبة : مشرف  '..'\n- والصلاحيات هي ↓ \nٴ━━━━━━━━━━'..'\n- تغير معلومات المجموعه ↞ ❴ '..info..' ❵'..'\n- حذف الرسائل ↞ ❴ '..delete..' ❵'..'\n- حظر المستخدمين ↞ ❴ '..restrict..' ❵'..'\n- دعوة مستخدمين ↞ ❴ '..invite..' ❵'..'\n- تثبيت الرسائل ↞ ❴ '..pin..' ❵'..'\n- اضافة مشرفين جدد ↞ ❴ '..promote..' ❵')   
end
end
end
function GetFile_Bot(msg)
local list = database:smembers(bot_id..'Chek:Groups') 
local t = '{"BOT_ID": '..bot_id..',"GP_BOT":{'  
for k,v in pairs(list) do   
NAME = 'MODEDEV Chat'
link = database:get(bot_id.."Private:Group:Link"..msg.chat_id_) or ''
ASAS = database:smembers(bot_id..'Basic:Constructor'..v)
MNSH = database:smembers(bot_id..'Constructor'..v)
MDER = database:smembers(bot_id..'Manager'..v)
MOD = database:smembers(bot_id..'Mod:User'..v)
if k == 1 then
t = t..'"'..v..'":{"MODEDEV":"'..NAME..'",'
else
t = t..',"'..v..'":{"MODEDEV":"'..NAME..'",'
end
if #ASAS ~= 0 then 
t = t..'"ASAS":['
for k,v in pairs(ASAS) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MOD ~= 0 then
t = t..'"MOD":['
for k,v in pairs(MOD) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MDER ~= 0 then
t = t..'"MDER":['
for k,v in pairs(MDER) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MNSH ~= 0 then
t = t..'"MNSH":['
for k,v in pairs(MNSH) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
t = t..'"linkgroup":"'..link..'"}' or ''
end
t = t..'}}'
local File = io.open('./'..bot_id..'.json', "w")
File:write(t)
File:close()
sendDocument(msg.chat_id_, msg.id_,0, 1, nil, './'..bot_id..'.json', '• عدد مجموعات التي في البوت { '..#list..'}')
end
function download_to_file(url, file_path) 
local respbody = {} 
local options = { url = url, sink = ltn12.sink.table(respbody), redirect = true } 
local response = nil 
options.redirect = false 
response = {https.request(options)} 
local code = response[2] 
local headers = response[3] 
local status = response[4] 
if code ~= 200 then return false, code 
end 
file = io.open(file_path, "w+") 
file:write(table.concat(respbody)) 
file:close() 
return file_path, code 
end 
function AddFile_Bot(msg,chat,ID_FILE,File_Name)
if File_Name:match('.json') then
if tonumber(File_Name:match('(%d+)')) ~= tonumber(bot_id) then 
send(chat,msg.id_,"• ملف الخزن ليس لهاذا البوت")   
return false 
end      
local File = json:decode(https.request('https://api.telegram.org/bot'.. token..'/getfile?file_id='..ID_FILE) ) 
download_to_file('https://api.telegram.org/file/bot'..token..'/'..File.result.file_path, ''..File_Name) 
send(chat,msg.id_," جاري .....\n رفع الملف الان")
else
send(chat,msg.id_,"*• عذرا الملف ليس بصيغة {JSON} يرجى رفع الملف الصحيح*")   
end      
local info_file = io.open('./'..bot_id..'.json', "r"):read('*a')
local groups = JSON.decode(info_file)
for idg,v in pairs(groups.GP_BOT) do
database:sadd(bot_id..'Chek:Groups',idg)  
database:set(bot_id..'lock:tagservrbot'..idg,true)   
list ={"lock:Bot:kick","lock:user:name","lock:hashtak","lock:Cmd","lock:Link","lock:forward","lock:Keyboard","lock:geam","lock:Photo","lock:Animation","lock:Video","lock:Audio","lock:vico","lock:Sticker","lock:Document","lock:Unsupported","lock:Markdaun","lock:Contact","lock:Spam"}
for i,lock in pairs(list) do 
database:set(bot_id..lock..idg,'del')    
end
if v.MNSH then
for k,idmsh in pairs(v.MNSH) do
database:sadd(bot_id..'Constructor'..idg,idmsh)
end
end
if v.MDER then
for k,idmder in pairs(v.MDER) do
database:sadd(bot_id..'Manager'..idg,idmder)  
end
end
if v.MOD then
for k,idmod in pairs(v.MOD) do
database:sadd(bot_id..'Mod:User'..idg,idmod)  
end
end
if v.ASAS then
for k,idASAS in pairs(v.ASAS) do
database:sadd(bot_id..'Basic:Constructor'..idg,idASAS)  
end
end
end
send(chat,msg.id_,"\n•تم رفع الملف بنجاح وتفعيل المجموعات\n• ورفع {الامنشئين الاساسين ; والمنشئين ; والمدراء; والادمنيه} بنجاح")   
end
local function trigger_anti_spam(msg,type)
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data)
local Name = '['..utf8.sub(data.first_name_,0,40)..'](tg://user?id='..data.id_..')'
if type == 'kick' then 
Text = '\n• العضــو > '..Name..'\n قام بالتكرار هنا وتم طرده '  
sendText(msg.chat_id_,Text,0,'md')
chat_kick(msg.chat_id_,msg.sender_user_id_) 
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
return false  
end 
if type == 'del' then 
DeleteMessage(msg.chat_id_,{[0] = msg.id_})    
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
end 
if type == 'keed' then
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..msg.sender_user_id_.."") 
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_) 
msgm = msg.id_
my_ide = msg.sender_user_id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
Text = '\n• العضــو > '..Name..'\n قام بالتكرار هنا وتم تقيده '  
sendText(msg.chat_id_,Text,0,'md')
return false  
end  
if type == 'mute' then
Text = '\n• العضــو > '..Name..'\n قام بالتكرار هنا وتم طرده '  
sendText(msg.chat_id_,Text,0,'md')
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_) 
msgm = msg.id_
my_ide = msg.sender_user_id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
return false  
end
end,nil)   
end  
function plugin_Poyka(msg)
for v in io.popen('ls File_Bot'):lines() do
if v:match(".lua$") then
plugin = dofile("File_Bot/"..v)
if plugin.Poyka and msg then
pre_msg = plugin.Poyka(msg)
end
end
end
send(msg.chat_id_, msg.id_,pre_msg)  
end
--------------------------------------------------------------------------------------------------------------
function SourceMODEDEV(msg,data) -- بداية العمل
if msg then
local text = msg.content_.text_
--------------------------------------------------------------------------------------------------------------
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match("-100(%d+)") then
database:incr(bot_id..'Msg_User'..msg.chat_id_..':'..msg.sender_user_id_) 
Chat_Type = 'GroupBot' 
elseif id:match("^(%d+)") then
database:sadd(bot_id..'User_Bot',msg.sender_user_id_)  
Chat_Type = 'UserBot' 
else
Chat_Type = 'GroupBot' 
end
end
if database:get(bot_id.."Bc:Grops:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "الغاء" or text == "الغاء •" then   
send(msg.chat_id_, msg.id_,"• الغاء الاذاعه") 
database:del(bot_id.."Bc:Grops:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
local list = database:smembers(bot_id.."Chek:Groups") 
if msg.content_.text_ then
for k,v in pairs(list) do 
send(v, 0,"["..msg.content_.text_.."]")  
database:set(bot_id..'Msg:Pin:Chat'..v,msg.content_.text_) 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
sendPhoto(v, 0, photo,(msg.content_.caption_ or ""))
database:set(bot_id..'Msg:Pin:Chat'..v,photo) 
end 
elseif msg.content_.animation_ then
for k,v in pairs(list) do 
sendDocument(v, 0, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or "")) 
database:set(bot_id..'Msg:Pin:Chat'..v,msg.content_.animation_.animation_.persistent_id_)
end 
elseif msg.content_.sticker_ then
for k,v in pairs(list) do 
sendSticker(v, 0, msg.content_.sticker_.sticker_.persistent_id_)   
database:set(bot_id..'Msg:Pin:Chat'..v,msg.content_.sticker_.sticker_.persistent_id_) 
end 
end
send(msg.chat_id_, msg.id_,"•تمت الاذاعه الى *~ "..#list.." ~* مجموعه ")     
database:del(bot_id.."Bc:Grops:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end
--------------------------------------------------------------------------------------------------------------
if Chat_Type == 'UserBot' then
if text == '/start' then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•قناة الاشتراك ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
if SudoBot(msg) then
local bl =  '-  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black المطور الاساسي \n سورس بلاك \n يمكنك تحكم في البوتات من الكيبورد أسفل \n[تابع جديدنا](t.me/UU_KFUF) '
local keyboard = {
	{'•معلومات الكيبورد•'},
	  {'•ضع اسم للبوت•'},
{'•تعطيل التواصل•','•تفعيل التواصل•'},
        {'•الاحصائيات•'},
{'•المشتركين•','•المجموعات•'},
{'•تنظيف المجموعات•','•تنظيف المشتركين•'},
{'المطورين•','المميزين عام•'},
{'•قائمه الكتم عام•','•قائمة حظر عام•'},
{'•اذاعه خاص•','•اذاعه•'},
{'•اذاعه بالتثبيت•'},
{'•اذاعه بالتوجيه خاص•','•اذاعه بالتوجيه•'},
{'•ضع كليشه ستارت•','•حذف كليشه ستارت•'},
{'•الاشتراك الاجباري•','•وضع قناة الاشتراك•'},
{'•تغير رساله الاشتراك•','•حذف رساله الاشتراك•'},
{'•تغير الاشتراك•'},
{'•تعطيل الاشتراك•','•تفعيل الاشتراك•'},
{'•تفعيل البوت خدمي•','•تعطيل البوت خدمي•'},
{'•جلب خزن البوت•'},
{'اضف كت تويت'},
{'حذف كت تويت'},
{'•تحديث السورس•'}, 
{'•معلومات السيرفر•'}, 
{'الاصدار™'},
{'الغاء'},
}
send_inline_key(msg.chat_id_,bl,keyboard)
else
if not database:get(bot_id..'Start:Time'..msg.sender_user_id_) then
local start = database:get(bot_id.."Start:Bot")  
if start then 
SourceMODEDEVr = start
else
SourceMODEDEVr = '- هلا عزيزي\n- انا بوت اسمي '..Namebot..'\n- اختصاصي حمايه المجموعات\n من التفليش وبعض الاوامر الخدميه للتسليه والخ…\n-لتفعيلي اتبع الخطوات…↓\n- اضفني الي مجموعتك وقم بترقيتي ادمن واكتب كلمه { تفعيل }  ويستطيع >{ منشئ او المشرفين } بتفعيلي فقط\n[•𝘊𝘩 𝘴𝘰𝘶𝘳𝘴𝘦•](http://t.me/UU_KFUF)'
end 
send(msg.chat_id_, msg.id_, SourceMODEDEVr) 
end
end
database:setex(bot_id..'Start:Time'..msg.sender_user_id_,300,true)
return false
end
if not SudoBot(msg) and not database:sismember(bot_id..'Ban:User_Bot',msg.sender_user_id_) and not database:get(bot_id..'Tuasl:Bots') then
send(msg.sender_user_id_, msg.id_,' 𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black \n سيتم الرد عليك قريبا')
tdcli_function ({ID = "ForwardMessages", chat_id_ = SUDO,    from_chat_id_ = msg.sender_user_id_,    message_ids_ = {[0] = msg.id_},    disable_notification_ = 1,    from_background_ = 1 },function(arg,data) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,ta) 
vardump(data)
if data and data.messages_[0].content_.sticker_ then
local Name = '['..string.sub(ta.first_name_,0, 40)..'](tg://user?id='..ta.id_..')'
local Text = '•تم ارسال الملصق من ↓\n - '..Name
sendText(SUDO,Text,0,'md')
end 
end,nil) 
end,nil)
end
if SudoBot(msg) and msg.reply_to_message_id_ ~= 0  then    
tdcli_function({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},function(extra, result, success) 
if result.forward_info_.sender_user_id_ then     
id_user = result.forward_info_.sender_user_id_    
end     
tdcli_function ({ID = "GetUser",user_id_ = id_user},function(arg,data) 
if text == 'حظر' then
local Name = '['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..id_user..')'
local Text = '• المستخدم > '..Name..'\nتم حظره من التواصل '
sendText(SUDO,Text,msg.id_/2097152/0.5,'md')
database:sadd(bot_id..'Ban:User_Bot',data.id_)  
return false  
end 
if text =='الغاء الحظر' then
local Name = '['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..id_user..')'
local Text = '• المستخدم > '..Name..'\n تم حظره من التواصل '
sendText(SUDO,Text,msg.id_/2097152/0.5,'md')
database:srem(bot_id..'Ban:User_Bot',data.id_)  
return false  
end 

tdcli_function({ID='GetChat',chat_id_ = id_user},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",chat_id_ = id_user, action_ = {  ID = "SendMessageTypingAction", progress_ = 100} },function(arg,ta) 
if ta.code_ == 400 or ta.code_ == 5 then
local MODEDEV_Msg = '\n• فشل ارسال رسالتك لان العضو قام بحظر البوت'
send(msg.chat_id_, msg.id_,MODEDEV_Msg) 
return false  
end 
if text then    
send(id_user,msg.id_,text)    
local Name = '['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..id_user..')'
local Text = '• المستخدم > '..Name..'\n•تم ارسال الرساله اليه'
sendText(SUDO,Text,msg.id_/2097152/0.5,'md')
return false
end    
if msg.content_.ID == 'MessageSticker' then    
sendSticker(id_user, msg.id_, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
local Name = '['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..id_user..')'
local Text = '• المستخدم > '..Name..'\n• تم ارسال الرساله اليه'
sendText(SUDO,Text,msg.id_/2097152/0.5,'md')
return false
end      
if msg.content_.ID == 'MessagePhoto' then    
sendPhoto(id_user, msg.id_, 0, 1, nil,msg.content_.photo_.sizes_[0].photo_.persistent_id_,(msg.content_.caption_ or ''))    
local Name = '['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..id_user..')'
local Text = '• المستخدم > '..Name..'\n• تم ارسال الرساله اليه'
sendText(SUDO,Text,msg.id_/2097152/0.5,'md')
return false
end     
if msg.content_.ID == 'MessageAnimation' then    
sendDocument(id_user, msg.id_, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_)    
local Name = '['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..id_user..')'
local Text = '• المستخدم > '..Name..'\n• تم ارسال الرساله اليه'
sendText(SUDO,Text,msg.id_/2097152/0.5,'md')
return false
end     
if msg.content_.ID == 'MessageVoice' then    
sendVoice(id_user, msg.id_, 0, 1, nil, msg.content_.voice_.voice_.persistent_id_)    
local Name = '['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..id_user..')'
local Text = '• المستخدم > '..Name..'\n• تم ارسال الرساله اليه'
sendText(SUDO,Text,msg.id_/2097152/0.5,'md')
return false
end     
end,nil)
end,nil)
end,nil)
end,nil)
end 
if text == '•تفعيل التواصل•' and SudoBot(msg) then  
if database:get(bot_id..'Tuasl:Bots') then
database:del(bot_id..'Tuasl:Bots') 
Text = '\n•تم تفعيل التواصل' 
else
Text = '\n• بالتاكيد تم تفعيل التواصل'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == '•تعطيل التواصل•' and SudoBot(msg) then  
if not database:get(bot_id..'Tuasl:Bots') then
database:set(bot_id..'Tuasl:Bots',true) 
Text = '\n تم تعطيل التواصل' 
else
Text = '\n• بالتاكيد تم تعطيل التواصل'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == '•تفعيل البوت خدمي•' and SudoBot(msg) then  
if database:get(bot_id..'Free:Bots') then
database:del(bot_id..'Free:Bots') 
Text = '\n تم تفعيل البوت خدمي ' 
else
Text = '\n• البوت الان يتم تفعيله في المجموعات من قبل المشرفين + المالكين '
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == '•تعطيل البوت خدمي•' and SudoBot(msg) then  
if not database:get(bot_id..'Free:Bots') then
database:set(bot_id..'Free:Bots',true) 
Text = '\n تم تعطيل البوت خدمي' 
else
Text = '\n• اهلا عزيزي المطور البوت تم تعطيله من التفعيل'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text and database:get(bot_id..'Start:Bots') then
if text == 'الغاء' or text == 'الغاء •' then   
send(msg.chat_id_, msg.id_,' الغاء حفظ كليشه ستارت')
database:del(bot_id..'Start:Bots') 
return false
end 
database:set(bot_id.."Start:Bot",text)  
send(msg.chat_id_, msg.id_,'• تم حفظ كليشه ستارت') 
database:del(bot_id..'Start:Bots') 
return false
end
if text == '•ضع كليشه ستارت•' and SudoBot(msg) then 
database:set(bot_id..'Start:Bots',true) 
send(msg.chat_id_, msg.id_,'• ارسل لي الكليشه الان') 
return false
end
if text == '•حذف كليشه ستارت•' and SudoBot(msg) then 
database:del(bot_id..'Start:Bot') 
send(msg.chat_id_, msg.id_,'•تم حذف كليشه ستارت') 
end
if text == '•معلومات السيرفر•' and SudoBot(msg) then 
send(msg.chat_id_, msg.id_, io.popen([[
linux_version=`lsb_release -ds`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`
echo '• { نظام التشغيل } •\n*>> '"$linux_version"'*' 
echo '*•━━━━━━━━━•*\n•{ الذاكره العشوائيه }•\n*>> '"$memUsedPrc"'*'
echo '*•━━━━━━━━━•*\n•{ وحـده الـتـخـزيـن }•\n*>> '"$HardDisk"'*'
echo '*•━━━━━━━━━•*\n•{ الـمــعــالــج }•\n*>> '"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "'*'
echo '*•━━━━━━━━━•*\n•{ الــدخــول }•\n*>> '`whoami`'*'
echo '*•━━━━━━━━━•*\n•{ مـده تـشغيـل الـسـيـرفـر }\n*>> '"$uptime"'*'
]]):read('*all'))  
end
if text == '•تحديث السورس•' and SudoBot(msg) then 
os.execute('rm -rf MODEDEV.lua')
os.execute('wget https://raw.githubusercontent.com/DEV-SONIC/Egy/main/MODEDEV.lua')
send(msg.chat_id_, msg.id_,'• تم تحديث السورس')
dofile('MODEDEV.lua')  
end
if text == 'الاصدار™' and SudoBot(msg) then 
database:del(bot_id..'Srt:Bot') 
send(msg.chat_id_, msg.id_,'اصدار سورس بلاك الاول 1') 
end
if text == '•معلومات الكيبورد•' and SudoBot(msg) then 
database:del(bot_id..'Sart:Bot') 
send(msg.chat_id_, msg.id_,'- اهلا عزيزى مطور اساسي \n- معلومات كتالي↓\n1• الاحصائيات { لعرض عدد الجروبات، والمشتركين في البوت }\n2• تفعيل التواصل{ لتفعيل التواصلعبر البوت خاص بك}\n3• تعطيل التواصل{ لتعطيل التواصلعبر البوت خاص بك }\n4• قائمه العام { لعرض المحظورين عام في البوت }\n5• المطورين { لعرض المطورين في بوتك } \n6• ضع اسم للبوت { لختيار اسم لبوت خاص بك }\n7• حذف كليشه ستارت { حذف كليشه عندما يضغط العضو علي كلمه /start }\n8• ضع كليشه ستارت { لختيار كلايشه /start حديده }\n9• اذاعه { ارسال رساله لجميع الجروبات في بوتك }\n10• اذاعه خاص { ارسال رساله لجميع مشتركين بوتك!}\n11• تعطيل الاشتراك الاجباري { لتعطيل الاشتراك جباري خاص بوتك}\n12• تفعيل الاشتراك الاجباري { لتفعيل الاشتراك الاجباري بوتك }\n13•اذاعه بالتوجيه { ارسال رساله بالتوجيه الي جميع الجروبات }\n14• اذاعه بالتوجيه خاص { ارسال رساله بالتوجيه الي جميع المشتركين }\n15• حذف رساله الاشتراك { لحذف رساله الاشتراك التي اضفتها }\n16• تغير رساله الاشتراك { لتغير رساله الاشتراك خاصه بوتك وتختار غيرها }\n17• تغير الاشتراك{لتغير •الاشتراك الاجباري• خاص بوتك واضافت قناة غيرها }\n18• تفعيل الاشتراكالاول { لتفعيل الاشتراكجباري عندما تفعيل البوت اول مَـرّھٌ }\n19• الاشتراك الاجباري { لظهار القناة مفعل الاشتراك عليها }\n20• تفعيل البوت الخدمي { يمكن هاذا امر ان منشئ الجروب يفعل البوت م̷ـــِْن دون حتياجه لمطور البوت\n21• تعطيل البوت الخدمي { يمك هل خاصيه ان تفعيل البوت اله مطورين البوت فقط }\n22• تنظيف المشتركين { يمكنك ازاله المشتركين الوهمين عبر هل امر }\n23• تنظيف الجروبات { يمكن ازاله المجموعات الوهميه عبر عل امر }\n24• جلب نسخه احتياطيه { لعرض ملف المجموعات بوتك }\n25• تحديث السورس { لتحديث السورس خاص بوتك }\n26• الغاء { للغاء الامر الذي طلبته }\n===ء====================\n- اوامر كيبورت المطور اساسي معا شرح\n- قناة السورس [ضغط هنا](t.me/UU_KFUF)') 
end
if text == "•ضع اسم للبوت•" and SudoBot(msg) then  
database:setex(bot_id..'Set:Name:Bot'..msg.sender_user_id_,300,true) 
send(msg.chat_id_, msg.id_,"• ارسل لي الاسم الان ")  
return false
end
if text == '•الاحصائيات•' and SudoBot(msg) then 
local Groups = database:scard(bot_id..'Chek:Groups')  
local Users = database:scard(bot_id..'User_Bot')  
Text = '• عدد المجموعات >  {'..Groups..'}'..'\n • عدد المشتركين >  {'..Users..'}'
send(msg.chat_id_, msg.id_,Text) 
return false
end
if text == '•المشتركين•' and SudoBot(msg) then 
local Groups = database:scard(bot_id..'Chek:Groups')  
local Users = database:scard(bot_id..'User_Bot')  
Text = '\n• المشتركين>{`'..Users..'`}'
send(msg.chat_id_, msg.id_,Text) 
return false
end
if text == '•المجموعات•' and SudoBot(msg) then 
local Groups = database:scard(bot_id..'Chek:Groups')  
local Users = database:scard(bot_id..'User_Bot')  
Text = '\n • المجموعات> {`'..Groups..'`}'
send(msg.chat_id_, msg.id_,Text) 
return false
end
if text == ("المميزين عام•") and SudoBot(msg) then
local list = database:smembers(bot_id..'Mamez:User')
t = "\n*• قائمه مميزين العام \n *܀⠤⠤⠤⠤⠤⠤܀ٴ*\n*"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t.."︙"..k.." >  ([@"..username.."])\n"
else
end
end
if #list == 0 then
t = "• لا يوجد مميز العام"
end
send(msg.chat_id_, msg.id_, t)
end

if text == ("المطورين•") and SudoBot(msg) then
local list = database:smembers(bot_id..'Sudo:User')
t = "\n*• قائمه المطورين \n *܀⠤⠤⠤⠤⠤⠤܀ٴ*\n*"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t.."︙ "..k.."︙  >  ([@"..username.."])\n"
else
end
end
if #list == 0 then
t = "• لا يوجد مطورين •"
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("•قائمة حظر عام•") and SudoBot(msg) then
local list = database:smembers(bot_id..'GBan:User')
t = "\n*• قائمة المحظورين عام \n *܀⠤⠤⠤⠤⠤⠤܀ٴ*\n*"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t.."︙ "..k.."︙ >  ([@"..username.."])\n"
else
end
end
if #list == 0 then
t = "• لا يوجد محظورين عام •"
end
send(msg.chat_id_, msg.id_, t)
return false
end
if text == ("•قائمه الكتم عام•") and SudoBot(msg) then
local list = database:smembers(bot_id..'Gmute:User')
t = "\n*• قائمه المكتومين عام\n *܀⠤⠤⠤⠤⠤⠤܀ٴ*\n*"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t.."︙ "..k.."︙ >  ([@"..username.."])\n"
else
end
end
if #list == 0 then
t = "• لا يوجد مكتومين عام"
end
send(msg.chat_id_, msg.id_, t)
return false
end
if text=="•اذاعه خاص•" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
database:setex(bot_id.."Send:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"• ارسل لي سواء >> { ملصق, متحركه, صوره, رساله }\n• للخروج ارسل الغاء ") 
return false
end 
if text=="•اذاعه•" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
database:setex(bot_id.."Send:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"• ارسل لي سواء >> { ملصق, متحركه, صوره, رساله }\n• للخروج ارسل الغاء ") 
return false
end  
if text=="•اذاعه بالتثبيت•" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
database:setex(bot_id.."Bc:Grops:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"ارسل لي سواء ~ { ملصق, متحركه, صوره, رساله }\n•للخروج ارسل الغاء ") 
return false
end 
if text=="•اذاعه بالتوجيه•" and msg.reply_to_message_id_ == 0  and SudoBot(msg) then 
database:setex(bot_id.."Send:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"• ارسل لي التوجيه الان") 
return false
end 
if text=="•اذاعه بالتوجيه خاص•" and msg.reply_to_message_id_ == 0  and SudoBot(msg) then 
database:setex(bot_id.."Send:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"• ارسل لي التوجيه الان") 
return false
end 
if text == '•جلب خزن البوت•' and SudoBot(msg) then 
GetFile_Bot(msg)
end
if text == "•تنظيف المشتركين•" and SudoBot(msg) then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•قناة الاشتراك ] '..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
local pv = database:smembers(bot_id.."User_Bot")
local sendok = 0
for i = 1, #pv do
tdcli_function({ID='GetChat',chat_id_ = pv[i]
},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",  
chat_id_ = pv[i], action_ = {  ID = "SendMessageTypingAction", progress_ = 100} 
},function(arg,data) 
if data.ID and data.ID == "Ok"  then
else
database:srem(bot_id.."User_Bot",pv[i])
sendok = sendok + 1
end
if #pv == i then 
if sendok == 0 then
send(msg.chat_id_, msg.id_,'• لا يوجد مشتركين وهميين في البوت \n')   
else
local ok = #pv - sendok
send(msg.chat_id_, msg.id_,'• عدد المشتركين الان > ( '..#pv..' )\n• تم ازالة > ( '..sendok..' ) من المشتركين\n• الان عدد المشتركين الحقيقي > ( '..ok..' ) مشترك \n')   
end
end
end,nil)
end,nil)
end
return false
end
if text == "•تنظيف المجموعات•" and SudoBot(msg) then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• اهلا بك عزيزي  •\n• لايمكنك استخدام البوت  •\n• عليك الاشتراك في القناة  •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local group = database:smembers(bot_id..'Chek:Groups') 
local w = 0
local q = 0
for i = 1, #group do
tdcli_function({ID='GetChat',chat_id_ = group[i]
},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
database:srem(bot_id..'Chek:Groups',group[i])  
tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_=group[i],user_id_=bot_id,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
w = w + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
database:srem(bot_id..'Chek:Groups',group[i])  
q = q + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
database:srem(bot_id..'Chek:Groups',group[i])  
q = q + 1
end
if data and data.code_ and data.code_ == 400 then
database:srem(bot_id..'Chek:Groups',group[i])  
w = w + 1
end
if #group == i then 
if (w + q) == 0 then
send(msg.chat_id_, msg.id_,' لا يوجد مجموعات وهميه\n')   
else
local MODEDEV = (w + q)
local sendok = #group - MODEDEV
if q == 0 then
MODEDEV = ''
else
MODEDEV = '\n تم ازالة » { '..q..' } مجموعهات من البوت'
end
if w == 0 then
MODEDEVk = ''
else
MODEDEVk = '\n تم ازالة » {'..w..'} مجموعه لان البوت عضو'
end
send(msg.chat_id_, msg.id_,'عدد المجموعات الان » { '..#group..' }'..MODEDEVk..''..MODEDEV..'\n  الان عدد المجموعات الحقيقي » { '..sendok..' } مجموعه\n')   
end
end
end,nil)
end
return false
end


if text and text:match("^رفع مطور @(.*)$") and SudoBot(msg) then
local username = text:match("^رفع مطور @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•قناة الاشتراك ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_," عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:sadd(bot_id..'Sudo:User', result.id_)
usertext = '\n• العضو > ['..result.title_..'](t.me/'..(username or 'UU_KFUF')..')'
status  = '\n تم ترقيته مطور في البوت'
texts = usertext..status
else
texts = ' يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false 
end
if text and text:match("^رفع مطور (%d+)$") and SudoBot(msg) then
local userid = text:match("^رفع مطور (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•قناة الاشتراك ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:sadd(bot_id..'Sudo:User', userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '
status  = '\n تم ترقيته مطور في البوت'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n• العضو > '..userid..''
status  = '\n تم ترقيته مطور في البوت'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false 
end
if text and text:match("^تنزيل مطور @(.*)$") and SudoBot(msg) then
local username = text:match("^تنزيل مطور @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•قناة الاشتراك ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
database:srem(bot_id..'Sudo:User', result.id_)
usertext = '\n• العضو > ['..result.title_..'](t.me/'..(username or 'UU_KFUF')..')'
status  = '\n تم تنزيله من المطورين'
texts = usertext..status
else
texts = ' يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end  
if text and text:match("^تنزيل مطور (%d+)$") and SudoBot(msg) then
local userid = text:match("^تنزيل مطور (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• لا تستطيع استخدام البوت يرجى الاشتراك في القناة حتى تتمكن من استخدام الاوامر \n • < جط ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:srem(bot_id..'Sudo:User', userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n•العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..')'
status  = '\n تم تنزيله من المطورين'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n•العضو > '..userid..''
status  = '\n تم تنزيله من المطورين'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false 
end

end
--------------------------------------------------------------------------------------------------------------
if text and not Special(msg) then  
local MODEDEV1_Msg = database:get(bot_id.."MODEDEV1:Add:Filter:Rp2"..text..msg.chat_id_)   
if MODEDEV1_Msg then 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'• العضو> ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n •'..MODEDEV1_Msg)
DeleteMessage(msg.chat_id_, {[0] = msg.id_})     
return false
end,nil)
end
end
if database:get(bot_id..'Set:Name:Bot'..msg.sender_user_id_) then 
if text == 'الغاء' or text == 'الغاء •' then   
send(msg.chat_id_, msg.id_,"• تم الغاء حفظ اسم البوت") 
database:del(bot_id..'Set:Name:Bot'..msg.sender_user_id_) 
return false  
end 
database:del(bot_id..'Set:Name:Bot'..msg.sender_user_id_) 
database:set(bot_id..'Name:Bot',text) 
send(msg.chat_id_, msg.id_, " تم حفظ اسم البوت")  
return false
end 
if database:get(bot_id.."Send:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'الغاء' or text == 'الغاء •' then   
send(msg.chat_id_, msg.id_," تم الغاء الاذاعه للخاص") 
database:del(bot_id.."Send:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
local list = database:smembers(bot_id..'User_Bot') 
if msg.content_.text_ then
for k,v in pairs(list) do 
send(v, 0,'['..msg.content_.text_..']')  
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
end 
elseif msg.content_.animation_ then
for k,v in pairs(list) do 
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(list) do 
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
send(msg.chat_id_, msg.id_,"• تمت الاذاعه الى >>{"..#list.."} مشترك في البوت ")     
database:del(bot_id.."Send:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end

if database:get(bot_id.."Send:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'الغاء' or text == 'الغاء •' then   
send(msg.chat_id_, msg.id_," تم الغاء الاذاعه") 
database:del(bot_id.."Send:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
local list = database:smembers(bot_id..'Chek:Groups') 
if msg.content_.text_ then
for k,v in pairs(list) do 
send(v, 0,'['..msg.content_.text_..']')  
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
end 
elseif msg.content_.animation_ then
for k,v in pairs(list) do 
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(list) do 
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
send(msg.chat_id_, msg.id_,"• تمت الاذاعه الى >>{"..#list.."} مجموعه في البوت ")     
database:del(bot_id.."Send:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end

if database:get(bot_id.."Send:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'الغاء' or text == 'الغاء •' then   
send(msg.chat_id_, msg.id_,"• تم الغاء الاذاعه") 
database:del(bot_id.."Send:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false  
end 
if msg.forward_info_ then 
local list = database:smembers(bot_id..'Chek:Groups')   
for k,v in pairs(list) do  
tdcli_function({ID="ForwardMessages",
chat_id_ = v,
from_chat_id_ = msg.chat_id_,
message_ids_ = {[0] = msg.id_},
disable_notification_ = 0,
from_background_ = 1},function(a,t) end,nil) 
end   
send(msg.chat_id_, msg.id_,"• تمت الاذاعه الى >>{"..#list.."} مجموعات في البوت ")     
database:del(bot_id.."Send:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end 
end
if database:get(bot_id.."Send:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'الغاء' or text == 'الغاء •' then   
send(msg.chat_id_, msg.id_,"• تم الغاء الاذاعه") 
database:del(bot_id.."Send:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false  
end 
if msg.forward_info_ then 
local list = database:smembers(bot_id..'User_Bot')   
for k,v in pairs(list) do  
tdcli_function({ID="ForwardMessages",
chat_id_ = v,
from_chat_id_ = msg.chat_id_,
message_ids_ = {[0] = msg.id_},
disable_notification_ = 0,
from_background_ = 1},function(a,t) end,nil) 
end   
send(msg.chat_id_, msg.id_,"• تمت الاذاعه الى >>{"..#list.."} مشترك في البوت ")     
database:del(bot_id.."Send:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end 
end
if database:get(bot_id.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
send(msg.chat_id_, msg.id_, "• تم الغاء الامر ") 
database:del(bot_id.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
database:del(bot_id.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local username = string.match(text, "@[%a%d_]+") 
tdcli_function ({    
ID = "SearchPublicChat",    
username_ = username  
},function(arg,data) 
if data and data.message_ and data.message_ == "USERNAME_NOT_OCCUPIED" then 
send(msg.chat_id_, msg.id_, '• المعرف لا يوجد فيه قناة')
return false  end
if data and data.type_ and data.type_.ID and data.type_.ID == 'PrivateChatInfo' then
send(msg.chat_id_, msg.id_, '• عذا لا يمكنك وضع معرف حسابات في الاشتراك ') 
return false  end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.is_supergroup_ == true then
send(msg.chat_id_, msg.id_,'• عذا لا يمكنك وضع معرف مجوعه في الاشتراك ') 
return false  end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.is_supergroup_ == false then
if data and data.type_ and data.type_.channel_ and data.type_.channel_.ID and data.type_.channel_.status_.ID == 'ChatMemberStatusEditor' then
send(msg.chat_id_, msg.id_,'• البوت ادمن في القناة \n تم تفعيل الاشتراك الاجباري في \n ايدي القناة ('..data.id_..')\n• معرف القناة ([@'..data.type_.channel_.username_..'])') 
database:set(bot_id..'add:ch:id',data.id_)
database:set(bot_id..'add:ch:username','@'..data.type_.channel_.username_)
else
send(msg.chat_id_, msg.id_,'• البوت ليس ادمن في القناة يرجى ترقيته ادمن ثم اعادة المحاوله ') 
end
return false  
end
end,nil)
end
if database:get(bot_id.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
send(msg.chat_id_, msg.id_, "• تم الغاء الامر ") 
database:del(bot_id.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
database:del(bot_id.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local texxt = string.match(text, "(.*)") 
database:set(bot_id..'text:ch:user',texxt)
send(msg.chat_id_, msg.id_,'• تم تغيير رسالة الاشتراك بنجاح ')
end

local status_welcome = database:get(bot_id..'Chek:Welcome'..msg.chat_id_)
if status_welcome and not database:get(bot_id..'lock:tagservr'..msg.chat_id_) then
if msg.content_.ID == "MessageChatJoinByLink" then
tdcli_function({ID = "GetUser",user_id_=msg.sender_user_id_},function(extra,result) 
local GetWelcomeGroup = database:get(bot_id..'Get:Welcome:Group'..msg.chat_id_)  
if GetWelcomeGroup then 
t = GetWelcomeGroup
else  
t = '\n• نورت حبي \n•  name \n• user' 
end 
t = t:gsub('name',result.first_name_) 
if result.username_ then 
welcomeuser = '[@'..result.username_..']'
else
welcomeuser = '< لا يوجد معرف >'
end
t = t:gsub('user',welcomeuser) 
send(msg.chat_id_, msg.id_,t)
end,nil) 
end 
end 
--------------------------------------------------------------------------------------------------------------
if msg.content_.photo_ then  
if database:get(bot_id..'Change:Chat:Photo'..msg.chat_id_..':'..msg.sender_user_id_) then 
if msg.content_.photo_.sizes_[3] then  
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_ 
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_ 
end 
tdcli_function ({ID = "ChangeChatPhoto",chat_id_ = msg.chat_id_,photo_ = getInputFile(photo_id) }, function(arg,data)   
if data.code_ == 3 then
send(msg.chat_id_, msg.id_,' عذرا البوت ليس ادمن يرجى ترقيتي والمحاوله لاحقا') 
database:del(bot_id..'Change:Chat:Photo'..msg.chat_id_..':'..msg.sender_user_id_) 
return false  end
if data.message_ == "CHAT_ADMIN_REQUIRED" then 
send(msg.chat_id_, msg.id_,'… ليس لدي صلاحية تغيير معلومات المجموعه يرجى المحاوله لاحقا') 
database:del(bot_id..'Change:Chat:Photo'..msg.chat_id_..':'..msg.sender_user_id_) 
else
send(msg.chat_id_, msg.id_,'• تغيير صورة المجموعه') 
end
end, nil) 
database:del(bot_id..'Change:Chat:Photo'..msg.chat_id_..':'..msg.sender_user_id_) 
end   
end
--------------------------------------------------------------------------------------------------------------
if database:get(bot_id.."Set:Description" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if text == 'الغاء' then 
send(msg.chat_id_, msg.id_,"تم الغاء وضع الوصف") 
database:del(bot_id.."Set:Description" .. msg.chat_id_ .. "" .. msg.sender_user_id_)
return false  
end 
database:del(bot_id.."Set:Description" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
https.request('https://api.telegram.org/bot'..token..'/setChatDescription?chat_id='..msg.chat_id_..'&description='..text) 
send(msg.chat_id_, msg.id_,'تم تغيير وصف المجموعه')   
return false  
end 
--------------------------------------------------------------------------------------------------------------
if database:get(bot_id.."Welcome:Group" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text == 'الغاء' then 
send(msg.chat_id_, msg.id_,"تم الغاء حفظ الترحيب") 
database:del(bot_id.."Welcome:Group" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  
end 
database:del(bot_id.."Welcome:Group" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
database:set(bot_id..'Get:Welcome:Group'..msg.chat_id_,text) 
send(msg.chat_id_, msg.id_,' حفظ ترحيب المجموعه')   
return false   
end
--------------------------------------------------------------------------------------------------------------
if database:get(bot_id.."Set:Priovate:Group:Link"..msg.chat_id_..""..msg.sender_user_id_) then
if text == 'الغاء' then
send(msg.chat_id_,msg.id_,"تم الغاء حفظ الرابط")       
database:del(bot_id.."Set:Priovate:Group:Link"..msg.chat_id_..""..msg.sender_user_id_) 
return false
end
if text and text:match("(https://telegram.me/joinchat/%S+)") or text and text:match("(https://t.me/joinchat/%S+)") then     
local Link = text:match("(https://telegram.me/joinchat/%S+)") or text and text:match("(https://t.me/joinchat/%S+)")   
database:set(bot_id.."Private:Group:Link"..msg.chat_id_,Link)
send(msg.chat_id_,msg.id_,"تم حفظ الرابط بنجاح")       
database:del(bot_id.."Set:Priovate:Group:Link"..msg.chat_id_..""..msg.sender_user_id_) 
return false 
end
end 
--------------------------------------------------------------------------------------------------------------
if MODEDEV_Msg and not Special(msg) then  
local MODEDEV_Msg = database:get(bot_id.."Add:Filter:Rp2"..text..msg.chat_id_)   
if MODEDEV_Msg then    
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
send(msg.chat_id_,0,"• عضو : {["..data.first_name_.."](T.ME/"..data.username_..")}\n•["..MODEDEV_Msg.."] \n") 
else
send(msg.chat_id_,0,"• عضو : {["..data.first_name_.."](T.ME/UU_KFUF)}\n•["..MODEDEV_Msg.."] \n") 
end
end,nil)   
DeleteMessage(msg.chat_id_, {[0] = msg.id_})     
return false
end
end
--------------------------------------------------------------------------------------------------------------
if not Special(msg) and msg.content_.ID ~= "MessageChatAddMembers" and database:hget(bot_id.."flooding:settings:"..msg.chat_id_,"flood") then 
floods = database:hget(bot_id.."flooding:settings:"..msg.chat_id_,"flood") or 'nil'
NUM_MSG_MAX = database:hget(bot_id.."flooding:settings:"..msg.chat_id_,"floodmax") or 5
TIME_CHECK = database:hget(bot_id.."flooding:settings:"..msg.chat_id_,"floodtime") or 5
local post_count = tonumber(database:get(bot_id..'floodc:'..msg.sender_user_id_..':'..msg.chat_id_) or 0)
if post_count > tonumber(database:hget(bot_id.."flooding:settings:"..msg.chat_id_,"floodmax") or 5) then 
local ch = msg.chat_id_
local type = database:hget(bot_id.."flooding:settings:"..msg.chat_id_,"flood") 
trigger_anti_spam(msg,type)  
end
database:setex(bot_id..'floodc:'..msg.sender_user_id_..':'..msg.chat_id_, tonumber(database:hget(bot_id.."flooding:settings:"..msg.chat_id_,"floodtime") or 3), post_count+1) 
local edit_id = data.text_ or 'nil'  
NUM_MSG_MAX = 5
if database:hget(bot_id.."flooding:settings:"..msg.chat_id_,"floodmax") then
NUM_MSG_MAX = database:hget(bot_id.."flooding:settings:"..msg.chat_id_,"floodmax") 
end
if database:hget(bot_id.."flooding:settings:"..msg.chat_id_,"floodtime") then
TIME_CHECK = database:hget(bot_id.."flooding:settings:"..msg.chat_id_,"floodtime") 
end 
end 
--------------------------------------------------------------------------------------------------------------
if text and database:get(bot_id..'lock:Fshar'..msg.chat_id_) and not Special(msg) then 
list = {"كس","كسمك","كسختك","عير","كسخالتك","خرا بالله","عير بالله","كسخواتكم","كحاب","مناويج","مناويج","كحبه","ابن الكحبه","فرخ","فروخ","طيزك","طيزختك","كسمك","يا ابن الخول","المتناك","شرموط","شرموطه","ابن الشرموطه","ابن الخول","ابن العرص","منايك","متناك","احا","ابن المتناكه","زبك","عرص","زبي","خول","لبوه","لباوي","ابن اللبوه","منيوك","كسمكك","متناكه","احو","احي","يا عرص","يا خول","قحبه","القحبه","شراميط","العلق","العلوق","العلقه","كسمك","يا ابن الخول","المتناك","شرموط","شرموطه","ابن الشرموطه","ابن الخول","االمنيوك","كسمككك","الشرموطه","ابن العرث","ابن الحيضانه","زبك","خول","زبي","قاحب"}
for k,v in pairs(list) do
print(string.find(text,v))
if string.find(text,v) ~= nil then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
end
if text and database:get(bot_id..'lock:Fars'..msg.chat_id_) and not Special(msg) then 
list = {"ڄ","گ","که","پی","خسته","برم","راحتی","بیام","بپوشم","گرمه","چه","چ","ڬ","ٺ","چ","ڇ","ڿ","ڀ","ڎ","ݫ","ژ","ڟ","ݜ","ڸ","پ","۴","زدن","دخترا","دیوث","مک","زدن"}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
end
if text and database:get(bot_id..'lock:Azag'..msg.chat_id_) and not Special(msg) then 
list = {"كس","كسمك","كسختك","عير","كسخالتك","خرا بالله","عير بالله","كسخواتكم","كحاب","مناويج","مناويج","كحبه","ابن الكحبه","فرخ","فروخ","طيزك","طيزختك","كسمك","يا ابن الخول","المتناك","شرموط","شرموطه","ابن الشرموطه","ابن الخول","ابن العرص","منايك","متناك","احا","ابن المتناكه","زبك","عرص","زبي","خول","لبوه","لباوي","ابن اللبوه","منيوك","كسمكك","متناكه","احو","احي","يا عرص","يا خول","قحبه","القحبه","شراميط","العلق","العلوق","العلقه","كسمك","يا ابن الخول","المتناك","شرموط","شرموطه","ابن الشرموطه","ابن الخول","االمنيوك","كسمككك","الشرموطه","ابن العرث","ابن الحيضانه","زبك","خول","زبي","قاحب"}
for k,v in pairs(list) do
print(string.find(text,v))
if string.find(text,v) ~= nil then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
end
if text and database:get(bot_id..'lock:Azag'..msg.chat_id_) and not Special(msg) then 
list = {"ڄ","گ","که","پی","خسته","برم","راحتی","بیام","بپوشم","گرمه","چه","چ","ڬ","ٺ","چ","ڇ","ڿ","ڀ","ڎ","ݫ","ژ","ڟ","ݜ","ڸ","پ","۴","زدن","دخترا","دیوث","مک","زدن"}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
end
if text and database:get(bot_id..'lock:Azag'..msg.chat_id_) and not Special(msg) then 
list = {"ڄ","گ","که","پی","خسته","برم","راحتی","بیام","بپوشم","گرمه","چه","چ","ڬ","ٺ","چ","ڇ","ڿ","ڀ","ڎ","ݫ","ژ","ڟ","ݜ","ڸ","پ","۴","زدن","دخترا","دیوث","مک","زدن","اصل","پ","پی","لطفا","سکوت","نیومدم","گم","كس","كحبه","تبادل","جهات","سني","شيعي","ياسعودي","ياعراكي","كسمك"}
for k,v in pairs(list) do
print(string.find(text,v))
if string.find(text,v) ~= nil then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
end
if text and database:get(bot_id..'lock:Azag'..msg.chat_id_) and not Special(msg) then 
list = {"ربج","خرب دينك","خرب دينج","عير بربك","جهات","كس ربك","رب الكواد","كسم ربك","خرب دينك","خرب دينج","عير بربك","سكسي","كس ربك","خرب الله","صوج الله","خرب محمد","الله الكواد","صوج الله","كسخت الله","ربك"}
for k,v in pairs(list) do
print(string.find(text,v))
if string.find(text,v) ~= nil then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
end
if text and database:get(bot_id..'lock:Azag'..msg.chat_id_) and not Special(msg) then 
list = {"زيج","عفطه","نيجه","مصه","لحسه","العبي","ابن التنيج","ارد اتنايج","خره بالعراق","انعل رب العراق","كسربك","كسج","كسي","تنيج","69","عير","كيري","مبعوص","كسختك","بعبصتكم","موشريفه","ابن","صرم","اختك","خالتك","امك","رب الكواد","xnxx","كس","كسمك","كسختك","عير","كسخالتك","خرا بالله","عير بالله","كسخواتكم","كحاب","مناويج","مناويج","كحبه","ابن الكحبه","فرخ","فروخ","طيزك","طيزختك"}
for k,v in pairs(list) do
print(string.find(text,v))
if string.find(text,v) ~= nil then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
end
if text and database:get(bot_id..'lock:Azag'..msg.chat_id_) and not Special(msg) then 
list = {"يا عبد","يا سعودي","يا عراقي","يا عراكي","يا سوري","يا فلسطيني","يا اردني","يا مصري","يا خليجي","يا محتل","يا مشرد","يا فقير","يبن فقيره","يا مهان","يا ابيض","يا نظيف","يعبد","يسعودي","يعراقي","يعاركي","يمصري","يردني","يمشرد","يفقير","يفلسطيني","يابيض","يا هطف","يبن هبله","يحمار","ياهبل","يخليجي"}
for k,v in pairs(list) do
print(string.find(text,v))
if string.find(text,v) ~= nil then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
end
--------------------------------------------------------------------------------------------------------------
if database:get(bot_id..'lock:text'..msg.chat_id_) and not Special(msg) then       
DeleteMessage(msg.chat_id_,{[0] = msg.id_})   
return false     
end     
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageChatAddMembers" then 
database:incr(bot_id..'Add:Contact'..msg.chat_id_..':'..msg.sender_user_id_) 
end
if msg.content_.ID == "MessageChatAddMembers" and not Special(msg) then   
if database:get(bot_id.."lock:AddMempar"..msg.chat_id_) == 'kick' then
local mem_id = msg.content_.members_  
for i=0,#mem_id do  
chat_kick(msg.chat_id_,mem_id[i].id_)
end
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageChatJoinByLink" and not Special(msg) then 
if database:get(bot_id.."lock:Join"..msg.chat_id_) == 'kick' then
chat_kick(msg.chat_id_,msg.sender_user_id_)
return false  
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.caption_ then 
if msg.content_.caption_:match("@[%a%d_]+") or msg.content_.caption_:match("@(.+)") then  
if database:get(bot_id.."lock:user:name"..msg.chat_id_) == "del" and not Special(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:user:name"..msg.chat_id_) == "ked" and not Special(msg) then    
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:user:name"..msg.chat_id_) == "kick" and not Special(msg) then    
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:user:name"..msg.chat_id_) == "ktm" and not Special(msg) then    
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match("@[%a%d_]+") or text and text:match("@(.+)") then    
if database:get(bot_id.."lock:user:name"..msg.chat_id_) == "del" and not Special(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:user:name"..msg.chat_id_) == "ked" and not Special(msg) then    
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:user:name"..msg.chat_id_) == "kick" and not Special(msg) then    
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:user:name"..msg.chat_id_) == "ktm" and not Special(msg) then    
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.caption_ then 
if msg.content_.caption_:match("#[%a%d_]+") or msg.content_.caption_:match("#(.+)") then 
if database:get(bot_id.."lock:hashtak"..msg.chat_id_) == "del" and not Special(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:hashtak"..msg.chat_id_) == "ked" and not Special(msg) then    
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:hashtak"..msg.chat_id_) == "kick" and not Special(msg) then    
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:hashtak"..msg.chat_id_) == "ktm" and not Special(msg) then    
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match("#[%a%d_]+") or text and text:match("#(.+)") then
if database:get(bot_id.."lock:hashtak"..msg.chat_id_) == "del" and not Special(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:hashtak"..msg.chat_id_) == "ked" and not Special(msg) then    
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:hashtak"..msg.chat_id_) == "kick" and not Special(msg) then    
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:hashtak"..msg.chat_id_) == "ktm" and not Special(msg) then    
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.caption_ then 
if msg.content_.caption_:match("/[%a%d_]+") or msg.content_.caption_:match("/(.+)") then  
if database:get(bot_id.."lock:Cmd"..msg.chat_id_) == "del" and not Special(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Cmd"..msg.chat_id_) == "ked" and not Special(msg) then    
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Cmd"..msg.chat_id_) == "kick" and not Special(msg) then    
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Cmd"..msg.chat_id_) == "ktm" and not Special(msg) then    
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match("/[%a%d_]+") or text and text:match("/(.+)") then
if database:get(bot_id.."lock:Cmd"..msg.chat_id_) == "del" and not Special(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Cmd"..msg.chat_id_) == "ked" and not Special(msg) then    
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Cmd"..msg.chat_id_) == "kick" and not Special(msg) then    
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Cmd"..msg.chat_id_) == "ktm" and not Special(msg) then    
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.caption_ then 
if not Special(msg) then 
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or msg.content_.caption_:match(".[Pp][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or msg.content_.caption_:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/") or msg.content_.caption_:match("[Tt].[Mm][Ee]/") then 
if database:get(bot_id.."lock:Link"..msg.chat_id_) == "del" and not Special(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Link"..msg.chat_id_) == "ked" and not Special(msg) then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Link"..msg.chat_id_) == "kick" and not Special(msg) then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Link"..msg.chat_id_) == "ktm" and not Special(msg) then
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or text and text:match("[Hh][Tt][Tt][Pp][Ss]://") or text and text:match("[Hh][Tt][Tt][Pp]://") or text and text:match("[Ww][Ww][Ww].") or text and text:match(".[Cc][Oo][Mm]") or text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or text and text:match(".[Pp][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or text and text:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/") or text and text:match("[Tt].[Mm][Ee]/") and not Special(msg) then
if database:get(bot_id.."lock:Link"..msg.chat_id_) == "del" and not Special(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Link"..msg.chat_id_) == "ked" and not Special(msg) then 
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Link"..msg.chat_id_) == "kick" and not Special(msg) then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Link"..msg.chat_id_) == "ktm" and not Special(msg) then
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == 'MessagePhoto' and not Special(msg) then     
if database:get(bot_id.."lock:Photo"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Photo"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Photo"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Photo"..msg.chat_id_) == "ktm" then
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == 'MessageVideo' and not Special(msg) then     
if database:get(bot_id.."lock:Video"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Video"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Video"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Video"..msg.chat_id_) == "ktm" then
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == 'MessageAnimation' and not Special(msg) then     
if database:get(bot_id.."lock:Animation"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Animation"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Animation"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Animation"..msg.chat_id_) == "ktm" then
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.game_ and not Special(msg) then     
if database:get(bot_id.."lock:geam"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:geam"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:geam"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:geam"..msg.chat_id_) == "ktm" then
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == 'MessageAudio' and not Special(msg) then     
if database:get(bot_id.."lock:Audio"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Audio"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Audio"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Audio"..msg.chat_id_) == "ktm" then
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == 'MessageVoice' and not Special(msg) then     
if database:get(bot_id.."lock:vico"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:vico"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:vico"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:vico"..msg.chat_id_) == "ktm" then
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.reply_markup_ and msg.reply_markup_.ID == 'ReplyMarkupInlineKeyboard' and not Special(msg) then     
if database:get(bot_id.."lock:Keyboard"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Keyboard"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Keyboard"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Keyboard"..msg.chat_id_) == "ktm" then
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == 'MessageSticker' and not Special(msg) then     
if database:get(bot_id.."lock:Sticker"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Sticker"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Sticker"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Sticker"..msg.chat_id_) == "ktm" then
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
if tonumber(msg.via_bot_user_id_) ~= 0 and not Special(msg) then
if database:get(bot_id.."lock:inline"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:inline"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:inline"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:inline"..msg.chat_id_) == "ktm" then
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.forward_info_ and not Special(msg) then     
if database:get(bot_id.."lock:forward"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
elseif database:get(bot_id.."lock:forward"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
elseif database:get(bot_id.."lock:forward"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
elseif database:get(bot_id.."lock:forward"..msg.chat_id_) == "ktm" then
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == 'MessageDocument' and not Special(msg) then     
if database:get(bot_id.."lock:Document"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Document"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Document"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Document"..msg.chat_id_) == "ktm" then
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageUnsupported" and not Special(msg) then      
if database:get(bot_id.."lock:Unsupported"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Unsupported"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Unsupported"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Unsupported"..msg.chat_id_) == "ktm" then
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.entities_ then 
if msg.content_.entities_[0] then 
if msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityUrl" or msg.content_.entities_[0].ID == "MessageEntityTextUrl" then      
if not Special(msg) then
if database:get(bot_id.."lock:Markdaun"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Markdaun"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Markdaun"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Markdaun"..msg.chat_id_) == "ktm" then
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end  
end 
end
end 
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == 'MessageContact' and not Special(msg) then      
if database:get(bot_id.."lock:Contact"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Contact"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Contact"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Contact"..msg.chat_id_) == "ktm" then
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.text_ and not Special(msg) then  
local _nl, ctrl_ = string.gsub(text, '%c', '')  
local _nl, real_ = string.gsub(text, '%d', '')   
sens = 400  
if database:get(bot_id.."lock:Spam"..msg.chat_id_) == "del" and string.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Spam"..msg.chat_id_) == "ked" and string.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Spam"..msg.chat_id_) == "kick" and string.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif database:get(bot_id.."lock:Spam"..msg.chat_id_) == "ktm" and string.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
database:sadd(bot_id..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
if msg.content_.ID == 'MessageSticker' and not Manager(msg) then 
local filter = database:smembers(bot_id.."filtersteckr"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.sticker_.set_id_ then
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
send(msg.chat_id_,0, "•عذرا يا > {[@"..data.username_.."]}\n•  الملصق الذي ارسلته تم منعه من المجموعه \n" ) 
else
send(msg.chat_id_,0, "•عذرا يا > {["..data.first_name_.."](T.ME/UU_KFUF)}\n• الملصق الذي ارسلته تم منعه من المجموعه \n" ) 
end
end,nil)   
DeleteMessage(msg.chat_id_,{[0] = msg.id_})       
return false   
end
end
end

------------------------------------------------------------------------

------------------------------------------------------------------------
if msg.content_.ID == 'MessagePhoto' and not Manager(msg) then 
local filter = database:smembers(bot_id.."filterphoto"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.photo_.id_ then
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
send(msg.chat_id_,0,"•عذرا يا > {[@"..data.username_.."]}\n• الصوره التي ارسلتها تم منعها من المجموعه \n" ) 
else
send(msg.chat_id_,0,"•عذرا يا > {["..data.first_name_.."](T.ME/UU_KFUF)}\n• الصوره التي ارسلتها تم منعها من المجموعه \n") 
end
end,nil)   
DeleteMessage(msg.chat_id_,{[0] = msg.id_})       
return false   
end
end
end
------------------------------------------------------------------------
if msg.content_.ID == 'MessageAnimation' and not Manager(msg) then 
local filter = database:smembers(bot_id.."filteranimation"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.animation_.animation_.persistent_id_ then
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
send(msg.chat_id_,0,"•عذرا يا > {[@"..data.username_.."]}\n• المتحركه التي ارسلتها تم منعها من المجموعه \n") 
else
send(msg.chat_id_,0,"•عذرا يا > {["..data.first_name_.."](T.ME/UU_KFUF)}\n• المتحركه التي ارسلتها تم منعها من المجموعه \n" ) 
end
end,nil)   
DeleteMessage(msg.chat_id_,{[0] = msg.id_})       
return false   
end
end
end

if text == 'تفعيل' and Sudo(msg) then
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,'• البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = getChatId(msg.chat_id_).ID }, function(arg,data)  
if tonumber(data.member_count_) < tonumber(database:get(bot_id..'Num:Add:Bot') or 0) and not SudoBot(msg) then
send(msg.chat_id_, msg.id_,'• عدد اعضاء المجموعه قليله يرجى جمع >> {'..(database:get(bot_id..'Num:Add:Bot') or 0)..'} عضو')
return false
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,chat)  
if database:sismember(bot_id..'Chek:Groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_,'• المجموعه تم تفعيلها من قبل')
else
sendText(msg.chat_id_,'\n•بواسطه ← ['..string.sub(result.first_name_,0, 70)..'](tg://user?id='..result.id_..')\n• تم تفعيل المجموعه {'..chat.title_..'}',msg.id_/2097152/0.5,'md')
database:sadd(bot_id..'Chek:Groups',msg.chat_id_)
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
local NameChat = chat.title_
local IdChat = msg.chat_id_
local NumMember = data.member_count_
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if linkgpp.ok == true then 
LinkGp = linkgpp.result
else
LinkGp = 'لا يوجد'
end
Text = '• تم تفعيل مجموعه جديده\n'..
'\n•بواسطة {'..Name..'}'..
'\n•ايدي المجموعه {`'..IdChat..'`}'..
'\n•اسم المجموعه {['..NameChat..']}'..
'\n•عدد اعضاء المجموعه *{'..NumMember..'}*'..
'\n•الرابط {['..LinkGp..']}'
if not SudoBot(msg) then
sendText(SUDO,Text,0,'md')
end
end
end,nil) 
end,nil) 
end,nil)
end
if text == 'تعطيل' and Sudo(msg) then
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,chat)  
if not database:sismember(bot_id..'Chek:Groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_,'• المجموعه تم تطيلها من قبل')
else
sendText(msg.chat_id_,'\n•بواسطه ← ['..string.sub(result.first_name_,0, 70)..'](tg://user?id='..result.id_..')\n✔️¦ تم تعطيل المجموعه {'..chat.title_..'}',msg.id_/2097152/0.5,'md')
database:srem(bot_id..'Chek:Groups',msg.chat_id_)  
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
local NameChat = chat.title_
local IdChat = msg.chat_id_
local AddPy = var
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if linkgpp.ok == true then 
LinkGp = linkgpp.result
else
LinkGp = 'لا يوجد'
end
Text = '• تم تعطيل مجموعه جديده\n'..
'\n•بواسطة {'..Name..'}'..
'\n•ايدي المجموعه {`'..IdChat..'`}'..
'\n•اسم المجموعه {['..NameChat..']}'..
'\n•الرابط {['..LinkGp..']}'
if not SudoBot(msg) then
sendText(SUDO,Text,0,'md')
end
end
end,nil) 
end,nil) 
end
if text == 'تفعيل' and not Sudo(msg) and not database:get(bot_id..'Free:Bots') then
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,'• البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = getChatId(msg.chat_id_).ID }, function(arg,data)  
if tonumber(data.member_count_) < tonumber(database:get(bot_id..'Num:Add:Bot') or 0) and not SudoBot(msg) then
send(msg.chat_id_, msg.id_,'• عدد اعضاء المجموعه قليله يرجى جمع >> {'..(database:get(bot_id..'Num:Add:Bot') or 0)..'} عضو')
return false
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,chat)  
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da and da.status_.ID == "ChatMemberStatusEditor" or da and da.status_.ID == "ChatMemberStatusCreator" then
if da and da.user_id_ == msg.sender_user_id_ then
if da.status_.ID == "ChatMemberStatusCreator" then
var = 'المنشئ'
elseif da.status_.ID == "ChatMemberStatusEditor" then
var = 'الادمن'
end
if database:sismember(bot_id..'Chek:Groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_,'• تم تفعيل المجموعه بنجاح')
else
sendText(msg.chat_id_,'\n•بواسطه ← ['..string.sub(result.first_name_,0, 70)..'](tg://user?id='..result.id_..')\n• تم تفعيل المجموعه {'..chat.title_..'}',msg.id_/2097152/0.5,'md')
database:sadd(bot_id..'Chek:Groups',msg.chat_id_)  
database:sadd(bot_id..'Basic:Constructor'..msg.chat_id_, msg.sender_user_id_)
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
local NumMember = data.member_count_
local NameChat = chat.title_
local IdChat = msg.chat_id_
local AddPy = var
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if linkgpp.ok == true then 
LinkGp = linkgpp.result
else
LinkGp = 'لا يوجد'
end
Text = '• تم تفعيل مجموعه جديده\n'..
'\n• بواسطة {'..Name..'}'..
'\n• موقعه في المجموعه {'..AddPy..'}' ..
'\n• ايدي المجموعه {`'..IdChat..'`}'..
'\n• عدد اعضاء المجموعه *{'..NumMember..'}*'..
'\n• اسم المجموعه {['..NameChat..']}'..
'\n• الرابط {['..LinkGp..']}'
if not SudoBot(msg) then
sendText(SUDO,Text,0,'md')
end
end
end
end
end,nil)   
end,nil) 
end,nil) 
end,nil)
end
if text and text:match("^ضع عدد الاعضاء (%d+)$") and SudoBot(msg) then
local Num = text:match("ضع عدد الاعضاء (%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•قناة الاشتراك ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id..'Num:Add:Bot',Num) 
send(msg.chat_id_, msg.id_,'• تم تعيين عدد الاعضاء سيتم تفعيل المجموعات التي اعضائها اكثر من  >> {'..Num..'} عضو')
end
if text == 'تحديث السورس' and SudoBot(msg) then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•قناة الاشتراك ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
os.execute('rm -rf MODEDEV.lua')
os.execute('wget https://raw.githubusercontent.com/DEV-SONIC/Egy/main/MODEDEV.lua')
send(msg.chat_id_, msg.id_,'• تم تحديث السورس')
dofile('MODEDEV.lua')  
end
if text == "تعطيل الزخرفه" and Manager(msg) then
send(msg.chat_id_, msg.id_, '• تم تعطيل الزخرفه')
database:set(bot_id.."MODEDEV:zhrf_Bots"..msg.chat_id_,"close")
end
if text == "تفعيل الزخرفه" and Manager(msg) then
send(msg.chat_id_, msg.id_,'• تم تفعيل الزخرفه')
database:set(bot_id.."MODEDEV:zhrf_Bots"..msg.chat_id_,"open")
end
if text and text:match("^زخرفه (.*)$") and database:get(bot_id.."MODEDEV:zhrf_Bots"..msg.chat_id_) == "open" then
local TextZhrfa = text:match("^زخرفه (.*)$")
zh = https.request('https://black-source.tk/BlackTeAM/frills.php?en='..URL.escape(TextZhrfa)..'')
zx = JSON.decode(zh)
t = "\n•قائمه الزخرفه \n*܀⠤⠤⠤⠤⠤⠤܀ٴ*\n"
i = 0
for k,v in pairs(zx.ok) do
i = i + 1
t = t..i.."-  `"..v.."` \n"
end
send(msg.chat_id_, msg.id_, t..'*܀⠤⠤⠤⠤⠤⠤܀ٴ*\n•اضغط على الاسم ليتم نسخه')
end
if text == "تعطيل معاني الاسماء" and Manager(msg) then
send(msg.chat_id_, msg.id_, '⋆ ⇽ تم تعطيل معاني الاسماء')
database:set(bot_id.."MODEDEV:Name_Bots"..msg.chat_id_,"close")
end
if text == "تفعيل معاني الاسماء" and Manager(msg) then
send(msg.chat_id_, msg.id_,'⋆ ⇽ تم تفعيل معاني الاسماء')
database:set(bot_id.."MODEDEV:Name_Bots"..msg.chat_id_,"open")
end
if text and text:match("^معني (.*)$") and database:get(bot_id.."MODEDEV:Name_Bots"..msg.chat_id_) == "open" then
local TextName = text:match("^معني (.*)$")
gk = https.request('http://sonicx.ml/Api/Name.php?Name='..URL.escape(TextName)..'')
br = JSON.decode(gk)
send(msg.chat_id_, msg.id_,br.meaning)
end
if text == "تعطيل الابراج" and Manager(msg) then
send(msg.chat_id_, msg.id_, '• تم تعطيل الابراج')
database:set(bot_id.."MODEDEV:brj_Bots"..msg.chat_id_,"close")
end
if text == "تفعيل الابراج" and Manager(msg) then
send(msg.chat_id_, msg.id_,'• تم تفعيل الابراج')
database:set(bot_id.."MODEDEV:brj_Bots"..msg.chat_id_,"open")
end
if text and text:match("^برج (.*)$") and database:get(bot_id.."MODEDEV:brj_Bots"..msg.chat_id_) == "open" then
local Textbrj = text:match("^برج (.*)$")
gk = https.request('https://mode-dev.tk/Api2/Modbr.php?br='..URL.escape(Textbrj)..'')
br = JSON.decode(gk)
i = 0
for k,v in pairs(br.ok) do
i = i + 1
t = v.."\n"
end
send(msg.chat_id_, msg.id_, t)
end
if text == "تعطيل حساب العمر" and Manager(msg) then
send(msg.chat_id_, msg.id_, '• تم تعطيل حساب العمر')
database:set(bot_id.."MODEDEV:age_Bots"..msg.chat_id_,"close")
end
if text == "تفعيل حساب العمر" and Manager(msg) then
send(msg.chat_id_, msg.id_,'• تم تفعيل حساب العمر')
database:set(bot_id.."MODEDEV:age_Bots"..msg.chat_id_,"open")
end
if text and text:match("^احسب (.*)$") and database:get(bot_id.."MODEDEV:age_Bots"..msg.chat_id_) == "open" then
local Textage = text:match("^احسب (.*)$")
ge = https.request('https://mode-dev.tk/Api1/niggaapi.php?age='..URL.escape(Textage)..'')
ag = JSON.decode(ge)
i = 0
for k,v in pairs(ag.ok) do
i = i + 1
t = v.."\n"
end
send(msg.chat_id_, msg.id_, t)
end

if text == "تعطيل الافلام" and Mod(msg) then
send(msg.chat_id_, msg.id_, 'تم تعطيل الافلام')
database:set(bot_id.."BLACKBOTSS:movie_bot"..msg.chat_id_,"close")
end
if text == "تفعيل الافلام" and Mod(msg) then
send(msg.chat_id_, msg.id_,'تم تفعيل الافلام')
database:set(bot_id.."BLACKBOTSS:movie_bot"..msg.chat_id_,"open")
end
if text and text:match("^فلم (.*)$") and database:get(bot_id.."BLACKBOTSS:movie_bot"..msg.chat_id_) == "open" then
local Textm = text:match("^فلم (.*)$")
data,res = https.request('https://forhassan.ml/Black/movie.php?serch='..URL.escape(Textm)..'')
if res == 200 then
getmo = json:decode(data)
if getmo.Info == true then
local Text ='قصه الفلم'..getmo.info
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'مشاهده الفلم بجوده 240',url=getmo.sd}},
{{text = 'مشاهده الفلم بجوده 480', url=getmo.Web},{text = 'مشاهده الفلم بجوده 1080', url=getmo.hd}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
end
if text == "غنيلي" then
data,res = https.request('https://forhassan.ml/Black/audios.php')
if res == 200 then
audios = json:decode(data)
if audios.Info == true then
local done = download_to_file(audios.info,msg.sender_user_id_..'.mp3')
sendAudio(msg.chat_id_,msg.id_,'./'..msg.sender_user_id_..'.mp3','@UU_KFUF','•غنيلي = اغاني عشوائيه اهداء من البوت•','end')
os.execute('rm -rf ./'..msg.sender_user_id_..'.mp3') 
end
end
end
if text == "تعطيل الانستا" and Manager(msg) then
send(msg.chat_id_, msg.id_, 'تم تعطيل الانستا')
database:set(bot_id.."BLACKBOTSS:insta_bot"..msg.chat_id_,"close")
end
if text == "تفعيل الانستا" and Manager(msg) then
send(msg.chat_id_, msg.id_,'تم تفعيل الانستا')
database:set(bot_id.."BLACKBOTSS:insta_bot"..msg.chat_id_,"open")
end
if text and text:match("^معلومات (.*)$") and database:get(bot_id.."BLACKBOTSS:insta_bot"..msg.chat_id_) == "open" then
local Textni = text:match("^معلومات (.*)$")
data,res = https.request('https://forhassan.ml/Black/insta.php?username='..URL.escape(Textni)..'')
if res == 200 then
muaed = json:decode(data)
if muaed.Info == true then
local filee = download_to_file(muaed.ph,msg.sender_user_id_..'.jpg')
sendPhoto(msg.chat_id_, msg.id_,'./'..msg.sender_user_id_..'.jpg',muaed.info)     
os.execute('rm -rf ./'..msg.sender_user_id_..'.jpg') 
end
end
end
if text and text:match("^•تغير الاشتراك•$") and SudoBot(msg) then  
database:setex(bot_id.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 360, true)  
send(msg.chat_id_, msg.id_, '• حسنا ارسل لي معرف القناة') 
return false  
end
if text and text:match("^تغير رساله الاشتراك$") and SudoBot(msg) then  
database:setex(bot_id.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 360, true)  
send(msg.chat_id_, msg.id_, '• حسنا ارسل لي النص الذي تريده') 
return false  
end
if text == "حذف رساله الاشتراك" and SudoBot(msg) then  
database:del(bot_id..'text:ch:user')
send(msg.chat_id_, msg.id_, "• تم مسح رساله الاشتراك ") 
return false  
end
if text and text:match("^•وضع قناة الاشتراك•$") and SudoBot(msg) then  
database:setex(bot_id.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 360, true)  
send(msg.chat_id_, msg.id_, '• حسنا ارسل لي معرف القناة') 
return false  
end
if text == "•تفعيل الاشتراك•" and SudoBot(msg) then  
if database:get(bot_id..'add:ch:id') then
local addchusername = database:get(bot_id..'add:ch:username')
send(msg.chat_id_, msg.id_,"• الاشتراك الاجباري مفعل \n على القناة > ["..addchusername.."]")
else
database:setex(bot_id.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 360, true)  
send(msg.chat_id_, msg.id_," لا يوجد قناة للاشتراك الاجباري")
end
return false  
end
if text == "•تعطيل الاشتراك•" and SudoBot(msg) then  
database:del(bot_id..'add:ch:id')
database:del(bot_id..'add:ch:username')
send(msg.chat_id_, msg.id_, "• تم تعطيل الاشتراك الاجباري ") 
return false  
end
if text == "•الاشتراك الاجباري•" and SudoBot(msg) then  
if database:get(bot_id..'add:ch:username') then
local addchusername = database:get(bot_id..'add:ch:username')
send(msg.chat_id_, msg.id_, "• تم تم تفعيل الاشتراك الاجباري \n على القناة > ["..addchusername.."]")
else
send(msg.chat_id_, msg.id_, "• لا يوجد قناة في الاشتراك الاجباري ") 
end
return false  
end

if text == "تفعيل الاضافات" and SudoBot(msg) then
send(msg.chat_id_, msg.id_, '•تم تفعيل الاضافات')
database:set(bot_id.."AL:Sre:stats","✔")
end
if text == "تعطيل الاضافات" and SudoBot(msg) then
send(msg.chat_id_, msg.id_, '•تم تعطيل الاضافات')
database:set(bot_id.."AL:Sre:stats","❌")
end
if text == "الاضافات" and Constructor(msg) then
local Xx = database:get(bot_id.."AL:Sre:stats") or "لم يتم التحديد"
send(msg.chat_id_, msg.id_,"الاضافات هي :\n— — — — — — — — — \n1- كتم الاسماء \n١- كتم اسم +(اسم)\n٢-الغاء كتم اسم +(اسم)\n٣- الاسماء المكتومه\n٤- تفعيل كتم الاسم\n٥- تعطيل كتم الاسم\n— — — — — — — — — \n2- وضع توحيد \n١- وضع توحيد +(التوحيد)\n٢- تعين عدد الكتم+(العدد)\n٣- التوحيد\n٤- تفعيل التوحيد\n٥- تعطيل التوحيد \n— — — — — — — — — \n3- تنبيه الاسماء \n ۱- تفعيل تنبيه الاسماء \n ۲- تعطيل تنبيه الاسماء\n— — — — — — — — —  \n 4- تنبيه المعرف \n ١- تفعيل تنبيه المعرف \n ۲- تعطيل تنبيه المعرف\n— — — — — — — — —  \n5- تنبيه الصور \n ۱- تفعيل تنبيه الصور \n٢- تعطيل تنبيه الصور \n— — — — — — — — — \n حاله الاضافات هي : "..Xx.."\nاذا كانت ❌ الاضافات معطله\nاذا كانت ✔ الاضافات مفعله")
end
function bnnaGet(user_id, cb)
tdcli_function ({
ID = "GetUser",
user_id_ = user_id
}, cb, nil)
end

if database:get(bot_id.."block:name:stats"..msg.chat_id_) == "open" then
if text and text:match("^كتم اسم (.*)$") and Manager(msg) and database:get(bot_id.."block:name:stats"..msg.chat_id_) == "open" then
local BlNe = text:match("^كتم اسم (.*)$")
send(msg.chat_id_, msg.id_, '•تم كتم الاسم '..BlNe)
database:sadd(bot_id.."MODEDEV:blocname"..msg.chat_id_, BlNe)
end

if text and text:match("^الغاء كتم اسم (.*)$") and Manager(msg) and database:get(bot_id.."block:name:stats"..msg.chat_id_) == "open" then
local delBn = text:match("^الغاء كتم اسم (.*)$")
send(msg.chat_id_, msg.id_, '•تم الغاء كتم الاسم '..delBn)
database:srem(bot_id.."MODEDEV:blocname"..msg.chat_id_, delBn)
end

if text == "مسح الاسماء المكتومه" and Constructor(msg) and database:get(bot_id.."block:name:stats"..msg.chat_id_) == "open" then
database:del(bot_id.."MODEDEV:blocname"..msg.chat_id_)
texts = "• تم مسح الاسماء المكتومه "
send(msg.chat_id_, msg.id_, texts)
end
if text == "الاسماء المكتومه" and Constructor(msg) and database:get(bot_id.."block:name:stats"..msg.chat_id_) == "open" then
local All_name = database:smembers(bot_id.."MODEDEV:blocname"..msg.chat_id_)
t = "\n•قائمة الاسماء المكتومه \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(All_name) do
t = t..""..k.."- (["..v.."])\n"
end
if #All_name == 0 then
t = "•لا يوجد اسماء مكتومه"
end
send(msg.chat_id_, msg.id_, t)
end
end
if text == "تفعيل كتم الاسم" and Constructor(msg) and database:get(bot_id.."AL:Sre:stats") == "✔" then
send(msg.chat_id_, msg.id_, '•تم التفعيل سيتم كتم العضو الذي يضع الاسماء المكتومه')
database:set(bot_id.."block:name:stats"..msg.chat_id_,"open")
end
if text == "تعطيل كتم الاسم" and Constructor(msg) and database:get(bot_id.."AL:Sre:stats") == "✔" then
send(msg.chat_id_, msg.id_, '•تم تعطيل سيتم كتم العضو الذي يضع الاسماء المكتومه')
database:set(bot_id.."block:name:stats"..msg.chat_id_,"close")
end
if not Manager(msg) and database:get(bot_id.."block:name:stats"..msg.chat_id_) == "open" then
function BGBBB_name(t1,t2)
if t2.id_ then 
name_Black = ((t2.first_name_ or "") .. (t2.last_name_ or ""))
if name_Black then 
names_Black = database:smembers(bot_id.."MODEDEV:blocname"..msg.chat_id_) or ""
if names_Black and names_Black[1] then 
for i=1,#names_Black do 
if name_Black:match("(.*)("..names_Black[i]..")(.*)") then 
DeleteMessage_(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
end
end
end
bnnaGet(msg.sender_user_id_, BGBBB_name)
end
if database:get(bot_id.."kt:twh:stats"..msg.chat_id_) == "open" then
if text and text:match("^وضع توحيد (.*)$") and Manager(msg) and database:get(bot_id.."kt:twh:stats"..msg.chat_id_) == "open" then
local teh = text:match("^وضع توحيد (.*)$")
send(msg.chat_id_, msg.id_,'•تم تعيين '..teh..' كتوحيد للمجموعه')
database:set(bot_id.."MODEDEV:teh"..msg.chat_id_,teh)
end
if text and text:match("^تعين عدد الكتم (.*)$") and Manager(msg) and database:get(bot_id.."kt:twh:stats"..msg.chat_id_) == "open" then
local nump = text:match("^تعين عدد الكتم (.*)$")
send(msg.chat_id_, msg.id_,'•تم تعين  '..nump..' عدد الكتم')
database:set(bot_id.."MODEDEV:nump"..msg.chat_id_,nump)
end
if text == "التوحيد" then
local s1 = database:get(bot_id.."MODEDEV:teh"..msg.chat_id_) or "لا يوجد توحيد"
local s2 = database:get(bot_id.."MODEDEV:nump"..msg.chat_id_) or 5
send(msg.chat_id_, msg.id_,'•التوحيد هو '..s1..'\n • عدد الكتم هو : '..s2)
end
end
if text == "تفعيل التوحيد" and Constructor(msg) and database:get(bot_id.."AL:Sre:stats") == "✔" then
send(msg.chat_id_, msg.id_, '•تم تفعيل التوحيد')
database:set(bot_id.."kt:twh:stats"..msg.chat_id_,"open")
end
if text == "تعطيل التوحيد" and Constructor(msg) and database:get(bot_id.."AL:Sre:stats") == "✔" then
send(msg.chat_id_, msg.id_, '•تم تعطيل التوحيد')
database:set(bot_id.."kt:twh:stats"..msg.chat_id_,"close")
end
if not Constructor(msg) then
if database:get(bot_id.."kt:twh:stats"..msg.chat_id_) == "open"  and database:get(bot_id.."MODEDEV:teh"..msg.chat_id_) then 
id = msg.sender_user_id_
function keko_tsahke_new(tshake1,tshake2)
if tshake2 and tshake2.first_name_ then 
if tshake2.first_name_:match("(.*)"..database:get(bot_id.."MODEDEV:teh"..msg.chat_id_).."(.*)") then 
database:srem(bot_id.."MODEDEV:Muted:User"..msg.chat_id_, msg.sender_user_id_)
else
local tshake_nnn = database:get(bot_id.."MODEDEV:nump"..msg.chat_id_) or 5
local tshake_nnn2 = database:get(bot_id.."MODEDEV:nump22"..msg.chat_id_..msg.sender_user_id_) or 0
if (tonumber(tshake_nnn2) == tonumber(tshake_nnn) or tonumber(tshake_nnn2) > tonumber(tshake_nnn)) then 
database:sadd(bot_id..'Muted:User'..msg.chat_id_, msg.sender_user_id_)
else 
database:incrby(bot_id.."MODEDEV:nump22"..msg.chat_id_..msg.sender_user_id_,1)
send(msg.chat_id_, msg.id_, "•عزيزي >>["..tshake2.username_.."](https://t.me/"..(tshake2.username_ or "UU_KFUF")..")\n•عليك وضع التوحيد ⪼ {`"..database:get(bot_id.."MODEDEV:teh"..msg.chat_id_).."`} بجانب اسمك\n•عدد المحاولات المتبقيه {"..(tonumber(tshake_nnn) - tonumber(tshake_nnn2)).."}")
end
end
end
end
bnnaGet(id, keko_tsahke_new)
end
end
if text == "تفعيل تنبيه الاسماء" and Manager(msg) and database:get(bot_id.."AL:Sre:stats") == "✔" then
send(msg.chat_id_, msg.id_, '•تم تفعيل تنبيه الاسماء')
database:set(bot_id.."Ttn:BBE:stats"..msg.chat_id_,"open")
end
if text == "تعطيل تنبيه الاسماء" and Manager(msg) and database:get(bot_id.."AL:Sre:stats") == "✔" then
send(msg.chat_id_, msg.id_, '•تم تعطيل تنبيه الاسماء')
database:set(bot_id.."Ttn:BBE:stats"..msg.chat_id_,"close")
end
if text and database:get(bot_id.."Ttn:BBE:stats"..msg.chat_id_) == "open" then 
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data)
if data.id_ then 
if data.id_ ~= bot_id then
local MODEDEVChengName = database:get(bot_id.."MODEDEV:Cheng:Name"..data.id_)
if not data.first_name_ then 
if MODEDEVChengName then 
send(msg.chat_id_, msg.id_, " خوش معرف جان ["..MODEDEVChengName..']')
database:del(bot_id.."MODEDEV:Cheng:Name"..data.id_) 
end
end
if data.first_name_ then 
if MODEDEVChengName ~= data.first_name_ then 
local Text = {
  "جان اسمك خوش اسم ",
"ليش غيرت اسمك يحلو ",
"هذا لحلو غير اسمه ",
}
send(msg.chat_id_, msg.id_,Text[math.random(#Text)])
end  
database:set(bot_id.."MODEDEV:Cheng:Name"..data.id_, data.first_name_) 
end
end
end
end,nil)   
end
if text == "تفعيل تنبيه المعرف" and Constructor(msg) and database:get(bot_id.."AL:Sre:stats") == "✔" then
send(msg.chat_id_, msg.id_, '•تم تفعيل تنبيه المعرف')
database:set(bot_id.."Ttn:Userr:stats"..msg.chat_id_,"open")
end
if text == "تعطيل تنبيه المعرف" and Constructor(msg) and database:get(bot_id.."AL:Sre:stats") == "✔" then
send(msg.chat_id_, msg.id_, '•تم تعطيل تنبيه المعرف')
database:set(bot_id.."Ttn:Userr:stats"..msg.chat_id_,"close")
end
if text and database:get(bot_id.."Ttn:Userr:stats"..msg.chat_id_) == "open" then  
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data)
if data.id_ then 
if data.id_ ~= bot_id then
local MODEDEVChengUserName = database:get(bot_id.."MODEDEV:Cheng:UserName"..data.id_)
if not data.username_ then 
if MODEDEVChengUserName then 
send(msg.chat_id_, msg.id_, 1, "هذا الشخص حذف معرفه      \n هاذه معرفه  : [@"..MODEDEVChengUserName..']')
database:del(bot_id.."MODEDEV:Cheng:UserName"..data.id_) 
end
end
if data.username_ then 
if MODEDEVChengUserName ~= data.username_ then 
local Text = {
' ايه دا غيرت معرفك ليه🌞😹😹😹',
"هددوك ولا اي مغير معرفك ؟😂😂",
" ليه غيرت معرفك 😐🌝",
'ليه مغير معرفك يقلبي💌', 
"منور معرف جديد : "..data.username_.."",
}
send(msg.chat_id_, msg.id_,Text[math.random(#Text)])
end  
database:set(bot_id.."MODEDEV:Cheng:UserName"..data.id_, data.username_) 
end
end
end
end,nil)   
end
if text == "تفعيل تنبيه الصور" and Manager(msg) and database:get(bot_id.."AL:Sre:stats") == "✔" then
send(msg.chat_id_, msg.id_, '•تم تفعيل تنبيه الصور')
database:set(bot_id.."Ttn:Ph:stats"..msg.chat_id_,"open")
end
if text == "تعطيل تنبيه الصور" and Manager(msg) and database:get(bot_id.."AL:Sre:stats") == "✔" then
send(msg.chat_id_, msg.id_, '•تم تعطيل تنبيه الصور')
database:set(bot_id.."Ttn:Ph:stats"..msg.chat_id_,"close")
end
if text and database:get(bot_id.."Ttn:Ph:stats"..msg.chat_id_) == "open" then  
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data)
if data.id_ then 
if data.id_ ~= bot_id then 
local MODEDEVChengPhoto = database:get(bot_id.."MODEDEV:Cheng:Photo"..data.id_)
if not data.profile_photo_ then 
if MODEDEVChengPhoto then 
send(msg.chat_id_, msg.id_, "حذف كل صوره الحلو 😂👌🏻")
database:del(bot_id.."MODEDEV:Cheng:Photo"..data.id_) 
end
end
if data.profile_photo_.big_.persistent_id_ then 
if MODEDEVChengPhoto ~= data.profile_photo_.big_.persistent_id_ then 
local Text = {
  "ايه الصوره القمر دي ",
  "صورتك الجديده جميله ❄️",
  "غيرت صورتك في كراش ولا ايه؟ 🤔😹",
  "الصوره الجديده جامده😹😹🌚",
  " غيرت صورتك يعني اتشاكلت مع الحب ؟😹🌞",
}
send(msg.chat_id_, msg.id_,Text[math.random(#Text)])
end  
database:set(bot_id.."MODEDEV:Cheng:Photo"..data.id_, data.profile_photo_.big_.persistent_id_) 
end
end
end
end,nil)   
end

if text == 'السورس' or text == 'سورس' or text == 'ياسورس' or text == 'يا سورس' then
local Text =[[
مرحبا بك في سورس بلاك
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'قناة السورس', url="t.me/UU_KFUF"},
},
{
{text = 'مطور السورس', url="t.me/UUOUOU_7"},
},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end

if text == 'م1' or text == 'م2' or text == 'م3' or text == 'م4' or text == 'م5' then
Text = [[
اهلا عزيزي
لايوجد هاكذا اوامر في البوت
اكتب `الاوامر` وتحكم في الكيبورد بالاسفل
]]
send(msg.chat_id_, msg.id_,Text)
return false
end
--------------------------------------------------------------------------------------------------------------
if Chat_Type == 'GroupBot' and ChekAdd(msg.chat_id_) == true then
if text == 'رفع خزن البوت' and SudoBot(msg) then   
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•قناة الاشتراك ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if tonumber(msg.reply_to_message_id_) > 0 then
function by_reply(extra, result, success)   
if result.content_.document_ then 
local ID_FILE = result.content_.document_.document_.persistent_id_ 
local File_Name = result.content_.document_.file_name_
AddFile_Bot(msg,msg.chat_id_,ID_FILE,File_Name)
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text == 'جلب خزن البوت' and SudoBot(msg) then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•قناة الاشتراك ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
GetFile_Bot(msg)
end
if text == 'الاوامر المضافه' and Constructor(msg) then
local list = database:smembers(bot_id..'List:Cmd:Group:New'..msg.chat_id_..'')
t = "• قائمه الاوامر المضافه  \n*܀⠤⠤⠤⠤⠤⠤܀ٴ*\n"
for k,v in pairs(list) do
Cmds = database:get(bot_id.."Set:Cmd:Group:New1"..msg.chat_id_..':'..v)
print(Cmds)
if Cmds then 
t = t.."•"..k.."• >  ("..v..") > {"..Cmds.."}\n"
else
end
end
if #list == 0 then
t = "• لا يوجد اوامر مضافه"
end
send(msg.chat_id_, msg.id_,'['..t..']')
end
if text == 'حذف الاوامر المضافه' or text == 'مسح الاوامر المضافه' then
if Constructor(msg) then 
local list = database:smembers(bot_id..'List:Cmd:Group:New'..msg.chat_id_)
for k,v in pairs(list) do
database:del(bot_id.."Set:Cmd:Group:New1"..msg.chat_id_..':'..v)
database:del(bot_id..'List:Cmd:Group:New'..msg.chat_id_)
end
send(msg.chat_id_, msg.id_,' تم ازالة جميع الاوامر المضافه')  
end
end
if text == 'اضف امر' and Constructor(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•قناة الاشتراك ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id.."Set:Cmd:Group"..msg.chat_id_..':'..msg.sender_user_id_,'true') 
send(msg.chat_id_, msg.id_,'• ارسل الامر القديم')  
return false
end
if text == 'حذف امر' or text == 'مسح امر' then 
if Constructor(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•قناة الاشتراك ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id.."Del:Cmd:Group"..msg.chat_id_..':'..msg.sender_user_id_,'true') 
send(msg.chat_id_, msg.id_,'• ارسل الامر الذي قمت بوضعه بدلا عن القديم')  
return false
end
end
if text and database:get(bot_id.."Set:Cmd:Group"..msg.chat_id_..':'..msg.sender_user_id_) == 'true' then
database:set(bot_id.."Set:Cmd:Group:New"..msg.chat_id_,text)
send(msg.chat_id_, msg.id_,'• ارسل الامر الجديد')  
database:del(bot_id.."Set:Cmd:Group"..msg.chat_id_..':'..msg.sender_user_id_)
database:set(bot_id.."Set:Cmd:Group1"..msg.chat_id_..':'..msg.sender_user_id_,'true1') 
return false
end
if text and database:get(bot_id.."Set:Cmd:Group1"..msg.chat_id_..':'..msg.sender_user_id_) == 'true1' then
local NewCmd = database:get(bot_id.."Set:Cmd:Group:New"..msg.chat_id_)
database:set(bot_id.."Set:Cmd:Group:New1"..msg.chat_id_..':'..text,NewCmd)
database:sadd(bot_id.."List:Cmd:Group:New"..msg.chat_id_,text)
send(msg.chat_id_, msg.id_,' تم حفظ الامر')  
database:del(bot_id.."Set:Cmd:Group1"..msg.chat_id_..':'..msg.sender_user_id_)
return false
end
if text == 'السيرفر' and SudoBot(msg) then 
send(msg.chat_id_, msg.id_, io.popen([[
linux_version=`lsb_release -ds`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`
echo '• { نظام التشغيل } •\n*>> '"$linux_version"'*' 
echo '*•━━━━━━━━━•*\n•{ الذاكره العشوائيه }•\n*>> '"$memUsedPrc"'*'
echo '*•━━━━━━━━━•*\n•{ وحـده الـتـخـزيـن }•\n*>> '"$HardDisk"'*'
echo '*•━━━━━━━━━•*\n•{ الـمــعــالــج }•\n*>> '"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "'*'
echo '*•━━━━━━━━━•*\n•{ الــدخــول }•\n*>> '`whoami`'*'
echo '*•━━━━━━━━━•*\n•{ مـده تـشغيـل الـسـيـرفـر }\n*>> '"$uptime"'*'
]]):read('*all'))  
end
------------------------------------------------------------------------------------------------------------
if text == 'جوكر' or text == 'محمد' or text == 'محمد حسن' or text == 'Joker' then
local Text =[[
مطور السورس . يمكنك التواصل معه عن طريق معرفه
]]
keyboard = {} 
keyboard.inline_keyboard = {

{
{text = 'JOKER', url="t.me/UUOUOU_7"},
},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end



if text == 'العاب متطوره' or text == 'العاب بلاك' or text == 'الالعاب المتطوره' or text == 'العاب السورس' then
local Text =[[
𝘨𝘢𝘮𝘦𝘴 𝘱𝘳𝘰 ○'
𝘞𝘦 𝘢𝘭𝘸𝘢𝘺𝘴 𝘸𝘢𝘯𝘵 𝘵𝘰 𝘱𝘭𝘦𝘢𝘴𝘦 𝘺𝘰𝘶 ●  
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = ' ● فلابي بيرد', url="t.me/awesomebot?game=FlappyBird"},{text = ' ● تحداني في الرياضيات', url="t.me/gamebot?game=MathBattle"}
},
{
{text = ' ● سباق درجات', url="t.me/gamee?game=MotoFX"},{text = ' ● سباق سيارات', url="t.me/gamee?game=F1Racer"}
},
{
{text = ' ● متشابه', url="t.me/gamee?game=DiamondRows"},{text = ' ● كرة القدم', url="t.me/gamee?game=FootballStar"}
},
{
{text = ' ● ورق', url="t.me/gamee?game=Hexonix"},{text = ' ● 2048', url="https://t.me/awesomebot?game=g2048"}
},
{
{text = ' ● Squares', url="t.me/gamee?game=Squares"},{text = ' ● Atomic ', url="t.me/gamee?game=AtomicDrop1"}
},
{
{text = ' ● Corsairs', url="t.me/gamebot?game=Corsairs"},{text = ' ● LumberJack ', url="t.me/gamebot?game=LumberJack"}
},
{
{text = ' ● LittlePlane', url="t.me/gamee?game=LittlePlane"},{text = ' ● RollerDisco ', url="t.me/gamee?game=RollerDisco"}
},
{
{text = 'مطور السـورس', url="t.me/UUOUOU_7"},
},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
------------------------------------------------------------------------------------------------------------

function sendVoicebot(chat_id,reply_id,voice,caption,func)
pcall(tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageVoice",
voice_ = GetInputFile(voice),
duration_ = "",
waveform_ = "",
caption_ = caption or ""
}},func or dl_cb,nil))
end
function sendAudiobot(chat_id,reply_id,audio,title,caption,performer,func)
pcall(tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageAudio",
audio_ = GetInputFile(audio),
duration_ = "",
title_ = title or "",
performer_ = performer or "",
caption_ = caption or ""
}},func or dl_cb,nil))
end
function download(url, file_path) 
local respbody = {} 
local options = { url = url, sink = ltn12.sink.table(respbody), redirect = true } 
local response = nil 
options.redirect = false 
response = {http.request(options)} 
local code = response[2] 
local headers = response[3] 
local status = response[4] 
if code ~= 200 then return false, code 
end 
file = io.open(file_path, "w+") 
file:write(table.concat(respbody)) 
file:close() 
return './'..file_path 
end



------------------------------------------------------------------------------------------------------------
if text == 'قفل الدردشه' and msg.reply_to_message_id_ == 0 and Manager(msg) then 
database:set(bot_id.."lock:text"..msg.chat_id_,true) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*•تم قفـل الدردشه*\n')  
end,nil)   
elseif text == 'قفل الاضافه' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
database:set(bot_id.."lock:AddMempar"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*•تم قفـل الاضافه*\n')  
end,nil)   
elseif text == 'قفل الدخول' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
database:set(bot_id.."lock:Join"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*•تم قفـل الدخول*\n')  
end,nil)   
elseif text == 'قفل البوتات' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
database:set(bot_id.."lock:Bot:kick"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*•تم قفـل البوتات*\n')  
end,nil)   
elseif text == 'قفل البوتات بالطرد' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
database:set(bot_id.."lock:Bot:kick"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*•تم قفـل البوتات بالطرد*\n')  
end,nil)   
elseif text == 'قفل الاشعارات' and msg.reply_to_message_id_ == 0 and Mod(msg) then  
database:set(bot_id..'lock:tagservr'..msg.chat_id_,true)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*•تم قفـل الاشعارات*\n')  
end,nil)   
elseif text == 'قفل التثبيت' and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
database:set(bot_id.."lockpin"..msg.chat_id_, true) 
database:sadd(bot_id..'lock:pin',msg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*•تم قفـل التثبيت*\n')  
end,nil)   
elseif text == 'قفل التعديل' and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
database:set(bot_id..'lock:edit'..msg.chat_id_,true) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*•تم قفـل التعديل*\n')  
end,nil)   
elseif text == 'قفل السب' and msg.reply_to_message_id_ == 0 and Manager(msg) then 
database:set(bot_id..'lock:Fshar'..msg.chat_id_,true) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*•تم قفـل السب*\n')  
end,nil)   
elseif text == 'قفل الازعاج' and msg.reply_to_message_id_ == 0 and Manager(msg) then 
database:set(bot_id..'lock:Ansore'..msg.chat_id_,true) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*•تم قفـل الازعاج*\n')  
end,nil)   
elseif text == 'قفل الفارسيه' and msg.reply_to_message_id_ == 0 and Manager(msg) then 
database:set(bot_id..'lock:Fars'..msg.chat_id_,true) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*•تم قفـل الفارسيه*\n')  
end,nil)   
elseif text == 'قفل الانلاين' and msg.reply_to_message_id_ == 0 and Manager(msg) then 
database:set(bot_id.."lock:inline"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*•تم قفـل الانلاين*\n')  
end,nil)   
elseif text == 'قفل تعديل الميديا' and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
database:set(bot_id..'lock_edit_med'..msg.chat_id_,true) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*•تم قفـل تعطيل الميديا*\n')  
end,nil)   
elseif text == 'قفل الكل' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
database:set(bot_id..'lock:tagservrbot'..msg.chat_id_,true)   
list ={"lock:Bot:kick","lock:user:name","lock:hashtak","lock:Cmd","lock:Link","lock:forward","lock:Keyboard","lock:geam","lock:Photo","lock:Animation","lock:Video","lock:Audio","lock:vico","lock:Sticker","lock:Document","lock:Unsupported","lock:Markdaun","lock:Contact","lock:Spam"}
for i,lock in pairs(list) do 
database:set(bot_id..lock..msg.chat_id_,'del')    
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*•تم قفـل جميع الاوامر*\n')  
end,nil)   
end
if text == 'فتح الانلاين' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
database:del(bot_id.."lock:inline"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*•تم فتح الانلاين*\n')  
end,nil)   
elseif text == 'فتح الاضافه' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
database:del(bot_id.."lock:AddMempar"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*•تم فتح الاضافه*\n')  
end,nil)   
elseif text == 'فتح الدردشه' and msg.reply_to_message_id_ == 0 and Manager(msg) then 
database:del(bot_id.."lock:text"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*•تم فتح الدردشه*\n')  
end,nil)   
elseif text == 'فتح الدخول' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
database:del(bot_id.."lock:Join"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*•تم فتح الدخول*\n')  
end,nil)   
elseif text == 'فتح البوتات' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
database:del(bot_id.."lock:Bot:kick"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*•تم فتح البوتات*\n')  
end,nil)   
elseif text == 'فتح البوتات بالطرد' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
database:del(bot_id.."lock:Bot:kick"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*•تم فتح البوتات بالطرد*\n')  
end,nil)   
elseif text == 'فتح الاشعارات' and msg.reply_to_message_id_ == 0 and Mod(msg) then  
database:del(bot_id..'lock:tagservr'..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*•تم فتح الاشعارات*\n')  
end,nil)   
elseif text == 'فتح التثبيت' and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
database:del(bot_id.."lockpin"..msg.chat_id_)  
database:srem(bot_id..'lock:pin',msg.chat_id_)
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*•تم فتح التثبيت*\n')  
end,nil)   
elseif text == 'فتح التعديل' and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
database:del(bot_id..'lock:edit'..msg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*•تم فتح التثبيت*\n')  
end,nil)   
elseif text == 'فتح السب' and msg.reply_to_message_id_ == 0 and Manager(msg) then 
database:del(bot_id..'lock:Fshar'..msg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*•تم فتح السب*\n')  
end,nil)   
elseif text == 'فتح الازعاج' and msg.reply_to_message_id_ == 0 and Manager(msg) then 
database:del(bot_id..'lock:Azag'..msg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*•تم فتح الازعاج*\n')  
end,nil)   
elseif text == 'فتح الفارسيه' and msg.reply_to_message_id_ == 0 and Manager(msg) then 
database:del(bot_id..'lock:Fshar'..msg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*•تم فتح الفارسيه*\n')  
end,nil)   
elseif text == 'فتح تعديل الميديا' and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
database:del(bot_id..'lock_edit_med'..msg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*•تم فتح تعديل الميديا*\n')  
end,nil)   
elseif text == 'فتح الكل' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
database:del(bot_id..'lock:tagservrbot'..msg.chat_id_)   
list ={"lock:Bot:kick","lock:user:name","lock:hashtak","lock:Cmd","lock:Link","lock:forward","lock:Keyboard","lock:geam","lock:Photo","lock:Animation","lock:Video","lock:Audio","lock:vico","lock:Sticker","lock:Document","lock:Unsupported","lock:Markdaun","lock:Contact","lock:Spam"}
for i,lock in pairs(list) do 
database:del(bot_id..lock..msg.chat_id_)    
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*•تم فتح الكل*\n')  
end,nil)   
end
if text == 'قفل الروابط' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Link"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الروابط*\n')  
end,nil)   
elseif text == 'قفل الروابط بالتقيد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Link"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الروابط بالتقيد*\n')  
end,nil)   
elseif text == 'قفل الروابط بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Link"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الروابط بالكتم*\n')  
end,nil)   
elseif text == 'قفل الروابط بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Link"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الروابط بالطرد*\n')  
end,nil)   
elseif text == 'فتح الروابط' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Link"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم فتح الروابط*\n')  
end,nil)   
end
if text == 'قفل المعرفات' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:user:name"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل المعرفات*\n')  
end,nil)   
elseif text == 'قفل المعرفات بالتقيد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:user:name"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل المعرفات بالتقيد*\n')  
end,nil)   
elseif text == 'قفل المعرفات بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:user:name"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل المعرفات بالكتم*\n')  
end,nil)   
elseif text == 'قفل المعرفات بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:user:name"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل المعرفات بالطرد*\n')  
end,nil)   
elseif text == 'فتح المعرفات' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:user:name"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم فتح المعرفات*\n')  
end,nil)   
end
if text == 'قفل التاك' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:hashtak"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل التاك*\n')  
end,nil)   
elseif text == 'قفل التاك بالتقيد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:hashtak"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل التاك بالتقيد*\n')  
end,nil)   
elseif text == 'قفل التاك بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:hashtak"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل التاك بالكتم*\n•*الحاله >الكتم*')  
end,nil)   
elseif text == 'قفل التاك بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:hashtak"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل التاك بالطرد\n•*الحاله >الطرد*')  
end,nil)   
elseif text == 'فتح التاك' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:hashtak"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم فتح التاك*\n')  
end,nil)   
end
if text == 'قفل الشارحه' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Cmd"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*•تم قفل الشارحه*\n')  
end,nil)
elseif text == 'قفل الشارحه بالتقيد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Cmd"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الشارحه بالتقيد*\n')  
end,nil) 
elseif text == 'قفل الشارحه بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Cmd"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفل الشارحه بالكتم*\n')  
end,nil)   
elseif text == 'قفل الشارحه بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Cmd"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الشارحه بالطرد*\n')  
end,nil)   
elseif text == 'فتح الشارحه' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Cmd"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم فتح الشارحه*\n')  
end,nil)   
end
if text == 'قفل الصور' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Photo"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الصور*\n')  
end,nil)   
elseif text == 'قفل الصور بالتقيد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Photo"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الصور بالتقيد*\n')  
end,nil)   
elseif text == 'قفل الصور بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Photo"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الصور بالكتم*\n')  
end,nil)   
elseif text == 'قفل الصور بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Photo"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الصور بالطرد*\n')  
end,nil)   
elseif text == 'فتح الصور' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Photo"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم فتح الصور*\n')  
end,nil)   
end
if text == 'قفل الفيديو' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Video"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الفيديو*\n')  
end,nil)   
elseif text == 'قفل الفيديو بالتقيد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Video"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الفيديو بالتقيد*\n')  
end,nil)   
elseif text == 'قفل الفيديو بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Video"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الفيديو بالكتم*\n')  
end,nil)   
elseif text == 'قفل الفيديو بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Video"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الفيديو بالطرد*\n')  
end,nil)   
elseif text == 'فتح الفيديو' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Video"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم فتح الفيديو*\n')  
end,nil)   
end
if text == 'قفل المتحركه' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Animation"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل المتحركه*\n')  
end,nil)   
elseif text == 'قفل المتحركه بالتقيد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Animation"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل المتحركه بالتقيد*\n')  
end,nil)   
elseif text == 'قفل المتحركه بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Animation"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل المتحركه بالكتم*\n')  
end,nil)   
elseif text == 'قفل المتحركه بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Animation"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل المتحركه بالطرد*\n')  
end,nil)   
elseif text == 'فتح المتحركه' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Animation"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم فتح المتحركه*\n')  
end,nil)   
end
if text == 'قفل الالعاب' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:geam"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' بواسطه > ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الالعاب*\n')  
end,nil)   
elseif text == 'قفل الالعاب بالتقيد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:geam"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الالعاب بالتقيد*\n')  
end,nil)   
elseif text == 'قفل الالعاب بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:geam"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الالعاب بالكتم*\n')  
end,nil)   
elseif text == 'قفل الالعاب بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:geam"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الالعاب بالطرد*\n')  
end,nil)   
elseif text == 'فتح الالعاب' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:geam"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' بواسطه > ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم فتح الالعاب*\n')  
end,nil)   
end
if text == 'قفل الاغاني' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Audio"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' بواسطه > ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الاغاني*\n')  
end,nil)   
elseif text == 'قفل الاغاني بالتقيد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Audio"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الاغاني بالتقيد*\n')  
end,nil)   
elseif text == 'قفل الاغاني بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Audio"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الاغاني بالكتم\n')  
end,nil)   
elseif text == 'قفل الاغاني بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Audio"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الاغاني بالطرد\n')  
end,nil)   
elseif text == 'فتح الاغاني' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Audio"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم فتح الاغاني*\n')  
end,nil)   
end
if text == 'قفل الصوت' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:vico"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الصوت*\n')  
end,nil)   
elseif text == 'قفل الصوت بالتقيد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:vico"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الصوت بالتقيد*\n')  
end,nil)   
elseif text == 'قفل الصوت بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:vico"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الصوت بالكتم*\n')  
end,nil)   
elseif text == 'قفل الصوت بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:vico"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الصوت بالطرد*\n')  
end,nil)   
elseif text == 'فتح الصوت' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:vico"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم فتح الصوت*\n')  
end,nil)   
end
if text == 'قفل الكيبورد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Keyboard"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الكيبورد*\n')  
end,nil)   
elseif text == 'قفل الكيبورد بالتقيد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Keyboard"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الكيبورد بالتقيد*\n')  
end,nil)   
elseif text == 'قفل الكيبورد بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Keyboard"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الكيبورد بالكتم*\n')  
end,nil)   
elseif text == 'قفل الكيبورد بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Keyboard"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الكيبورد بالطرد*\n')  
end,nil)   
elseif text == 'فتح الكيبورد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Keyboard"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم فتح الكيبورد*\n')  
end,nil)   
end
if text == 'قفل الملصقات' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Sticker"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الملصقات*\n')  
end,nil)   
elseif text == 'قفل الملصقات بالتقيد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Sticker"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الملصقات بالتقيد*\n')  
end,nil)   
elseif text == 'قفل الملصقات بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Sticker"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الملصقات بالكتم*\n')  
end,nil)   
elseif text == 'قفل الملصقات بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Sticker"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الملصقات بالطرد*\n')  
end,nil)   
elseif text == 'فتح الملصقات' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Sticker"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم فتح الملصقات*\n')  
end,nil)   
end
if text == 'قفل التوجيه' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:forward"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل التوجيه*\n')  
end,nil)   
elseif text == 'قفل التوجيه بالتقيد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:forward"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل التوجيه بالتقيد*\n')  
end,nil)   
elseif text == 'قفل التوجيه بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:forward"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل التوجيه بالكتم*\n')  
end,nil)   
elseif text == 'قفل التوجيه بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:forward"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل التوجيه بالطرد*\n')  
end,nil)   
elseif text == 'فتح التوجيه' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:forward"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم فتح التوجيه*\n')  
end,nil)   
end
if text == 'قفل الملفات' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Document"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' بواسطه > ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الملفات*\n')  
end,nil)   
elseif text == 'قفل الملفات بالتقيد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Document"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الملفات بالتقيد*\n')  
end,nil)   
elseif text == 'قفل الملفات بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Document"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الملفات بالكتم*\n')  
end,nil)   
elseif text == 'قفل الملفات بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Document"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الملفات بالطرد*\n')  
end,nil)   
elseif text == 'فتح الملفات' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Document"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,' بواسطه > ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم فتح الملفات*\n')  
end,nil)   
end
if text == 'قفل السيلفي' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Unsupported"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل السيلفي*\n')  
end,nil)   
elseif text == 'قفل السيلفي بالتقيد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Unsupported"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل السيلفي بالتقيد*\n')  
end,nil)   
elseif text == 'قفل السيلفي بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Unsupported"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل السيلفي بالكتم*\n')  
end,nil)   
elseif text == 'قفل السيلفي بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Unsupported"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل السيلفي بالطرد\n')  
end,nil)   
elseif text == 'فتح السيلفي' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Unsupported"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم فتح السيلفي*\n')  
end,nil)   
end
if text == 'قفل الماركداون' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Markdaun"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الماركداون*\n')  
end,nil)   
elseif text == 'قفل الماركداون بالتقيد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Markdaun"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الماركداون بالتقيد*\n')  
end,nil)   
elseif text == 'قفل الماركداون بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Markdaun"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الماركداون بالكتم*\n')  
end,nil)   
elseif text == 'قفل الماركداون بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Markdaun"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الماركداون بالطرد*\n')  
end,nil)   
elseif text == 'فتح الماركداون' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Markdaun"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم فتح الماركداون*\n')  
end,nil)   
end
if text == 'قفل الجهات' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Contact"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الجهات*\n')  
end,nil)   
elseif text == 'قفل الجهات بالتقيد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Contact"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الجهات*\n')  
end,nil)   
elseif text == 'قفل الجهات بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Contact"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الجهات بالكتم*\n')  
end,nil)   
elseif text == 'قفل الجهات بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Contact"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الجهات بالطرد*\n')  
end,nil)   
elseif text == 'فتح الجهات' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Contact"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم فتح الجهات*\n')  
end,nil)   
end
if text == 'قفل الكلايش' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Spam"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الكلايش*\n')  
end,nil)   
elseif text == 'قفل الكلايش بالتقيد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Spam"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الكلايش بالتقيد\n•*الحاله >التقيد*')  
end,nil)   
elseif text == 'قفل الكلايش بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Spam"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الكلايش بالكتم\n•*الحاله >الكتم')  
end,nil)   
elseif text == 'قفل الكلايش بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Spam"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم قفـل الكلايش بالطرد*\n•*الحاله >الطرد*')  
end,nil)   
elseif text == 'فتح الكلايش' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Spam"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..')\n*• الاسم >* ['..utf8.sub(data.first_name_,0,15)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم فتح الكلايش*\n')  
end,nil)   
end
if text == 'قفل التكرار بالطرد' and Mod(msg) then 
database:hset(bot_id.."flooding:settings:"..msg.chat_id_ ,"flood",'kick')  
send(msg.chat_id_, msg.id_,'*تم قفل التكرار بالطرد*\n•*الحاله >الطرد*')
elseif text == 'قفل التكرار' and Mod(msg) then 
database:hset(bot_id.."flooding:settings:"..msg.chat_id_ ,"flood",'del')  
send(msg.chat_id_, msg.id_,'*تم قفل التكرار*\n')
elseif text == 'قفل التكرار بالتقيد' and Mod(msg) then 
database:hset(bot_id.."flooding:settings:"..msg.chat_id_ ,"flood",'keed')  
send(msg.chat_id_, msg.id_,'*تم قفل التكرار بالتقيد*\n•*الحاله >التقيد*')
elseif text == 'قفل التكرار بالكتم' and Mod(msg) then 
database:hset(bot_id.."flooding:settings:"..msg.chat_id_ ,"flood",'mute')  
send(msg.chat_id_, msg.id_,'*تم قفل التكرار بالكتم*\n')
elseif text == 'فتح التكرار' and Mod(msg) then 
database:hdel(bot_id.."flooding:settings:"..msg.chat_id_ ,"flood")  
send(msg.chat_id_, msg.id_,'*تم فتح التكرار*')
end 
if text == 'فتح السوبر' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
database:del(bot_id..'lock:tajkervrbot'..msg.chat_id_)   
list ={"lock:hashtak","lock:user:name","lock:Spam","lock:forward","lock:Cmd","lock:text","lock:Fshar","lock:Azag","lock:edit","lock:inline","lock:forward","lock:Keyboard"}
for i,lock in pairs(list) do 
database:del(bot_id..lock..msg.chat_id_)    
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم فتح السوبر*\n')  
end,nil)   
end
if text == 'قفل السوبر' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
database:set(bot_id..'lock:tajkervrbot'..msg.chat_id_,true)   
list ={"lock:Bot:kick","lock:user:name","lock:hashtak","lock:Cmd","lock:Link","lock:forward","lock:Keyboard","lock:geam","lock:Photo","lock:Animation","lock:Video","lock:Audio","lock:vico","lock:Sticker","lock:Document","lock:Unsupported","lock:Markdaun","lock:Contact","lock:Spam"}
for i,lock in pairs(list) do 
database:set(bot_id..lock..msg.chat_id_,'del')    
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'*• الرتبه >* ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n*تم فتح السوبر*\n')  
end,nil)   
end
--------------------------------------------------------------------------------------------------------------
if text == 'تحديث' and SudoBot(msg) then    
dofile('MODEDEV.lua')  
send(msg.chat_id_, msg.id_, '•  تم تحديث الملفات') 
end 
if text == ("مسح قائمه العام") and SudoBot(msg) then
database:del(bot_id..'GBan:User')
send(msg.chat_id_, msg.id_, '\n• تم مسح قائمه العام')
return false
end
if text == ("قائمة العام") and SudoBot(msg) then
local list = database:smembers(bot_id..'GBan:User')
t = "\n• قائمة المحظورين عام \n━━━━━━━━━━━\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t.."*︙"..k.."︙> [@"..username.."]•\n*"
else
end
end
if #list == 0 then
t = "• لا يوجد محظورين عام"
end
send(msg.chat_id_, msg.id_, t)
return false
end
if text == ("حظر عام") and msg.reply_to_message_id_ and SudoBot(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•قناة الاشتراك ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.sender_user_id_ == tonumber(SUDO) then
send(msg.chat_id_, msg.id_, "• لا يمكنك حظر المطور الاساسي \n")
return false 
end
if result.sender_user_id_ == tonumber(1765160742) then
send(msg.chat_id_, msg.id_, "•لا يمكنك حظر مبرمج السورس \n")
return false 
end
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
send(msg.chat_id_, msg.id_, " لا تسطيع حظر البوت عام")
return false 
end
database:sadd(bot_id..'GBan:User', result.sender_user_id_)
chat_kick(result.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},
function(arg,data) 
usertext = '\n•> العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') ~'
status  = '\n تم حظره عام من المجموعات'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^حظر عام @(.*)$")  and SudoBot(msg) then
local username = text:match("^حظر عام @(.*)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•قناة الاشتراك ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"• عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
if tonumber(result.id_) == tonumber(bot_id) then  
send(msg.chat_id_, msg.id_, "• لا تسطيع حظر البوت عام")
return false 
end
if result.id_ == tonumber(SUDO) then
send(msg.chat_id_, msg.id_, "• لا يمكنك حظر المطور الاساسي \n")
return false 
end
if result.id_ == tonumber(1765160742) then
send(msg.chat_id_, msg.id_, "•  لا يمكنك حظر مبرمج السورس \n")
return false 
end
usertext = '\n•العضو > ['..result.title_..'](t.me/'..(username or 'UU_KFUF')..')'
status  = '\n تم حظره عام من المجموعات'
texts = usertext..status
database:sadd(bot_id..'GBan:User', result.id_)
else
texts = '• لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^حظر عام (%d+)$") and SudoBot(msg) then
local userid = text:match("^حظر عام (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•قناة الاشتراك ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if userid == tonumber(SUDO) then
send(msg.chat_id_, msg.id_, "• لا يمكنك حظر المطور الاساسي \n")
return false 
end
if result.id_ == tonumber(1765160742) then
send(msg.chat_id_, msg.id_, "•  لا يمكنك حظر مبرمج السورس \n")
return false 
end
if tonumber(userid) == tonumber(bot_id) then  
send(msg.chat_id_, msg.id_, "•لا تسطيع حظر البوت عام")
return false 
end
database:sadd(bot_id..'GBan:User', userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') ~'
status  = '\n تم حظره عام من المجموعات'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n •  العضو > '..userid..''
status  = '\n تم حظره عام من المجموعات'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
if text == ("كتم عام") and msg.reply_to_message_id_ and SudoBot(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•قناة الاشتراك ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.sender_user_id_ == tonumber(SUDO) then
send(msg.chat_id_, msg.id_, "• لا يمكنك الاساسي \n")
return false 
end
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
send(msg.chat_id_, msg.id_, " لا تسطيع كتم البوت عام")
return false 
end
if result.sender_user_id_ == tonumber(1765160742) then
send(msg.chat_id_, msg.id_, "•لا يمكنك كتم مطور  السورس \n")
return false 
end
database:sadd(bot_id..'Gmute:User', result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},
function(arg,data) 
usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '
status  = '\n تم كتمه عام من المجموعات'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^كتم عام @(.*)$")  and SudoBot(msg) then
local username = text:match("^كتم عام @(.*)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•قناة الاشتراك ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"• عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
if tonumber(result.id_) == tonumber(bot_id) then  
send(msg.chat_id_, msg.id_, "• لا تسطيع كتم البوت عام")
return false 
end
if result.id_ == tonumber(1765160742) then
send(msg.chat_id_, msg.id_, "•  لا يمكنك حظر مبرمج السورس \n")
return false 
end
if result.id_ == tonumber(SUDO) then
send(msg.chat_id_, msg.id_, "• لا يمكنك الاساسي \n")
return false 
end
usertext = '\n•العضو > ['..result.title_..'](t.me/'..(username or 'UU_KFUF')..')'
status  = '\n تم كتمه عام من المجموعات'
texts = usertext..status
database:sadd(bot_id..'Gmute:User', result.id_)
else
texts = '• لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^كتم عام (%d+)$") and SudoBot(msg) then
local userid = text:match("^كتم عام (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•قناة الاشتراك ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if userid == tonumber(SUDO) then
send(msg.chat_id_, msg.id_, "• لا يمكنك الاساسي \n")
return false 
end
if result.sender_user_id_ == tonumber(1765160742) then
send(msg.chat_id_, msg.id_, "•لا يمكنك كتم مطور  السورس \n")
return false 
end
if tonumber(userid) == tonumber(bot_id) then  
send(msg.chat_id_, msg.id_, "•لا تسطيع كتم البوت عام")
return false 
end
database:sadd(bot_id..'Gmute:User', userid)

tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '
status  = '\n تم كتمه عام من المجموعات'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n• العضو > '..userid..''
status  = '\n تم كتمه عام من المجموعات'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
if text == ("الغاء العام") and msg.reply_to_message_id_ and SudoBot(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•قناة الاشتراك ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n• > العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '
status  = '\n تم الغاء (الحظر-الكتم) عام من المجموعات'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
database:srem(bot_id..'GBan:User', result.sender_user_id_)
database:srem(bot_id..'Gmute:User', result.sender_user_id_)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^الغاء العام @(.*)$") and SudoBot(msg) then
local username = text:match("^الغاء العام @(.*)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•قناة الاشتراك ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
usertext = '\n•العضو > ['..result.title_..'](t.me/'..(username or 'UU_KFUF')..')'
status  = '\n تم الغاء (الحظر-الكتم) عام من المجموعات'
texts = usertext..status
database:srem(bot_id..'GBan:User', result.id_)
database:srem(bot_id..'Gmute:User', result.id_)
else
texts = '• لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^الغاء العام (%d+)$") and SudoBot(msg) then
local userid = text:match("^الغاء العام (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•قناة الاشتراك ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:srem(bot_id..'GBan:User', userid)
database:srem(bot_id..'Gmute:User', userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n• > العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '
status  = '\n تم الغاء (الحظر-الكتم) عام من المجموعات'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n• العضو > '..userid..''
status  = '\n تم حظره عام من المجموعات'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
------------------------------------------------------------------------
if text == ("مسح المطورين") and SudoBot(msg) then
database:del(bot_id..'Sudo:User')
send(msg.chat_id_, msg.id_, "\n•  تم مسح قائمة المطورين  ")
end
if text == ("المطورين") and SudoBot(msg) then
local list = database:smembers(bot_id..'Sudo:User')
t = "\n*• قائمة مطورين البوت \n*܀⠤⠤⠤⠤⠤⠤܀ٴ*\n*"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t.."︙"..k.." >  ([@"..username.."])\n"
else
end
end
if #list == 0 then
t = "• لا يوجد مطورين"
end
send(msg.chat_id_, msg.id_, t)
end
if text == 'الملفات' and SudoBot(msg) then
t = 'متجر سورس بلاك •\n*ٴ܀⠤⠤⠤⠤⠤⠤܀ٴ*\n'
i = 0
for v in io.popen('ls File_Bot'):lines() do
if v:match(".lua$") then
i = i + 1
t = t..i..'- الملف » {'..v..'}\n'
end
end
send(msg.chat_id_, msg.id_,t)
end
if text == "متجر الملفات" or text == 'المتجر' then
if SudoBot(msg) then
local Get_Files, res = https.request("https://raw.githubusercontent.com/PHFWHDHD/Files_Modedev/main/getfile.json")
if res == 200 then
local Get_info, res = pcall(JSON.decode,Get_Files);
vardump(res.plugins_)
if Get_info then
local TextS = "\n اهلا بك في متجر ملفات سورس بلاك\n ملفات السورس ↓\n*ٴ܀⠤⠤⠤⠤⠤⠤܀ٴ*●\n\n"
local TextE = "\n*ٴ܀⠤⠤⠤⠤⠤⠤܀ٴ*\n • علامة تعني { ✓ } ملف مفعل\n • علامة تعني { ✘ } ملف معطل\n • قناة سورس بلاك ↓\n".." • [𝙉𝙄𝙂𝙂𝘼 𝘾𝙃](t.me/UU_KFUF) \n"
local NumFile = 0
for name,Info in pairs(res.plugins_) do
local Check_File_is_Found = io.open("File_Bot/"..name,"r")
if Check_File_is_Found then
io.close(Check_File_is_Found)
CeckFile = "(✓)"
else
CeckFile = "(✘)"
end
NumFile = NumFile + 1
TextS = TextS..'*'..NumFile.."→* {`"..name..'`} » '..CeckFile..'\n[-Information]('..Info..')\n'
end
send(msg.chat_id_, msg.id_,TextS..TextE) 
end
else
send(msg.chat_id_, msg.id_," • لا يوجد اتصال من ال api \n") 
end
return false
end
end

if text and text:match("^(تعطيل) (.*)(.lua)$") and SudoBot(msg) then
local name_t = {string.match(text, "^(تعطيل) (.*)(.lua)$")}
local file = name_t[2]..'.lua'
local file_bot = io.open("File_Bot/"..file,"r")
if file_bot then
io.close(file_bot)
t = " • الملف » "..file.."\n • تم تعطيل ملف \n"
else
t = " • بالتاكيد تم تعطيل ملف → "..file.."\n"
end
local json_file, res = https.request("https://raw.githubusercontent.com/PHFWHDHD/Files_Modedev/main/File_Bot/"..file)
if res == 200 then
os.execute("rm -fr File_Bot/"..file)
send(msg.chat_id_, msg.id_,t) 
dofile('MODEDEV.lua')  
else
send(msg.chat_id_, msg.id_," • عذرا الملف لايدعم سورس بلاك \n") 
end
return false
end
if text and text:match("^(تفعيل) (.*)(.lua)$") and SudoBot(msg) then
local name_t = {string.match(text, "^(تفعيل) (.*)(.lua)$")}
local file = name_t[2]..'.lua'
local file_bot = io.open("File_Bot/"..file,"r")
if file_bot then
io.close(file_bot)
t = " • بالتاكيد تم تفعيل ملف → "..file.." \n"
else
t = " • الملف » "..file.."\n • تم تفعيل ملف \n"
end
local json_file, res = https.request("https://raw.githubusercontent.com/PHFWHDHD/Files_Modedev/main/File_Bot/"..file)
if res == 200 then
local chek = io.open("File_Bot/"..file,'w+')
chek:write(json_file)
chek:close()
send(msg.chat_id_, msg.id_,t) 
dofile('MODEDEV.lua')  
else
send(msg.chat_id_, msg.id_," • عذرا الملف لايدعم سورس بلاك \n") 
end
return false
end
if text == "مسح الملفات" and SudoBot(msg) then
os.execute("rm -fr File_Bot/*")
send(msg.chat_id_,msg.id_," • تم مسح الملفات")
return false
end
if text == ("رفع مطور") and msg.reply_to_message_id_ and SudoBot(msg) then
function start_function(extra, result, success)
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•قناة الاشتراك ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:sadd(bot_id..'Sudo:User', result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n> العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..')'
status  = '\n> الايدي > '..result.sender_user_id_..' ~\n تم ترقيته مطور في البوت'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false 
end
if text and text:match("^رفع مطور @(.*)$") and SudoBot(msg) then
local username = text:match("^رفع مطور @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•قناة الاشتراك ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"• عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:sadd(bot_id..'Sudo:User', result.id_)
usertext = '\n العضو > ['..result.title_..'](t.me/'..(username or 'UU_KFUF')..')'
status  = '\n تم ترقيته مطور في البوت'
texts = usertext..status
else
texts = '• لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false 
end
if text and text:match("^رفع مطور (%d+)$") and SudoBot(msg) then
local userid = text:match("^رفع مطور (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•قناة الاشتراك ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:sadd(bot_id..'Sudo:User', userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n> العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '
status  = '\n تم ترقيته مطور في البوت'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n• العضو > '..userid..''
status  = '\n تم ترقيته مطور في البوت'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false 
end
if text == ("تنزيل مطور") and msg.reply_to_message_id_ and SudoBot(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•قناة الاشتراك ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Sudo:User', result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n> العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '
status  = '\n> الايدي > '..result.sender_user_id_..' ~\n تم تنزيله من المطورين'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false 
end
if text and text:match("^تنزيل مطور @(.*)$") and SudoBot(msg) then
local username = text:match("^تنزيل مطور @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•قناة الاشتراك ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
database:srem(bot_id..'Sudo:User', result.id_)
usertext = '\n• العضو > ['..result.title_..'](t.me/'..(username or 'UU_KFUF')..')'
status  = '\n تم تنزيله من المطورين'
texts = usertext..status
else
texts = '• لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end  
if text and text:match("^تنزيل مطور (%d+)$") and SudoBot(msg) then
local userid = text:match("^تنزيل مطور (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•قناة الاشتراك ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:srem(bot_id..'Sudo:User', userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n•> العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '
status  = '\n تم تنزيله من المطورين'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n •  العضو > '..userid..''
status  = '\n تم تنزيله من المطورين'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false 
end
------------------------------------------------------------------------
if text == ("مسح المميزين عام") and SudoBot(msg) then
database:del(bot_id..'Mamez:User')
send(msg.chat_id_, msg.id_, "\n•  تم مسح قائمة المميزين عام  ")
end
if text == ("المميز العام") and SudoBot(msg) then
local list = database:smembers(bot_id..'Mamez:User')
t = "\n*• قائمة مميز العام البوت \n *܀⠤⠤⠤⠤⠤⠤܀ٴ*\n*"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t.."︙"..k.." >  ([@"..username.."])\n"
else
end
end
if #list == 0 then
t = "• لا يوجد مميز العام"
end
send(msg.chat_id_, msg.id_, t)
end

if text == ("رفع مميز عام") and msg.reply_to_message_id_ and SudoBot(msg) then
function start_function(extra, result, success)
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•قناة الاشتراك ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:sadd(bot_id..'Mamez:User', result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '
status  = '\n• الايدي > '..result.sender_user_id_..' \n تم ترقيته مميز عام في البوت'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false 
end
if text and text:match("^رفع مميز عام @(.*)$") and SudoBot(msg) then
local username = text:match("^رفع مميز عام @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•قناة الاشتراك ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"• عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:sadd(bot_id..'Mamez:User', result.id_)
usertext = '\n• العضو > ['..result.title_..'](t.me/'..(username or 'UU_KFUF')..')'
status  = '\n تم ترقيته مميز عام في البوت'
texts = usertext..status
else
texts = '• لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false 
end
if text and text:match("^رفع مميز عام (%d+)$") and SudoBot(msg) then
local userid = text:match("^رفع مميز عام (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
database:sadd(bot_id..'Mamez:User', userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '
status  = '\n تم ترقيته مميز عام في البوت'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n• العضو > '..userid..''
status  = '\n تم ترقيته مميز عام في البوت'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false 
end
if text == ("تنزيل مميز عام") and msg.reply_to_message_id_ and SudoBot(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Mamez:User', result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '
status  = '\n• الايدي > '..result.sender_user_id_..' \n تم تنزيله من المميز العام'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false 
end
if text and text:match("^تنزيل مميز عام @(.*)$") and SudoBot(msg) then
local username = text:match("^تنزيل مميز عام @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
database:srem(bot_id..'Mamez:User', result.id_)
usertext = '\n• العضو > ['..result.title_..'](t.me/'..(username or 'UU_KFUF')..')'
status  = '\n تم تنزيله من المميز العام'
texts = usertext..status
else
texts = '• لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end  
if text and text:match("^تنزيل مميز عام (%d+)$") and SudoBot(msg) then
local userid = text:match("^تنزيل مميز عام (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
database:srem(bot_id..'Mamez:User', userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '
status  = '\n تم تنزيله من المميز العام'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n• العضو > '..userid..''
status  = '\n تم تنزيله من المميز العام'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false 
end
------------------------------------------------------------------------

if text == ("تاك للحمير") and Mod(msg) then
local list = database:smembers(bot_id..'Mote:User'..msg.chat_id_)
t = "\n•ياحمير تعالو يردونكم 😹😭💞 . \n•━━━━•━━━━•\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t.."*︙"..k.."︙> [@"..username.."]•\n*"
else
end
end
if #list == 0 then
t = "• لا يوجد حمير 😹😔💞"
end
send(msg.chat_id_, msg.id_, t)
end
---------
if text == ("رفع حمار") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'Mote:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n•تم رفع العضو حمار في المجموعة 😭😹💞'
local  statuss  = ''
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل حمار")) and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Mote:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n•تم تنزيل العضو حمار في المجموعة 😭😹💞'
status  = ''
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == ("تاك للخولات") and Mod(msg) then
local list = database:smembers(bot_id..'Athol:User'..msg.chat_id_)
t = "\n•يا خولات تعالو يردونكم 😹😭💞 . \n•━━━━•━━━━•\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t.."*︙"..k.."︙> [@"..username.."]•\n*"
else
end
end
if #list == 0 then
t = "•لايوجد خولات😹😔💞"
end
send(msg.chat_id_, msg.id_, t)
end
---------
if text == ("رفع خول") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'Athol:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n•تم رفع العضو خول في المجموعة 😭😹💞'
local  statuss  = ''
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل خول")) and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Athol:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n•تم تنزيل العضو خول في المجموعة 😭😹💞'
status  = ''
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == ("تاك للوتكات") and Mod(msg) then
local list = database:smembers(bot_id..'Naby:User'..msg.chat_id_)
t = "\n•يا وتكات تعالو يردونكم 😹😭💞 . \n•━━━━•━━━━•\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t.."*︙"..k.."︙> [@"..username.."]•\n*"
else
end
end
if #list == 0 then
t = "•لايوجد وتكات ناشفه زي المستشفي 😹😔💞"
end
send(msg.chat_id_, msg.id_, t)
end
---------
if text == ("رفع وتكه") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'Naby:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n•رفعتلكم وتكه جديده استقبلو 😹😭💞'
local  statuss  = ''
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل وتكه")) and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Naby:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n•طلعتي سناب شات نزلتك 😹😭💞'
status  = ''
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == ("تاك للكلاب") and Mod(msg) then
local list = database:smembers(bot_id..'Glb:User'..msg.chat_id_)
t = "\n•يا كلاب تعالو يردونكم 😹😭💞 . \n•━━━━•━━━━•\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t.."*︙"..k.."︙> [@"..username.."]•\n*"
else
end
end
if #list == 0 then
t = "•لايوجد كلاب 😹😔💞"
end
send(msg.chat_id_, msg.id_, t)
end
---------
if text == ("رفع كلب") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'Glb:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n•تم رفع العضو كلب في المجموعة 😭😹💞'
local  statuss  = ''
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل كلب")) and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Glb:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n•تم تنزيل العضو كلب في المجموعة 😭😹💞'
status  = ''
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == ("تاك للمتوحدين") and Mod(msg) then
local list = database:smembers(bot_id..'Zgal:User'..msg.chat_id_)
t = "\n•يا متوحدين تعالو يردونكم 😹😭💞 . \n•━━━━•━━━━•\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t.."*︙"..k.."︙> [@"..username.."]•\n*"
else
end
end
if #list == 0 then
t = "•لايوجد متوحدين 😹😔💞"
end
send(msg.chat_id_, msg.id_, t)
end
---------
if text == ("رفع متوحد") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'Zgal:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n•تم رفع العضو متوحد في المجموعة 😭😹💞'
local  statuss  = ''
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل متوحد")) and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Zgal:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n•تم تنزيل العضو متوحد في المجموعة 😭😹💞'
status  = ''
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == ("تاك للقرود") and Mod(msg) then
local list = database:smembers(bot_id..'Zahf:User'..msg.chat_id_)
t = "\n•ياقرود تعالو يردونكم 😹😭💞 . \n•━━━━•━━━━•\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t.."*︙"..k.."︙> [@"..username.."]•\n*"
else
end
end
if #list == 0 then
t = "•لايوجد قرود 😹😔💞"
end
send(msg.chat_id_, msg.id_, t)
end
---------
if text == ("رفع قرد") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'Zahf:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n•تم رفع العضو قرد في المجموعة 😭😹💞'
local  statuss  = ''
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل قؤد")) and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Zahf:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n•تم تنزيل العضو قرد في المجموعة 😭😹💞'
status  = ''
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == ("تاك للي بقلبي") and Mod(msg) then
local list = database:smembers(bot_id..'Galby:User'..msg.chat_id_)
t = "\n•يا قلوب تعالو يردونكم 😹😭💞 . \n•━━━━•━━━━•\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t.."*︙"..k.."︙> [@"..username.."]•\n*"
else
end
end
if #list == 0 then
t = "•لايوجد قلوب 😹😔💞"
end
send(msg.chat_id_, msg.id_, t)
end
---------
if text == ("رفع بقلبي") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'Galby:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n•رفعتك  بقلبي لتجرحني 😘😭💞'
local  statuss  = ''
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل بقلبي")) and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Galby:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n•مش قولتلك لتجرحني نزلتك من قلبي 😭💞'
status  = ''
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == ("تاك للملوك") and Mod(msg) then
local list = database:smembers(bot_id..'Tag:User'..msg.chat_id_)
t = "\n•يا ملوك تعالو يردونكم 😹😭💞 . \n•━━━━•━━━━•\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t.."*︙"..k.."︙> [@"..username.."]•\n*"
else
end
end
if #list == 0 then
t = "•لايوجد ملوك😹😔💞"
end
send(msg.chat_id_, msg.id_, t)
end
---------
if text == ("رفع ملك") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'Tag:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n•هو ملك ميحتاج ارفعه 🤴🏻💞'
local  statuss  = ''
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل ملك")) and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Tag:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n•الملك ماينزل من مكانه 🤴🏻💞'
status  = ''
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == ("زواج") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'Zoag:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n•تم زواجكم انتم الاثنين. مبروك عليكم  🥺💞'
local  statuss  = ''
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text == ("طلاق") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'Mote:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n•طالق طالق طالق بالعشرة 😹😭💞'
local  statuss  = ''
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
--------------
if text == ("مسح الاساسين") and Sudo(msg) then
database:del(bot_id..'Basic:Constructor'..msg.chat_id_)
send(msg.chat_id_, msg.id_, '\n• تم مسح قائمه المنشئين الاساسين')
return false
end

if text == 'المنشئين الاساسين' and Sudo(msg) then
local list = database:smembers(bot_id..'Basic:Constructor'..msg.chat_id_)
t = "\n• قائمة المنشئين الاساسين \n *܀⠤⠤⠤⠤⠤⠤܀ٴ*\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t.."*︙"..k.."︙> [@"..username.."]•\n*"
else
end
end
if #list == 0 then
t = "• لا يوجد منشئين اساسيين"
end
send(msg.chat_id_, msg.id_, t)
return false
end

if text == ("رفع منشئ اساسي") and msg.reply_to_message_id_ and Sudo(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  ??𝒆𝒍𝒄𝒐𝒎?? black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'Basic:Constructor'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '
status  = '\n• الايدي > '..result.sender_user_id_..'~\n تم ترقيته منشئ اساسي'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^رفع منشئ اساسي @(.*)$") and Sudo(msg) then
local username = text:match("^رفع منشئ اساسي @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"• عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:sadd(bot_id..'Basic:Constructor'..msg.chat_id_, result.id_)
usertext = '\n• العضو > ['..result.title_..'](t.me/'..(username or 'UU_KFUF')..')'
status  = '\n تم ترقيته منشئ اساسي'
texts = usertext..status
else
texts = '• لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^رفع منشئ اساسي (%d+)$") and Sudo(msg) then
local userid = text:match("^رفع منشئ اساسي (%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
database:sadd(bot_id..'Basic:Constructor'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '
status  = '\n تم ترقيته منشئ اساسي'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n• العضو > '..userid..''
status  = '\n تم ترقيته منشئ اساسي'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
if text == ("تنزيل منشئ اساسي") and msg.reply_to_message_id_ and Sudo(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Basic:Constructor'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '
status  = '\n• الايدي > '..result.sender_user_id_..'~\n تم تنزيله من الاساسيين'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^تنزيل منشئ اساسي @(.*)$") and Sudo(msg) then
local username = text:match("^تنزيل منشئ اساسي @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
database:srem(bot_id..'Basic:Constructor'..msg.chat_id_, result.id_)
usertext = '\n• العضو > ['..result.title_..'](t.me/'..(username or 'UU_KFUF')..')'
status  = '\n تم تنزيله من الاساسيين'
texts = usertext..status
else
texts = '• لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^تنزيل منشئ اساسي (%d+)$") and Sudo(msg) then
local userid = text:match("^تنزيل منشئ اساسي (%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
database:srem(bot_id..'Basic:Constructor'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '
status  = '\n تم تنزيله من الاساسيين'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n• العضو > '..userid..''
status  = '\n تم تنزيله من الاساسيين'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
------------------------------------------------------------------------
if text == 'مسح المنشئين' and BasicConstructor(msg) then
database:del(bot_id..'Constructor'..msg.chat_id_)
texts = '• تم مسح المنشئين '
send(msg.chat_id_, msg.id_, texts)
end

if text == ("المنشئين") and BasicConstructor(msg) then
local list = database:smembers(bot_id..'Constructor'..msg.chat_id_)
t = "\n• قائمة المنشئين \n*܀⠤⠤⠤⠤⠤⠤܀ٴ*\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t.."*︙"..k.."︙> [@"..username.."]•\n*"
else
end
end
if #list == 0 then
t = "• لا يوجد منشئين"
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("تاك جميع الرتب") and BasicConstructor(msg) then
local list = database:smembers(bot_id..'Constructor'..msg.chat_id_)
t = "\n• قائمة المنشئين \n*܀⠤⠤⠤⠤⠤⠤܀ٴ*\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t.."*︙"..k.."︙> [@"..username.."]•\n*"
else
end
end
if #list == 0 then
t = "• لا يوجد منشئين"
end
send(msg.chat_id_, msg.id_, t)
end
if text ==("المنشئ") then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
owner_id = admins[i].user_id_
tdcli_function ({ID = "GetUser",user_id_ = owner_id},function(arg,b) 
if b.first_name_ == false then
send(msg.chat_id_, msg.id_,"• حساب المنشئ محذوف")
return false  
end
local UserName = (b.username_ or "UU_KFUF")
send(msg.chat_id_, msg.id_,"• منشئ المجموعه > ["..b.first_name_.."](T.me/"..UserName..")")  
end,nil)   
end
end
end,nil)   
end
if text == "رفع منشئ" and msg.reply_to_message_id_ and BasicConstructor(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'Constructor'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '
status  = '\n• الايدي > '..result.sender_user_id_..' ~\n تم ترقيته منشئ'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
end
if text and text:match("^رفع منشئ @(.*)$") and BasicConstructor(msg) then
local username = text:match("^رفع منشئ @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"• عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:sadd(bot_id..'Constructor'..msg.chat_id_, result.id_)
usertext = '\n• العضو > ['..result.title_..'](t.me/'..(username or 'UU_KFUF')..')'
status  = '\n تم ترقيته منشئ'
texts = usertext..status
else
texts = '• لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
end
------------------------------------------------------------------------
if text and text:match("^رفع منشئ (%d+)$") and BasicConstructor(msg) then
local userid = text:match("^رفع منشئ (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
database:sadd(bot_id..'Constructor'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '
status  = '\n تم ترقيته منشئ'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n• العضو > '..userid..''
status  = '\n تم ترقيته منشئ'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
end
if text and text:match("^تنزيل منشئ$") and msg.reply_to_message_id_ and BasicConstructor(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Constructor'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '
status  = '\n• الايدي > '..result.sender_user_id_..' \n تم تنزيله من المنشئين'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
end
------------------------------------------------------------------------
if text and text:match("^تنزيل منشئ @(.*)$") and BasicConstructor(msg) then
local username = text:match("^تنزيل منشئ @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
database:srem(bot_id..'Constructor'..msg.chat_id_, result.id_)
usertext = '\n• العضو > ['..result.title_..'](t.me/'..(username or 'UU_KFUF')..')'
status  = '\n تم تنزيله من المنشئين'
texts = usertext..status
else
texts = '• لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
end
------------------------------------------------------------------------
if text and text:match("^تنزيل منشئ (%d+)$") and BasicConstructor(msg) then
local userid = text:match("^تنزيل منشئ (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
database:srem(bot_id..'Constructor'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '
status  = '\n تم تنزيله من المنشئين'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n• العضو > '..userid..''
status  = '\n تم تنزيله من المنشئين'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
end
------------------------------------------------------------------------
if text == 'مسح المدراء' and Constructor(msg) then
database:del(bot_id..'Manager'..msg.chat_id_)
texts = '•  تم مسح المدراء '
send(msg.chat_id_, msg.id_, texts)
end
if text == ("المدراء") and Constructor(msg) then
local list = database:smembers(bot_id..'Manager'..msg.chat_id_)
t = "\n• قائمة المدراء \n *܀⠤⠤⠤⠤⠤⠤܀ٴ*\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t.."*︙"..k.."︙> [@"..username.."]•\n*"
else
end
end
if #list == 0 then
t = "- لا يوجد مدراء"
end
send(msg.chat_id_, msg.id_, t)
end

if text == ("رفع مدير") and msg.reply_to_message_id_ and Constructor(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'Manager'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '
status  = '\n• الايدي > '..result.sender_user_id_..' \n تم ترقيته مدير'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end  
if text and text:match("^رفع مدير @(.*)$") and Constructor(msg) then
local username = text:match("^رفع مدير @(.*)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"• عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:sadd(bot_id..'Manager'..msg.chat_id_, result.id_)
usertext = '\n• العضو > ['..result.title_..'](t.me/'..(username or 'UU_KFUF')..')'
status  = '\n تم ترقيته مدير'
texts = usertext..status
else
texts = '• لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end 

if text and text:match("^رفع مدير (%d+)$") and Constructor(msg) then
local userid = text:match("^رفع مدير (%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
database:sadd(bot_id..'Manager'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '
status  = '\n تم ترقيته مدير'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n• العضو > '..userid..''
status  = '\n تم ترقيته مدير'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end  
if text == ("تنزيل مدير") and msg.reply_to_message_id_ and Constructor(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Manager'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '
status  = '\n• الايدي > '..result.sender_user_id_..' \n تم تنزيله من المدراء'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end  
if text and text:match("^تنزيل مدير @(.*)$") and Constructor(msg) then
local username = text:match("^تنزيل مدير @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
database:srem(bot_id..'Manager'..msg.chat_id_, result.id_)
usertext = '\n• العضو > ['..result.title_..'](t.me/'..(username or 'UU_KFUF')..')'
status  = '\n تم تنزيله من المدراء'
texts = usertext..status
else
texts = '• لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end  
if text and text:match("^تنزيل مدير (%d+)$") and Constructor(msg) then
local userid = text:match("^تنزيل مدير (%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
database:srem(bot_id..'Manager'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '
status  = '\n تم تنزيله من المدراء'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n• العضو > '..userid..''
status  = '\n تم تنزيله من المدراء'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
------------------------------------------------------------------------
if text ==("رفع الادمنيه") and Manager(msg) then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local num2 = 0
local admins = data.members_
for i=0 , #admins do
if data.members_[i].bot_info_ == false and data.members_[i].status_.ID == "ChatMemberStatusEditor" then
database:sadd(bot_id.."Mod:User"..msg.chat_id_, admins[i].user_id_)
num2 = num2 + 1
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,b) 
if b.username_ == true then
end
if b.first_name_ == false then
database:srem(bot_id.."Mod:User"..msg.chat_id_, admins[i].user_id_)
end
end,nil)   
else
database:srem(bot_id.."Mod:User"..msg.chat_id_, admins[i].user_id_)
end
end
if num2 == 0 then
send(msg.chat_id_, msg.id_,"• لا توجد ادمنية ليتم رفعهم") 
else
send(msg.chat_id_, msg.id_,"• تمت ترقية { "..num2.." } من ادمنية المجموعه") 
end
end,nil)   
end
if text == 'مسح الادمنيه' and Manager(msg) then
database:del(bot_id..'Mod:User'..msg.chat_id_)
send(msg.chat_id_, msg.id_, '•  تم مسح  قائمة الادمنية  ')
end
if text == ("الادمنيه") then
local list = database:smembers(bot_id..'Mod:User'..msg.chat_id_)
t = "\n• قائمة الادمنيه \n *܀⠤⠤⠤⠤⠤⠤܀ٴ*\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t.."*︙"..k.."︙> [@"..username.."]•\n*"
else
end
end
if #list == 0 then
t = "• لا يوجد ادمنيه"
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("تاك الادمنيه") then
local list = database:smembers(bot_id..'Mod:User'..msg.chat_id_)
t = "\n• قائمة االادمنيه \n *܀⠤⠤⠤⠤⠤⠤܀ٴ*\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- {[@"..username.."]}\n"
else
end
end
if #list == 0 then
t = "• لا يوجد ادمنيه"
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("تاك جميع الرتب") then
local list = database:smembers(bot_id..'Mod:User'..msg.chat_id_)
t = "\n• قائمة االادمنيه \n *܀⠤⠤⠤⠤⠤⠤܀ٴ*\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- {[@"..username.."]}\n"
else
end
end
if #list == 0 then
t = "• لا يوجد ادمنيه"
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("رفع ادمن") and msg.reply_to_message_id_ and Manager(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
if database:get(bot_id..'Lock:Add:Bot'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,'• تم تعطيل الرفع من قبل المنشئين') 
return false
end
database:sadd(bot_id..'Mod:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '
status  = '\n• الايدي > '..result.sender_user_id_..' ~\n تم ترقيته ادمن'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^رفع ادمن @(.*)$") and Manager(msg) then
local username = text:match("^رفع ادمن @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
if database:get(bot_id..'Lock:Add:Bot'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,'• تم تعطيل الرفع من قبل المنشئين') 
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"• عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:sadd(bot_id..'Mod:User'..msg.chat_id_, result.id_)
usertext = '\n• العضو > ['..result.title_..'](t.me/'..(username or 'UU_KFUF')..')'
status  = '\n تم ترقيته ادمن'
texts = usertext..status
else
texts = '• لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^رفع ادمن (%d+)$") and Manager(msg) then
local userid = text:match("^رفع ادمن (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
if database:get(bot_id..'Lock:Add:Bot'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,' تم تعطيل الرفع من قبل المنشئين') 
return false
end
database:sadd(bot_id..'Mod:User'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..')'
status  = '\n تم ترقيته ادمن'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n• العضو > '..userid..''
status  = '\n تم ترقيته ادمن'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
if text == ("تنزيل ادمن") and msg.reply_to_message_id_ and Manager(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Mod:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '
status  = '\n• الايدي > '..result.sender_user_id_..' \n تم تنزيله من الادمنيه'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^تنزيل ادمن @(.*)$") and Manager(msg) then
local username = text:match("^تنزيل ادمن @(.*)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
database:srem(bot_id..'Mod:User'..msg.chat_id_, result.id_)
usertext = '\n• العضو > ['..result.title_..'](t.me/'..(username or 'UU_KFUF')..')'
status  = '\n تم تنزيله من الادمنيه'
texts = usertext..status
else
texts = '• لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^تنزيل ادمن (%d+)$") and Manager(msg) then
local userid = text:match("^تنزيل ادمن (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
database:srem(bot_id..'Mod:User'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '
status  = '\n تم تنزيله من الادمنيه'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n• العضو > '..userid..''
status  = '\n تم تنزيله من الادمنيه'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
------------------------------------------------------------------------
if text == ("طرد") and msg.reply_to_message_id_ ~=0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾??𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
if database:get(bot_id..'Lock:kick'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,'• تم تعطيل الطرد من قبل المنشئين') 
return false
end
function start_function(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
send(msg.chat_id_, msg.id_, "• لا تسطيع طرد البوت ")
return false 
end
if Can_or_NotCan(result.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, '\n• عذرا لا تستطيع طرد او حظر او كتم او تقيد ( '..Rutba(result.sender_user_id_,msg.chat_id_)..' )')
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,'• ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !') 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,' البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') ~'
statusk  = '\n• الايدي > `'..result.sender_user_id_..'` \n تم طرد العضو من هنا'
send(msg.chat_id_, msg.id_, usertext..statusk)
end,nil)
chat_kick(result.chat_id_, result.sender_user_id_)
end,nil)   
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end  
if text and text:match("^طرد @(.*)$") and Mod(msg) then 
local username = text:match("^طرد @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
if database:get(bot_id..'Lock:kick'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,'• تم تعطيل الطرد من قبل المنشئين') 
return false
end
function start_function(extra, result, success)
if result.id_ then
if tonumber(result.id_) == tonumber(bot_id) then  
send(msg.chat_id_, msg.id_, "•لا تسطيع طرد البوت ")
return false 
end
if Can_or_NotCan(result.id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, '\n• عذرا لا تستطيع طرد او حظر او كتم او تقيد ( '..Rutba(result.id_,msg.chat_id_)..' )')
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"• عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,'• ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !') 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,' البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
usertext = '\n•العضو > ['..result.title_..'](t.me/'..(username or 'UU_KFUF')..')'
statusk  = '\n تم طرد العضو من هنا'
texts = usertext..statusk
chat_kick(msg.chat_id_, result.id_)
send(msg.chat_id_, msg.id_, texts)
end,nil)   
end
else
send(msg.chat_id_, msg.id_, '• لا يوجد حساب بهاذا المعرف')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end  

if text and text:match("^طرد (%d+)$") and Mod(msg) then 
local userid = text:match("^طرد (%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 𝒏??𝒈𝒈𝒂 •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
if database:get(bot_id..'Lock:kick'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,'• تم تعطيل الطرد من قبل المنشئين') 
return false
end
if tonumber(userid) == tonumber(bot_id) then  
send(msg.chat_id_, msg.id_, "• لا تسطيع طرد البوت ")
return false 
end
if Can_or_NotCan(userid, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, '\n• عذرا لا تستطيع طرد او حظر او كتم او تقيد ( '..Rutba(userid,msg.chat_id_)..' )')
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = userid, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,'• ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !') 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,' البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
chat_kick(msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
 usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') ~'
 statusk  = '\n تم طرد العضو من هنا'
send(msg.chat_id_, msg.id_, usertext..statusk)
else
 usertext = '\n• العضو > '..userid..''
 statusk  = '\n تم طرده من هنا'
send(msg.chat_id_, msg.id_, usertext..statusk)
end;end,nil)
end,nil)   
end
return false
end
------------------------------------------------------------------------
------------------------------------------------------------------------
if text == 'مسح المميزين' and Mod(msg) then
database:del(bot_id..'Special:User'..msg.chat_id_)
send(msg.chat_id_, msg.id_, '•  تم مسح  قائمة الاعضاء المميزين  ')
end
if text == ("المميزين") and Mod(msg) then
local list = database:smembers(bot_id..'Special:User'..msg.chat_id_)
t = "\n• قائمة مميزين المجموعه \n *܀⠤⠤⠤⠤⠤⠤܀ٴ*\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t.."*︙"..k.."︙> [@"..username.."]•\n*"
else
end
end
if #list == 0 then
t = "• لا يوجد مميزين"
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("رفع مميز") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
if database:get(bot_id..'Lock:Add:Bot'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,'• تم تعطيل الرفع من قبل المنشئين') 
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'Special:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '
local  statuss  = '\n• الايدي > '..result.sender_user_id_..' \n تم ترقيته مميز هنا '
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^رفع مميز @(.*)$") and Mod(msg) then
local username = text:match("^رفع مميز @(.*)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
if database:get(bot_id..'Lock:Add:Bot'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,'• تم تعطيل الرفع من قبل المنشئين') 
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"• عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:sadd(bot_id..'Special:User'..msg.chat_id_, result.id_)
usertext = '\n• العضو > ['..result.title_..'](t.me/'..(username or 'UU_KFUF')..')'
local  statuss  = '\n تم ترقيته مميز هنا'
texts = usertext..statuss
else
texts = '•لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end

if text and text:match("^رفع مميز (%d+)$") and Mod(msg) then
local userid = text:match("^رفع مميز (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
if database:get(bot_id..'Lock:Add:Bot'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,'• تم تعطيل الرفع من قبل المنشئين') 
return false
end
database:sadd(bot_id..'Special:User'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n•العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..')'
local  statuss  = '\n تم ترقيته مميز هنا'
send(msg.chat_id_, msg.id_, usertext..statuss)
else
usertext = '\n• العضو > '..userid..''
local  statuss  = '\n تم ترقيته مميز هنا '
send(msg.chat_id_, msg.id_, usertext..statuss)
end;end,nil)
return false
end

if (text == ("تنزيل مميز")) and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Special:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '
status  = '\n• الايدي > '..result.sender_user_id_..' \n تم تنزيله من المميزين'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^تنزيل مميز @(.*)$") and Mod(msg) then
local username = text:match("^تنزيل مميز @(.*)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
database:srem(bot_id..'Special:User'..msg.chat_id_, result.id_)
usertext = '\n• العضو > ['..result.title_..'](t.me/'..(username or 'UU_KFUF')..')'
status  = '\n تم تنزيله من المميزين'
texts = usertext..status
else
texts = '• لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^تنزيل مميز (%d+)$") and Mod(msg) then
local userid = text:match("^تنزيل مميز (%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
database:srem(bot_id..'Special:User'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '
status  = '\n تم تنزيله من المميزين'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n•  العضو > '..userid..''
status  = '\n تم تنزيله من المميزين'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end  
------------------------------------------------------------------------
if text == 'مسح المحظورين' and Mod(msg) then
database:del(bot_id..'Ban:User'..msg.chat_id_)
send(msg.chat_id_, msg.id_, '\n •  تم مسح المحظورين')
end
if text == ("المحظورين") then
local list = database:smembers(bot_id..'Ban:User'..msg.chat_id_)
t = "\n• قائمة محظورين المجموعه \n *܀⠤⠤⠤⠤⠤⠤܀ٴ*\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "• لا يوجد محظورين"
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("حظر") and msg.reply_to_message_id_ ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
if database:get(bot_id..'Lock:kick'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,'• تم تعطيل الحظر من قبل المنشئين') 
return false
end
function start_function(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
send(msg.chat_id_, msg.id_, "• لا تسطيع حظر البوت ")
return false 
end
if Can_or_NotCan(result.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, '\n• عذرا لا تستطيع طرد او حظر او كتم او تقيد ( '..Rutba(result.sender_user_id_,msg.chat_id_)..' )')
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.sender_user_id_, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,'• ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !') 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,'البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
database:sadd(bot_id..'Ban:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '
status  = '\n• الايدي > '..result.sender_user_id_..' \n تم حظره من المجموعه'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
chat_kick(result.chat_id_, result.sender_user_id_)
end,nil)   
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if text and text:match("^حظر @(.*)$") and Mod(msg) then
local username = text:match("^حظر @(.*)$")
if database:get(bot_id..'Lock:kick'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,'•تم تعطيل الحظر من قبل المنشئين') 
return false
end
function start_function(extra, result, success)
if result.id_ then
if Can_or_NotCan(result.id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, '\n• عذرا لا تستطيع طرد او حظر او كتم او تقيد ( '..Rutba(result.id_,msg.chat_id_)..' )')
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"• عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,'• ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !') 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,' البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
database:sadd(bot_id..'Ban:User'..msg.chat_id_, result.id_)
usertext = '\n• المستخدم > ['..result.title_..'](t.me/'..(username or 'GLOBLA')..')'
status  = '\n تم حظره من المجموعه'
texts = usertext..status
chat_kick(msg.chat_id_, result.id_)
send(msg.chat_id_, msg.id_, texts)
end,nil)   
end
else
send(msg.chat_id_, msg.id_, '•  لا يوجد حساب بهاذا المعرف')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end

if text and text:match("^حظر (%d+)$") and Mod(msg) then
local userid = text:match("^حظر (%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
if database:get(bot_id..'Lock:kick'..msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_, msg.id_,'• تم تعطيل حظر من قبل المنشئين') 
return false
end
if tonumber(userid) == tonumber(bot_id) then  
send(msg.chat_id_, msg.id_, "• لا تسطيع حظر البوت")
return false 
end
if Can_or_NotCan(userid, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, '\n• عذرا لا تستطيع طرد او حظر او كتم او تقيد ( '..Rutba(userid,msg.chat_id_)..' )')
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = userid, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,'• ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !') 
return false  
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,' البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
database:sadd(bot_id..'Ban:User'..msg.chat_id_, userid)
chat_kick(msg.chat_id_, userid)  
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n•> العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') ~'
status  = '\n تم حظره من المجموعه'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n• العضو > '..userid..''
status  = '\n تم حظره من المجموعه'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
end,nil)   
end
return false
end
if text == ("الغاء حظر") and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(bot_id) then
send(msg.chat_id_, msg.id_, ' انا لست محظورا \n') 
return false 
end
database:srem(bot_id..'Ban:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '
status  = '\n• الايدي > '..result.sender_user_id_..' \n تم الغاء حظره من هنا'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.sender_user_id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
 
if text and text:match("^الغاء حظر @(.*)$") and Mod(msg) then
local username = text:match("^الغاء حظر @(.*)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if tonumber(result.id_) == tonumber(bot_id) then
send(msg.chat_id_, msg.id_, ' انا لست محظورا \n') 
return false 
end
database:srem(bot_id..'Ban:User'..msg.chat_id_, result.id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
usertext = '\n• العضو > ['..result.title_..'](t.me/'..(username or 'UU_KFUF')..')'
status  = '\n تم الغاء حظره من هنا'
texts = usertext..status
else
texts = '• لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end

if text and text:match("^الغاء حظر (%d+)$") and Mod(msg) then
local userid = text:match("^الغاء حظر (%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎?? black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
if tonumber(userid) == tonumber(bot_id) then
send(msg.chat_id_, msg.id_, ' انا لست محظورا \n') 
return false 
end
database:srem(bot_id..'Ban:User'..msg.chat_id_, userid)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = userid, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') ~'
status  = '\n تم الغاء حظره من هنا'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n• لعضو > '..userid..''
status  = '\n تم الغاء حظره من هنا'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
------------------------------------------------------------------------
if text == 'مسح المكتومين' and Mod(msg) then
database:del(bot_id..'Muted:User'..msg.chat_id_)
send(msg.chat_id_, msg.id_, '•  تم مسح قائمه المكتومين ')
end
if text == ("المكتومين") and Mod(msg) then
local list = database:smembers(bot_id..'Muted:User'..msg.chat_id_)
t = "\n قائمة المكتومين \n *܀⠤⠤⠤⠤⠤⠤܀ٴ*\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
end
end
if #list == 0 then
t = "•  لا يوجد مكتومين"
end
send(msg.chat_id_, msg.id_, t)
end

if text == ("كتم") and msg.reply_to_message_id_ ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
send(msg.chat_id_, msg.id_, "• لا تسطيع كتم البوت ")
return false 
end
if Can_or_NotCan(result.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, '\n• عذرا لا تستطيع طرد او حظر او كتم او تقيد ( '..Rutba(result.sender_user_id_,msg.chat_id_)..' )')
else
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,' البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
database:sadd(bot_id..'Muted:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..')'
status  = '\n•  الايدي > `'..result.sender_user_id_..'`\n تم كتمه من هنا'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^كتم @(.*)$") and Mod(msg) then
local username = text:match("^كتم @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• لا تستطيع استخدام البوت يرجى الاشتراك في القناة حتى تتمكن من استخدام الاوامر \n • < جط ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,' البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
function start_function(extra, result, success)
if result.id_ then
if tonumber(result.id_) == tonumber(bot_id) then  
send(msg.chat_id_, msg.id_, "• لا تسطيع كتم البوت ")
return false 
end
if Can_or_NotCan(result.id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, '\n• عذرا لا تستطيع طرد او حظر او كتم او تقيد ( '..Rutba(result.id_,msg.chat_id_)..' )')
else
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"• عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:sadd(bot_id..'Muted:User'..msg.chat_id_, result.id_)
usertext = '\n• العضو > ['..result.title_..'](t.me/'..(username or 'UU_KFUF')..')'
status  = '\n تم كتمه من هنا'
texts = usertext..status
send(msg.chat_id_, msg.id_, texts)
end
else
send(msg.chat_id_, msg.id_, '• لا يوجد حساب بهاذا المعرف')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match('^كتم (%d+) (.*)$') and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
local TextEnd = {string.match(text, "^(كتم) (%d+) (.*)$")}
function start_function(extra, result, success)
if TextEnd[3] == 'يوم' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 86400
end
if TextEnd[3] == 'ساعه' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 3600
end
if TextEnd[3] == 'دقيقه' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 60
end
TextEnd[3] = TextEnd[3]:gsub('دقيقه',"دقايق") 
TextEnd[3] = TextEnd[3]:gsub('ساعه',"ساعات") 
TextEnd[3] = TextEnd[3]:gsub("يوم","ايام") 
if Can_or_NotCan(result.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, "\n• عذرا لا تستطيع طرد او حظر او كتم او تقيد ( "..Rutba(result.sender_user_id_,msg.chat_id_).." )")
else
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n•> العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') ~'
status  = '\n تم كتم لمدة ~ { '..TextEnd[2]..' '..TextEnd[3]..'}'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+Time))
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end


if text and text:match('^كتم (%d+) (.*) @(.*)$') and Mod(msg) then
local TextEnd = {string.match(text, "^(كتم) (%d+) (.*) @(.*)$")}
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"• عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
if TextEnd[3] == 'يوم' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 86400
end
if TextEnd[3] == 'ساعه' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 3600
end
if TextEnd[3] == 'دقيقه' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 60
end
TextEnd[3] = TextEnd[3]:gsub('دقيقه',"دقايق") 
TextEnd[3] = TextEnd[3]:gsub('ساعه',"ساعات") 
TextEnd[3] = TextEnd[3]:gsub("يوم","ايام") 
if Can_or_NotCan(result.id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, "\n• عذرا لا تستطيع طرد او حظر او كتم او تقيد ( "..Rutba(result.id_,msg.chat_id_).." )")
else
usertext = '\n• العضو > ['..result.title_..'](t.me/'..(username or 'UU_KFUF')..')'
status  = '\n• تم كتم لمدة ~ { '..TextEnd[2]..' '..TextEnd[3]..'}'
texts = usertext..status
send(msg.chat_id_, msg.id_,texts)
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_..'&until_date='..tonumber(msg.date_+Time))
end
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = TextEnd[4]}, start_function, nil)
return false
end
if text and text:match("^كتم (%d+)$") and Mod(msg) then
local userid = text:match("^كتم (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
if tonumber(userid) == tonumber(bot_id) then  
send(msg.chat_id_, msg.id_, "• لا تسطيع كتم البوت ")
return false 
end
if Can_or_NotCan(userid, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, '\n• عذرا لا تستطيع طرد او حظر او كتم او تقيد ( '..Rutba(userid,msg.chat_id_)..' )')
else
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,' البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
database:sadd(bot_id..'Muted:User'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n•> العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') ~'
status  = '\n تم كتمه من هنا'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n• العضو > '..userid..''
status  = '\n تم كتمه من هنا'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
end
return false
end
if text == ("الغاء الكتم") and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Muted:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n•> العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') ~'
status  = '\n•> الايدي > '..result.sender_user_id_..' ~\n تم الغاء الكتم من هنا'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^الغاء الكتم @(.*)$") and Mod(msg) then
local username = text:match("^الغاء الكتم @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• لا تستطيع استخدام البوت يرجى الاشتراك في القناة حتى تتمكن من استخدام الاوامر \n • < جط ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
database:srem(bot_id..'Muted:User'..msg.chat_id_, result.id_)
usertext = '\n• العضو > ['..result.title_..'](t.me/'..(username or 'UU_KFUF')..')'
status  = '\n تم الغاء الكتم من هنا'
texts = usertext..status
else
texts = '• لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end

if text and text:match("^الغاء الكتم (%d+)$") and Mod(msg) then
local userid = text:match("^الغاء الكتم (%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
database:srem(bot_id..'Muted:User'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n•> العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') ~'
status  = '\n تم الغاء الكتم من هنا'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n• العضو > '..userid..''
status  = '\n تم الغاء الكتم من هنا'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
if text == ("الغاء كتم") and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Muted:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n•> العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') ~'
status  = '\n•> الايدي > '..result.sender_user_id_..' ~\n تم الغاء الكتم من هنا'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^الغاء كتم @(.*)$") and Mod(msg) then
local username = text:match("^الغاء كتم @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• لا تستطيع استخدام البوت يرجى الاشتراك في القناة حتى تتمكن من استخدام الاوامر \n • < جط ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
database:srem(bot_id..'Muted:User'..msg.chat_id_, result.id_)
usertext = '\n• العضو > ['..result.title_..'](t.me/'..(username or 'UU_KFUF')..')'
status  = '\n تم الغاء الكتم من هنا'
texts = usertext..status
else
texts = '• لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end

if text and text:match("^الغاء كتم (%d+)$") and Mod(msg) then
local userid = text:match("^الغاء كتم (%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
database:srem(bot_id..'Muted:User'..msg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n•> العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') ~'
status  = '\n تم الغاء الكتم من هنا'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n• العضو > '..userid..''
status  = '\n تم الغاء الكتم من هنا'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end

if text == ("تقيد") and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
send(msg.chat_id_, msg.id_, "• لا تسطيع تقيد البوت ")
return false 
end
if Can_or_NotCan(result.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, '\n• عذرا لا تستطيع طرد او حظر او كتم او تقيد ( '..Rutba(result.sender_user_id_,msg.chat_id_)..' )')
else
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '
status  = '\n• الايدي > '..result.sender_user_id_..' \n تم تقيده في المجموعه'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^تقيد @(.*)$") and Mod(msg) then
local username = text:match("^تقيد @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if tonumber(result.id_) == tonumber(bot_id) then  
send(msg.chat_id_, msg.id_, "• لا تسطيع تقيد البوت ")
return false 
end
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"• عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
if Can_or_NotCan(result.id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, '\n• عذرا لا تستطيع طرد او حظر او كتم او تقيد ( '..Rutba(result.id_,msg.chat_id_)..' )')
return false 
end      
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_)
 
usertext = '\n• العضو > ['..result.title_..'](t.me/'..(username or 'UU_KFUF')..')'
status  = '\n تم تقيده في المجموعه'
texts = usertext..status
else
texts = '• لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end

if text and text:match('^تقيد (%d+) (.*)$') and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
local TextEnd = {string.match(text, "^(تقيد) (%d+) (.*)$")}
function start_function(extra, result, success)
if TextEnd[3] == 'يوم' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 86400
end
if TextEnd[3] == 'ساعه' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 3600
end
if TextEnd[3] == 'دقيقه' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 60
end
TextEnd[3] = TextEnd[3]:gsub('دقيقه',"دقايق") 
TextEnd[3] = TextEnd[3]:gsub('ساعه',"ساعات") 
TextEnd[3] = TextEnd[3]:gsub("يوم","ايام") 
if Can_or_NotCan(result.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, "\n• عذرا لا تستطيع طرد او حظر او كتم او تقيد ( "..Rutba(result.sender_user_id_,msg.chat_id_).." )")
else
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n•> العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') ~'
status  = '\n• تم تقيده لمدة ~ { '..TextEnd[2]..' '..TextEnd[3]..'}'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+Time))
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end


if text and text:match('^تقيد (%d+) (.*) @(.*)$') and Mod(msg) then
local TextEnd = {string.match(text, "^(تقيد) (%d+) (.*) @(.*)$")}
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"• عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
if TextEnd[3] == 'يوم' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 86400
end
if TextEnd[3] == 'ساعه' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 3600
end
if TextEnd[3] == 'دقيقه' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 60
end
TextEnd[3] = TextEnd[3]:gsub('دقيقه',"دقايق") 
TextEnd[3] = TextEnd[3]:gsub('ساعه',"ساعات") 
TextEnd[3] = TextEnd[3]:gsub("يوم","ايام") 
if Can_or_NotCan(result.id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, "\n• عذرا لا تستطيع طرد او حظر او كتم او تقيد ( "..Rutba(result.id_,msg.chat_id_).." )")
else
usertext = '\n• العضو > ['..result.title_..'](t.me/'..(username or 'UU_KFUF')..')'
status  = '\n• تم تقيده لمدة  { '..TextEnd[2]..' '..TextEnd[3]..'}'
texts = usertext..status
send(msg.chat_id_, msg.id_,texts)
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_..'&until_date='..tonumber(msg.date_+Time))
end
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = TextEnd[4]}, start_function, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^تقيد (%d+)$") and Mod(msg) then
local userid = text:match("^تقيد (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
if tonumber(userid) == tonumber(bot_id) then  
send(msg.chat_id_, msg.id_, "• لا تسطيع تقيد البوت ")
return false 
end
if Can_or_NotCan(userid, msg.chat_id_) then
send(msg.chat_id_, msg.id_, '\n• عذرا لا تستطيع طرد او حظر او كتم او تقيد ( '..Rutba(userid,msg.chat_id_)..' )')
else
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') ~'
status  = '\n تم تقيده في المجموعه'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n• العضو > '..userid..''
status  = '\n تم تقيده في المجموعه'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
end
return false
end
------------------------------------------------------------------------
if text == ("الغاء التقيد") and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.sender_user_id_ .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '
status  = '\n• الايدي > '..result.sender_user_id_..' \n تم فك تقيده'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text == ("الغاء تقيد") and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.sender_user_id_ .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '
status  = '\n• الايدي > '..result.sender_user_id_..' \n تم فك تقيده'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^الغاء التقيد @(.*)$") and Mod(msg) then
local username = text:match("^الغاء التقيد @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.id_ .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
usertext = '\n• العضو > ['..result.title_..'](t.me/'..(username or 'UU_KFUF')..')'
status  = '\n تم فك تقيده'
texts = usertext..status
else
texts = '• لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^الغاء تقيد @(.*)$") and Mod(msg) then
local username = text:match("^الغاء تقيد @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.id_ .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
usertext = '\n• العضو > ['..result.title_..'](t.me/'..(username or 'UU_KFUF')..')'
status  = '\n تم فك تقيده'
texts = usertext..status
else
texts = '• لا يوجد حساب بهاذا المعرف'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^فك تقيد (%d+)$") and Mod(msg) then
local userid = text:match("^فك تقيد (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..userid.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '
status  = '\n تم فك تقيده'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n• العضو > '..userid..''
status  = '\n تم فك تقيده'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
if text and text:match('^رفع القيود @(.*)') and Manager(msg) then 
local username = text:match('^رفع القيود @(.*)') 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if SudoBot(msg) then
database:srem(bot_id..'GBan:User',result.id_)
database:srem(bot_id..'Ban:User'..msg.chat_id_,result.id_)
database:srem(bot_id..'Muted:User'..msg.chat_id_,result.id_)
database:srem(bot_id..'Gmute:User'..msg.chat_id_,result.id_)
usertext = '\n• العضو > ['..result.title_..'](t.me/'..(username or 'UU_KFUF')..')'
status  = '\n تم الغاء القيود عنه'
texts = usertext..status
send(msg.chat_id_, msg.id_,texts)
else
database:srem(bot_id..'Ban:User'..msg.chat_id_,result.id_)
database:srem(bot_id..'Muted:User'..msg.chat_id_,result.id_)
usertext = '\n• العضو > ['..result.title_..'](t.me/'..(username or 'UU_KFUF')..')'
status  = '\n تم الغاء القيود عنه'
texts = usertext..status
send(msg.chat_id_, msg.id_,texts)
end
else
Text = '• المعرف غلط'
send(msg.chat_id_, msg.id_,Text)
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
end
if text == "رفع القيود" and Manager(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
if SudoBot(msg) then
database:srem(bot_id..'GBan:User',result.sender_user_id_)
database:srem(bot_id..'Ban:User'..msg.chat_id_,result.sender_user_id_)
database:srem(bot_id..'Muted:User'..msg.chat_id_,result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n•> العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') ~'
status  = '\n•> الايدي > '..result.sender_user_id_..' ~\n تم الغاء القيود عنه'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
else
database:srem(bot_id..'Ban:User'..msg.chat_id_,result.sender_user_id_)
database:srem(bot_id..'Muted:User'..msg.chat_id_,result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n•> العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') ~'
status  = '\n•> الايدي > '..result.sender_user_id_..' ~\n تم الغاء القيود عنه'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
end
if text and text:match('^كشف القيود @(.*)') and Manager(msg) then 
local username = text:match('^كشف القيود @(.*)') 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if database:sismember(bot_id..'Muted:User'..msg.chat_id_,result.id_) then
Muted = 'مكتوم'
else
Muted = 'غير مكتوم'
end
if database:sismember(bot_id..'Ban:User'..msg.chat_id_,result.id_) then
Ban = 'محظور'
else
Ban = 'غير محظور'
end
if database:sismember(bot_id..'GBan:User',result.id_) then
GBan = 'محظور عام'
else
GBan = 'غير محظور عام'
end
Textt = "• الحظر العام > "..GBan.."\n• الحظر > "..Ban.."\n• الكتم > "..Muted..""
send(msg.chat_id_, msg.id_,Textt)
else
Text = '• المعرف غلط'
send(msg.chat_id_, msg.id_,Text)
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
end

if text == "كشف القيود" and Manager(msg) then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
function start_function(extra, result, success)
if database:sismember(bot_id..'Muted:User'..msg.chat_id_,result.sender_user_id_) then
Muted = 'مكتوم'
else
Muted = 'غير مكتوم'
end
if database:sismember(bot_id..'Ban:User'..msg.chat_id_,result.sender_user_id_) then
Ban = 'محظور'
else
Ban = 'غير محظور'
end
if database:sismember(bot_id..'GBan:User',result.sender_user_id_) then
GBan = 'محظور عام'
else
GBan = 'غير محظور عام'
end
if database:sismember(bot_id..'Gmute:User',result.sender_user_id_) then
Gmute = 'محظور عام'
else
Gmute = 'غير محظور عام'
end
Textt = "• الحظر العام > "..GBan.."\n• الكتم العام > "..Gmute.."\n• الحظر > "..Ban.."\n الكتم > "..Muted..""
send(msg.chat_id_, msg.id_,Textt)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
end
if text == ("رفع مشرف") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
function start_function(extra, result, success)
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,' البوت ليس مشرف يرجى ترقيتي !') 
return false  
end
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '
status  = '\n• الايدي > '..result.sender_user_id_..' ~\n تم رفعه مشرف بالمجموعه '
send(msg.chat_id_, msg.id_, usertext..status)
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=True&can_restrict_members=false&can_pin_messages=True&can_promote_members=false")
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^رفع مشرف @(.*)$") and Constructor(msg) then
local username = text:match("^رفع مشرف @(.*)$")
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,' البوت ليس مشرف يرجى ترقيتي !') 
return false  
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"• عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
usertext = '\n• العضو > ['..result.title_..'](t.me/'..(username or 'UU_KFUF')..')'
status  = '\n تم رفعه مشرف بالمجموعه '
texts = usertext..status
send(msg.chat_id_, msg.id_, texts)
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=True&can_restrict_members=false&can_pin_messages=True&can_promote_members=false")
else
send(msg.chat_id_, msg.id_, '• لا يوجد حساب بهاذا المعرف')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text == ("تنزيل مشرف") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
function start_function(extra, result, success)
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,' البوت ليس مشرف يرجى ترقيتي !') 
return false  
end
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '
status  = '\n• الايدي > '..result.sender_user_id_..' ~\n تم تنزيله ادمن من المجموعه'
send(msg.chat_id_, msg.id_, usertext..status)
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^تنزيل مشرف @(.*)$") and Constructor(msg) then
local username = text:match("^تنزيل مشرف @(.*)$")
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,' البوت ليس مشرف يرجى ترقيتي !') 
return false  
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"• عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
usertext = '\n• العضو > ['..result.title_..'](t.me/'..(username or 'UU_KFUF')..')'
status  = '\n تم تنزيله مشرف من المجموعه'
texts = usertext..status
send(msg.chat_id_, msg.id_, texts)
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
else
send(msg.chat_id_, msg.id_, '• لا يوجد حساب بهاذا المعرف')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end


if text == ("رفع مالك") and msg.reply_to_message_id_ ~= 0 and BasicConstructor(msg) then
function start_function(extra, result, success)
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,' البوت ليس مشرف يرجى ترقيتي !') 
return false  
end
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '
status  = '\n• الايدي > '..result.sender_user_id_..' \n تم رفع العضو مالك المجموعه'
send(msg.chat_id_, msg.id_, usertext..status)
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=True")
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^مالك @(.*)$") and BasicConstructor(msg) then
local username = text:match("^مالك @(.*)$")
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,' البوت ليس مشرف يرجى ترقيتي !') 
return false  
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"• عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
usertext = '\n• العضو > ['..result.title_..'](t.me/'..(username or 'UU_KFUF')..')'
status  = '\n تم رفع العضو مالك'
texts = usertext..status
send(msg.chat_id_, msg.id_, texts)
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=True")
else
send(msg.chat_id_, msg.id_, '• لا يوجد حساب بهاذا المعرف')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text == ("تنزيل مالك") and msg.reply_to_message_id_ ~= 0 and BasicConstructor(msg) then
function start_function(extra, result, success)
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,' البوت ليس مشرف يرجى ترقيتي !') 
return false  
end
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '
status  = '\n• الايدي > '..result.sender_user_id_..' \n تم تنزيله تنزيل مالك من المجموعه بكل الصلاحيات'
send(msg.chat_id_, msg.id_, usertext..status)
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^تنزيل مالك @(.*)$") and BasicConstructor(msg) then
local username = text:match("^تنزيل مالك @(.*)$")
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,' البوت ليس مشرف يرجى ترقيتي !') 
return false  
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"• عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
usertext = '\n• العضو > ['..result.title_..'](t.me/'..(username or 'UU_KFUF')..')'
status  = '\n تم رفع عضو مالك'
texts = usertext..status
send(msg.chat_id_, msg.id_, texts)
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
else
send(msg.chat_id_, msg.id_, '• لا يوجد حساب بهاذا المعرف')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text == 'اعدادات المجموعه' and Mod(msg) then    
if database:get(bot_id..'lockpin'..msg.chat_id_) then    
lock_pin = '✓'
else 
lock_pin = '✘'    
end
if database:get(bot_id..'lock:tagservr'..msg.chat_id_) then    
lock_tagservr = '✓'
else 
lock_tagservr = '✘'    
end
if database:get(bot_id..'lock:text'..msg.chat_id_) then    
lock_text = '✓'
else 
lock_text = '✘'    
end
if database:get(bot_id.."lock:AddMempar"..msg.chat_id_) == 'kick' then
lock_add = '✓'
else 
lock_add = '✘'    
end    
if database:get(bot_id.."lock:Join"..msg.chat_id_) == 'kick' then
lock_join = '✓'
else 
lock_join = '✘'    
end    
if database:get(bot_id..'lock:edit'..msg.chat_id_) then    
lock_edit = '✓'
else 
lock_edit = '✘'    
end
print(welcome)
if database:get(bot_id..'Get:Welcome:Group'..msg.chat_id_) then
welcome = '✓'
else 
welcome = '✘'    
end
if database:get(bot_id..'lock:edit'..msg.chat_id_) then    
lock_edit_med = '✓'
else 
lock_edit_med = '✘'    
end
if database:hget(bot_id.."flooding:settings:"..msg.chat_id_, "flood") == "kick" then     
flood = 'بالطرد •'     
elseif database:hget(bot_id.."flooding:settings:"..msg.chat_id_,"flood") == "keed" then     
flood = 'بالتقيد •'     
elseif database:hget(bot_id.."flooding:settings:"..msg.chat_id_,"flood") == "mute" then     
flood = 'بالكتم •'           
elseif database:hget(bot_id.."flooding:settings:"..msg.chat_id_,"flood") == "del" then     
flood = 'بالمسح •'           
else     
flood = '✘'     
end
if database:get(bot_id.."lock:Photo"..msg.chat_id_) == "del" then
lock_photo = '✓' 
elseif database:get(bot_id.."lock:Photo"..msg.chat_id_) == "ked" then 
lock_photo = 'بالتقيد •'   
elseif database:get(bot_id.."lock:Photo"..msg.chat_id_) == "ktm" then 
lock_photo = 'بالكتم •'    
elseif database:get(bot_id.."lock:Photo"..msg.chat_id_) == "kick" then 
lock_photo = 'بالطرد •'   
else
lock_photo = '✘'   
end    
if database:get(bot_id.."lock:Contact"..msg.chat_id_) == "del" then
lock_phon = '✓' 
elseif database:get(bot_id.."lock:Contact"..msg.chat_id_) == "ked" then 
lock_phon = 'بالتقيد •'    
elseif database:get(bot_id.."lock:Contact"..msg.chat_id_) == "ktm" then 
lock_phon = 'بالكتم •'    
elseif database:get(bot_id.."lock:Contact"..msg.chat_id_) == "kick" then 
lock_phon = 'بالطرد •'    
else
lock_phon = '✘'    
end    
if database:get(bot_id.."lock:Link"..msg.chat_id_) == "del" then
lock_links = '✓'
elseif database:get(bot_id.."lock:Link"..msg.chat_id_) == "ked" then
lock_links = 'بالتقيد •'    
elseif database:get(bot_id.."lock:Link"..msg.chat_id_) == "ktm" then
lock_links = 'بالكتم •'    
elseif database:get(bot_id.."lock:Link"..msg.chat_id_) == "kick" then
lock_links = 'بالطرد •'    
else
lock_links = '✘'    
end
if database:get(bot_id.."lock:Cmd"..msg.chat_id_) == "del" then
lock_cmds = '✓'
elseif database:get(bot_id.."lock:Cmd"..msg.chat_id_) == "ked" then
lock_cmds = 'بالتقيد •'    
elseif database:get(bot_id.."lock:Cmd"..msg.chat_id_) == "ktm" then
lock_cmds = 'بالكتم •'   
elseif database:get(bot_id.."lock:Cmd"..msg.chat_id_) == "kick" then
lock_cmds = 'بالطرد •'    
else
lock_cmds = '✘'    
end
if database:get(bot_id.."lock:user:name"..msg.chat_id_) == "del" then
lock_user = '✓'
elseif database:get(bot_id.."lock:user:name"..msg.chat_id_) == "ked" then
lock_user = 'بالتقيد •'    
elseif database:get(bot_id.."lock:user:name"..msg.chat_id_) == "ktm" then
lock_user = 'بالكتم •'    
elseif database:get(bot_id.."lock:user:name"..msg.chat_id_) == "kick" then
lock_user = 'بالطرد •'    
else
lock_user = '✘'    
end
if database:get(bot_id.."lock:hashtak"..msg.chat_id_) == "del" then
lock_hash = '✓'
elseif database:get(bot_id.."lock:hashtak"..msg.chat_id_) == "ked" then 
lock_hash = 'بالتقيد •'    
elseif database:get(bot_id.."lock:hashtak"..msg.chat_id_) == "ktm" then 
lock_hash = 'بالكتم •'    
elseif database:get(bot_id.."lock:hashtak"..msg.chat_id_) == "kick" then 
lock_hash = 'بالطرد •'    
else
lock_hash = '✘'    
end
if database:get(bot_id.."lock:vico"..msg.chat_id_) == "del" then
lock_muse = '✓'
elseif database:get(bot_id.."lock:vico"..msg.chat_id_) == "ked" then 
lock_muse = 'بالتقيد •'    
elseif database:get(bot_id.."lock:vico"..msg.chat_id_) == "ktm" then 
lock_muse = 'بالكتم •'    
elseif database:get(bot_id.."lock:vico"..msg.chat_id_) == "kick" then 
lock_muse = 'بالطرد •'    
else
lock_muse = '✘'    
end 
if database:get(bot_id.."lock:Video"..msg.chat_id_) == "del" then
lock_ved = '✓'
elseif database:get(bot_id.."lock:Video"..msg.chat_id_) == "ked" then 
lock_ved = 'بالتقيد •'    
elseif database:get(bot_id.."lock:Video"..msg.chat_id_) == "ktm" then 
lock_ved = 'بالكتم •'    
elseif database:get(bot_id.."lock:Video"..msg.chat_id_) == "kick" then 
lock_ved = 'بالطرد •'    
else
lock_ved = '✘'    
end
if database:get(bot_id.."lock:Animation"..msg.chat_id_) == "del" then
lock_gif = '✓'
elseif database:get(bot_id.."lock:Animation"..msg.chat_id_) == "ked" then 
lock_gif = 'بالتقيد •'    
elseif database:get(bot_id.."lock:Animation"..msg.chat_id_) == "ktm" then 
lock_gif = 'بالكتم •'    
elseif database:get(bot_id.."lock:Animation"..msg.chat_id_) == "kick" then 
lock_gif = 'بالطرد •'    
else
lock_gif = '✘'    
end
if database:get(bot_id.."lock:Sticker"..msg.chat_id_) == "del" then
lock_ste = '✓'
elseif database:get(bot_id.."lock:Sticker"..msg.chat_id_) == "ked" then 
lock_ste = 'بالتقيد •'    
elseif database:get(bot_id.."lock:Sticker"..msg.chat_id_) == "ktm" then 
lock_ste = 'بالكتم •'    
elseif database:get(bot_id.."lock:Sticker"..msg.chat_id_) == "kick" then 
lock_ste = 'بالطرد •'    
else
lock_ste = '✘'    
end
if database:get(bot_id.."lock:geam"..msg.chat_id_) == "del" then
lock_geam = '✓'
elseif database:get(bot_id.."lock:geam"..msg.chat_id_) == "ked" then 
lock_geam = 'بالتقيد •'    
elseif database:get(bot_id.."lock:geam"..msg.chat_id_) == "ktm" then 
lock_geam = 'بالكتم •'    
elseif database:get(bot_id.."lock:geam"..msg.chat_id_) == "kick" then 
lock_geam = 'بالطرد •'    
else
lock_geam = '✘'    
end    
if database:get(bot_id.."lock:vico"..msg.chat_id_) == "del" then
lock_vico = '✓'
elseif database:get(bot_id.."lock:vico"..msg.chat_id_) == "ked" then 
lock_vico = 'بالتقيد •'    
elseif database:get(bot_id.."lock:vico"..msg.chat_id_) == "ktm" then 
lock_vico = 'بالكتم •'    
elseif database:get(bot_id.."lock:vico"..msg.chat_id_) == "kick" then 
lock_vico = 'بالطرد •'    
else
lock_vico = '✘'    
end    
if database:get(bot_id.."lock:Keyboard"..msg.chat_id_) == "del" then
lock_inlin = '✓'
elseif database:get(bot_id.."lock:Keyboard"..msg.chat_id_) == "ked" then 
lock_inlin = 'بالتقيد •'
elseif database:get(bot_id.."lock:Keyboard"..msg.chat_id_) == "ktm" then 
lock_inlin = 'بالكتم •'    
elseif database:get(bot_id.."lock:Keyboard"..msg.chat_id_) == "kick" then 
lock_inlin = 'بالطرد •'
else
lock_inlin = '✘'
end
if database:get(bot_id.."lock:forward"..msg.chat_id_) == "del" then
lock_fwd = '✓'
elseif database:get(bot_id.."lock:forward"..msg.chat_id_) == "ked" then 
lock_fwd = 'بالتقيد •'    
elseif database:get(bot_id.."lock:forward"..msg.chat_id_) == "ktm" then 
lock_fwd = 'بالكتم •'    
elseif database:get(bot_id.."lock:forward"..msg.chat_id_) == "kick" then 
lock_fwd = 'بالطرد •'    
else
lock_fwd = '✘'    
end    
if database:get(bot_id.."lock:Document"..msg.chat_id_) == "del" then
lock_file = '✓'
elseif database:get(bot_id.."lock:Document"..msg.chat_id_) == "ked" then 
lock_file = 'بالتقيد •'    
elseif database:get(bot_id.."lock:Document"..msg.chat_id_) == "ktm" then 
lock_file = 'بالكتم •'    
elseif database:get(bot_id.."lock:Document"..msg.chat_id_) == "kick" then 
lock_file = 'بالطرد •'    
else
lock_file = '✘'    
end    
if database:get(bot_id.."lock:Unsupported"..msg.chat_id_) == "del" then
lock_self = '✓'
elseif database:get(bot_id.."lock:Unsupported"..msg.chat_id_) == "ked" then 
lock_self = 'بالتقيد •'    
elseif database:get(bot_id.."lock:Unsupported"..msg.chat_id_) == "ktm" then 
lock_self = 'بالكتم •'    
elseif database:get(bot_id.."lock:Unsupported"..msg.chat_id_) == "kick" then 
lock_self = 'بالطرد •'    
else
lock_self = '✘'    
end
if database:get(bot_id.."lock:Bot:kick"..msg.chat_id_) == 'del' then
lock_bots = '✓'
elseif database:get(bot_id.."lock:Bot:kick"..msg.chat_id_) == 'ked' then
lock_bots = 'بالتقيد •'   
elseif database:get(bot_id.."lock:Bot:kick"..msg.chat_id_) == 'kick' then
lock_bots = 'بالطرد •'    
else
lock_bots = '✘'    
end
if database:get(bot_id.."lock:Markdaun"..msg.chat_id_) == "del" then
lock_mark = '✓'
elseif database:get(bot_id.."lock:Markdaun"..msg.chat_id_) == "ked" then 
lock_mark = 'بالتقيد •'    
elseif database:get(bot_id.."lock:Markdaun"..msg.chat_id_) == "ktm" then 
lock_mark = 'بالكتم •'    
elseif database:get(bot_id.."lock:Markdaun"..msg.chat_id_) == "kick" then 
lock_mark = 'بالطرد •'    
else
lock_mark = '✘'    
end
if database:get(bot_id.."lock:Spam"..msg.chat_id_) == "del" then    
lock_spam = '✓'
elseif database:get(bot_id.."lock:Spam"..msg.chat_id_) == "ked" then 
lock_spam = 'بالتقيد •'    
elseif database:get(bot_id.."lock:Spam"..msg.chat_id_) == "ktm" then 
lock_spam = 'بالكتم •'    
elseif database:get(bot_id.."lock:Spam"..msg.chat_id_) == "kick" then 
lock_spam = 'بالطرد •'    
else
lock_spam = '✘'    
end        
if not database:get(bot_id..'Reply:Manager'..msg.chat_id_) then
rdmder = '✓'
else
rdmder = '✘'
end
if not database:get(bot_id..'Reply:Sudo'..msg.chat_id_) then
rdsudo = '✓'
else
rdsudo = '✘'
end
if not database:get(bot_id..'Bot:Id'..msg.chat_id_)  then
idgp = '✓'
else
idgp = '✘'
end
if not database:get(bot_id..'Bot:Id:Photo'..msg.chat_id_) then
idph = '✓'
else
idph = '✘'
end
if not database:get(bot_id..'Lock:kick'..msg.chat_id_)  then
setadd = '✓'
else
setadd = '✘'
end
if not database:get(bot_id..'Lock:Add:Bot'..msg.chat_id_)  then
banm = '✓'
else
banm = '✘'
end
if not database:get(bot_id..'Added:Me'..msg.chat_id_) then
addme = '✓'
else
addme = '✘'
end
if not database:get(bot_id..'Seh:User'..msg.chat_id_) then
sehuser = '✓'
else
sehuser = '✘'
end
if not database:get(bot_id..'Cick:Me'..msg.chat_id_) then
kickme = '✓'
else
kickme = '✘'
end
NUM_MSG_MAX = database:hget(bot_id.."flooding:settings:"..msg.chat_id_,"floodmax") or 0
local text = 
'\n • اعدادات المجموعه كتالي √↓'..
'\n *܀⠤⠤⠤⠤⠤⠤܀ٴ*'..
'\n علامة ال {✓} تعني معطل'..
'\n علامة ال {✘} تعني مفعل'..
'\n *܀⠤⠤⠤⠤⠤⠤܀ٴ*'..
'\n •  الروابط > { '..lock_links..
' }\n'..'• المعرفات > { '..lock_user..
' }\n'..'• التاك > { '..lock_hash..
' }\n'..'• البوتات > { '..lock_bots..
' }\n'..'•التوجيه > { '..lock_fwd..
' }\n'..'•التثبيت > { '..lock_pin..
' }\n'..'• الاشعارات > { '..lock_tagservr..
' }\n'..'• الماركدون > { '..lock_mark..
' }\n'..'• التعديل > { '..lock_edit..
' }\n'..'• تعديل الميديا > { '..lock_edit_med..
' }\n *܀⠤⠤⠤⠤⠤⠤܀ٴ*'..
'\n'..' الكلايش > { '..lock_spam..
' }\n'..' الكيبورد > { '..lock_inlin..
' }\n'..' الاغاني > { '..lock_vico..
' }\n'..' المتحركه > { '..lock_gif..
' }\n'..' الملفات > { '..lock_file..
' }\n'..' الدردشه > { '..lock_text..
' }\n'..' الفيديو > { '..lock_ved..
' }\n'..' الصور > { '..lock_photo..
' }\n *܀⠤⠤⠤⠤⠤⠤܀ٴ*'..
'\n'..'• الصوت > { '..lock_muse..
' }\n'..'• الملصقات > { '..lock_ste..
' }\n'..'• الجهات > { '..lock_phon..
' }\n'..'• الدخول > { '..lock_join..
' }\n'..'• الاضافه > { '..lock_add..
' }\n'..'• السيلفي > { '..lock_self..
' }\n'..'• الالعاب > { '..lock_geam..
' }\n'..'• التكرار > { '..flood..
' }\n'..'• الترحيب > { '..welcome..
' }\n'..'• عدد التكرار > { '..NUM_MSG_MAX..
' }\n *܀⠤⠤⠤⠤⠤⠤܀ٴ*'..
'\n• علامة ال {✓} تعني مفعل'..
'\n• علامة ال {✘} تعني معطل'..
'\n *܀⠤⠤⠤⠤⠤⠤܀ٴ*'..
'\n'..'• امر صيح > { '..kickme..
' }\n'..'• امر اطردني > { '..sehuser..
' }\n'..'•امر منو ضافني > { '..addme..
' }\n'..'• الردود > { '..rdmder..
' }\n'..'• ردود العامه > { '..rdsudo..
' }\n'..'• الايدي > { '..idgp..
' }\n'..'• الايدي بالصوره > { '..idph..
' }\n'..'• الرفع > { '..setadd..
' }\n'..'• الحظر > { '..banm..' }\n\n *܀⠤⠤⠤⠤⠤⠤܀ٴ*\n•[REVOR](t.me/UU_KFUF) \n'
send(msg.chat_id_, msg.id_,text)     
end    
if text ==('تثبيت') and msg.reply_to_message_id_ ~= 0 and Mod(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
if database:sismember(bot_id..'lock:pin',msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_,msg.id_," التثبيت والغاء التثبيت تم قفله من قبل المنشئين")  
return false  
end
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.reply_to_message_id_,disable_notification_ = 1},function(arg,data) 
if data.ID == "Ok" then
send(msg.chat_id_, msg.id_,"• تم تثبيت الرسال")   
database:set(bot_id..'Pin:Id:Msg'..msg.chat_id_,msg.reply_to_message_id_)
elseif data.code_ == 6 then
send(msg.chat_id_,msg.id_,"• انا لست ادمن هنا يرجى ترقيتي ادمن ثم اعد المحاوله")  
elseif data.message_ == "CHAT_NOT_MODIFIED" then
send(msg.chat_id_,msg.id_,"• لا توجد رساله مثبته")  
elseif data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"• ليست لدي صلاحية التثبيت يرجى التحقق من الصلاحيات")  
end
end,nil) 
end
if text == 'الغاء التثبيت' and Mod(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎?? black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
if database:sismember(bot_id..'lock:pin',msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_,msg.id_," التثبيت والغاء التثبيت تم قفله من قبل المنشئين")  
return false  
end
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100','')},function(arg,data) 
if data.ID == "Ok" then
send(msg.chat_id_, msg.id_,"• تم الغاء تثبيت الرساله")   
database:del(bot_id..'Pin:Id:Msg'..msg.chat_id_)
elseif data.code_ == 6 then
send(msg.chat_id_,msg.id_,"• انا لست ادمن هنا يرجى ترقيتي ادمن ثم اعد المحاوله")  
elseif data.message_ == "CHAT_NOT_MODIFIED" then
send(msg.chat_id_,msg.id_,"• لا توجد رساله مثبته")  
elseif data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_," ليست لدي صلاحية التثبيت يرجى التحقق من الصلاحيات")  
end
end,nil)
end

if text == 'الغاء تثبيت الكل' and Mod(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎?? black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
if database:sismember(bot_id..'lock:pin',msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_,msg.id_," التثبيت والغاء التثبيت تم قفله من قبل المنشئين")  
return false  
end
local url , res = https.request('https://api.telegram.org/bot'..token..'/unpinAllChatMessages?chat_id='..msg.chat_id_)
if res == 200 then
send(msg.chat_id_, msg.id_,"• تم الغاء تثبيت كل الرسائل المثبته")   
database:del(bot_id..'Pin:Id:Msg'..msg.chat_id_)
elseif res == 400 then
send(msg.chat_id_,msg.id_,"• انا لست ادمن هنا يرجى ترقيتي ادمن او ليست لدي صلاحية التثبيت يرجى التحقق من الصلاحيات ثم اعد المحاوله")  
end
end

if text and text:match('^ضع تكرار (%d+)$') and Mod(msg) then   
local Num = text:match('ضع تكرار (.*)')
database:hset(bot_id.."flooding:settings:"..msg.chat_id_ ,"floodmax" ,Num) 
send(msg.chat_id_, msg.id_,'• تم وضع عدد التكرار ('..Num..')')  
end 
if text and text:match('^ضع زمن التكرار (%d+)$') and Mod(msg) then   
local Num = text:match('^ضع زمن التكرار (%d+)$')
database:hset(bot_id.."flooding:settings:"..msg.chat_id_ ,"floodtime" ,Num) 
send(msg.chat_id_, msg.id_,'• تم وضع زمن التكرار ('..Num..')') 
end
if text == "ضع رابط" or text == 'وضع رابط' then
if msg.reply_to_message_id_ == 0  and Mod(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆??𝒄𝒐𝒎𝒆 𝒏??𝒈𝒈𝒂 •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
send(msg.chat_id_,msg.id_,"• ارسل رابط المجموعه او رابط قناة المجموعه")
database:setex(bot_id.."Set:Priovate:Group:Link"..msg.chat_id_..""..msg.sender_user_id_,120,true) 
return false
end
end
if text == "تفعيل رابط" or text == 'تفعيل الرابط' then
if Mod(msg) then  
database:set(bot_id.."Link_Group:status"..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,"• تم تفعيل الرابط") 
return false  
end
end
if text == "تعطيل رابط" or text == 'تعطيل الرابط' then
if Mod(msg) then  
database:del(bot_id.."Link_Group:status"..msg.chat_id_) 
send(msg.chat_id_, msg.id_,"• تم تعطيل الرابط") 
return false end
end
if text == "تفعيل صورتي" or text == 'تفعيل الصوره' then
if Mod(msg) then  
database:set(bot_id.."my_photo:status"..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,"• تم تفعيل الصوره") 
return false  
end
end
if text == "تعطيل الصوره" or text == 'تعطيل صورتي' then
if Mod(msg) then  
database:del(bot_id.."my_photo:status"..msg.chat_id_) 
send(msg.chat_id_, msg.id_,"• تم تعطيل الصوره") 
return false end
end
if text == "الرابط" then 
local status_Link = database:get(bot_id.."Link_Group:status"..msg.chat_id_)
if not status_Link then
send(msg.chat_id_, msg.id_,"• الرابط معطل") 
return false  
end
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,ta) 
local link = database:get(bot_id.."Private:Group:Link"..msg.chat_id_)            
if link then                              
send(msg.chat_id_,msg.id_,' ['..ta.title_..']('..link..')')                          
else                
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if linkgpp.ok == true then 
linkgp = ' ['..ta.title_..']('..linkgpp.result..')'
else
linkgp = '• لا يوجد رابط ارسل ضع رابط'
end  
send(msg.chat_id_, msg.id_,linkgp)              
end            
 end,nil)
end
if text == 'مسح الرابط' or text == 'حذف الرابط' then
if Mod(msg) then     
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
send(msg.chat_id_,msg.id_," تم مسح الرابط•")           
database:del(bot_id.."Private:Group:Link"..msg.chat_id_) 
return false      
end
end
if text and text:match("^ضع صوره") and Mod(msg) and msg.reply_to_message_id_ == 0 then  
database:set(bot_id..'Change:Chat:Photo'..msg.chat_id_..':'..msg.sender_user_id_,true) 
send(msg.chat_id_, msg.id_,'• ارسل لي الصوره') 
return false
end
if text == "حذف الصوره" or text == "مسح الصوره" then 
if Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
https.request('https://api.telegram.org/bot'..token..'/deleteChatPhoto?chat_id='..msg.chat_id_) 
send(msg.chat_id_, msg.id_,'• تم ازالة صورة المجموعه') 
end
return false  
end
if text == 'ضع وصف' or text == 'وضع وصف' then  
if Mod(msg) then
database:setex(bot_id.."Set:Description" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 120, true)  
send(msg.chat_id_, msg.id_,'• ارسل الان الوصف')
end
return false  
end
if text == 'ضع ترحيب' or text == 'وضع ترحيب' then  
if Mod(msg) then
database:setex(bot_id.."Welcome:Group" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 120, true)  
t  = '• ارسل لي الترحيب الان'
tt = '\n تستطيع اضافة مايلي !\n• دالة عرض الاسم >{`name`}\n دالة عرض المعرف >{`user`}'
send(msg.chat_id_, msg.id_,t..tt) 
end
return false  
end
if text == 'الترحيب' and Mod(msg) then 
local GetWelcomeGroup = database:get(bot_id..'Get:Welcome:Group'..msg.chat_id_)  
if GetWelcomeGroup then 
GetWelcome = GetWelcomeGroup
else 
GetWelcome = ' لم يتم تعيين ترحيب للمجموعه'
end 
send(msg.chat_id_, msg.id_,'['..GetWelcome..']') 
return false  
end
if text == 'تفعيل الترحيب' and Mod(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
database:set(bot_id..'Chek:Welcome'..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,'• تم تفعيل ترحيب المجموعه') 
return false  
end
if text == 'تعطيل الترحيب' and Mod(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
database:del(bot_id..'Chek:Welcome'..msg.chat_id_) 
send(msg.chat_id_, msg.id_,'• تم تعطيل ترحيب المجموعه') 
return false  
end
if text == 'مسح الترحيب' or text == 'حذف الترحيب' then 
if Mod(msg) then
database:del(bot_id..'Get:Welcome:Group'..msg.chat_id_) 
send(msg.chat_id_, msg.id_,' تم ازالة ترحيب المجموعه') 
end
end
if text and text == "منع" and msg.reply_to_message_id_ == 0 and Manager(msg)  then       
send(msg.chat_id_, msg.id_,"•ارسل الكلمه لمنعها")  
database:set(bot_id.."MODEDEV1:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_,"rep")  
return false  
end    
if text then   
local tsssst = database:get(bot_id.."MODEDEV1:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
if tsssst == "rep" then   
send(msg.chat_id_, msg.id_,"ارسل التحذير عند ارسال الكلمه")  
database:set(bot_id.."MODEDEV1:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_,"repp")  
database:set(bot_id.."MODEDEV1:filtr1:add:reply2"..msg.sender_user_id_..msg.chat_id_, text)  
database:sadd(bot_id.."MODEDEV1:List:Filter"..msg.chat_id_,text)  
return false  end  
end
if text then  
local test = database:get(bot_id.."MODEDEV1:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
if test == "repp" then  
send(msg.chat_id_, msg.id_,"•تم منع الكلمه مع التحذير")  
database:del(bot_id.."MODEDEV1:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
local test = database:get(bot_id.."MODEDEV1:filtr1:add:reply2"..msg.sender_user_id_..msg.chat_id_)  
if text then   
database:set(bot_id.."MODEDEV1:Add:Filter:Rp2"..test..msg.chat_id_, text)  
end  
database:del(bot_id.."MODEDEV1:filtr1:add:reply2"..msg.sender_user_id_..msg.chat_id_)  
return false  end  
end

if text == "الغاء منع" and msg.reply_to_message_id_ == 0 and Manager(msg) then    
send(msg.chat_id_, msg.id_,"•ارسل الكلمه الان")  
database:set(bot_id.."MODEDEV1:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_,"reppp")  
return false  end
if text then 
local test = database:get(bot_id.."MODEDEV1:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
if test and test == "reppp" then   
send(msg.chat_id_, msg.id_,"•تم الغاء منعها ")  
database:del(bot_id.."MODEDEV1:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
database:del(bot_id.."MODEDEV1:Add:Filter:Rp2"..text..msg.chat_id_)  
database:srem(bot_id.."MODEDEV1:List:Filter"..msg.chat_id_,text)  
return false  end  
end


if text == 'منع' and tonumber(msg.reply_to_message_id_) > 0 and Manager(msg) then     
function cb(a,b,c) 
textt = '•تم منع '
if b.content_.sticker_ then
local idsticker = b.content_.sticker_.set_id_
database:sadd(bot_id.."filtersteckr"..msg.chat_id_,idsticker)
text = 'الملصق'
send(msg.chat_id_, msg.id_,textt..'( '..text..' ) بنجاح لن يتم ارسالها مجددا')  
return false
end
if b.content_.ID == "MessagePhoto" then
local photo = b.content_.photo_.id_
database:sadd(bot_id.."filterphoto"..msg.chat_id_,photo)
text = 'الصوره'
send(msg.chat_id_, msg.id_,textt..'( '..text..' ) بنجاح لن يتم ارسالها مجددا')  
return false
end
if b.content_.animation_.animation_ then
local idanimation = b.content_.animation_.animation_.persistent_id_
database:sadd(bot_id.."filteranimation"..msg.chat_id_,idanimation)
text = 'المتحركه'
send(msg.chat_id_, msg.id_,textt..'( '..text..' ) بنجاح لن يتم ارسالها مجددا')  
return false
end
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, cb, nil)
end
if text == 'الغاء منع' and tonumber(msg.reply_to_message_id_) > 0 and Manager(msg) then     
function cb(a,b,c) 
textt = '• تم الغاء منع '
if b.content_.sticker_ then
local idsticker = b.content_.sticker_.set_id_
database:srem(bot_id.."filtersteckr"..msg.chat_id_,idsticker)
text = 'الملصق'
send(msg.chat_id_, msg.id_,textt..'( '..text..' ) بنجاح يمكنهم الارسال الان')  
return false
end
if b.content_.ID == "MessagePhoto" then
local photo = b.content_.photo_.id_
database:srem(bot_id.."filterphoto"..msg.chat_id_,photo)
text = 'الصوره'
send(msg.chat_id_, msg.id_,textt..'( '..text..' ) بنجاح يمكنهم الارسال الان')  
return false
end
if b.content_.animation_.animation_ then
local idanimation = b.content_.animation_.animation_.persistent_id_
database:srem(bot_id.."filteranimation"..msg.chat_id_,idanimation)
text = 'المتحركه'
send(msg.chat_id_, msg.id_,textt..'( '..text..' ) بنجاح يمكنهم الارسال الان')  
return false
end
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, cb, nil)
end

if text == "مسح قائمه المنع"and Manager(msg) then   
local list = database:smembers(bot_id.."MODEDEV1:List:Filter"..msg.chat_id_)  
for k,v in pairs(list) do  
database:del(bot_id.."MODEDEV1:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
database:del(bot_id.."MODEDEV1:Add:Filter:Rp2"..v..msg.chat_id_)  
database:srem(bot_id.."MODEDEV1:List:Filter"..msg.chat_id_,v)  
end  
send(msg.chat_id_, msg.id_,"•تم مسح قائمه المنع")  
end

if text == "قائمه المنع" and Manager(msg) then   
local list = database:smembers(bot_id.."MODEDEV1:List:Filter"..msg.chat_id_)  
t = "\n•قائمة المنع \n *܀⠤⠤⠤⠤⠤⠤܀ٴ*\n"
for k,v in pairs(list) do  
local MODEDEV_Msg = database:get(bot_id.."MODEDEV1:Add:Filter:Rp2"..v..msg.chat_id_)   
t = t..""..k.."- "..v.." > {"..MODEDEV_Msg.."}\n"    
end  
if #list == 0 then  
t = "•لا يوجد كلمات ممنوعه"  
end  
send(msg.chat_id_, msg.id_,t)  
end  

if text == 'مسح قائمه منع المتحركات' and Manager(msg) then     
database:del(bot_id.."filteranimation"..msg.chat_id_)
send(msg.chat_id_, msg.id_,'• تم مسح قائمه منع المتحركات')  
end
if text == 'مسح قائمه منع الصور' and Manager(msg) then     
database:del(bot_id.."filterphoto"..msg.chat_id_)
send(msg.chat_id_, msg.id_,'• تم مسح قائمه منع الصور')  
end
if text == 'مسح قائمه منع الملصقات' and Manager(msg) then     
database:del(bot_id.."filtersteckr"..msg.chat_id_)
send(msg.chat_id_, msg.id_,'• تم مسح قائمه منع الملصقات')  
end
if text == 'المطور' or text == 'مطور' or text == 'المٌطـور' then
local Text_Dev = database:get(bot_id..'Text:Dev:Bot')
if Text_Dev then 
send(msg.chat_id_, msg.id_,Text_Dev)
else
tdcli_function ({ID = "GetUser",user_id_ = SUDO},function(arg,result) 
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
sendText(msg.chat_id_,Name,msg.id_/2097152/0.5,'md')
end,nil)
end
end

if text == 'حذف كليشه المطور' and SudoBot(msg) then
database:del(bot_id..'Text:Dev:Bot')
send(msg.chat_id_, msg.id_,'• تم حذف كليشه المطور')
end
if text == 'ضع كليشه المطور' and SudoBot(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
database:set(bot_id..'Set:Text:Dev:Bot'..msg.chat_id_,true)
send(msg.chat_id_, msg.id_,' ارسل الكليشه الان')
return false
end
if text and database:get(bot_id..'Set:Text:Dev:Bot'..msg.chat_id_) then
if text == 'الغاء' then 
database:del(bot_id..'Set:Text:Dev:Bot'..msg.chat_id_)
send(msg.chat_id_, msg.id_,' تم الغاء حفظ كليشة المطور')
return false
end
database:set(bot_id..'Text:Dev:Bot',text)
database:del(bot_id..'Set:Text:Dev:Bot'..msg.chat_id_)
send(msg.chat_id_, msg.id_,' تم حفظ كليشه المطور')
return false
end

if text == 'تعين الايدي' and Manager(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black  •\n• لايمكنك استخدام البوت  •\n• عليك الاشتراك في القناة  •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:setex(bot_id.."CHENG:ID"..msg.chat_id_..""..msg.sender_user_id_,240,true)  
local Text= [[
> 
•يمكنك اضافة
• `#تعليق` تعليق الصوره
• `#يوزرك`   اسم المستخدم
• `#رسائلك`   عدد رسائل المستخدم
• `#صورك`   عدد صور المستخدم
• `#ايدي`   ايدي المستخدم
• `#تفاعلك`   تفاعل المستخدم
• `#رتبتك`   موقع المستخدم
• `#تعديلاتك`   عدد السحكات 
• `#نقاطك` نقاطك
*܀⠤⠤⠤⠤⠤⠤܀ٴ*
ارسل تغير الايدي لتغير ايدي جديد
𝘊𝘩 - [ 𝘪𝘋](t.me/ll_ll_X)•
]]
send(msg.chat_id_, msg.id_,Text)
return false  
elseif text == 'تغير الايدي' and Mod(msg) then 
local List = {
[[
゠𝚄𝚂𝙴𝚁 𖨈 #يوزرك 𖥲 .
゠𝙼𝚂𝙶 𖨈 #رسائلك 𖥲 .
゠𝚂𝚃𝙰 𖨈 #رتبتك 𖥲 .
゠𝙸𝙳 𖨈 #ايدي 𖥲 .
]],
[[
-›   𝚄𝚂𝙴𝚁𝙽𝙰𝙼𝙴 ¦ #يوزرك .
-›   𝙸𝙳 ¦ #ايدي .
-›   𝚂𝚃𝙰𝚂𝚃 ¦ #رتبتك .
-›   𝙼𝚂𝙶𝚂 ¦ #رسائلك .
]],
[[
⌯  𝗨𝗦𝗘𝗥𝗡𝗮𝗺𝗘 . #يوزرك 🇺🇸 -
⌯  𝗦𝗧𝗮𝗦𝗧 . #رتبتك 🇺🇸 -
⌯ 𝗜𝗗 . #ايدي 🇺🇸 -
⌯ 𝗚𝗮𝗺𝗘𝗦 . #نقاطك 🇺🇸 -
⌯ 𝗺𝗦𝗚𝗦 . #رسائلك 🇺🇸 -
]],
[[
┌ 𝐔𝐒𝐄𝐑 𖤱 #يوزرك 𖦴 .
├ 𝐌𝐒𝐆 𖤱 #رسائلك 𖦴 .
├ 𝐒𝐓𝐀 𖤱 #رتبتك 𖦴 .
└ 𝐈𝐃 𖤱 #ايدي 𖦴 .
]],
[[
➞: 𝒔𝒕𝒂𓂅 #رتبتك 𓍯➸💞.
➞: 𝒖𝒔𝒆𝒓𓂅 #يوزرك 𓍯➸💞.
➞: 𝒎𝒔𝒈𝒆𓂅 #رسائلك 𓍯➸💞.
➞: 𝒊𝒅 𓂅 #ايدي 𓍯➸💞.
]],
[[
☆•𝐮𝐬𝐞𝐫 : #يوزرك 𖣬  
☆•𝐦𝐬𝐠  : #رسائلك 𖣬 
☆•𝐬𝐭𝐚 : #رتبتك 𖣬 
☆•𝐢𝐝  : #ايدي 𖣬
]],
[[
- 𓏬 𝐔𝐬𝐄𝐫 : #يوزرك 𓂅 .
- 𓏬 𝐌𝐬𝐆  : #رسائلك 𓂅 .
- 𓏬 𝐒𝐭𝐀 : #رتبتك 𓂅 .
- 𓏬 𝐈𝐃 : #ايدي 𓂅 .
]],
[[
ᯓ 𝗨𝗦𝗘𝗥𝗡𝗮𝗺𝗘  #يوزرك 🇺🇸 ꙰
ᯓ 𝗦𝗧𝗮𝗦𝗧  #رتبتك 🇺🇸 ꙰
ᯓ 𝗜𝗗  #ايدي 🇺🇸 ꙰
ᯓ 𝗚𝗮𝗺𝗘𝗦  #نقاطك 🇺🇸 ꙰
ᯓ 𝗺𝗦𝗚𝗦  #رسائلك 🇺🇸 ꙰
ᯓ 𝙥𝙝𝙤𝙩𝙤𝙨  #صورك 🇺🇸 ꙰
ᯓ 𝙖𝙪𝙩𝙤  #تفاعلك 🇺🇸 ꙰
ᯓ 𝙚𝙙𝙞𝙩  #تعديلاتك 🇺🇸 ꙰
]],
[[
𝚄𝚜𝚎𝚛 ✯ #يوزرك  
𝚂𝚝𝚊  ✯ #رتبتك  
𝙸𝚍   ✯ #ايدي  
𝙼𝚜𝚐𝚎 ✯ #رسائلك
]],
[[
.𖣂 𝙪𝙨𝙚𝙧𝙣𝙖𝙢𝙚 , #يوزرك  
.𖣂 𝙨𝙩𝙖𝙨𝙩 , #رتبتك  
.𖣂 𝙡𝘿 , #ايدي  
.𖣂 𝙂𝙖𝙢𝙨 , #نقاطك 
.𖣂 𝙢𝙨𝙂𝙨 , #رسائلك
]]}
local Text_Rand = List[math.random(#List)]
database:set(bot_id.."KLISH:ID"..msg.chat_id_,Text_Rand)
send(msg.chat_id_, msg.id_,'•تم تغيير الايدي بنجاح ✓')
end
if text == 'حذف الايدي' or text == 'مسح الايدي' then
if Manager(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black ?? •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة ?? •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'⚜️]')
end
return false
end
database:del(bot_id.."KLISH:ID"..msg.chat_id_)
send(msg.chat_id_, msg.id_, '•تم ازالة كليشة الايدي')
end 
return false  
end 
if database:get(bot_id.."CHENG:ID"..msg.chat_id_..""..msg.sender_user_id_) then 
if text == 'الغاء' then 
send(msg.chat_id_, msg.id_,"•تم الغاء تعين الايدي") 
database:del(bot_id.."CHENG:ID"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
database:del(bot_id.."CHENG:ID"..msg.chat_id_..""..msg.sender_user_id_) 
local CHENGER_ID = text:match("(.*)")  
database:set(bot_id.."KLISH:ID"..msg.chat_id_,CHENGER_ID)
send(msg.chat_id_, msg.id_,'•تم تعين الايدي بنجاح')    
end
if text == 'وبتبتب' or text == 'مسح البوتات' and Mod(msg) then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
tdcli_function ({ ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID,filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,tah)  
local admins = tah.members_  
local x = 0
local c = 0
for i=0 , #admins do 
if tah.members_[i].status_.ID == "ChatMemberStatusEditor" then  
x = x + 1 
end
if tonumber(admins[i].user_id_) ~= tonumber(bot_id) then
chat_kick(msg.chat_id_,admins[i].user_id_)
end
c = c + 1
end     
if (c - x) == 0 then
send(msg.chat_id_, msg.id_, "• لا توجد بوتات في المجموعه")
else
local t = '• عدد البوتات هنا >> {'..c..'}\n عدد البوتات التي هي ادمن >> {'..x..'}\n• تم طرد >> {'..(c - x)..'} من البوتات'
send(msg.chat_id_, msg.id_,t) 
end 
end,nil)  
end   
end
if text == ("كشف البوتات") and Mod(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
tdcli_function ({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID,filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(extra,result,success)
local admins = result.members_  
text = "\n قائمة البوتات الموجوده \n *܀⠤⠤⠤⠤⠤⠤܀ٴ*\n"
local n = 0
local t = 0
for i=0 , #admins do 
n = (n + 1)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_
},function(arg,ta) 
if result.members_[i].status_.ID == "ChatMemberStatusMember" then  
tr = ''
elseif result.members_[i].status_.ID == "ChatMemberStatusEditor" then  
t = t + 1
tr = ' {★}'
end
text = text..">> [@"..ta.username_..']'..tr.."\n"
if #admins == 0 then
send(msg.chat_id_, msg.id_, "• لا توجد بوتات في المجموعه")
return false 
end
if #admins == i then 
local a = '\n *܀⠤⠤⠤⠤⠤⠤܀ٴ*\n عدد البوتات التي هنا >> {'..n..'} بوت\n'
local f = '• عدد البوتات التي هي ادمن >> {'..t..'}\n• ملاحضه علامة ال (✯) تعني ان البوت ادمن \n'
send(msg.chat_id_, msg.id_, text..a..f)
end
end,nil)
end
end,nil)
end

if database:get(bot_id.."Set:Rules:" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'الغاء' then 
send(msg.chat_id_, msg.id_, " تم الغاء حفظ القوانين") 
database:del(bot_id.."Set:Rules:" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
return false  
end 
database:set(bot_id.."Set:Rules:Group" .. msg.chat_id_,text) 
send(msg.chat_id_, msg.id_," تم حفظ قوانين المجموعه") 
database:del(bot_id.."Set:Rules:" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
end  

if text == 'ضع قوانين' or text == 'وضع قوانين' then 
if Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
database:setex(bot_id.."Set:Rules:" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_,msg.id_,"• ارسل لي القوانين الان")  
end
end
if text == 'مسح القوانين' or text == 'حذف القوانين' then  
if Mod(msg) then
send(msg.chat_id_, msg.id_,"• تم ازالة قوانين المجموعه")  
database:del(bot_id.."Set:Rules:Group"..msg.chat_id_) 
end
end
if text == 'القوانين' then 
local Set_Rules = database:get(bot_id.."Set:Rules:Group" .. msg.chat_id_)   
if Set_Rules then     
send(msg.chat_id_,msg.id_, Set_Rules)   
else      
send(msg.chat_id_, msg.id_," لا توجد قوانين هنا")   
end    
end
if text == 'تفعيل الحمايه' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
database:set(bot_id..'lock:tagrvrbot'..msg.chat_id_,true)   
list ={"lock:Bot:kick","lock:user:name","lock:Link","lock:forward","lock:Sticker","lock:Animation","lock:Video","lock:Fshar","Bot:Id:Photo","lock:Audio","lock:vico","lock:Document","lock:Unsupported","lock:Markdaun","lock:Contact","lock:Spam"}
for i,lock in pairs(list) do 
database:set(bot_id..lock..msg.chat_id_,'del')    
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'• بواسطه > ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n•تم الامر بنجاح\n')  
end,nil)   
end
if text == 'تعطيل الحمايه' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
database:del(bot_id..'lock:tagrvrbot'..msg.chat_id_)   
list ={"lock:Bot:kick","lock:user:name","lock:Link","lock:forward","lock:Sticker","lock:Animation","lock:Video","lock:Fshar","Bot:Id:Photo","lock:Audio","lock:vico","lock:Document","lock:Unsupported","lock:Markdaun","lock:Contact","lock:Spam"}
for i,lock in pairs(list) do 
database:del(bot_id..lock..msg.chat_id_)    
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'• بواسطه > ['..Rutba(msg.sender_user_id_,msg.chat_id_)..'](T.ME/'..(data.username_ or 'UU_KFUF')..') \n• تم الامر بنجاح\n')  
end,nil)   
end
if text == 'طرد المحذوفين' or text == 'مسح المحذوفين' then  
if Mod(msg) then    
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),offset_ = 0,limit_ = 1000}, function(arg,del)
for k, v in pairs(del.members_) do
tdcli_function({ID = "GetUser",user_id_ = v.user_id_},function(b,data) 
if data.first_name_ == false then
Group_Kick(msg.chat_id_, data.id_)
end
end,nil)
end
send(msg.chat_id_, msg.id_,'• تم طرده المحذوفين')
end,nil)
end
end
if text == 'الصلاحيات' and Mod(msg) then 
local list = database:smembers(bot_id..'Coomds'..msg.chat_id_)
if #list == 0 then
send(msg.chat_id_, msg.id_,'• لا توجد صلاحيات مضافه')
return false
end
t = "\n قائمة الصلاحيات المضافه \n *܀⠤⠤⠤⠤⠤⠤܀ٴ*\n"
for k,v in pairs(list) do
var = database:get(bot_id.."Comd:New:rt:bot:"..v..msg.chat_id_)
if var then
t = t..''..k..'- '..v..' > ('..var..')\n'
else
t = t..''..k..'- '..v..'\n'
end
end
send(msg.chat_id_, msg.id_,t)
end
if text and text:match("^اضف صلاحيه (.*)$") and Mod(msg) then 
ComdNew = text:match("^اضف صلاحيه (.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
database:set(bot_id.."Comd:New:rt"..msg.chat_id_..msg.sender_user_id_,ComdNew)  
database:sadd(bot_id.."Coomds"..msg.chat_id_,ComdNew)  
database:setex(bot_id.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_,200,true)  
send(msg.chat_id_, msg.id_, "•  نـوع رتـبـه \n• {عـضـو -- ممـيـز -- ادمـن -- مـديـر}") 
end
if text and text:match("^مسح صلاحيه (.*)$") and Mod(msg) then 
ComdNew = text:match("^مسح صلاحيه (.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
database:del(bot_id.."Comd:New:rt:bot:"..ComdNew..msg.chat_id_)
send(msg.chat_id_, msg.id_, "*• تم مسح الصلاحيه *\n✓") 
end
if database:get(bot_id.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
send(msg.chat_id_, msg.id_,"* تم الغاء الامر *\n✓") 
database:del(bot_id.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
if text == 'مدير' then
if not Constructor(msg) then
send(msg.chat_id_, msg.id_"* تستطيع اضافه صلاحيات {ادمن - مميز - عضو} \n ارسل الصلاحيه مجددا*\n") 
return false
end
end
if text == 'ادمن' then
if not Manager(msg) then 
send(msg.chat_id_, msg.id_,"* تستطيع اضافه صلاحيات {مميز - عضو} \n ارسل الصلاحيه مجددا*\n") 
return false
end
end
if text == 'مميز' then
if not Mod(msg) then
send(msg.chat_id_, msg.id_,"* تستطيع اضافه صلاحيات {عضو} \n ارسل الصلاحيه مجددا*\n") 
return false
end
end
if text == 'مدير' or text == 'ادمن' or text == 'مميز' or text == 'عضو' then
local textn = database:get(bot_id.."Comd:New:rt"..msg.chat_id_..msg.sender_user_id_)  
database:set(bot_id.."Comd:New:rt:bot:"..textn..msg.chat_id_,text)
send(msg.chat_id_, msg.id_, "• تم اضـافـه الامـر √") 
database:del(bot_id.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
end
if text and text:match('رفع (.*)') and tonumber(msg.reply_to_message_id_) > 0 and Mod(msg) then 
local RTPA = text:match('رفع (.*)')
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
if database:sismember(bot_id..'Coomds'..msg.chat_id_,RTPA) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local blakrt = database:get(bot_id.."Comd:New:rt:bot:"..RTPA..msg.chat_id_)
if blakrt == 'مميز' and Mod(msg) then
send(msg.chat_id_, msg.id_,'\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '..'\n تم رفعه '..RTPA..' هنا\n')   
database:set(bot_id.."Comd:New:rt:user:"..msg.chat_id_..result.sender_user_id_,RTPA) 
database:sadd(bot_id..'Special:User'..msg.chat_id_,result.sender_user_id_)  
elseif blakrt == 'ادمن' and Manager(msg) then 
send(msg.chat_id_, msg.id_,'\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '..'\n تم رفعه '..RTPA..' هنا\n')   
database:set(bot_id.."Comd:New:rt:user:"..msg.chat_id_..result.sender_user_id_,RTPA)
database:sadd(bot_id..'Mod:User'..msg.chat_id_,result.sender_user_id_)  
elseif blakrt == 'مدير' and Constructor(msg) then
send(msg.chat_id_, msg.id_,'\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '..'\n تم رفعه '..RTPA..' هنا\n')   
database:set(bot_id.."Comd:New:rt:user:"..msg.chat_id_..result.sender_user_id_,RTPA)  
database:sadd(bot_id..'Manager'..msg.chat_id_,result.sender_user_id_)  
elseif blakrt == 'عضو' and Mod(msg) then
send(msg.chat_id_, msg.id_,'\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '..'\n تم رفعه '..RTPA..' هنا\n')   
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match('تنزيل (.*)') and tonumber(msg.reply_to_message_id_) > 0 and Mod(msg) then 
local RTPA = text:match('تنزيل (.*)')
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
if database:sismember(bot_id..'Coomds'..msg.chat_id_,RTPA) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local blakrt = database:get(bot_id.."Comd:New:rt:bot:"..RTPA..msg.chat_id_)
if blakrt == 'مميز' and Mod(msg) then
send(msg.chat_id_, msg.id_,'\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '..'\n تم تنزيله من '..RTPA..' هنا\n')   
database:srem(bot_id..'Special:User'..msg.chat_id_,result.sender_user_id_)  
database:del(bot_id.."Comd:New:rt:user:"..msg.chat_id_..result.sender_user_id_)
elseif blakrt == 'ادمن' and Manager(msg) then 
send(msg.chat_id_, msg.id_,'\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '..'\n تم تنزيله من '..RTPA..' هنا\n')   
database:srem(bot_id..'Mod:User'..msg.chat_id_,result.sender_user_id_) 
database:del(bot_id.."Comd:New:rt:user:"..msg.chat_id_..result.sender_user_id_)
elseif blakrt == 'مدير' and Constructor(msg) then
send(msg.chat_id_, msg.id_,'\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '..'\n تم تنزيله من '..RTPA..' هنا\n')   
database:srem(bot_id..'Manager'..msg.chat_id_,result.sender_user_id_)  
database:del(bot_id.."Comd:New:rt:user:"..msg.chat_id_..result.sender_user_id_)
elseif blakrt == 'عضو' and Mod(msg) then
send(msg.chat_id_, msg.id_,'\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'UU_KFUF')..') '..'\n تم تنزيله من '..RTPA..' هنا\n')   
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match('^رفع (.*) @(.*)') and Mod(msg) then 
local text1 = {string.match(text, "^(رفع) (.*) @(.*)$")}
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
if database:sismember(bot_id..'Coomds'..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local blakrt = database:get(bot_id.."Comd:New:rt:bot:"..text1[2]..msg.chat_id_)
if blakrt == 'مميز' and Mod(msg) then
send(msg.chat_id_, msg.id_,'\n• العضو > ['..result.title_..'](t.me/'..(text1[3] or 'UU_KFUF')..')'..'\n تم رفعه '..text1[2]..' هنا')   
database:sadd(bot_id..'Special:User'..msg.chat_id_,result.id_)  
database:set(bot_id.."Comd:New:rt:user:"..msg.chat_id_..result.id_,text1[2])
elseif blakrt == 'ادمن' and Manager(msg) then 
send(msg.chat_id_, msg.id_,'\n• العضو > ['..result.title_..'](t.me/'..(text1[3] or 'UU_KFUF')..')'..'\n تم رفعه '..text1[2]..' هنا')   
database:sadd(bot_id..'Mod:User'..msg.chat_id_,result.id_)  
database:set(bot_id.."Comd:New:rt:user:"..msg.chat_id_..result.id_,text1[2])
elseif blakrt == 'مدير' and Constructor(msg) then
send(msg.chat_id_, msg.id_,'\n• العضو > ['..result.title_..'](t.me/'..(text1[3] or 'UU_KFUF')..')'..'\n تم رفعه '..text1[2]..' هنا')   
database:sadd(bot_id..'Manager'..msg.chat_id_,result.id_)  
database:set(bot_id.."Comd:New:rt:user:"..msg.chat_id_..result.id_,text1[2])
elseif blakrt == 'عضو' and Mod(msg) then
send(msg.chat_id_, msg.id_,'\n• العضو > ['..result.title_..'](t.me/'..(text1[3] or 'UU_KFUF')..')'..'\n تم رفعه '..text1[2]..' هنا')   
end
else
info = '• المعرف غلط'
send(msg.chat_id_, msg.id_,info)
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end 
end
if text and text:match('^تنزيل (.*) @(.*)') and Mod(msg) then 
local text1 = {string.match(text, "^(تنزيل) (.*) @(.*)$")}
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
if database:sismember(bot_id..'Coomds'..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local blakrt = database:get(bot_id.."Comd:New:rt:bot:"..text1[2]..msg.chat_id_)
if blakrt == 'مميز' and Mod(msg) then
send(msg.chat_id_, msg.id_,'\n• العضو > ['..result.title_..'](t.me/'..(text1[3] or 'UU_KFUF')..')'..'\n تم تنريله من '..text1[2]..' هنا')   
database:srem(bot_id..'Special:User'..msg.chat_id_,result.id_)  
database:del(bot_id.."Comd:New:rt:user:"..msg.chat_id_..result.id_)
elseif blakrt == 'ادمن' and Manager(msg) then 
send(msg.chat_id_, msg.id_,'\n• العضو > ['..result.title_..'](t.me/'..(text1[3] or 'UU_KFUF')..')'..'\n تم تنريله من '..text1[2]..' هنا')   
database:srem(bot_id..'Mod:User'..msg.chat_id_,result.id_)  
database:del(bot_id.."Comd:New:rt:user:"..msg.chat_id_..result.id_)
elseif blakrt == 'مدير' and Constructor(msg) then
send(msg.chat_id_, msg.id_,'\n• العضو > ['..result.title_..'](t.me/'..(text1[3] or 'UU_KFUF')..')'..'\n تم تنريله من '..text1[2]..' هنا')   
database:srem(bot_id..'Manager'..msg.chat_id_,result.id_)  
database:del(bot_id.."Comd:New:rt:user:"..msg.chat_id_..result.id_)
elseif blakrt == 'عضو' and Mod(msg) then
send(msg.chat_id_, msg.id_,'\n• العضو > ['..result.title_..'](t.me/'..(text1[3] or 'UU_KFUF')..')'..'\n تم تنريله من '..text1[2]..' هنا')   
end
else
info = '• المعرف غلط'
send(msg.chat_id_, msg.id_,info)
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end  
end
if text == "مسح رسايلي" or text == "مسح رسائلي" or text == "حذف رسايلي" or text == "حذف رسائلي" then  
send(msg.chat_id_, msg.id_,'• تم مسح رسائلك جميعها'  )  
database:del(bot_id..'Msg_User'..msg.chat_id_..':'..msg.sender_user_id_) 
end
if text == "رسايلي" or text == "رسائلي" or text == "msg" then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
send(msg.chat_id_, msg.id_,'•  عدد رسائلك هنا > { '..database:get(bot_id..'Msg_User'..msg.chat_id_..':'..msg.sender_user_id_)..'}' ) 
end 
if text == 'تفعيل الاذاعه' and SudoBot(msg) then  
if database:get(bot_id..'Bc:Bots') then
database:del(bot_id..'Bc:Bots') 
Text = '\n تم تفعيل الاذاعه ' 
else
Text = '\n بالتاكيد تم تفعيل الاذاعه '
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل الاذاعه' and SudoBot(msg) then  
if not database:get(bot_id..'Bc:Bots') then
database:set(bot_id..'Bc:Bots',true) 
Text = '\n تم تعطيل الاذاعه' 
else
Text = '\n بالتاكيد تم تعطيل الاذاعه'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تفعيل التواصل' and SudoBot(msg) then  
if database:get(bot_id..'Tuasl:Bots') then
database:del(bot_id..'Tuasl:Bots') 
Text = '\n• تم تفعيل التواصل' 
else
Text = '\n بالتاكيد تم تفعيل التواصل'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل التواصل' and SudoBot(msg) then  
if not database:get(bot_id..'Tuasl:Bots') then
database:set(bot_id..'Tuasl:Bots',true) 
Text = '\n• تم تعطيل التواصل' 
else
Text = '\n بالتاكيد تم تعطيل التواصل'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تفعيل البوت خدمي' and SudoBot(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
if database:get(bot_id..'Free:Bots') then
database:del(bot_id..'Free:Bots') 
Text = '\n تم تفعيل البوت خدمي ' 
else
Text = '\n البوت الان يتم تفعيله في المجموعات من قبل المشرفين + المالكين '
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل البوت خدمي' and SudoBot(msg) then  
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
if not database:get(bot_id..'Free:Bots') then
database:set(bot_id..'Free:Bots',true) 
Text = '\n تم تعطيل البوت خدمي' 
else
Text = '\n اهلا عزيزي المطور البوت تم تعطيله من التفعيل'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل المسح' and BasicConstructor(msg) then   
if database:get(bot_id..'Lock:delmsg'..msg.chat_id_)  then
database:del(bot_id..'Lock:delmsg'..msg.chat_id_) 
Text = '\n• تم تعطيل المسح' 
else
Text = '\n•بالتاكيد تم تعطيل الميح'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تفعيل المسح' and BasicConstructor(msg) then  
if not database:get(bot_id..'Lock:delmsg'..msg.chat_id_)  then
database:set(bot_id..'Lock:delmsg'..msg.chat_id_,true) 
Text = '\n• تم تفعيل المسح' 
else
Text = '\n•بالتاكيد تم تفعيل المسح'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text and text:match('^مسح (%d+)$') and Constructor(msg) and database:get(bot_id..'Lock:delmsg'..msg.chat_id_) then                
if not database:get(bot_id..'MODEDEV:Delete:Time'..msg.chat_id_..':'..msg.sender_user_id_) then           
local Number = tonumber(text:match('^مسح (%d+)$')) 
if Number > 1000 then 
send(msg.chat_id_, msg.id_,'• لا تستطيع مسح اكثر من *~ 1000* رساله') 
return false  
end  
local Message = msg.id_
for i=1,tonumber(Number) do
DeleteMessage(msg.chat_id_,{[0]=Message})
Message = Message - 1048576
end
send(msg.chat_id_, msg.id_,'• تم مسح *~ '..Number..'* رساله .')  
database:setex(bot_id..'MODEDEV:Delete:Time'..msg.chat_id_..':'..msg.sender_user_id_,300,true)
end
end
if text == "امسح" and Manager(msg) then
msgm = {[0]=msg.id_}
local Message = msg.id_
for i=1,200 do
Message = Message - 1048576
msgm[i] = Message
end
tdcli_function({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = msgm},function(arg,data)
new = 0
msgm2 = {}
for i=0 ,data.total_count_ do
if data.messages_[i] and data.messages_[i].content_ and data.messages_[i].content_.ID ~= "MessageText" then
msgm2[new] = data.messages_[i].id_
new = new + 1
end
end
DeleteMessage(msg.chat_id_,msgm2)
end,nil)  
send(msg.chat_id_, msg.id_,"تم تنظيف الميديا بنجاح •")
end
if text == "امسح" and Manager(msg) then
Msgs = {[0]=msg.id_}
local Message = msg.id_
for i=1,200 do
Message = Message - 1048576
Msgs[i] = Message
end
tdcli_function({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data)
new = 0
Msgs2 = {}
for i=0 ,data.total_count_ do
if data.messages_[i] and (not data.messages_[i].edit_date_ or data.messages_[i].edit_date_ ~= 0) then
Msgs2[new] = data.messages_[i].id_
new = new + 1
end
end
DeleteMessage(msg.chat_id_,Msgs2)
end,nil)  
send(msg.chat_id_, msg.id_,'• تم تنظيف الميديا المعدله')
end
if text == "تغير اسم البوت" or text == "تغيير اسم البوت" then 
if SudoBot(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
database:setex(bot_id..'Set:Name:Bot'..msg.sender_user_id_,300,true) 
send(msg.chat_id_, msg.id_," ارسل لي الاسم الان ")  
end
return false
end

if text == ""..(database:get(bot_id..'Name:Bot') or 'بلاك').."" then  
Namebot = (database:get(bot_id..'Name:Bot') or 'بلاك')
local MODEDEV_Msg = {
'ۿۧهلا ؏ـمࢪي .',
'    اؤمرني',
'ۿۧاا قلبي .',
'انا '..Namebot..' مش بوت ɵ̷̥̥᷄ˬɵ̷̥̥᷅',
'قلب '..Namebot..' ودقاته ɵ̷̥̥᷄ˬɵ̷̥̥᷅',
'قلبو ',
'عيونه',
'ۿۧها ححب  .',
}
send(msg.chat_id_, msg.id_,'['..MODEDEV_Msg[math.random(#MODEDEV_Msg)]..']') 
return false
end
if text=="اذاعه خاص" and msg.reply_to_message_id_ == 0 and Sudo(msg) then 
if database:get(bot_id..'Bc:Bots') and not SudoBot(msg) then 
send(msg.chat_id_, msg.id_,'• الاذاعه معطله من قبل المطور الاساسي')
return false
end
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
database:setex(bot_id.."Send:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"• ارسل لي سواء >> { ملصق, متحركه, صوره, رساله }\n• للخروج ارسل الغاء ") 
return false
end 
if text=="اذاعه" and msg.reply_to_message_id_ == 0 and Sudo(msg) then 
if database:get(bot_id..'Bc:Bots') and not SudoBot(msg) then 
send(msg.chat_id_, msg.id_,'• الاذاعه معطله من قبل المطور الاساسي')
return false
end
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
database:setex(bot_id.."Send:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"• ارسل لي سواء >> { ملصق, متحركه, صوره, رساله }\n• للخروج ارسل الغاء ") 
return false
end  
if text=="اذاعه بالتوجيه" and msg.reply_to_message_id_ == 0  and Sudo(msg) then 
if database:get(bot_id..'Bc:Bots') and not SudoBot(msg) then 
send(msg.chat_id_, msg.id_,'• الاذاعه معطله من قبل المطور الاساسي')
return false
end
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
database:setex(bot_id.."Send:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_," ارسل لي التوجيه الان") 
return false
end 
if text=="اذاعه بالتوجيه خاص" and msg.reply_to_message_id_ == 0  and Sudo(msg) then 
if database:get(bot_id..'Bc:Bots') and not SudoBot(msg) then 
send(msg.chat_id_, msg.id_,'• الاذاعه معطله من قبل المطور الاساسي')
return false
end
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
database:setex(bot_id.."Send:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_," ارسل لي التوجيه الان") 
return false
end 
if text and text:match('^ضع اسم (.*)') and Manager(msg) or text and text:match('^وضع اسم (.*)') and Manager(msg) then 
local Name = text:match('^ضع اسم (.*)') or text and text:match('^وضع اسم (.*)') 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 𝒓𝒆𝒗𝒐?? •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
tdcli_function ({ ID = "ChangeChatTitle",chat_id_ = msg.chat_id_,title_ = Name },function(arg,data) 
if data.message_ == "Channel chat title can be changed by administrators only" then
send(msg.chat_id_,msg.id_,"• البوت ليس ادمن يرجى ترقيتي !")  
return false  
end 
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"• ليست لدي صلاحية تغير اسم المجموعه")  
else
sebd(msg.chat_id_,msg.id_,'• تم تغيير اسم المجموعه الى {['..Name..']}')  
end
end,nil) 
end
if text == ("تاك جميع الرتب") and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 200
},function(ta,MODEDEV)
local t = "\n*• قائمة الاعضاء \n *܀⠤⠤⠤⠤⠤⠤܀ٴ*\n*"
x = 0
local list = MODEDEV.members_
for k, v in pairs(list) do
x = x + 1
if database:get(bot_id..'user:Name'..v.user_id_) then
t = t.."*︙"..x.."︙ >  {@"..database:get(bot_id..'user:Name'..v.user_id_).."}\n*"
else
end
end
send(msg.chat_id_,msg.id_,t)
end,nil)
end
if text == ("تاك للكل") and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
if database:get(bot_id.."chat:tagall"..msg.chat_id_) then  return send(msg.chat_id_, msg.id_,"يمكنك عمل تاك للكل كل *10 دقائق* فقط") end
database:setex(bot_id..'chat:tagall'..msg.chat_id_,600,true)
tdcli_function({ID="GetChannelFull",channel_id_ = msg.chat_id_:gsub('-100','')},function(argg,dataa) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = dataa.member_count_
},function(ta,MODEDEV)
x = 0
tags = 0
local list = MODEDEV.members_
for k, v in pairs(list) do
tdcli_function({ID="GetUser",user_id_ = v.user_id_},function(arg,data)
if x == 5 or x == tags or k == 0 then
tags = x + 5
t = "#all"
end
x = x + 1
tagname = data.first_name_
tagname = tagname:gsub("]","")
tagname = tagname:gsub("[[]","")
t = t..", ["..tagname.."](tg://user?id="..v.user_id_..")"
if x == 5 or x == tags or k == 0 then
local Text = t:gsub('#all,','#all\n')
sendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
end
end,nil)
end
end,nil)
end,nil)
end

if text == ("تاك") and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 200
},function(ta,MODEDEV)
local t = "\n*• قائمة الاعضاء \n *܀⠤⠤⠤⠤⠤⠤܀ٴ*\n*"
x = 0
local list = MODEDEV.members_
for k, v in pairs(list) do
tdcli_function({ID="GetUser",user_id_ = v.user_id_},function(arg,data)
x = x + 1
if data.username_ then
t = t.."*︙"..x.."︙>* {[@"..data.username_.."]} \n"
end
if k == 0 then
t = t.."*يمكنك عمل تاك  + العدد مثال تاك ل 5*"
send(msg.chat_id_,msg.id_,t)
end
end,nil)
end
end,nil)
end
if text and text:match("^تاك ل (%d+)$") and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
taglimit = text:match("^تاك ل (%d+)$"):gsub('تاك ل ','')
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = taglimit
},function(ta,MODEDEV)
local t = "\n*• قائمة الاعضاء \n *܀⠤⠤⠤⠤⠤⠤܀ٴ*\n*"
x = 0
local list = MODEDEV.members_
for k, v in pairs(list) do
tdcli_function({ID="GetUser",user_id_ = v.user_id_},function(arg,data)
x = x + 1
if data.username_ then
t = t.."*︙"..x.."︙l>* {[@"..data.username_.."]} \n"
else
tagname = data.first_name_
tagname = tagname:gsub("]","")
tagname = tagname:gsub("[[]","")
t = t.."*︙"..x.."︙l>* {["..tagname.."](tg://user?id="..v.user_id_..")} \n"
end
if k == 0 then
send(msg.chat_id_,msg.id_,t)
end
end,nil)
end
end,nil)
end


if text == ("تنزيل الكل") and msg.reply_to_message_id_ ~= 0 and Manager(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•لا تستطيع استخدام البوت \n •يرجى الاشتراك بالقناه اولا \n •< جط ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if tonumber(SUDO) == tonumber(result.sender_user_id_) then
send(msg.chat_id_, msg.id_,"• لا تستطيع تنزيل المطور الاساسي")
return false 
end
if database:sismember(bot_id..'Sudo:User',result.sender_user_id_) then
dev = 'المطور ،' else dev = '' end
if database:sismember(bot_id..'Basic:Constructor'..msg.chat_id_, result.sender_user_id_) then
crr = 'منشئ اساسي ،' else crr = '' end
if database:sismember(bot_id..'Constructor'..msg.chat_id_, result.sender_user_id_) then
cr = 'منشئ ،' else cr = '' end
if database:sismember(bot_id..'Manager'..msg.chat_id_, result.sender_user_id_) then
own = 'مدير ،' else own = '' end
if database:sismember(bot_id..'Mod:User'..msg.chat_id_, result.sender_user_id_) then
mod = 'ادمن ،' else mod = '' end
if database:sismember(bot_id..'Special:User'..msg.chat_id_, result.sender_user_id_) then
vip = 'مميز ،' else vip = ''
end
if Can_or_NotCan(result.sender_user_id_,msg.chat_id_) ~= false then
send(msg.chat_id_, msg.id_,"\n• تم تنزيل العضو من الرتب التاليه \n { "..dev..''..crr..''..cr..''..own..''..mod..''..vip.." } \n")
else
send(msg.chat_id_, msg.id_,"\n• ليس لديه رتب حتى استطيع تنزيله \n")
end
if tonumber(SUDO) == tonumber(msg.sender_user_id_) then
database:srem(bot_id..'Sudo:User', result.sender_user_id_)
database:srem(bot_id..'Basic:Constructor'..msg.chat_id_,result.sender_user_id_)
database:srem(bot_id..'Constructor'..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id..'Manager'..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id..'Mod:User'..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id..'Special:User'..msg.chat_id_, result.sender_user_id_)
elseif database:sismember(bot_id..'Sudo:User',msg.sender_user_id_) then
database:srem(bot_id..'Mod:User'..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id..'Special:User'..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id..'Manager'..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id..'Constructor'..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id..'Basic:Constructor'..msg.chat_id_,result.sender_user_id_)
elseif database:sismember(bot_id..'Basic:Constructor'..msg.chat_id_, msg.sender_user_id_) then
database:srem(bot_id..'Mod:User'..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id..'Special:User'..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id..'Manager'..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id..'Constructor'..msg.chat_id_, result.sender_user_id_)
elseif database:sismember(bot_id..'Constructor'..msg.chat_id_, msg.sender_user_id_) then
database:srem(bot_id..'Mod:User'..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id..'Special:User'..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id..'Manager'..msg.chat_id_, result.sender_user_id_)
elseif database:sismember(bot_id..'Manager'..msg.chat_id_, msg.sender_user_id_) then
database:srem(bot_id..'Mod:User'..msg.chat_id_, result.sender_user_id_)
database:srem(bot_id..'Special:User'..msg.chat_id_, result.sender_user_id_)
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
end

if text == ("مسح الردود العامه") and SudoBot(msg) then 
local list = database:smembers(bot_id..'List:Rd:Sudo')
for k,v in pairs(list) do
database:del(bot_id.."Add:Rd:Sudo:Gif"..v)   
database:del(bot_id.."Add:Rd:Sudo:vico"..v)   
database:del(bot_id.."Add:Rd:Sudo:stekr"..v)     
database:del(bot_id.."Add:Rd:Sudo:Text"..v)   
database:del(bot_id.."Add:Rd:Sudo:Photo"..v)
database:del(bot_id.."Add:Rd:Sudo:Video"..v)
database:del(bot_id.."Add:Rd:Sudo:File"..v)
database:del(bot_id.."Add:Rd:Sudo:Audio"..v)
database:del(bot_id..'List:Rd:Sudo')
end
send(msg.chat_id_, msg.id_," تم حذف ردود العامه")
end

if text == ("الردود العامه") and SudoBot(msg) then 
local list = database:smembers(bot_id..'List:Rd:Sudo')
text = "\n قائمة الردود العامه \n *܀⠤⠤⠤⠤⠤⠤܀ٴ*\n"
for k,v in pairs(list) do
if database:get(bot_id.."Add:Rd:Sudo:Gif"..v) then
db = 'متحركه '
elseif database:get(bot_id.."Add:Rd:Sudo:vico"..v) then
db = 'بصمه '
elseif database:get(bot_id.."Add:Rd:Sudo:stekr"..v) then
db = 'ملصق '
elseif database:get(bot_id.."Add:Rd:Sudo:Text"..v) then
db = 'رساله '
elseif database:get(bot_id.."Add:Rd:Sudo:Photo"..v) then
db = 'صوره '
elseif database:get(bot_id.."Add:Rd:Sudo:Video"..v) then
db = 'فيديو '
elseif database:get(bot_id.."Add:Rd:Sudo:File"..v) then
db = 'ملف '
elseif database:get(bot_id.."Add:Rd:Sudo:Audio"..v) then
db = 'اغنيه '
end
text = text..""..k.." >> ("..v..") > {"..db.."}\n"
end
if #list == 0 then
text = "• لا يوجد ردود عامه"
end
send(msg.chat_id_, msg.id_,'['..text..']')
end
if text or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.animation_ or msg.content_.audio_ or msg.content_.document_ or msg.content_.photo_ or msg.content_.video_ then  
local test = database:get(bot_id..'Text:Sudo:Bot'..msg.sender_user_id_..':'..msg.chat_id_)
if database:get(bot_id..'Set:Rd'..msg.sender_user_id_..':'..msg.chat_id_) == 'true1' then
database:del(bot_id..'Set:Rd'..msg.sender_user_id_..':'..msg.chat_id_)
if msg.content_.sticker_ then   
database:set(bot_id.."Add:Rd:Sudo:stekr"..test, msg.content_.sticker_.sticker_.persistent_id_)  
end   
if msg.content_.voice_ then  
database:set(bot_id.."Add:Rd:Sudo:vico"..test, msg.content_.voice_.voice_.persistent_id_)  
end   
if msg.content_.animation_ then   
database:set(bot_id.."Add:Rd:Sudo:Gif"..test, msg.content_.animation_.animation_.persistent_id_)  
end  
if text then   
text = text:gsub('"','') 
text = text:gsub("'",'') 
text = text:gsub('`','') 
text = text:gsub('*','') 
database:set(bot_id.."Add:Rd:Sudo:Text"..test, text)  
end  
if msg.content_.audio_ then
database:set(bot_id.."Add:Rd:Sudo:Audio"..test, msg.content_.audio_.audio_.persistent_id_)  
end
if msg.content_.document_ then
database:set(bot_id.."Add:Rd:Sudo:File"..test, msg.content_.document_.document_.persistent_id_)  
end
if msg.content_.video_ then
database:set(bot_id.."Add:Rd:Sudo:Video"..test, msg.content_.video_.video_.persistent_id_)  
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_group = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_group = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_group = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_group = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
database:set(bot_id.."Add:Rd:Sudo:Photo"..test, photo_in_group)  
end
send(msg.chat_id_, msg.id_,' تم حفظ الرد بنجاح')
return false  
end  
end
if text and text:match("^(.*)$") then
if database:get(bot_id..'Set:Rd'..msg.sender_user_id_..':'..msg.chat_id_) == 'true' then
send(msg.chat_id_, msg.id_,' ارسل الرد الذي تريده سواء كان {صوره,فيديو,متحركه,ملصق,بصمه,صوت}')
database:set(bot_id..'Set:Rd'..msg.sender_user_id_..':'..msg.chat_id_, 'true1')
database:set(bot_id..'Text:Sudo:Bot'..msg.sender_user_id_..':'..msg.chat_id_, text)
database:sadd(bot_id..'List:Rd:Sudo', text)
return false end
end
if text and text:match("^(.*)$") then
if database:get(bot_id..'Set:On'..msg.sender_user_id_..':'..msg.chat_id_) == 'true' then
send(msg.chat_id_, msg.id_,' تم ازالة الرد من قائمه الردود عامه')
list = {"Add:Rd:Sudo:Audio","Add:Rd:Sudo:File","Add:Rd:Sudo:Video","Add:Rd:Sudo:Photo","Add:Rd:Sudo:Text","Add:Rd:Sudo:stekr","Add:Rd:Sudo:vico","Add:Rd:Sudo:Gif"}
for k,v in pairs(list) do
database:del(bot_id..v..text)
end
database:del(bot_id..'Set:On'..msg.sender_user_id_..':'..msg.chat_id_)
database:srem(bot_id..'List:Rd:Sudo', text)
return false
end
end

if text and text:match("^(.*)$") then
if database:get(bot_id.."botss:MODEDEV:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_) == "true" then
send(msg.chat_id_, msg.id_, '\n • ارسل لي الكلمه الان')
database:set(bot_id.."botss:MODEDEV:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_, "true1")
database:set(bot_id.."botss:MODEDEV:Text:Sudo:Bot"..msg.sender_user_id_..":"..msg.chat_id_, text)
database:sadd(bot_id.."botss:MODEDEV:List:Rd:Sudo", text)
return false end
end
if text and text:match("^(.*)$") then
if database:get(bot_id.."botss:MODEDEV:Set:On"..msg.sender_user_id_..":"..msg.chat_id_) == "true" then
send(msg.chat_id_, msg.id_,"• تم حذف الرد من الردود المتعدده")
database:del(bot_id..'botss:MODEDEV:Add:Rd:Sudo:Text'..text)
database:del(bot_id..'botss:MODEDEV:Add:Rd:Sudo:Text1'..text)
database:del(bot_id..'botss:MODEDEV:Add:Rd:Sudo:Text2'..text)
database:del(bot_id.."botss:MODEDEV:Set:On"..msg.sender_user_id_..":"..msg.chat_id_)
database:srem(bot_id.."botss:MODEDEV:List:Rd:Sudo", text)
return false
end
end
if text == ("مسح الردود المتعدده") and SudoBot(msg) then 
local list = database:smembers(bot_id.."botss:MODEDEV:List:Rd:Sudo")
for k,v in pairs(list) do  
database:del(bot_id.."botss:MODEDEV:Add:Rd:Sudo:Text"..v) 
database:del(bot_id.."botss:MODEDEV:Add:Rd:Sudo:Text1"..v) 
database:del(bot_id.."botss:MODEDEV:Add:Rd:Sudo:Text2"..v)   
database:del(bot_id.."botss:MODEDEV:List:Rd:Sudo")
end
send(msg.chat_id_, msg.id_,"• تم حذف الردود المتعدده")
end
if text == ("الردود المتعدده") and SudoBot(msg) then 
local list = database:smembers(bot_id.."botss:MODEDEV:List:Rd:Sudo")
text = "\nقائمة الردود المتعدده \n*܀⠤⠤⠤⠤⠤⠤܀ٴ*\n"
for k,v in pairs(list) do
db = "رساله "
text = text..""..k.." => {"..v.."} => {"..db.."}\n"
end
if #list == 0 then
text = "لا توجد ردود متعدده"
end
send(msg.chat_id_, msg.id_,"["..text.."]")
end
if text == "اضف رد متعدد" and SudoBot(msg) then 
database:set(bot_id.."botss:MODEDEV:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_,true)
return send(msg.chat_id_, msg.id_,"\n •  حسنآ ارسل الرد الذي تريد\n•  اضافتة يمكنك اضافـة\n•  3 ردود علئ رد واحد\n")
end
if text == "حذف رد متعدد" and SudoBot(msg) then 
database:set(bot_id.."botss:MODEDEV:Set:On"..msg.sender_user_id_..":"..msg.chat_id_,true)
return send(msg.chat_id_, msg.id_,"•  ارسل الان الكلمه لحذفها")
end
if text then  
local test = database:get(bot_id.."botss:MODEDEV:Text:Sudo:Bot"..msg.sender_user_id_..":"..msg.chat_id_)
if database:get(bot_id.."botss:MODEDEV:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_) == "true1" then
database:set(bot_id.."botss:MODEDEV:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_,'rd1')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("","") 
text = text:gsub("*","") 
database:set(bot_id.."botss:MODEDEV:Add:Rd:Sudo:Text"..test, text)  
end  
send(msg.chat_id_, msg.id_,"• تم حفظ الرد الاول ارسل الرد الثاني")
return false  
end  
end
if text then  
local test = database:get(bot_id.."botss:MODEDEV:Text:Sudo:Bot"..msg.sender_user_id_..":"..msg.chat_id_)
if database:get(bot_id.."botss:MODEDEV:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_) == "rd1" then
database:set(bot_id.."botss:MODEDEV:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_,'rd2')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("","") 
text = text:gsub("*","") 
database:set(bot_id.."botss:MODEDEV:Add:Rd:Sudo:Text1"..test, text)  
end  
send(msg.chat_id_, msg.id_,"• تم حفظ الرد الثاني ارسل الرد الثالث")
return false  
end  
end
if text then  
local test = database:get(bot_id.."botss:MODEDEV:Text:Sudo:Bot"..msg.sender_user_id_..":"..msg.chat_id_)
if database:get(bot_id.."botss:MODEDEV:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_) == "rd2" then
database:set(bot_id.."botss:MODEDEV:Set:Rd"..msg.sender_user_id_..":"..msg.chat_id_,'rd3')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
database:set(bot_id.."botss:MODEDEV:Add:Rd:Sudo:Text2"..test, text)  
end

send(msg.chat_id_, msg.id_,"• تم حفظ الردود")
return false  
end  
end
if text then
local Text = database:get(bot_id.."botss:MODEDEV:Add:Rd:Sudo:Text"..text)   
local Text1 = database:get(bot_id.."botss:MODEDEV:Add:Rd:Sudo:Text1"..text)   
local Text2 = database:get(bot_id.."botss:MODEDEV:Add:Rd:Sudo:Text2"..text)   
if Text or Text1 or Text2 then 
local texting = {
Text,
Text1,
Text2
}
Textes = math.random(#texting)
send(msg.chat_id_, msg.id_,texting[Textes])
end
end


if text == 'اضف رد عام' and SudoBot(msg) then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
send(msg.chat_id_, msg.id_,'• ارسل الكلمه تريد اضافتها')
database:set(bot_id..'Set:Rd'..msg.sender_user_id_..':'..msg.chat_id_,true)
return false 
end
if text == 'حذف رد عام' and SudoBot(msg) then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
send(msg.chat_id_, msg.id_,'• ارسل الكلمه تريد حذفها')
database:set(bot_id..'Set:On'..msg.sender_user_id_..':'..msg.chat_id_,true)
return false 
end
if text and not database:get(bot_id..'Reply:Sudo'..msg.chat_id_) then
if not database:sismember(bot_id..'Spam:Texting'..msg.sender_user_id_,text) then
local anemi = database:get(bot_id.."Add:Rd:Sudo:Gif"..text)   
local veico = database:get(bot_id.."Add:Rd:Sudo:vico"..text)   
local stekr = database:get(bot_id.."Add:Rd:Sudo:stekr"..text)     
local text1 = database:get(bot_id.."Add:Rd:Sudo:Text"..text)   
local photo = database:get(bot_id.."Add:Rd:Sudo:Photo"..text)
local video = database:get(bot_id.."Add:Rd:Sudo:Video"..text)
local document = database:get(bot_id.."Add:Rd:Sudo:File"..text)
local audio = database:get(bot_id.."Add:Rd:Sudo:Audio"..text)
------------------------------------------------------------------------
if text == "اضف كت تويت" and SudoBot(msg) then
database:set(bot_id.."gamebot:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_,true)
return send(msg.chat_id_, msg.id_,"ارسل السؤال الان ")
end
if text == "حذف كت تويت" and SudoBot(msg) then
database:del(bot_id.."gamebot:List:Manager")
return send(msg.chat_id_, msg.id_,"تم حذف الاسئله")
end
if text and text:match("^(.*)$") then
if database:get(bot_id.."gamebot:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_) == "true" then
send(msg.chat_id_, msg.id_, '\nتم حفظ السؤال بنجاح')
database:set(bot_id.."gamebot:Set:Manager:rd"..msg.sender_user_id_..":"..msg.chat_id_,"true1uu")
database:sadd(bot_id.."gamebot:List:Manager", text)
return false end
end
if text == 'كت تويت' then
local list = database:smembers(bot_id..'gamebot:List:Manager')
quschen = list[math.random(#list)]
send(msg.chat_id_, msg.id_,quschen)
end
------------------------------------------------------------------------
if text1 then 
send(msg.chat_id_, msg.id_,text1)
database:sadd(bot_id..'Spam:Texting'..msg.sender_user_id_,text) 
end
if stekr then 
sendSticker(msg.chat_id_, msg.id_, 0, 1, nil, stekr)   
database:sadd(bot_id..'Spam:Texting'..msg.sender_user_id_,text) 
end
if veico then 
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, veico)   
database:sadd(bot_id..'Spam:Texting'..msg.sender_user_id_,text) 
end
if video then 
sendVideo(msg.chat_id_, msg.id_, 0, 1, nil,video)
database:sadd(bot_id..'Spam:Texting'..msg.sender_user_id_,text) 
end
if anemi then 
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, anemi, '', nil)  
database:sadd(bot_id..'Spam:Texting'..msg.sender_user_id_,text) 
end
if document then
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, document)   
database:sadd(bot_id..'Spam:Texting'..msg.sender_user_id_,text) 
end  
if audio then
sendAudio(msg.chat_id_,msg.id_,audio)  
database:sadd(bot_id..'Spam:Texting'..msg.sender_user_id_,text) 
end
if photo then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil,photo,'')
database:sadd(bot_id..'Spam:Texting'..msg.sender_user_id_,text) 
end  
end
end
if text == ("مسح الردود") and BasicConstructor(msg) then
local list = database:smembers(bot_id..'List:Manager'..msg.chat_id_..'')
for k,v in pairs(list) do
database:del(bot_id.."Add:Rd:Manager:Gif"..v..msg.chat_id_)   
database:del(bot_id.."Add:Rd:Manager:Vico"..v..msg.chat_id_)   
database:del(bot_id.."Add:Rd:Manager:Stekrs"..v..msg.chat_id_)     
database:del(bot_id.."Add:Rd:Manager:Text"..v..msg.chat_id_)   
database:del(bot_id.."Add:Rd:Manager:Photo"..v..msg.chat_id_)
database:del(bot_id.."Add:Rd:Manager:Video"..v..msg.chat_id_)
database:del(bot_id.."Add:Rd:Manager:File"..v..msg.chat_id_)
database:del(bot_id.."Add:Rd:Manager:Audio"..v..msg.chat_id_)
database:del(bot_id..'List:Manager'..msg.chat_id_)
end
send(msg.chat_id_, msg.id_,"• تم مسح الردود")
end
if text == ("الردود") and Manager(msg) then
local list = database:smembers(bot_id..'List:Manager'..msg.chat_id_..'')
text = " قائمه الردود \n *܀⠤⠤⠤⠤⠤⠤܀ٴ*\n"
for k,v in pairs(list) do
if database:get(bot_id.."Add:Rd:Manager:Gif"..v..msg.chat_id_) then
db = 'متحركه •'
elseif database:get(bot_id.."Add:Rd:Manager:Vico"..v..msg.chat_id_) then
db = 'بصمه •'
elseif database:get(bot_id.."Add:Rd:Manager:Stekrs"..v..msg.chat_id_) then
db = 'ملصق •'
elseif database:get(bot_id.."Add:Rd:Manager:Text"..v..msg.chat_id_) then
db = 'رساله •'
elseif database:get(bot_id.."Add:Rd:Manager:Photo"..v..msg.chat_id_) then
db = 'صوره •'
elseif database:get(bot_id.."Add:Rd:Manager:Video"..v..msg.chat_id_) then
db = 'فيديو •'
elseif database:get(bot_id.."Add:Rd:Manager:File"..v..msg.chat_id_) then
db = 'ملف •'
elseif database:get(bot_id.."Add:Rd:Manager:Audio"..v..msg.chat_id_) then
db = 'اغنيه •'
end
text = text..""..k..">> ("..v..") > {"..db.."}\n"
end
if #list == 0 then
text = "• لا يوجد ردود"
end
send(msg.chat_id_, msg.id_,'['..text..']')
end
if text or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.animation_ or msg.content_.audio_ or msg.content_.document_ or msg.content_.photo_ or msg.content_.video_ then  
local test = database:get(bot_id..'Text:Manager'..msg.sender_user_id_..':'..msg.chat_id_..'')
if database:get(bot_id..'Set:Manager:rd'..msg.sender_user_id_..':'..msg.chat_id_) == 'true1' then
database:del(bot_id..'Set:Manager:rd'..msg.sender_user_id_..':'..msg.chat_id_)
if msg.content_.sticker_ then   
database:set(bot_id.."Add:Rd:Manager:Stekrs"..test..msg.chat_id_, msg.content_.sticker_.sticker_.persistent_id_)  
end   
if msg.content_.voice_ then  
database:set(bot_id.."Add:Rd:Manager:Vico"..test..msg.chat_id_, msg.content_.voice_.voice_.persistent_id_)  
end   
if msg.content_.animation_ then   
database:set(bot_id.."Add:Rd:Manager:Gif"..test..msg.chat_id_, msg.content_.animation_.animation_.persistent_id_)  
end  
if text then   
text = text:gsub('"','') 
text = text:gsub("'",'') 
text = text:gsub('`','') 
text = text:gsub('*','') 
database:set(bot_id.."Add:Rd:Manager:Text"..test..msg.chat_id_, text)  
end  
if msg.content_.audio_ then
database:set(bot_id.."Add:Rd:Manager:Audio"..test..msg.chat_id_, msg.content_.audio_.audio_.persistent_id_)  
end
if msg.content_.document_ then
database:set(bot_id.."Add:Rd:Manager:File"..test..msg.chat_id_, msg.content_.document_.document_.persistent_id_)  
end
if msg.content_.video_ then
database:set(bot_id.."Add:Rd:Manager:Video"..test..msg.chat_id_, msg.content_.video_.video_.persistent_id_)  
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_group = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_group = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_group = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_group = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
database:set(bot_id.."Add:Rd:Manager:Photo"..test..msg.chat_id_, photo_in_group)  
end
send(msg.chat_id_, msg.id_,' تم حفظ الرد بنجاح')
return false  
end  
end
if text and text:match("^(.*)$") then
if database:get(bot_id..'Set:Manager:rd'..msg.sender_user_id_..':'..msg.chat_id_) == 'true' then
send(msg.chat_id_, msg.id_,'• ارسل الرد الذي تريده سواء كان {صوره,فيديو,متحركه,ملصق,بصمه,صوت}')
database:set(bot_id..'Set:Manager:rd'..msg.sender_user_id_..':'..msg.chat_id_,'true1')
database:set(bot_id..'Text:Manager'..msg.sender_user_id_..':'..msg.chat_id_, text)
database:del(bot_id.."Add:Rd:Manager:Gif"..text..msg.chat_id_)   
database:del(bot_id.."Add:Rd:Manager:Vico"..text..msg.chat_id_)   
database:del(bot_id.."Add:Rd:Manager:Stekrs"..text..msg.chat_id_)     
database:del(bot_id.."Add:Rd:Manager:Text"..text..msg.chat_id_)   
database:del(bot_id.."Add:Rd:Manager:Photo"..text..msg.chat_id_)
database:del(bot_id.."Add:Rd:Manager:Video"..text..msg.chat_id_)
database:del(bot_id.."Add:Rd:Manager:File"..text..msg.chat_id_)
database:del(bot_id.."Add:Rd:Manager:Audio"..text..msg.chat_id_)
database:sadd(bot_id..'List:Manager'..msg.chat_id_..'', text)
return false end
end
if text and text:match("^(.*)$") then
if database:get(bot_id..'Set:Manager:rd'..msg.sender_user_id_..':'..msg.chat_id_..'') == 'true2' then
send(msg.chat_id_, msg.id_,'• تم ازالة الرد ')
database:del(bot_id.."Add:Rd:Manager:Gif"..text..msg.chat_id_)   
database:del(bot_id.."Add:Rd:Manager:Vico"..text..msg.chat_id_)   
database:del(bot_id.."Add:Rd:Manager:Stekrs"..text..msg.chat_id_)     
database:del(bot_id.."Add:Rd:Manager:Text"..text..msg.chat_id_)   
database:del(bot_id.."Add:Rd:Manager:Photo"..text..msg.chat_id_)
database:del(bot_id.."Add:Rd:Manager:Video"..text..msg.chat_id_)
database:del(bot_id.."Add:Rd:Manager:File"..text..msg.chat_id_)
database:del(bot_id.."Add:Rd:Manager:Audio"..text..msg.chat_id_)
database:del(bot_id..'Set:Manager:rd'..msg.sender_user_id_..':'..msg.chat_id_)
database:srem(bot_id..'List:Manager'..msg.chat_id_..'', text)
return false
end
end
if text == 'اضف رد' and Manager(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
send(msg.chat_id_, msg.id_,'• ارسل الكلمه التي تريد اضافتها')
database:set(bot_id..'Set:Manager:rd'..msg.sender_user_id_..':'..msg.chat_id_,true)
return false 
end
------------------------------------------------------------------------
if text == 'حذف رد' and Manager(msg) then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
send(msg.chat_id_, msg.id_,' ارسل الكلمه التي تريد حذفها')
database:set(bot_id..'Set:Manager:rd'..msg.sender_user_id_..':'..msg.chat_id_,'true2')
return false 
end
if text and not database:get(bot_id..'Reply:Manager'..msg.chat_id_) then
if not database:sismember(bot_id..'Spam:Texting'..msg.sender_user_id_,text) then
local anemi = database:get(bot_id.."Add:Rd:Manager:Gif"..text..msg.chat_id_)   
local veico = database:get(bot_id.."Add:Rd:Manager:Vico"..text..msg.chat_id_)   
local stekr = database:get(bot_id.."Add:Rd:Manager:Stekrs"..text..msg.chat_id_)     
local text1 = database:get(bot_id.."Add:Rd:Manager:Text"..text..msg.chat_id_)   
local photo = database:get(bot_id.."Add:Rd:Manager:Photo"..text..msg.chat_id_)
local video = database:get(bot_id.."Add:Rd:Manager:Video"..text..msg.chat_id_)
local document = database:get(bot_id.."Add:Rd:Manager:File"..text..msg.chat_id_)
local audio = database:get(bot_id.."Add:Rd:Manager:Audio"..text..msg.chat_id_)
------------------------------------------------------------------------
if text1 then 
send(msg.chat_id_, msg.id_, text1)
database:sadd(bot_id..'Spam:Texting'..msg.sender_user_id_,text) 
end
if stekr then 
sendSticker(msg.chat_id_, msg.id_, 0, 1, nil, stekr)   
database:sadd(bot_id..'Spam:Texting'..msg.sender_user_id_,text) 
end
if veico then 
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, veico)   
database:sadd(bot_id..'Spam:Texting'..msg.sender_user_id_,text) 
end
if video then 
sendVideo(msg.chat_id_, msg.id_, 0, 1, nil,video)
database:sadd(bot_id..'Spam:Texting'..msg.sender_user_id_,text) 
end
if anemi then 
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, anemi)   
database:sadd(bot_id..'Spam:Texting'..msg.sender_user_id_,text) 
end
if document then
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, document)   
database:sadd(bot_id..'Spam:Texting'..msg.sender_user_id_,text) 
end  
if audio then
sendAudio(msg.chat_id_,msg.id_,audio)  
database:sadd(bot_id..'Spam:Texting'..msg.sender_user_id_,text) 
end
if photo then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil,photo,photo_caption)
database:sadd(bot_id..'Spam:Texting'..msg.sender_user_id_,text) 
end  
end
end
if text == ""..(database:get(bot_id..'Name:Bot') or 'بلاك').." غادر" or text == 'بوت غادر' then  
if Sudo(msg) and not database:get(bot_id..'Left:Bot'..msg.chat_id_)  then 
tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=bot_id,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
send(msg.chat_id_, msg.id_,'•وجودنا جميع وبعدنا خساره تم مغادرة المجموعه') 
database:srem(bot_id..'Chek:Groups',msg.chat_id_)  
end
return false  
end
-------------------------------
if text == 'بوت' then
Namebot = (database:get(bot_id..'Name:Bot') or 'بلاك')
send(msg.chat_id_, msg.id_,'*اسمي '..Namebot..'*')
end
if text == 'الاحصائيات' then
if Sudo(msg) then 
local Groups = database:scard(bot_id..'Chek:Groups')  
local Users = database:scard(bot_id..'User_Bot')  
Text = '•عدد المجموعات >  {'..Groups..'}'..'\n• عدد المشتركين >  {'..Users..'}'
send(msg.chat_id_, msg.id_,Text) 
end
return false
end
if text == 'المجموعات' then
if Sudo(msg) then 
local Groups = database:scard(bot_id..'Chek:Groups')  
local Users = database:scard(bot_id..'User_Bot')  
Text = '• عدد المجموعات > {`'..Groups..'`}'
send(msg.chat_id_, msg.id_,Text) 
end
return false
end
if text == 'المشتركين' then
if Sudo(msg) then 
local Groups = database:scard(bot_id..'Chek:Groups')  
local Users = database:scard(bot_id..'User_Bot')  
Text = '• عدد المشتركين > {`'..Users..'}'
send(msg.chat_id_, msg.id_,Text) 
end
return false
end
if text == 'تفعيل المغادره' and SudoBot(msg) then   
if database:get(bot_id..'Left:Bot'..msg.chat_id_) then
Text = ' تم تفعيل مغادرة البوت'
database:del(bot_id..'Left:Bot'..msg.chat_id_)  
else
Text = ' بالتاكيد تم تفعيل مغادرة البوت'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل المغادره' and SudoBot(msg) then  
if not database:get(bot_id..'Left:Bot'..msg.chat_id_) then
Text = ' تم تعطيل مغادرة البوت'
database:set(bot_id..'Left:Bot'..msg.chat_id_,true)   
else
Text = ' بالتاكيد تم تعطيل مغادرة البوت'
end
send(msg.chat_id_, msg.id_, Text) 
end

if text == 'تفعيل الردود' and Manager(msg) then   
if database:get(bot_id..'Reply:Manager'..msg.chat_id_) then
Text = ' تم تفعيل الردود'
database:del(bot_id..'Reply:Manager'..msg.chat_id_)  
else
Text = ' تم تفعيل الردود'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل ردود ' and Manager(msg) then  
if not database:get(bot_id..'Reply:Manager'..msg.chat_id_) then
database:set(bot_id..'Reply:Manager'..msg.chat_id_,true)  
Text = '\n تم تعطيل ردود ' 
else
Text = '\n بالتاكيد تم تعطيل ردود '
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تفعيل الردود العامه' and Manager(msg) then   
if database:get(bot_id..'Reply:Sudo'..msg.chat_id_) then
database:del(bot_id..'Reply:Sudo'..msg.chat_id_)  
Text = '\n تم تفعيل الردود العامه' 
else
Text = '\n بالتاكيد تم تفعيل الردود العامه'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل الردود العامه' and Manager(msg) then  
if not database:get(bot_id..'Reply:Sudo'..msg.chat_id_) then
database:set(bot_id..'Reply:Sudo'..msg.chat_id_,true)   
Text = '\n• تعطيل الردود العامه' 
else
Text = '\n بالتاكيد تم تتعطيل الردود العامه'
end
send(msg.chat_id_, msg.id_,Text) 
end

if text == 'تفعيل الايدي' and Manager(msg) then   
if database:get(bot_id..'Bot:Id'..msg.chat_id_)  then
database:del(bot_id..'Bot:Id'..msg.chat_id_) 
Text = '\n تم تفعيل الايدي' 
else
Text = '\n بالتاكيد تم تفعيل الايدي'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل الايدي' and Manager(msg) then  
if not database:get(bot_id..'Bot:Id'..msg.chat_id_)  then
database:set(bot_id..'Bot:Id'..msg.chat_id_,true) 
Text = '\n تم تعطيل الايدي' 
else
Text = '\n بالتاكيد تم تعطيل الايدي'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تفعيل الايدي بالصوره' and Manager(msg) then   
if database:get(bot_id..'Bot:Id:Photo'..msg.chat_id_)  then
database:del(bot_id..'Bot:Id:Photo'..msg.chat_id_) 
Text = '\n تم تفعيل الايدي بالصور ' 
else
Text = '\n بالتاكيد تم تفعيل الايدي بالصوره '
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل الايدي بالصوره' and Manager(msg) then  
if not database:get(bot_id..'Bot:Id:Photo'..msg.chat_id_)  then
database:set(bot_id..'Bot:Id:Photo'..msg.chat_id_,true) 
Text = '\n تم تعطيل الايدي بالصوره' 
else
Text = '\n بالتاكيد تم تعطيل الايدي بالصوره'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تفعيل الحظر' and Constructor(msg) then   
if database:get(bot_id..'Lock:kick'..msg.chat_id_)  then
database:del(bot_id..'Lock:kick'..msg.chat_id_) 
Text = '\n تم تفعيل الحظر ' 
else
Text = '\n  بالتاكيد تم تفعيل الحظر '
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل الحظر' and Constructor(msg) then  
if not database:get(bot_id..'Lock:kick'..msg.chat_id_)  then
database:set(bot_id..'Lock:kick'..msg.chat_id_,true) 
Text = '\n تم تعطيل الحظر' 
else
Text = '\n بالتاكيد تم تعطيل الحظر'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تفعيل الرفع' and Constructor(msg) then   
if database:get(bot_id..'Lock:Add:Bot'..msg.chat_id_)  then
database:del(bot_id..'Lock:Add:Bot'..msg.chat_id_) 
Text = '\n تم تفعيل الرفع ' 
else
Text = '\n• بالتاكيد تم تفعيل الرفع '
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل الرفع' and Constructor(msg) then  
if not database:get(bot_id..'Lock:Add:Bot'..msg.chat_id_)  then
database:set(bot_id..'Lock:Add:Bot'..msg.chat_id_,true) 
Text = '\n• تم تعطيل الرفع' 
else
Text = '\n بالتاكيد تم تعطيل الرفع'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text and text:match("^وضع لقب (.*)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
local timsh = text:match("^وضع لقب (.*)$")
function start_function(extra, result, success)
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,' البوت ليس مشرف يرجى ترقيتي !') 
return false  
end
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n• العضو > ['..data.first_name_..'](t.me/'..(data.username_ or 'MODEDEV')..') '
status  = '\n• الايدي > '..result.sender_user_id_..'\n•تم ضافه {'..timsh..'} كلقب له'
send(msg.chat_id_, msg.id_, usertext..status)
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=True&can_restrict_members=false&can_pin_messages=True&can_promote_members=false")
https.request("https://api.telegram.org/bot"..token.."/setChatAdministratorCustomTitle?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&custom_title="..timsh)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text == 'ايدي' and tonumber(msg.reply_to_message_id_) > 0 then
function start_function(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(extra,data) 
local Msguser = tonumber(database:get(bot_id..'Msg_User'..msg.chat_id_..':'..result.sender_user_id_) or 1) 
local Contact = tonumber(database:get(bot_id..'Add:Contact'..msg.chat_id_..':'..result.sender_user_id_) or 0) 
local NUMPGAME = tonumber(database:get(bot_id..'NUM:GAMES'..msg.chat_id_..result.sender_user_id_) or 0)
local edit = tonumber(database:get(bot_id..'edits'..msg.chat_id_..result.sender_user_id_) or 0)
local rtp = Rutba(result.sender_user_id_,msg.chat_id_)
local username = ('[@'..data.username_..']' or 'لا يوجد')
local iduser = result.sender_user_id_
send(msg.chat_id_, msg.id_,'• ID • ('..iduser..')\n•USE • ('..username..')\n• STA • ('..rtp..')\n• MSG • ('..Msguser..')')
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
end
if text and text:match("^ايدي @(.*)$") then
local username = text:match("^ايدي @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•لا تستطيع استخدام البوت \n •يرجى الاشتراك بالقناه اولا \n •< جط ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
tdcli_function ({ID = "GetUser",user_id_ = result.id_},function(extra,data) 
local Msguser = tonumber(database:get(bot_id..'Msg_User'..msg.chat_id_..':'..result.id_) or 1) 
local Contact = tonumber(database:get(bot_id..'Add:Contact'..msg.chat_id_..':'..result.id_) or 0) 
local NUMPGAME = tonumber(database:get(bot_id..'NUM:GAMES'..msg.chat_id_..result.id_) or 0)
local edit = tonumber(database:get(bot_id..'edits'..msg.chat_id_..result.id_) or 0)
local rtp = Rutba(result.id_,msg.chat_id_)
local username = ('[@'..data.username_..']' or 'لا يوجد')
local iduser = result.id_
send(msg.chat_id_, msg.id_,'• ID • (`'..iduser..'`)\n• USE • ('..username..')\n• STA • ('..rtp..')\n• MSG • ('..Msguser..')')
end,nil)
else
send(msg.chat_id_, msg.id_,'• المعرف غير صحيح ')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
end
if text == 'رتبتي' then
local rtp = Rutba(msg.sender_user_id_,msg.chat_id_)
send(msg.chat_id_, msg.id_,'• رتبتك في البوت > '..rtp)
end
if text == "اسمي"  then 
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(extra,result,success)
if result.first_name_  then
first_name = '• اسمك الاول > {`'..(result.first_name_)..'`}'
else
first_name = ''
end   
if result.last_name_ then 
last_name = '• اسمك الثاني > {`'..result.last_name_..'`}' 
else
last_name = ''
end      
send(msg.chat_id_, msg.id_,first_name..'\n'..last_name) 
end,nil)
end 
if text == 'ايديي' then
send(msg.chat_id_, msg.id_,'• ايديك > '..msg.sender_user_id_)
end
if text == 'الرتبه' and tonumber(msg.reply_to_message_id_) > 0 then
function start_function(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(extra,data) 
local rtp = Rutba(result.sender_user_id_,msg.chat_id_)
local username = ' ['..data.first_name_..'](t.me/'..(data.username_ or 'BOBBW')..')'
local iduser = result.sender_user_id_
send(msg.chat_id_, msg.id_,'*- العضو > (*'..username..'*)\n- الرتبه > ('..rtp..')*\n')
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
end
---------
if text and text:match("^الرتبه @(.*)$") then
local username = text:match("^الرتبه @(.*)$")
function start_function(extra, result, success)
if result.id_ then
tdcli_function ({ID = "GetUser",user_id_ = result.id_},function(extra,data) 
local rtp = Rutba(result.id_,msg.chat_id_)
local username = ('[@'..data.username_..']' or 'لا يوجد')
local iduser = result.id_
send(msg.chat_id_, msg.id_,'*- العضو > (*'..username..'*)\n- الرتبه > ('..rtp..')*\n')
end,nil)
else
send(msg.chat_id_, msg.id_,'- المعرف غير صحيح ')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
end
---------
if text == 'كشف' and tonumber(msg.reply_to_message_id_) > 0 then
function start_function(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(extra,data) 
local rtp = Rutba(result.sender_user_id_,msg.chat_id_)
local username = ('[@'..data.username_..']' or 'لا يوجد')
local iduser = result.sender_user_id_
send(msg.chat_id_, msg.id_,'● الايدي > ('..iduser..')\n● المعرف > ('..username..')\n● الرتبه > ('..rtp..')\n')
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
end
---------
if text and text:match("^كشف @(.*)$") then
local username = text:match("^كشف @(.*)$")
function start_function(extra, result, success)
if result.id_ then
tdcli_function ({ID = "GetUser",user_id_ = result.id_},function(extra,data) 
local rtp = Rutba(result.id_,msg.chat_id_)
local username = ('[@'..data.username_..']' or 'لا يوجد')
local iduser = result.id_
send(msg.chat_id_, msg.id_,'● الايدي > ('..iduser..')\n● المعرف > ('..username..')\n● الرتبه > ('..rtp..')\n')
end,nil)
else
send(msg.chat_id_, msg.id_,'● المعرف غير صحيح ')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
end
if text==('عدد الجروب') and Mod(msg) then  
if msg.can_be_deleted_ == false then 
send(msg.chat_id_,msg.id_,"• البوت ليس ادمن هنا \n") 
return false  
end 
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,ta) 
tdcli_function({ID="GetChannelFull",channel_id_ = msg.chat_id_:gsub('-100','')},function(arg,data) 
local taha = '• عدد الادمنيه : '..data.administrator_count_..
'\n\n عدد المطرودين : '..data.kicked_count_..
'\n\n• عدد الاعضاء : '..data.member_count_..
'\n\n• عدد رسائل المجموعه : '..(msg.id_/2097152/0.5)..
'\n\n• اسم المجموعه : ['..ta.title_..']'
send(msg.chat_id_, msg.id_, taha) 
end,nil)
end,nil)
end 
if text == 'اطردني' or text == 'احظرني' then
if not database:get(bot_id..'Cick:Me'..msg.chat_id_) then
if Can_or_NotCan(msg.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, '\n• عذرا عزيزي لا يمكنني طرد( '..Rutba(msg.sender_user_id_,msg.chat_id_)..' )')
return false
end
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=msg.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_, msg.id_,'• ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !') 
return false  
end
if (data and data.code_ and data.code_ == 3) then 
send(msg.chat_id_, msg.id_,'• البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
if data and data.code_ and data.code_ == 400 and data.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_, msg.id_,'• عذرا لا استطيع طرد ادمنية المجموعه') 
return false  
end
if data and data.ID and data.ID == 'Ok' then
send(msg.chat_id_, msg.id_,' تم طردك من المجموعه ') 
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = msg.sender_user_id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
return false
end
end,nil)   
else
send(msg.chat_id_, msg.id_,' امر اطردني تم تعطيله من قبل المدراء ') 
end
end
if text == 'تنزيل جميع الرتب' and BasicConstructor(msg) then  
database:del(bot_id..'Constructor'..msg.chat_id_)
database:del(bot_id..'Manager'..msg.chat_id_)
database:del(bot_id..'Mod:User'..msg.chat_id_)
database:del(bot_id..'Special:User'..msg.chat_id_)
send(msg.chat_id_, msg.id_, '\n • تم تنزيل الكل من الرتب الاتيه\n المميزين\nالادمنيه\nالمدراء\n المنشئين\n')
end
if text and text:match("^صيح (.*)$") then
local username = text:match("^صيح (.*)$") 
if not database:get(bot_id..'Seh:User'..msg.chat_id_) then
function start_function(extra, result, success)
if result and result.message_ and result.message_ == "USERNAME_NOT_OCCUPIED" then 
send(msg.chat_id_, msg.id_,'• المعرف غلط ') 
return false  
end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.ID == "Channel" then
send(msg.chat_id_, msg.id_,'• لا اسطيع صيح معرفات القنوات') 
return false  
end
if result.type_.user_.type_.ID == "UserTypeBot" then
send(msg.chat_id_, msg.id_,'• لا اسطيع صيح معرفات البوتات') 
return false  
end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.is_supergroup_ == true then
send(msg.chat_id_, msg.id_,'• لا اسطيع صيح معرفات المجموعات') 
return false  
end
if result.id_ then
send(msg.chat_id_, msg.id_,'• تعال يصيحوك [@'..username..']') 
return false
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
else
send(msg.chat_id_, msg.id_,' امر صيح تم تعطيله من قبل المدراء ') 
end
return false
end
if text and text:match("(.*)(ضافني)(.*)") then
if not database:get(bot_id..'Added:Me'..msg.chat_id_) then
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da and da.status_.ID == "ChatMemberStatusCreator" then
send(msg.chat_id_, msg.id_,' انت منشئ المجموعه ') 
return false
end
local Added_Me = database:get(bot_id.."Who:Added:Me"..msg.chat_id_..':'..msg.sender_user_id_)
if Added_Me then 
tdcli_function ({ID = "GetUser",user_id_ = Added_Me},function(extra,result,success)
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
Text = '• هذا الي ضافك  > '..Name
sendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
end,nil)
else
send(msg.chat_id_, msg.id_,'• انت دخلت عبر الرابط ') 
end
end,nil)
else
send(msg.chat_id_, msg.id_,'• امر منو ضافني تم تعطيله من قبل المدراء ') 
end
end
if text == 'تفعيل ضافني' and Manager(msg) then   
if database:get(bot_id..'Added:Me'..msg.chat_id_) then
Text = ' تم تفعيل امر ضافني'
database:del(bot_id..'Added:Me'..msg.chat_id_)  
else
Text = ' بالتاكيد تم تفعيل امر  ضافني'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل ضافني' and Manager(msg) then  
if not database:get(bot_id..'Added:Me'..msg.chat_id_) then
database:set(bot_id..'Added:Me'..msg.chat_id_,true)  
Text = '\n تم تعطيل امر  ضافني'
else
Text = '\n بالتاكيد تم تعطيل امر  ضافني'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تفعيل صيح' and Manager(msg) then   
if database:get(bot_id..'Seh:User'..msg.chat_id_) then
Text = ' تم تفعيل امر صيح'
database:del(bot_id..'Seh:User'..msg.chat_id_)  
else
Text = ' بالتاكيد تم تفعيل امر صيح'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل صيح' and Manager(msg) then  
if not database:get(bot_id..'Seh:User'..msg.chat_id_) then
database:set(bot_id..'Seh:User'..msg.chat_id_,true)  
Text = '\n تم تعطيل امر صيح'
else
Text = '\n بالتاكيد تم تعطيل امر صيح'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تفعيل اطردني' and Manager(msg) then   
if database:get(bot_id..'Cick:Me'..msg.chat_id_) then
Text = ' تم تفعيل امر اطردني'
database:del(bot_id..'Cick:Me'..msg.chat_id_)  
else
Text = ' بالتاكيد تم تفعيل امر اطردني'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل اطردني' and Manager(msg) then  
if not database:get(bot_id..'Cick:Me'..msg.chat_id_) then
database:set(bot_id..'Cick:Me'..msg.chat_id_,true)  
Text = '\n•  تم تعطيل امر اطردني'
else
Text = '\n• بالتاكيد تم تعطيل امر اطردني'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == "صورتي"  then
local my_ph = database:get(bot_id.."my_photo:status"..msg.chat_id_)
if not my_ph then
send(msg.chat_id_, msg.id_,"• الصوره معطله") 
return false  
end
local function getpro(extra, result, success)
if result.photos_[0] then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_,"• عدد صورك   >  "..result.total_count_.." صوره‌‏ •", msg.id_, msg.id_, "md")
else
send(msg.chat_id_, msg.id_,'لا تمتلك صوره في حسابك', 1, 'md')
  end end
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = msg.sender_user_id_, offset_ = 0, limit_ = 1 }, getpro, nil)
end
if text == ("ايدي") or text == ("id") or text == ("ID")  or text == ("Id") and msg.reply_to_message_id_ == 0 and not database:get(bot_id..'Bot:Id'..msg.chat_id_) then     
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•لا تستطيع استخدام البوت \n •يرجى الاشتراك بالقناه اولا \n •< جط ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if not database:sismember(bot_id..'Spam:Texting'..msg.sender_user_id_,text) then
database:sadd(bot_id..'Spam:Texting'..msg.sender_user_id_,text) 
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da)  tdcli_function ({ ID = "SendChatAction",  chat_id_ = msg.sender_user_id_, action_ = {  ID = "SendMessageTypingAction", progress_ = 100}  },function(arg,ta)  tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)  tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = msg.sender_user_id_,offset_ = 0,limit_ = 1},function(extra,taha,success) 
if da.status_.ID == "ChatMemberStatusCreator" then 
rtpa = 'المالك'
elseif da.status_.ID == "ChatMemberStatusEditor" then 
rtpa = 'مشرف' 
elseif da.status_.ID == "ChatMemberStatusMember" then 
rtpa = 'عضو'
end

local Ctitle = json:decode(https.request("https://api.telegram.org/bot"..token.."/getChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_))
if Ctitle.result.status == "administrator" and Ctitle.result.custom_title or Ctitle.result.status == "creator" and Ctitle.result.custom_title then
lakbk = Ctitle.result.custom_title
else
lakbk = 'لا يوجد'
end
local Msguser = tonumber(database:get(bot_id..'Msg_User'..msg.chat_id_..':'..msg.sender_user_id_) or 1) 
local nummsggp = tonumber(msg.id_/2097152/0.5)
local nspatfa = tonumber(Msguser / nummsggp * 100)
local Contact = tonumber(database:get(bot_id..'Add:Contact'..msg.chat_id_..':'..msg.sender_user_id_) or 0) 
local NUMPGAME = tonumber(database:get(bot_id..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_) or 0)
local rtp = Rutba(msg.sender_user_id_,msg.chat_id_)
if result.username_ then
username = '@'..result.username_ 
else
username = 'لا يوجد '
end
local iduser = msg.sender_user_id_
local edit = tonumber(database:get(bot_id..'edits'..msg.chat_id_..msg.sender_user_id_) or 0)
local photps = (taha.total_count_ or 0)
local interaction = Total_Msg(Msguser)
local rtpg = rtpa
local tahaa = {
"",
}
local rdphoto = tahaa[math.random(#tahaa)]
if not database:get(bot_id..'Bot:Id:Photo'..msg.chat_id_) then      
local get_id_text = database:get(bot_id.."KLISH:ID"..msg.chat_id_)
if get_id_text then
if result.username_ then
username = '@'..result.username_ 
else
username = 'لا يوجد '
end
get_id_text = get_id_text:gsub('#تعليق',rdphoto) 
get_id_text = get_id_text:gsub('#ايدي',iduser) 
get_id_text = get_id_text:gsub('#يوزرك',username) 
get_id_text = get_id_text:gsub('#رسائلك',Msguser) 
get_id_text = get_id_text:gsub('#تعديلاتك',edit) 
get_id_text = get_id_text:gsub('#رتبتك',rtp) 
get_id_text = get_id_text:gsub('#تفاعلك',interaction) 
get_id_text = get_id_text:gsub('#نقاطك',NUMPGAME) 
get_id_text = get_id_text:gsub('#صورك',photps) 
if result.status_.ID == "UserStatusRecently" and result.profile_photo_ ~= false then   
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, taha.photos_[0].sizes_[1].photo_.persistent_id_,get_id_text)       
else 
if result.status_.ID == "UserStatusEmpty" and result.profile_photo_ == false then
send(msg.chat_id_, msg.id_,'['..get_id_text..']')   
else
send(msg.chat_id_, msg.id_, '\nليس لديك صور في حسابك \n['..get_id_text..']')      
end 
end
else
if result.username_ then
username = '@'..result.username_ 
else
username = 'لا يوجد '
end
if result.status_.ID == "UserStatusRecently" and result.profile_photo_ ~= false then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, taha.photos_[0].sizes_[1].photo_.persistent_id_,''..rdphoto..'\n•  iD 𖦹 '..msg.sender_user_id_..'\n•  User Name 𖦹 '..username..'\n•  Rank 𖦹 '..Rutba(msg.sender_user_id_,msg.chat_id_)..'\n•  Msg 𖦹 '..Msguser..'\n•  Your Title 𖦹 '..lakbk..'\n')
else 
if result.status_.ID == "UserStatusEmpty" and result.profile_photo_ == false then
send(msg.chat_id_, msg.id_,'[\n • 𝐈𝐃 '..msg.sender_user_id_..'\n • 𝐔𝐒𝐄𝐑⁦ - '..username..'\n • 𝐑𝐀𝐍𝐊 - '..Rutba(msg.sender_user_id_,msg.chat_id_)..'\n • 𝐌𝐒𝐆𝐒⁦ - '..Msguser..'\n')
else
send(msg.chat_id_, msg.id_, '\n • الصوره - ليس لديك صور في حسابك'..'[\n • 𝐈𝐃ッ - '..msg.sender_user_id_..'\n • 𝐔𝐒𝐄𝐑⁦ - '..username..'\n • 𝐑𝐀𝐍𝐊 - '..Rutba(msg.sender_user_id_,msg.chat_id_)..'\n • 𝐌𝐒𝐆𝐒⁦ - '..Msguser..'\n')
end 
end
end
else
local get_id_text = database:get(bot_id.."KLISH:ID"..msg.chat_id_)
if get_id_text then
get_id_text = get_id_text:gsub('#تعليق',rdphoto) 
get_id_text = get_id_text:gsub('#ايدي',iduser) 
get_id_text = get_id_text:gsub('#يوزرك',username) 
get_id_text = get_id_text:gsub('#رسائلك',Msguser) 
get_id_text = get_id_text:gsub('#تعديلاتك',edit) 
get_id_text = get_id_text:gsub('#رتبتك',rtp) 
get_id_text = get_id_text:gsub('#تفاعلك',interaction) 
get_id_text = get_id_text:gsub('#نقاطك',NUMPGAME) 
get_id_text = get_id_text:gsub('#صورك',photps) 
send(msg.chat_id_, msg.id_,'['..get_id_text..']')   
else
send(msg.chat_id_, msg.id_,'[\n • ايديك - '..msg.sender_user_id_..'💕\n • معرفك - '..username..'💕\n • رتبتك - '..Rutba(msg.sender_user_id_,msg.chat_id_)..'💕\n • موقعك - '..rtpa..'💕\n • تفاعلك - '..Total_Msg(Msguser)..'💕\n • رسائلك - '..Msguser..'💕\n • نسبه تفاعلك - '..string.sub(nspatfa, 1,5)..' %💕\n • السحكات - '..edit..'💕\n • نقاطك - '..NUMPGAME..']💕\n')
end
end

end,nil)
end,nil)
end,nil)
end,nil)
end
end

if text == 'سحكاتي' or text == 'تعديلاتي' then 
local Num = tonumber(database:get(bot_id..'edits'..msg.chat_id_..msg.sender_user_id_) or 0)
if Num == 0 then 
Text = ' •  ليس لديك سحكات'
else
Text = ' • عدد سحكاتك *> { '..Num..' } *'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == "مسح سحكاتي" or text == "حذف سحكاتي" then  
send(msg.chat_id_, msg.id_,' • تم مسح سحكاتك'  )  
database:del(bot_id..'edits'..msg.chat_id_..msg.sender_user_id_)
end
if text == "مسح جهاتي" or text == "حذف جهاتي" then  
send(msg.chat_id_, msg.id_,' • تم مسح جهاتك'  )  
database:del(bot_id..'Add:Contact'..msg.chat_id_..':'..msg.sender_user_id_)
end
if text == 'جهاتي' or text == 'ضفت كام' then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,' • لا تستطيع استخدام البوت \n  • يرجى الاشتراك بالقناه اولا \n  • < جط ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local Num = tonumber(database:get(bot_id..'Add:Contact'..msg.chat_id_..':'..msg.sender_user_id_) or 0) 
if Num == 0 then 
Text = ' • لم تقم بأضافه احد'
else
Text = ' • عدد جهاتك > ['..Num..'](https://t.me/UU_KFUF) •'
end
send(msg.chat_id_, msg.id_,Text) 
end

if text == "تنظيف المشتركين" and SudoBot(msg) then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
local pv = database:smembers(bot_id.."User_Bot")
local sendok = 0
for i = 1, #pv do
tdcli_function({ID='GetChat',chat_id_ = pv[i]
},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",  
chat_id_ = pv[i], action_ = {  ID = "SendMessageTypingAction", progress_ = 100} 
},function(arg,data) 
if data.ID and data.ID == "Ok"  then
else
database:srem(bot_id.."User_Bot",pv[i])
sendok = sendok + 1
end
if #pv == i then 
if sendok == 0 then
send(msg.chat_id_, msg.id_,'• لا يوجد مشتركين وهميين في البوت \n')   
else
local ok = #pv - sendok
send(msg.chat_id_, msg.id_,'• عدد المشتركين الان > ( '..#pv..' )\n• تم ازالة > ( '..sendok..' ) من المشتركين\n• الان عدد المشتركين الحقيقي > ( '..ok..' ) مشترك \n')   
end
end
end,nil)
end,nil)
end
return false
end
if text == "تنظيف المجموعات" and SudoBot(msg) then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
local group = database:smembers(bot_id..'Chek:Groups') 
local w = 0
local q = 0
for i = 1, #group do
tdcli_function({ID='GetChat',chat_id_ = group[i]
},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
database:srem(bot_id..'Chek:Groups',group[i])  
tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_=group[i],user_id_=bot_id,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
w = w + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
database:srem(bot_id..'Chek:Groups',group[i])  
q = q + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
database:srem(bot_id..'Chek:Groups',group[i])  
q = q + 1
end
if data and data.code_ and data.code_ == 400 then
database:srem(bot_id..'Chek:Groups',group[i])  
w = w + 1
end
if #group == i then 
if (w + q) == 0 then
send(msg.chat_id_, msg.id_,'لا يوجد مجموعات وهميه في البوت\n')   
else
local MODEDEV = (w + q)
local sendok = #group - MODEDEV
if q == 0 then
MODEDEV = ''
else
MODEDEV = '\n- تم ازالة » { '..q..' } مجموعات من البوت'
end
if w == 0 then
MODEDEVk = ''
else
MODEDEVk = '\n- تم ازالة » {'..w..'} مجموعه لان البوت عضو'
end
send(msg.chat_id_, msg.id_,' عدد المجموعات الان » { '..#group..' }'..MODEDEVk..''..MODEDEV..'\n*- الان عدد المجموعات الحقيقي » { '..sendok..' } مجموعات\n')   
end
end
end,nil)
end
return false
end

-----------
if text and text:match("^(gpinfo)$") or text and text:match("^معلومات المجموعه$") then
function gpinfo(arg,data)
-- vardump(data) 
MODEDEVdx(msg.chat_id_, msg.id_, '• ايدي المجموعة > ( '..msg.chat_id_..' )\n عدد الادمنيه > ( *'..data.administrator_count_..' )*\n• عدد المحظورين > ( *'..data.kicked_count_..' )*\n• عدد الاعضاء > ( *'..data.member_count_..' )*\n', 'md') 
end 
getChannelFull(msg.chat_id_, gpinfo, nil) 
end
-----------
if text ==("مسح") and Mod(msg) and tonumber(msg.reply_to_message_id_) > 0 then
DeleteMessage(msg.chat_id_,{[0] = tonumber(msg.reply_to_message_id_),msg.id_})   
end   
if database:get(bot_id.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
database:del(bot_id..'id:user'..msg.chat_id_)  
send(msg.chat_id_, msg.id_, "• تم الغاء الامر ") 
database:del(bot_id.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  
end 
database:del(bot_id.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = database:get(bot_id..'id:user'..msg.chat_id_)  
database:del(bot_id..'Msg_User'..msg.chat_id_..':'..msg.sender_user_id_) 
database:incrby(bot_id..'Msg_User'..msg.chat_id_..':'..iduserr,numadded)  
send(msg.chat_id_, msg.id_," تم اضافة له {"..numadded..'} من الرسائل')  
end
------------------------------------------------------------------------
if database:get(bot_id.."gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
database:del(bot_id..'idgem:user'..msg.chat_id_)  
send(msg.chat_id_, msg.id_, "• تم الغاء الامر ") 
database:del(bot_id.."gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  
end 
database:del(bot_id.."gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = database:get(bot_id..'idgem:user'..msg.chat_id_)  
database:incrby(bot_id..'NUM:GAMES'..msg.chat_id_..iduserr,numadded)  
send(msg.chat_id_, msg.id_,  1, "• تم اضافة له {"..numadded..'} من النقاطي', 1 , 'md')  
end
------------------------------------------------------------
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id_ == 0 and Constructor(msg) then    
taha = text:match("^اضف رسائل (%d+)$")
database:set(bot_id..'id:user'..msg.chat_id_,taha)  
database:setex(bot_id.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 120, true)  
send(msg.chat_id_, msg.id_, '• ارسل لي عدد الرسائل الان') 
return false
end
------------------------------------------------------------------------
if text and text:match("^اضف نقاط (%d+)$") and msg.reply_to_message_id_ == 0 and Constructor(msg) then  
taha = text:match("^اضف نقاط (%d+)$")
database:set(bot_id..'idgem:user'..msg.chat_id_,taha)  
database:setex(bot_id.."gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 120, true)  
send(msg.chat_id_, msg.id_, ' ارسل لي عدد النقاطي التي تريد اضافتها') 
return false
end
------------------------------------------------------------------------
if text and text:match("^اضف نقاط (%d+)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
local Num = text:match("^اضف نقاط (%d+)$")
function reply(extra, result, success)
database:incrby(bot_id..'NUM:GAMES'..msg.chat_id_..result.sender_user_id_,Num)  
send(msg.chat_id_, msg.id_," تم اضافة له {"..Num..'} من نقاط')  
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},reply, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
local Num = text:match("^اضف رسائل (%d+)$")
function reply(extra, result, success)
database:del(bot_id..'Msg_User'..msg.chat_id_..':'..result.sender_user_id_) 
database:incrby(bot_id..'Msg_User'..msg.chat_id_..':'..result.sender_user_id_,Num)  
send(msg.chat_id_, msg.id_, "\n• تم اضافة له {"..Num..'} من الرسائل')  
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},reply, nil)
return false
end
if text == 'نقاطي' or text == 'نقاط' then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black •\n• لايمكنك استخدام البوت •\n• عليك الاشتراك في القناة •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..'•]')
end
return false
end
local Num = database:get(bot_id..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_) or 0
if Num == 0 then 
Text = '• لم تلعب اي لعبه للحصول على نقاطي'
else
Text = '• عدد نقاطي التي ربحتها هي *> { '..Num..' }  نقطه *'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text and text:match("^بيع نقاطي (%d+)$") or text and text:match("^بيع نقاطي (%d+)$") then
local NUMPY = text:match("^بيع نقاطي (%d+)$") or text and text:match("^بيع نقاطي (%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•قناة الاشتراك ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if tonumber(NUMPY) == tonumber(0) then
send(msg.chat_id_,msg.id_,"\n*• لا استطيع البيع اقل من 1 *") 
return false 
end
if tonumber(database:get(bot_id..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_)) == tonumber(0) then
send(msg.chat_id_,msg.id_,'• ليس لديك نقاط في الالعاب\n اذا كنت تريد ربح نقاطي \n• ارسل الالعاب وابدأ اللعب ! ') 
else
local NUM_GAMES = database:get(bot_id..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_)
if tonumber(NUMPY) > tonumber(NUM_GAMES) then
send(msg.chat_id_,msg.id_,'\n• ليس لديك نقاط بهاذ العبه \n لزيادة نقاطيك في اللعبه \n• ارسل الالعاب وابدأ اللعب !') 
return false 
end
local NUMNKO = (NUMPY * 50)
database:decrby(bot_id..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_,NUMPY)  
database:incrby(bot_id..'Msg_User'..msg.chat_id_..':'..msg.sender_user_id_,NUMNKO)  
send(msg.chat_id_,msg.id_,' تم خصم *> { '..NUMPY..' }* من نقاطك \n• وتم اضافة* > { '..(NUMPY * 50)..' } رساله الى رسالك *')
end 
return false 
end
if text == 'فحص البوت' and Manager(msg) then
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. msg.chat_id_ ..'&user_id='.. bot_id..'')
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.ok == true then
if Json_Info.result.status == "administrator" then
if Json_Info.result.can_change_info == true then
info = 'ꪜ' else info = '✘' end
if Json_Info.result.can_delete_messages == true then
delete = 'ꪜ' else delete = '✘' end
if Json_Info.result.can_invite_users == true then
invite = 'ꪜ' else invite = '✘' end
if Json_Info.result.can_pin_messages == true then
pin = 'ꪜ' else pin = '✘' end
if Json_Info.result.can_restrict_members == true then
restrict = 'ꪜ' else restrict = '✘' end
if Json_Info.result.can_promote_members == true then
promote = 'ꪜ' else promote = '✘' end 
send(msg.chat_id_,msg.id_,'\n• اهلا عزيزي البوت هنا مشرف'..'\n  وصلاحياته هي ↓ \nٴ━━━━━━━━━━'..'\n•  تغير معلومات المجموعه ↞ ❴ '..info..' ❵'..'\n•  حذف الرسائل ↞ ❴ '..delete..' ❵'..'\n  حظر المستخدمين ↞ ❴ '..restrict..' ❵'..'\n•  دعوة مستخدمين ↞ ❴ '..invite..' ❵'..'\n  تثبيت الرسائل ↞ ❴ '..pin..' ❵'..'\n•  اضافة مشرفين جدد ↞ ❴ '..promote..' ❵')   
end
end
end
if text and text:match("^قول (.*)$") then
if not Special(msg) then
send(msg.chat_id_, msg.id_,'في عضو يتأمر برأسي') 
return false
end
local txt = {string.match(text, "^(قول) (.*)$")}
send(msg.chat_id_, 0, txt[2], "md")
local id = msg.id_
local msgs = {
[0] = id
}
local chat = msg.chat_id_
delete_msg(chat, msgs)
end
if text and text:match("^تغير رد المطور (.*)$") and Manager(msg) then
local Teext = text:match("^تغير رد المطور (.*)$") 
database:set(bot_id.."Sudo:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_,"• تم تغير رد المطور الى ← "..Teext)
end
if text and text:match("^تغير رد منشئ الاساسي (.*)$") and Manager(msg) then
local Teext = text:match("^تغير رد منشئ الاساسي (.*)$") 
database:set(bot_id.."BasicConstructor:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_,"• تم تغير رد المنشئ الاساسي الى ← "..Teext)
end
if text and text:match("^تغير رد المنشئ (.*)$") and Manager(msg) then
local Teext = text:match("^تغير رد المنشئ (.*)$") 
database:set(bot_id.."Constructor:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_,"• تم تغير رد المنشئ الى ← "..Teext)
end
if text and text:match("^تغير رد المدير (.*)$") and Manager(msg) then
local Teext = text:match("^تغير رد المدير (.*)$") 
database:set(bot_id.."Manager:Rd"..msg.chat_id_,Teext) 
send(msg.chat_id_, msg.id_,"• تم تغير رد المدير الى ← "..Teext)
end
if text and text:match("^تغير رد الادمن (.*)$") and Manager(msg) then
local Teext = text:match("^تغير رد الادمن (.*)$") 
database:set(bot_id.."Mod:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_,"• تم تغير رد الادمن الى ← "..Teext)
end
if text and text:match("^تغير رد المميز (.*)$") and Manager(msg) then
local Teext = text:match("^تغير رد المميز (.*)$") 
database:set(bot_id.."Special:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_,"• تم تغير رد المميز الى ← "..Teext)
end
if text and text:match("^تغير رد العضو (.*)$") and Manager(msg) then
local Teext = text:match("^تغير رد العضو (.*)$") 
database:set(bot_id.."Memp:Rd"..msg.chat_id_,Teext)
send(msg.chat_id_, msg.id_,"• تم تغير رد العضو الى ← "..Teext)
end

if text == 'الاوامر' then
if not Mod(msg) then
send(msg.chat_id_, msg.id_,'• عذرا الاوامر هذا لا تخصك ') 
return false
end
local Text =[[
*𝙷𝙸 𝙳𝚄𝙳𝙴 *
*܀⠤⠤⠤⠤⠤⠤܀*
*① الادمنيه*
*② للتفعيل،التعطيل،الرفع*
*③ الخدميات*
*④ اوامر المسح*
*⑤ اوامر الاعضاء*
*⑥ اومر التسليه*
*܀⠤⠤⠤⠤⠤⠤܀*
𝘊𝘩 - [BLACK](t.me/UU_KFUF)•
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '①', callback_data="/help1"},{text = '②', callback_data="/help2"},{text = '③', callback_data="/help3"},
},
{
{text = '④', callback_data="/help4"},{text = '⑤', callback_data="/help5"},
},
{
{text = 'اوامر التسليه', callback_data="/help10"},
},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end
----------------------------------------------------------------------------
if text == 'م6' or text == 'م٦' then
if not Sudo(msg) then
send(msg.chat_id_, msg.id_,'• عذرا الاوامر هذا لا تخصك ') 
return false
end
if AddChannel(msg.sender_user_id_) == false then
local textchuser = datahso:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•قناة الاشتراك ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
Text = [[
•   𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black 
•اوامر المطورين البوت كتالي
*܀⠤⠤⠤⠤⠤⠤܀ٴ*
• تفعيل - تعطيل 
• المجموعات - المشتركين 
• رفع - تنزيل منشئ اساسي
• مسح المنشئين - المنشئين
• اسم + غادر 
• اذاعه
• ردود العامه
•رفع -تنزيل مميز عام
•مسح المميزين عام - المميز العام
*܀⠤⠤⠤⠤⠤⠤܀ٴ*
𝘊𝘩 - [BLACK](t.me/UU_KFUF)•
]]
send(msg.chat_id_, msg.id_,Text) 
return false
end
----------------------------------------------------------------------------
if text == 'م7' or text == 'م المطور' then 
if not SudoBot(msg) then
send(msg.chat_id_, msg.id_,'• عذرا الاوامر هذا لا تخصك  ') 
return false
end
if AddChannel(msg.sender_user_id_) == false then
local textchuser = datahso:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•قناة الاشتراك ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
Text = [[
•  𝑾𝒆𝒍𝒄𝒐𝒎𝒆 black 
*• اوامر مطور الاساسي ↓*
ٴ**܀⠤⠤⠤⠤⠤⠤܀ٴ**
*• تفعيل*
• تعطيل
• رفع - تنزيل منشئ اساسي
• مسح المطورين
• المطورين
• رفع - تنزيل مطور
ٴ*܀⠤⠤⠤⠤⠤⠤܀ٴ*
• اسم البوت + غادر
• غادر
• اسم بوت + الرتبه
• تحديث السورس
• حظر عام
• كتم عام
• الغاء العام
• قائمه العام
• مسح قائمه العام
•جلب خزن البوت
• رفع خزن البوت
 ٴ*܀⠤⠤⠤⠤⠤⠤܀ٴ*
• اذاعه خاص
• اذاعه
• اذاعه بالتوجيه
• اذاعه بالتوجيه خاص
• اذاعه بالتثبيت
ٴ *܀⠤⠤⠤⠤⠤⠤܀ٴ*
• جلب نسخه البوت
• رفع نسخه البوت
• ضع عدد الاعضاء + العدد
• ضع كليشه المطور
• تفعيل - تعطيل الاذاعه
• تفعيل - تعطيل البوت الخدمي
• تفعيل - تعطيل التواصل
• تغير اسم البوت
• اضف - حذف رد عام 
• ردود العامه 
• حذف ردود العامه 
ٴ *܀⠤⠤⠤⠤⠤⠤܀ٴ*
• الاشتراك الاجباري
• تعطيل الاشتراك الاجباري
• تفعيل الاشتراك الاجباري
• حذف رساله الاشتراك
• تغير رساله الاشتراك
• تغير الاشتراك
ٴ *܀⠤⠤⠤⠤⠤⠤܀ٴ*
• الاحصائيات
• المشتركين
• المجموعات 
• تفعيل/تعطيل المغادره
• تنظيف المشتركين
•  تنظيف المجموعات
ٴ *܀⠤⠤⠤⠤⠤⠤܀ٴ*
𝘊𝘩 - [BLACK](t.me/UU_KFUF)•
]]
send(msg.chat_id_, msg.id_,Text) 
return false
end
----------------------------------------------------------------------------
if text == 'سمايلات' or text == 'سمايل' then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•∞عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•∞< جط ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Games'..msg.chat_id_) then
database:del(bot_id..'Set:Sma'..msg.chat_id_)
Random = {'🍏','🍎','🍐','🍊','🍋','🍉','🍇','🍓','🍈','🍒','🍑','🍍','🥥','🥝','🍅','🍆','🥑','🥦','🥒','🌶','??','🥕','🥔','🥖','🥐','🍞','🥨','🍟','🧀','🥚','🍳','🥓','🥩','🍗','🍖','🌭','🍔','🍠','🍕','🥪','🥙','☕️','🍵','🥤','🍶','🍺','🍻','🏀','⚽️','??','⚾️','🎾','🏐','🏉','🎱','🏓','🏸','🥅','🎰','•','🎳','🎯','•','🎻','🎸','🎺','🥁','🎹','🎼','🎧','🎤','🎬','🎨','•','??','•','🎫','🎗','🏵','🎖','•','🥌','??','🚗','🚌','🏎','🚓','🚑','??','🚛','🚜','🇮🇶','⚔','🛡','🔮','🌡','💣','•','•','📓','📗','📂','📅','📪','☑','•','•','⏰','📺','🎚','☎️','•'}
SM = Random[math.random(#Random)]
database:set(bot_id..'Random:Sm'..msg.chat_id_,SM)
send(msg.chat_id_, msg.id_,'•∞ اسرع واحد يدز هذا السمايل ? ← {`'..SM..'`}')
return false
end
end
if text == ''..(database:get(bot_id..'Random:Sm'..msg.chat_id_) or '')..'' and not database:get(bot_id..'Set:Sma'..msg.chat_id_) then
if not database:get(bot_id..'Set:Sma'..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'•∞ الف مبروك لقد فزت \n•∞ للعب مره اخره ارسل ←{ سمايل , سمايلات }')
database:incrby(bot_id..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id..'Set:Sma'..msg.chat_id_,true)
return false
end 
if text == 'الاسرع' or text == 'ترتيب' then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•∞عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•∞< جط ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Games'..msg.chat_id_) then
database:del(bot_id..'Speed:Tr'..msg.chat_id_)
KlamSpeed = {'سحور','سياره','استقبال','قنفه','ايفون','بزونه','مطبخ','كرستيانو','دجاجه','مدرسه','الوان','غرفه','ثلاجه','كهوه','سفينه','العراق','محطه','طياره','رادار','منزل','مستشفى','كهرباء','تفاحه','اخطبوط','سلمون','فرنسا','برتقاله','تفاح','مطرقه','بتيته','لهانه','شباك','باص','سمكه','ذباب','تلفاز','حاسوب','انترنيت','ساحه','جسر'};
name = KlamSpeed[math.random(#KlamSpeed)]
database:set(bot_id..'Klam:Speed'..msg.chat_id_,name)
name = string.gsub(name,'سحور','س ر و ح')
name = string.gsub(name,'سياره','ه ر س ي ا')
name = string.gsub(name,'استقبال','ل ب ا ت ق س ا')
name = string.gsub(name,'قنفه','ه ق ن ف')
name = string.gsub(name,'ايفون','و ن ف ا')
name = string.gsub(name,'بزونه','ز و ه ن')
name = string.gsub(name,'مطبخ','خ ب ط م')
name = string.gsub(name,'كرستيانو','س ت ا ن و ك ر ي')
name = string.gsub(name,'دجاجه','ج ج ا د ه')
name = string.gsub(name,'مدرسه','ه م د ر س')
name = string.gsub(name,'الوان','ن ا و ا ل')
name = string.gsub(name,'غرفه','غ ه ر ف')
name = string.gsub(name,'ثلاجه','ج ه ت ل ا')
name = string.gsub(name,'كهوه','ه ك ه و')
name = string.gsub(name,'سفينه','ه ن ف ي س')
name = string.gsub(name,'العراق','ق ع ا ل ر ا')
name = string.gsub(name,'محطه','ه ط م ح')
name = string.gsub(name,'طياره','ر ا ط ي ه')
name = string.gsub(name,'رادار','ر ا ر ا د')
name = string.gsub(name,'منزل','ن ز م ل')
name = string.gsub(name,'مستشفى','ى ش س ف ت م')
name = string.gsub(name,'كهرباء','ر ب ك ه ا ء')
name = string.gsub(name,'تفاحه','ح ه ا ت ف')
name = string.gsub(name,'اخطبوط','ط ب و ا خ ط')
name = string.gsub(name,'سلمون','ن م و ل س')
name = string.gsub(name,'فرنسا','ن ف ر س ا')
name = string.gsub(name,'برتقاله','ر ت ق ب ا ه ل')
name = string.gsub(name,'تفاح','ح ف ا ت')
name = string.gsub(name,'مطرقه','ه ط م ر ق')
name = string.gsub(name,'بتيته','ب ت ت ي ه')
name = string.gsub(name,'لهانه','ه ن ل ه ل')
name = string.gsub(name,'شباك','ب ش ا ك')
name = string.gsub(name,'باص','ص ا ب')
name = string.gsub(name,'سمكه','ك س م ه')
name = string.gsub(name,'ذباب','ب ا ب ذ')
name = string.gsub(name,'تلفاز','ت ف ل ز ا')
name = string.gsub(name,'حاسوب','س ا ح و ب')
name = string.gsub(name,'انترنيت','ا ت ن ر ن ي ت')
name = string.gsub(name,'ساحه','ح ا ه س')
name = string.gsub(name,'جسر','ر ج س')
send(msg.chat_id_, msg.id_,'•∞ اسرع واحد يرتبها ← {'..name..'}')
return false
end
end
------------------------------------------------------------------------
if text == ''..(database:get(bot_id..'Klam:Speed'..msg.chat_id_) or '')..'' and not database:get(bot_id..'Speed:Tr'..msg.chat_id_) then
if not database:get(bot_id..'Speed:Tr'..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'•∞ الف مبروك لقد فزت \n•∞ للعب مره اخره ارسل ←{ الاسرع , ترتيب }')
database:incrby(bot_id..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id..'Speed:Tr'..msg.chat_id_,true)
end 

if text == 'حزوره' then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•∞عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•∞< جط ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Games'..msg.chat_id_) then
database:del(bot_id..'Set:Hzora'..msg.chat_id_)
Hzora = {'الجرس','عقرب الساعه','السمك','المطر','5','الكتاب','البسمار','7','الكعبه','بيت الشعر','لهانه','انا','امي','الابره','الساعه','22','خطأ','كم الساعه','البيتنجان','البيض','المرايه','الضوء','الهواء','الضل','العمر','القلم','المشط','الحفره','البحر','الثلج','الاسفنج','الصوت','بلم'};
name = Hzora[math.random(#Hzora)]
database:set(bot_id..'Klam:Hzor'..msg.chat_id_,name)
name = string.gsub(name,'الجرس','شيئ اذا لمسته صرخ ما هوه ؟')
name = string.gsub(name,'عقرب الساعه','اخوان لا يستطيعان تمضيه اكثر من دقيقه معا فما هما ؟')
name = string.gsub(name,'السمك','ما هو الحيوان الذي لم يصعد الى سفينة نوح عليه السلام ؟')
name = string.gsub(name,'المطر','شيئ يسقط على رأسك من الاعلى ولا يجرحك فما هو ؟')
name = string.gsub(name,'5','ما العدد الذي اذا ضربته بنفسه واضفت عليه 5 يصبح ثلاثين ')
name = string.gsub(name,'الكتاب','ما الشيئ الذي له اوراق وليس له جذور ؟')
name = string.gsub(name,'البسمار','ما هو الشيئ الذي لا يمشي الا بالضرب ؟')
name = string.gsub(name,'7','عائله مؤلفه من 6 بنات واخ لكل منهن .فكم عدد افراد العائله ')
name = string.gsub(name,'الكعبه','ما هو الشيئ الموجود وسط مكة ؟')
name = string.gsub(name,'بيت الشعر','ما هو البيت الذي ليس فيه ابواب ولا نوافذ ؟ ')
name = string.gsub(name,'لهانه','وحده حلوه ومغروره تلبس مية تنوره .من هيه ؟ ')
name = string.gsub(name,'انا','ابن امك وابن ابيك وليس باختك ولا باخيك فمن يكون ؟')
name = string.gsub(name,'امي','اخت خالك وليست خالتك من تكون ؟ ')
name = string.gsub(name,'الابره','ما هو الشيئ الذي كلما خطا خطوه فقد شيئا من ذيله ؟ ')
name = string.gsub(name,'الساعه','ما هو الشيئ الذي يقول الصدق ولكنه اذا جاع كذب ؟')
name = string.gsub(name,'22','كم مره ينطبق عقربا الساعه على بعضهما في اليوم الواحد ')
name = string.gsub(name,'خطأ','ما هي الكلمه الوحيده التي تلفض خطأ دائما ؟ ')
name = string.gsub(name,'كم الساعه','ما هو السؤال الذي تختلف اجابته دائما ؟')
name = string.gsub(name,'البيتنجان','جسم اسود وقلب ابيض وراس اخظر فما هو ؟')
name = string.gsub(name,'البيض','ماهو الشيئ الذي اسمه على لونه ؟')
name = string.gsub(name,'المرايه','ارى كل شيئ من دون عيون من اكون ؟ ')
name = string.gsub(name,'الضوء','ما هو الشيئ الذي يخترق الزجاج ولا يكسره ؟')
name = string.gsub(name,'الهواء','ما هو الشيئ الذي يسير امامك ولا تراه ؟')
name = string.gsub(name,'الضل','ما هو الشيئ الذي يلاحقك اينما تذهب ؟ ')
name = string.gsub(name,'العمر','ما هو الشيء الذي كلما طال قصر ؟ ')
name = string.gsub(name,'القلم','ما هو الشيئ الذي يكتب ولا يقرأ ؟')
name = string.gsub(name,'المشط','له أسنان ولا يعض ما هو ؟ ')
name = string.gsub(name,'الحفره','ما هو الشيئ اذا أخذنا منه ازداد وكبر ؟')
name = string.gsub(name,'البحر','ما هو الشيئ الذي يرفع اثقال ولا يقدر يرفع مسمار ؟')
name = string.gsub(name,'الثلج','انا ابن الماء فان تركوني في الماء مت فمن انا ؟')
name = string.gsub(name,'الاسفنج','كلي ثقوب ومع ذالك احفض الماء فمن اكون ؟')
name = string.gsub(name,'الصوت','اسير بلا رجلين ولا ادخل الا بالاذنين فمن انا ؟')
name = string.gsub(name,'بلم','حامل ومحمول نصف ناشف ونصف مبلول فمن اكون ؟ ')
send(msg.chat_id_, msg.id_,'•∞ اسرع واحد يحل الحزوره ↓\n {'..name..'}')
return false
end
end
------------------------------------------------------------------------
if text == ''..(database:get(bot_id..'Klam:Hzor'..msg.chat_id_) or '')..'' and not database:get(bot_id..'Set:Hzora'..msg.chat_id_) then
if not database:get(bot_id..'Set:Hzora'..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'•∞ الف مبروك لقد فزت \n•∞ للعب مره اخره ارسل ←{ حزوره }')
database:incrby(bot_id..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id..'Set:Hzora'..msg.chat_id_,true)
end 

if text == 'معاني' then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•∞عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•∞< جط ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Games'..msg.chat_id_) then
database:del(bot_id..'Set:Maany'..msg.chat_id_)
Maany_Rand = {'قرد','دجاجه','بطريق','ضفدع','بومه','نحله','ديك','جمل','بقره','دولفين','تمساح','قرش','نمر','اخطبوط','سمكه','خفاش','اسد','فأر','ذئب','فراشه','عقرب','زرافه','قنفذ','تفاحه','باذنجان'}
name = Maany_Rand[math.random(#Maany_Rand)]
database:set(bot_id..'Maany'..msg.chat_id_,name)
name = string.gsub(name,'قرد','🐒')
name = string.gsub(name,'دجاجه','🐔')
name = string.gsub(name,'بطريق','🐧')
name = string.gsub(name,'ضفدع','🐸')
name = string.gsub(name,'بومه','🦉')
name = string.gsub(name,'نحله','🐝')
name = string.gsub(name,'ديك','🐓')
name = string.gsub(name,'جمل','🐫')
name = string.gsub(name,'بقره','🐄')
name = string.gsub(name,'دولفين','🐬')
name = string.gsub(name,'تمساح','🐊')
name = string.gsub(name,'قرش','🦈')
name = string.gsub(name,'نمر','🐅')
name = string.gsub(name,'اخطبوط','🐙')
name = string.gsub(name,'سمكه','🐟')
name = string.gsub(name,'خفاش','🦇')
name = string.gsub(name,'اسد','🦁')
name = string.gsub(name,'فأر','🐭')
name = string.gsub(name,'ذئب','🐺')
name = string.gsub(name,'فراشه','🦋')
name = string.gsub(name,'عقرب','🦂')
name = string.gsub(name,'زرافه','🦒')
name = string.gsub(name,'قنفذ','🦔')
name = string.gsub(name,'تفاحه','🍎')
name = string.gsub(name,'باذنجان','🍆')
send(msg.chat_id_, msg.id_,'•∞ اسرع واحد يدز معنى السمايل ← {'..name..'}')
return false
end
end
------------------------------------------------------------------------
if text == ''..(database:get(bot_id..'Maany'..msg.chat_id_) or '')..'' and not database:get(bot_id..'Set:Maany'..msg.chat_id_) then
if not database:get(bot_id..'Set:Maany'..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'•∞ الف مبروك لقد فزت \n•∞ للعب مره اخره ارسل ←{ معاني }')
database:incrby(bot_id..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id..'Set:Maany'..msg.chat_id_,true)
end 
if text == 'العكس' then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•∞عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•∞< جط ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Games'..msg.chat_id_) then
database:del(bot_id..'Set:Aks'..msg.chat_id_)
katu = {'باي','فهمت','موزين','اسمعك','احبك','موحلو','نضيف','حاره','ناصي','جوه','سريع','ونسه','طويل','سمين','ضعيف','شريف','شجاع','رحت','عدل','نشيط','شبعان','موعطشان','خوش ولد','اني','هادئ'}
name = katu[math.random(#katu)]
database:set(bot_id..'Set:Aks:Game'..msg.chat_id_,name)
name = string.gsub(name,'باي','هلو')
name = string.gsub(name,'فهمت','مافهمت')
name = string.gsub(name,'موزين','زين')
name = string.gsub(name,'اسمعك','ماسمعك')
name = string.gsub(name,'احبك','ماحبك')
name = string.gsub(name,'موحلو','حلو')
name = string.gsub(name,'نضيف','وصخ')
name = string.gsub(name,'حاره','بارده')
name = string.gsub(name,'ناصي','عالي')
name = string.gsub(name,'جوه','فوك')
name = string.gsub(name,'سريع','بطيء')
name = string.gsub(name,'ونسه','ضوجه')
name = string.gsub(name,'طويل','قزم')
name = string.gsub(name,'سمين','ضعيف')
name = string.gsub(name,'ضعيف','قوي')
name = string.gsub(name,'شريف','كواد')
name = string.gsub(name,'شجاع','جبان')
name = string.gsub(name,'رحت','اجيت')
name = string.gsub(name,'عدل','ميت')
name = string.gsub(name,'نشيط','كسول')
name = string.gsub(name,'شبعان','جوعان')
name = string.gsub(name,'موعطشان','عطشان')
name = string.gsub(name,'خوش ولد','موخوش ولد')
name = string.gsub(name,'اني','حمار')
name = string.gsub(name,'هادئ','عصبي')
send(msg.chat_id_, msg.id_,'•∞ اسرع واحد يدز العكس ← {'..name..'}')
return false
end
end
------------------------------------------------------------------------
if text == ''..(database:get(bot_id..'Set:Aks:Game'..msg.chat_id_) or '')..'' and not database:get(bot_id..'Set:Aks'..msg.chat_id_) then
if not database:get(bot_id..'Set:Aks'..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'•∞ الف مبروك لقد فزت \n•∞ للعب مره اخره ارسل ←{ العكس }')
database:incrby(bot_id..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id..'Set:Aks'..msg.chat_id_,true)
end 

if database:get(bot_id.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 20 then
send(msg.chat_id_, msg.id_,"•∞ عذرا لا يمكنك تخمين عدد اكبر من ال { 20 } خمن رقم ما بين ال{ 1 و 20 }\n")
return false  end 
local GETNUM = database:get(bot_id.."GAMES:NUM"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
database:del(bot_id..'SADD:NUM'..msg.chat_id_..msg.sender_user_id_)
database:del(bot_id.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
database:incrby(bot_id..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_,5)  
send(msg.chat_id_, msg.id_,'•∞ مبروك فزت ويانه وخمنت الرقم الصحيح\n•∞ تم اضافة { 5 } من النقاط \n')
elseif tonumber(NUM) ~= tonumber(GETNUM) then
database:incrby(bot_id..'SADD:NUM'..msg.chat_id_..msg.sender_user_id_,1)
if tonumber(database:get(bot_id..'SADD:NUM'..msg.chat_id_..msg.sender_user_id_)) >= 3 then
database:del(bot_id..'SADD:NUM'..msg.chat_id_..msg.sender_user_id_)
database:del(bot_id.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
send(msg.chat_id_, msg.id_,'•∞ اوبس لقد خسرت في اللعبه \n•∞ حظا اوفر في المره القادمه \n•∞ كان الرقم الذي تم تخمينه { '..GETNUM..' }')
else
send(msg.chat_id_, msg.id_,'•∞ اوبس تخمينك خطأ \n•∞ ارسل رقم تخمنه مره اخرى ')
end
end
end
end
if text == 'خمن' or text == 'تخمين' then   
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•∞عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•∞< جط ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Games'..msg.chat_id_) then
Num = math.random(1,20)
database:set(bot_id.."GAMES:NUM"..msg.chat_id_,Num) 
send(msg.chat_id_, msg.id_,'\n•∞ اهلا بك عزيزي في لعبة التخمين :\nٴ━━━━━━━━━━\n'..'•∞ ملاحظه لديك { 3 } محاولات فقط فكر قبل ارسال تخمينك \n\n'..'•∞ سيتم تخمين عدد ما بين ال {1 و 20} اذا تعتقد انك يمكنك الفوز جرب واللعب الان ؟ ')
database:setex(bot_id.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 100, true)  
return false  
end
end

if database:get(bot_id.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 6 then
send(msg.chat_id_, msg.id_,"•∞ عذرا لا يوجد سواء { 6 } اختيارات فقط ارسل اختيارك مره اخرى\n")
return false  end 
local GETNUM = database:get(bot_id.."Games:Bat"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
database:del(bot_id.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
send(msg.chat_id_, msg.id_,'•∞ مبروك فزت وطلعت المحيبس بل ايد رقم { '..NUM..' }\n•∞ لقد حصلت على { 3 }من نقاط يمكنك استبدالهن برسائل ')
database:incrby(bot_id..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_,3)  
elseif tonumber(NUM) ~= tonumber(GETNUM) then
database:del(bot_id.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
send(msg.chat_id_, msg.id_,'•∞ للاسف لقد خسرت \n•∞ المحيبس بل ايد رقم { '..GETNUM..' }\n•∞ حاول مره اخرى للعثور على المحيبس')
end
end
end

if text == 'محيبس' or text == 'بات' then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•∞عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•∞< جط ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Games'..msg.chat_id_) then   
Num = math.random(1,6)
database:set(bot_id.."Games:Bat"..msg.chat_id_,Num) 
TEST = [[
*➀       ➁     ➂      ➃      ➄     ➅
↓      ↓     ↓      ↓     ↓     ↓
👊 ‹› 👊 ‹› 👊 ‹› 👊 ‹› 👊 ‹› 👊
•∞ اختر لأستخراج المحيبس الايد التي تحمل المحيبس 
•∞ الفائز يحصل على { 3 } من النقاط *
]]
send(msg.chat_id_, msg.id_,TEST)
database:setex(bot_id.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 100, true)  
return false  
end
end

------------------------------------------------------------------------
if text == 'المختلف' then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•∞عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•∞< جط ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Games'..msg.chat_id_) then
mktlf = {'😸','☠','🐼','🐇','🌑','🌚','⭐️','•','⛈','🌥','⛄️','👨‍🔬','•','👨‍•','👩‍🍳','🧚‍♀','🧜‍♂','🧝‍♂','🙍‍♂','🧖‍♂','👬','👨‍👨‍👧','🕒','🕤','⌛️','📅',};
name = mktlf[math.random(#mktlf)]
database:del(bot_id..'Set:Moktlf:Bot'..msg.chat_id_)
database:set(bot_id..':Set:Moktlf'..msg.chat_id_,name)
name = string.gsub(name,'😸','😹😹😹😹😹😹😹•😸😹😹•😹')
name = string.gsub(name,'☠','💀💀💀💀💀💀💀☠💀💀💀💀💀')
name = string.gsub(name,'🐼','👻??👻🐼👻👻👻👻👻👻👻')
name = string.gsub(name,'🐇','🕊🕊🕊🕊🕊🐇🕊🕊🕊🕊')
name = string.gsub(name,'🌑','🌚🌚🌚🌚🌚🌑🌚🌚🌚')
name = string.gsub(name,'🌚','🌑🌑🌑🌑🌑🌚🌑🌑🌑')
name = string.gsub(name,'⭐️','🌟🌟🌟🌟🌟🌟🌟🌟⭐️🌟🌟🌟')
name = string.gsub(name,'•','💫💫💫💫💫•💫💫💫💫')
name = string.gsub(name,'⛈','🌨🌨🌨🌨🌨⛈🌨🌨🌨🌨')
name = string.gsub(name,'🌥','⛅️⛅️⛅️⛅️⛅️⛅️🌥⛅️⛅️⛅️⛅️')
name = string.gsub(name,'⛄️','☃☃☃☃☃☃⛄️☃☃☃☃')
name = string.gsub(name,'👨‍🔬','👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬??‍🔬👩‍🔬👩‍🔬👨‍??👩‍🔬👩‍🔬👩‍🔬')
name = string.gsub(name,'•','👩‍💻👩‍💻👩‍‍💻👩‍‍💻👩‍💻•👩‍💻👩‍💻??‍💻')
name = string.gsub(name,'👨‍🔧','👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👨‍🔧👩‍🔧')
name = string.gsub(name,'•‍🍳','👨‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳👩‍🍳👨‍🍳👨‍🍳👨‍??')
name = string.gsub(name,'🧚‍♀','🧚‍♂🧚‍♂🧚‍♂🧚‍♂🧚‍♀🧚‍♂🧚‍♂')
name = string.gsub(name,'🧜‍♂','🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧚‍♂🧜‍♀🧜‍♀🧜‍♀')
name = string.gsub(name,'🧝‍♂','🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♂🧝‍♀🧝‍♀🧝‍♀')
name = string.gsub(name,'🙍‍♂️','🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️•‍♂️🙍‍♂️🙎‍♂️🙎‍♂️🙎‍♂️')
name = string.gsub(name,'🧖‍♂️','🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♂️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️')
name = string.gsub(name,'👬','👭👭👭👭👭👬👭👭👭')
name = string.gsub(name,'👨‍👨‍👧','👨‍👨‍👦👨‍👨‍👦👨‍👨‍??👨‍👨‍👦👨‍👨‍👧👨‍👨‍👦👨‍👨‍👦')
name = string.gsub(name,'🕒','🕒🕒🕒🕒🕒🕒🕓🕒🕒🕒')
name = string.gsub(name,'🕤','🕥🕥🕥🕥🕥🕤🕥🕥🕥')
name = string.gsub(name,'⌛️','⏳⏳⏳⏳⏳⏳⌛️⏳⏳')
name = string.gsub(name,'📅','📆📆📆📆📆•📅📆📆')
send(msg.chat_id_, msg.id_,'•∞ اسرع واحد يدز الاختلاف ← {'..name..'}')
return false
end
end
------------------------------------------------------------------------
if text == ''..(database:get(bot_id..':Set:Moktlf'..msg.chat_id_) or '')..'' then 
if not database:get(bot_id..'Set:Moktlf:Bot'..msg.chat_id_) then 
database:del(bot_id..':Set:Moktlf'..msg.chat_id_)
send(msg.chat_id_, msg.id_,'•∞ الف مبروك لقد فزت \n•∞ للعب مره اخره ارسل ←{ المختلف }')
database:incrby(bot_id..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id..'Set:Moktlf:Bot'..msg.chat_id_,true)
end
------------------------------------------------------------------------
if text == 'رياضيات' then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•┇عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•┇< جط ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Games'..msg.chat_id_) then
Hussein = {'9','2','60','9','5','4','25','10','17','15','39','5','16',};
name = Hussein[math.random(#Hussein)]
database:del(bot_id..'Set:Ryadeat:Bot'..msg.chat_id_)
database:set(bot_id..':Set:Ryadeat'..msg.chat_id_,name)
name = string.gsub(name,'9','2+7=')
name = string.gsub(name,'2','5-3=')
name = string.gsub(name,'60','(30)² =')
name = string.gsub(name,'9','2+2+5=')
name = string.gsub(name,'5','8-3=?')
name = string.gsub(name,'4','40÷10=')
name = string.gsub(name,'25','30-5=')
name = string.gsub(name,'10','100÷10=')
name = string.gsub(name,'17','10+5+2=')
name = string.gsub(name,'15','25-10=')
name = string.gsub(name,'39','44-5=')
name = string.gsub(name,'5','12+1-8=')
name = string.gsub(name,'16','16+16-16=')
send(msg.chat_id_, msg.id_,'اجب عن التالي ~ {'..name..'}')
return false
end
end
------------------------------------------------------------------------
if text == ''..(database:get(bot_id..':Set:Ryadeat'..msg.chat_id_) or '')..'' then 
if not database:get(bot_id..'Set:Ryadeat:Bot'..msg.chat_id_) then 
database:del(bot_id..':Set:Ryadeat'..msg.chat_id_)
send(msg.chat_id_, msg.id_,'•┇ الف مبروك لقد فزت \n•┇ للعب مره اخره ارسل ←{ رياضيات }')
database:incrby(bot_id..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id..'Set:Ryadeat:Bot'..msg.chat_id_,true)
end
------------------------------------------------------------------------
if text == 'انكليزي' then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•┇عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•┇< جط ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Games'..msg.chat_id_) then
Hussein = {'معلومات','قنوات','مجموعات','كتاب','تفاحه','مختلف','سدني','نقود','اعلم','ذئب','تمساح','ذكي',};
name = Hussein[math.random(#Hussein)]
database:del(bot_id..'Set:English:Bot'..msg.chat_id_)
database:set(bot_id..':Set:English'..msg.chat_id_,name)
name = string.gsub(name,'ذئب','Wolf')
name = string.gsub(name,'معلومات','Information')
name = string.gsub(name,'قنوات','Channels')
name = string.gsub(name,'مجموعات','Groups')
name = string.gsub(name,'كتاب','Book')
name = string.gsub(name,'تفاحه','Apple')
name = string.gsub(name,'سدني','Sydney')
name = string.gsub(name,'نقود','money')
name = string.gsub(name,'اعلم','I know')
name = string.gsub(name,'تمساح','crocodile')
name = string.gsub(name,'مختلف','Different')
name = string.gsub(name,'ذكي','Intelligent')
send(msg.chat_id_, msg.id_,'اجب عن التالي ~ { '..name..' }')
return false
end
end
------------------------------------------------------------------------
if text == ''..(database:get(bot_id..':Set:English'..msg.chat_id_) or '')..'' then 
if not database:get(bot_id..'Set:English:Bot'..msg.chat_id_) then 
database:del(bot_id..':Set:English'..msg.chat_id_)
send(msg.chat_id_, msg.id_,'•┇ الف مبروك لقد فزت \n•┇ للعب مره اخره ارسل ←{ `انكليزي` }')
database:incrby(bot_id..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id..'Set:English:Bot'..msg.chat_id_,true)
end
------------------------------------------------------------------------
if text == 'امثله' then
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•∞عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•∞< جط ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Games'..msg.chat_id_) then
mthal = {'جوز','ضراطه','الحبل','الحافي','شقره','بيدك','سلايه','النخله','الخيل','حداد','المبلل','يركص','قرد','العنب','العمه','الخبز','بالحصاد','شهر','شكه','يكحله',};
name = mthal[math.random(#mthal)]
database:set(bot_id..'Set:Amth'..msg.chat_id_,name)
database:del(bot_id..'Set:Amth:Bot'..msg.chat_id_)
name = string.gsub(name,'جوز','ينطي____للماعده سنون')
name = string.gsub(name,'ضراطه','الي يسوق الحمار يتحمل___')
name = string.gsub(name,'بيدك','اكل___محد يفيدك')
name = string.gsub(name,'الحافي','تجدي من___نعال')
name = string.gsub(name,'شقره','مع الخيل يا___')
name = string.gsub(name,'النخله','الطول طول___والعقل عقل الصخلة')
name = string.gsub(name,'سلايه','بالوجه امراية وبالظهر___')
name = string.gsub(name,'الخيل','من قلة___شدو على الچلاب سروج')
name = string.gsub(name,'حداد','موكل من صخم وجهه كال اني___')
name = string.gsub(name,'المبلل','___ما يخاف من المطر')
name = string.gsub(name,'الحبل','اللي تلدغة الحية يخاف من جرة___')
name = string.gsub(name,'يركص','المايعرف___يقول الكاع عوجه')
name = string.gsub(name,'العنب','المايلوح___يقول حامض')
name = string.gsub(name,'العمه','___إذا حبت الچنة ابليس يدخل الجنة')
name = string.gsub(name,'الخبز','انطي___للخباز حتى لو ياكل نصه')
name = string.gsub(name,'باحصاد','اسمة___ومنجله مكسور')
name = string.gsub(name,'شهر','امشي__ولا تعبر نهر')
name = string.gsub(name,'شكه','يامن تعب يامن__يا من على الحاضر لكة')
name = string.gsub(name,'القرد','__بعين امه غزال')
name = string.gsub(name,'يكحله','اجه___عماها')
send(msg.chat_id_, msg.id_,'•∞ اسرع واحد يكمل المثل ← {'..name..'}')
return false
end
end
------------------------------------------------------------------------
if text == ''..(database:get(bot_id..'Set:Amth'..msg.chat_id_) or '')..'' then 
if not database:get(bot_id..'Set:Amth:Bot'..msg.chat_id_) then 
database:del(bot_id..'Set:Amth'..msg.chat_id_)
send(msg.chat_id_, msg.id_,'•∞ الف مبروك لقد فزت \n•∞ للعب مره اخره ارسل ←{ امثله }')
database:incrby(bot_id..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_, 1)  
end
database:set(bot_id..'Set:Amth:Bot'..msg.chat_id_,true)
end
if text == 'تعطيل الالعاب' or text == 'تعطيل اللعبه' and Mod(msg) then  
if database:get(bot_id..'Lock:Games'..msg.chat_id_)  then
database:del(bot_id..'Lock:Games'..msg.chat_id_) 
Text = '\n •  تم تعطيل الالعاب' 
else
Text = '\n •  بالتاكيد تم تعطيل الالعاب'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تفعيل الالعاب' or text == 'تفعيل اللعبه' and Mod(msg) then  
if not database:get(bot_id..'Lock:Games'..msg.chat_id_)  then
database:set(bot_id..'Lock:Games'..msg.chat_id_,true) 
Text = '\n • تم تفعيل الالعاب' 
else
Text = '\n • بالتاكيد تم تفعيل الالعاب'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'الالعاب' or text == 'لعبه' and database:get(bot_id..'Lock:Games'..msg.chat_id_) then
Text_Games = [[
للالعاب الاحترافيه
اكتب > العاب بلاك
•━━━━━━━━• 
    لعبة المليون >> من سيربح المليون
      لعبة كت تويت >> كت تويت
    لعبة لو خيروك >> لو خيروك
لعبة رياضيات >> رياضيات
 لعبة المختلف >> المختلف
 لعبة انكليزي >> انكليزي
 لعبه الاسرع >> الاسرع
 لعبة العكس >> العكس
 لعبة حزوره >> حزوره
 لعبة سمايل >> سمايل
 لعبة معاني >> معاني
 لعبة امثله >> امثله
 لعبة خمن >> خمن
 لعبة بات >> بات
•━━━━━━• 
- Ch [BLACK - SoUrCe](https://t.me/UU_KFUF)
]]
send(msg.chat_id_, msg.id_,Text_Games) 
end
if text == 'نقودي' or text == 'مجوهراتي' then 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'• عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n• < جط ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local Num = database:get(bot_id..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_) or 0
if Num == 0 then 
Text = '• لم تلعب اي لعبه للحصول على نقاط'
else
Text = '• عدد نقاط التي ربحتها هي *> { '..Num..' } نقاط *'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text and text:match("بيع نقودي (%d+)$") or text and text:match("^بيع نقودي (%d+)$") then
local NUMPY = text:match("^بيع نقودي (%d+)$") or text and text:match("^بيع نقودي (%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(msg.chat_id_, msg.id_,'['..textchuser..']')
else
send(msg.chat_id_, msg.id_,'•عذراً عـليك الاشـتࢪاك في قنـاة البـوت اولآ\n•< جط ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if tonumber(NUMPY) == tonumber(0) then
send(msg.chat_id_,msg.id_,"\n*• لا يمكنني البيع اقل من 1 *") 
return false 
end
if tonumber(database:get(bot_id..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_)) == tonumber(0) then
send(msg.chat_id_,msg.id_,'• ليس لديك نقاط من الالعاب \n• اذا كنت تريد ربح النقاط \n• ارسل الالعاب وابدأ اللعب ! ') 
else
local NUM_GAMES = database:get(bot_id..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_)
if tonumber(NUMPY) > tonumber(NUM_GAMES) then
send(msg.chat_id_,msg.id_,'\n• ليس لديك نقاط بهہ‌‏ذا العدد \n• لزيادة نقاطك في اللعبه \n• ارسل الالعاب وابدأ اللعب !') 
return false 
end
local NUMNKO = (NUMPY * 50)
database:decrby(bot_id..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_,NUMPY)  
database:incrby(bot_id..'Msg_User'..msg.chat_id_..':'..msg.sender_user_id_,NUMNKO)  
send(msg.chat_id_,msg.id_,'• تم خصم *> { '..NUMPY..' }* من نقاطك \n• وتم اضافة* > { '..(NUMPY * 50)..' } رساله الى رسالك *')
end 
return false 
end
if text ==("مسح") and Mod(msg) and tonumber(msg.reply_to_message_id_) > 0 then
DeleteMessage(msg.chat_id_,{[0] = tonumber(msg.reply_to_message_id_),msg.id_})   
end   
if database:get(bot_id.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
database:del(bot_id..'id:user'..msg.chat_id_)  
send(msg.chat_id_, msg.id_, "• تم الغاء الامر ") 
database:del(bot_id.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  
end 
database:del(bot_id.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = database:get(bot_id..'id:user'..msg.chat_id_)  
database:del(bot_id..'Msg_User'..msg.chat_id_..':'..msg.sender_user_id_) 
database:incrby(bot_id..'Msg_User'..msg.chat_id_..':'..iduserr,numadded)  
send(msg.chat_id_, msg.id_,"• تم اضافة له {"..numadded..'} من الرسائل')  
end
------------------------------------------------------------------------
if database:get(bot_id.."gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
database:del(bot_id..'idgem:user'..msg.chat_id_)  
send(msg.chat_id_, msg.id_, "• تم الغاء الامر ") 
database:del(bot_id.."gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  
end 
database:del(bot_id.."gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = database:get(bot_id..'idgem:user'..msg.chat_id_)  
database:incrby(bot_id..'NUM:GAMES'..msg.chat_id_..iduserr,numadded)  
send(msg.chat_id_, msg.id_,  1, "• تم اضافة لهہ‌‏ {"..numadded..'} من النقاط', 1, 'md')  
end
------------------------------------------------------------
if text and text:match('^الحساب (%d+)$') then
local id = text:match('^الحساب (%d+)$')
local text = 'اضغط لمشاهده العضو •'
tdcli_function ({ID="SendMessage", chat_id_=msg.chat_id_, reply_to_message_id_=msg.id_, disable_notification_=0, from_background_=1, reply_markup_=nil, input_message_content_={ID="InputMessageText", text_=text, disable_web_page_preview_=1, clear_draft_=0, entities_={[0] = {ID="MessageEntityMentionName", offset_=0, length_=19, user_id_=id}}}}, dl_cb, nil)
end

if text == "شنو رئيك بهذا" or text == "شنو رئيك بهذ" or text == "شنو رئيك بهاي" then
local texting = {"܁•قلبي اوي دا 🦄💞","܁•   كيوت فشخخخ 🥺💞","܁•اكتر شخص بحبه🥺💞","متوحد 😹💞.","܁•   قلبي دا اوعا حد يكلمو 😚💌"}
send(msg.chat_id_, msg.id_, ''..texting[math.random(#texting)]..'')
return false
end
if text == "نسبه الحب" or text == "نسبه حب" or text == "شكد الحب" then
local texting = {"7%","100%"," 80%","70%","0%","50%","10%","99%","000 حب زربا"}
send(msg.chat_id_, msg.id_, ''..texting[math.random(#texting)]..'')
return false
end
if text == "نسبه الرجوله" or text == "نسبه الانوثه" or text == "رجال لو مره" then
local texting = {"7%","100%"," 80%","70%","0%","50%","10%","99%","10000%"}
send(msg.chat_id_, msg.id_, ''..texting[math.random(#texting)]..'')
return false
end
if text == "هينه" or text == "رزله" then
local texting = {" مبهينش حيوانات😂😂","ايه يخول انت مزعلو ليه","لو جيت جمبه هزعلك مني فل!! ","عايز اي متوحد انت","سيبك منو دا متخلف 😂💔","ده واطى وندلل فكك منو 😂💔","دا جربان اهين مين😂😂😂😂 😂💔"}
send(msg.chat_id_, msg.id_, ''..texting[math.random(#texting)]..'')
return false
end
if text == "مصه" or text == "بوسه" then
local texting = {"امووووووووواحح😘💕","استغفر الله فاسق 😒","الوجه ميساعد 😐✋","ببوس حريم بس😌😹","خدك نضيف!؟ 😂","تدفع كام! 🌝","طب خليه يستحمي اول 🙊😂","كل شويه بوسه بوسه 😏","مش بايس حد انا فل!! ","امموووواه لعيونك ي جميل 💎💗😹"}
send(msg.chat_id_, msg.id_, ''..texting[math.random(#texting)]..'')
return false
end

if text == 'رابط الحذف' or text == 'رابط حذف' then
t =[[
رابط الحذف في جميع مواقع التواصل ●
فكر قبل لا تتسرع وتروح
ٴ●○━━━∴━━━●○ٴ
 ● رابط حذف  [Telegram](https://my.telegram.org/auth?to=delete) ܁
 ● رابط حذف [instagram](https://www.instagram.com/accounts/login/?next=/accounts/remove/request/permanent/) ܁
 ● رابط حذف [Facebook](https://www.facebook.com/help/deleteaccount) ܁
 ● رابط حذف [Snspchat](https://accounts.snapchat.com/accounts/login?continue=https%3A%2F%2Faccounts.snapchat.com%2Faccounts%2Fdeleteaccount) ܁
]]
send(msg.chat_id_, msg.id_,t) 
return false
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end -- Chat_Type = 'GroupBot' 
end -- end msg 
--------------------------------------------------------------------------------------------------------------
function tdcli_update_callback(data)  -- clback
if data.ID == "UpdateChannel" then 
if data.channel_.status_.ID == "ChatMemberStatusKicked" then 
database:srem(bot_id..'Chek:Groups','-100'..data.channel_.id_)  
end
end
if data.ID == "UpdateNewCallbackQuery" then
local Chat_id = data.chat_id_
local Msg_id = data.message_id_
local msg_idd = Msg_id/2097152/0.5
local Text = data.payload_.data_
if Text == '/help1' then
if not Mod(data) then
local notText = '• عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Teext =[[
*ٴ𝙷𝙸 𝙳𝚄𝙳𝙴 * 
*•اوامر الحمايه*
*•قفل + فتح > الامر*
*܀⠤⠤⠤⠤⠤⠤܀ٴ*
*•بالتقيد ، بالطرد ، بالكتم*
*•الروابط*
*•المعرف*
*•التاك*
*•الشارحه*
*•التعديل*
*•التثبيت*
*•المتحركه*
*•الملفات*
*•الصور*
*•التفليش*
*܀⠤⠤⠤⠤⠤⠤܀ٴ*
*•الماركداون*
*•البوتات*
*•التكرار*
*•الكلايش*
*•السيلفي*
*•الملصقات*
*•الفيديو*
*•الانلاين*
*•الدردشه*
*•السب*
*܀⠤⠤⠤⠤⠤⠤܀ٴ*
*•التوجيه*
*•الاغاني*
*•الصوت*
*•الجهات*
*•الاشعارات*
*܀⠤⠤⠤⠤⠤⠤܀ٴ*
*•اوامر الادمنيه*
*܀⠤⠤⠤⠤⠤⠤܀ٴ*
*•استعاده الاوامر*
*•الادمنيه*
*•تاك الادمنيه*
*•تغير الايدي*
*•تعين الايدي*
*•مسح + العدد*
 *•تنزيل الكل*
 *•منع + الصور + متحركه + ملصق*
 *•المميزين*
 *•حظر + الغاء حظر*
 *•المحظورين*
 *•كتم + الغاء الكتم*
 *•المكتومين*
 *•تقيد + الرقم + سَـاعه*
 *•تقيد + الرقم + يوم*
 *•تقيد + الرقم + دقيقه*
 *•كتم + الرقم + ساعه*
*•كتم + الرقم + يوم*
*•كتم + الرقم + دقيقه*
 *•تقيد ~ فك تقيد*
*•طرد*
*•تثبيت + الغاء تثبيت*
*•الترحيب*
*•كشف البوتات*
 *•الصلاحيات*
*•كشف *
 *•تاك*
*•اعدادات المجموعه*
*•عدد الجروب*
*•ردود*
 *•اسم بوت + الرتبه *
*•الاوامر المضافه*
*•قائمه المنع*
*܀⠤⠤⠤⠤⠤⠤܀ٴ*
𝘊𝘩 - [BLACK](t.me/UU_KFUF)•
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '①', callback_data="/help1"},{text = '②', callback_data="/help2"},{text = '③', callback_data="/help3"},
},
{
{text = '④', callback_data="/help4"},{text = '⑤', callback_data="/help5"},
},
{
{text = 'الاوامر الرئيسيه', callback_data="/help"},
},
{
{text = 'اوامر التسليه', callback_data="/help10"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if Text == '/help2' then
if not Mod(data) then
local notText = '• عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Teext =[[
*ٴ𝙷𝙸 𝙳𝚄𝙳𝙴 * 
*•اوامر تفعيل وتعطيل*
*܀⠤⠤⠤⠤⠤⠤܀ٴ*
* • تفعيل ⇓ تعطيل ⇓ امر*
*܀⠤⠤⠤⠤⠤⠤܀ٴ*
*• اطردني*
* • ضافني*
* • الرابط *
* • الرفع*
* • الحظر*
* • الايدي*
* • الالعاب*
* • الحمايه*
* • الردود العامه*
* • ردود*
* • قول*
* • ردود البوت*
* •صورتي*
*•الابراج*
*•معاني الاسماء*
*•الزخرفه*
*•الانستا*
*•اليوتيوب*
*•التحويل*
*•احسب*
*•الافلام*
*܀⠤⠤⠤⠤⠤⠤܀ٴ*
 اوامر الرفع و تغير
*܀⠤⠤⠤⠤⠤⠤܀ٴ*
*• مالك*
*• مشرف*
 *• منشئ اساسي*
*• منشئ*
*• مدير*
*• ادمن*
*• مميز*
*• الادمنيه*
*• القيود*
*܀⠤⠤⠤⠤⠤⠤܀ٴ*
*  اوامر التغير *
*܀⠤⠤⠤⠤⠤⠤܀ٴ*
*• تغير رد المطور + اسم*
*• تغير رد منشئ الاساسي + اسم*
*• تغير رد المنشئ + اسم*
*• تغير رد المدير + اسم*
*• تغير رد الادمن + اسم*
*• تغير رد المميز + اسم*
*• تغير رد العضو + اسم*
*܀⠤⠤⠤⠤⠤⠤܀ٴ*
𝘊𝘩 - [BLACK](t.me/UU_KFUF)•
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '①', callback_data="/help1"},{text = '②', callback_data="/help2"},{text = '③', callback_data="/help3"},
},
{
{text = '④', callback_data="/help4"},{text = '⑤', callback_data="/help5"},
},
{
{text = 'الاوامر الرئيسيه', callback_data="/help"},
},
{
{text = 'اوامر التسليه', callback_data="/help10"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if Text == '/help3' then
if not Mod(data) then
local notText = '• عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Teext =[[
*ٴ𝙷𝙸 𝙳𝚄𝙳𝙴 * 
*•اوامر الوضع ~ اضف *
*܀⠤⠤⠤⠤⠤⠤܀*
*•اضف ⇓ امر *
*܀⠤⠤⠤⠤⠤⠤܀*
*• أمر*
*•رد*
*• صلاحيه*
*܀⠤⠤⠤⠤⠤⠤܀*
 * ضع ⇓ امر* 
*܀⠤⠤⠤⠤⠤⠤܀*
*•اسم*
*• رابط*
*‏• ترحيب*
*• قوانين*
*• صوره*
*•وصف*
*• تكرار + عدد*
*܀⠤⠤⠤⠤⠤⠤܀*
*اوامر الخدميه⇓*
*<تفعيل + تعطيل>*
*܀⠤⠤⠤⠤⠤⠤܀*
*•حساب العمر*
*•احسب + المواليد *
*•كمثال احسب 1999/4/18*
*܀⠤⠤⠤⠤⠤⠤܀*
*•معاني الاسماء*
*•معني + الاسم*
*•كمثال -معني محمود*
*܀⠤⠤⠤⠤⠤⠤܀*
*•اليوتيوب*
*•كمثال بحث محمد السالم*
* بصمه + اسم الاغنيه*
*صوت + اسم الاغنيه*
*܀⠤⠤⠤⠤⠤⠤܀*
*•التحويلات*
*•لعرض اوامر تحويل الصيغ*
*܀⠤⠤⠤⠤⠤⠤܀ٴ*
*•الابراج*
*•لعرض معلومات برجك*
*•كمثال - برج الاسد*
*܀⠤⠤⠤⠤⠤⠤܀*
*•الافلام*
*•لعرض الافلام الاجنبيه فقط*
*•كمثال فلم man*
*܀⠤⠤⠤⠤⠤⠤܀*
*•الزخرفه*
*•زخرفه + الاسم*
*•كمثال زخرفه محمد*
*܀⠤⠤⠤⠤⠤⠤܀*
*•الالعاب الاحترافيه*
*•اكتب العاب بلاك*
*܀⠤⠤⠤⠤⠤⠤܀*
*•غنيلي*
*•لعرض اغاني عشوائيه*
*܀⠤⠤⠤⠤⠤⠤܀*
*•ضع لقب*
*•لوضع لقب للمشرف*
*•الامر بالرد *
*܀⠤⠤⠤⠤⠤⠤܀*
𝘊𝘩 - [BLACK](t.me/UU_KFUF)•
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '①', callback_data="/help1"},{text = '②', callback_data="/help2"},{text = '③', callback_data="/help3"},
},
{
{text = '④', callback_data="/help4"},{text = '⑤', callback_data="/help5"},
},
{
{text = 'الاوامر الرئيسيه', callback_data="/help"},
},
{
{text = 'اوامر التسليه', callback_data="/help10"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if Text == '/help4' then
if not Mod(data) then
local notText = '• عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Teext =[[
*ٴ𝙷𝙸 𝙳𝚄𝙳𝙴 *   
*• اوامر مسح ⇓ الحذف *
*܀⠤⠤⠤⠤⠤⠤܀ٴ*
*•مسح ⇓ الامر*
*܀⠤⠤⠤⠤⠤⠤܀ٴ*
*•الايدي*
*•الادمنيه*
*•المميزين*
*•الردود *
*•المنشئين*
*• المدراء*
*•البوتات*
*• صلاحيه*
*• قائمه منع المتحركات*
*• قائمه منع الصور*
*• قائمه منع الملصقات*
*• المحذوفين*
*• مسح قائمه المنع*
*܀⠤⠤⠤⠤⠤⠤܀ٴ*
*  حذف ⇓ امر ↓*
*܀⠤⠤⠤⠤⠤⠤܀ٴ*
*• الاوامر المضافه*
*܀⠤⠤⠤⠤⠤⠤܀ٴ*
𝘊𝘩 - [BLACK](t.me/UU_KFUF)•
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '①', callback_data="/help1"},{text = '②', callback_data="/help2"},{text = '③', callback_data="/help3"},
},
{
{text = '④', callback_data="/help4"},{text = '⑤', callback_data="/help5"},
},
{
{text = 'الاوامر الرئيسيه', callback_data="/help"},
},
{
{text = 'اوامر التسليه', callback_data="/help10"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if Text == '/help5' then
if not Mod(data) then
local notText = '• عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Teext =[[
*ٴ𝙷𝙸 𝙳𝚄𝙳𝙴 * 
*• اوامر الاعضاء كتالي*
*܀⠤⠤⠤⠤⠤⠤܀ٴ*
*• عرض معلوماتك *
*܀⠤⠤⠤⠤⠤⠤܀ٴ*
*• ايديي > اسمي *
*• رسايلي > مسح رسايلي*
*• رتبتي > سحكاتي *
*• مسح سحكاتي > المنشئ *
*• الرتبه بالرد /بالمعرف*
*• الحساب + ايدي الشخص*
*܀⠤⠤⠤⠤⠤⠤܀ٴ*
*• اوامر المجموعه *
*܀⠤⠤⠤⠤⠤⠤܀ٴ*
*• الرابط \ القوانين \ الترحيب*
*•  ايدي \ اطردني *
*• اسمي \ المطور  *
*• كشف*
*• قول - كلمه*
*܀⠤⠤⠤⠤⠤⠤܀ٴ*
*• اسم البوت - الامر *
*܀⠤⠤⠤⠤⠤⠤܀ٴ*
𝘊𝘩 - [BLACK](t.me/UU_KFUF)•
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '①', callback_data="/help1"},{text = '②', callback_data="/help2"},{text = '③', callback_data="/help3"},
},
{
{text = '④', callback_data="/help4"},{text = '⑤', callback_data="/help5"},
},
{
{text = 'الاوامر الرئيسيه', callback_data="/help"},
},
{
{text = 'اوامر التسليه', callback_data="/help10"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if Text == '/help10' then
if not Special(data) then
local notText = '• عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Teext =[[
ٴ•𝙷𝙸 𝙳𝚄𝙳𝙴 •
*اوامر التسليه ⇩*
*܀⠤⠤⠤⠤⠤⠤܀*
*رفع + تنزيل + الامر*
*• خول*
*• كلب*
*• حمار*
*• متوحد*
*• قرد*
*• بقلبي*
*• ملك*
*• وتكه *
*܀⠤⠤⠤⠤⠤⠤܀ٴ*
*بالرد ⇩ •*
*܀⠤⠤⠤⠤⠤⠤܀ٴ*
*• شنو رئيك بهذا*
*• شنو رئيك بهاي*
*• نسبه الحب*
*• نسبه الانوثه*
*• نسبه الرجوله*
*•زواج*
* •طلاق*
*• رزله*
*•هينه*
*܀⠤⠤⠤⠤⠤⠤܀*
𝘊𝘩 - [BLACK](t.me/UU_KFUF)•
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '①', callback_data="/help1"},{text = '②', callback_data="/help2"},{text = '③', callback_data="/help3"},
},
{
{text = '④', callback_data="/help4"},{text = '⑤', callback_data="/help5"},
},
{
{text = 'الاوامر الرئيسيه', callback_data="/help"},
},
{
{text = 'اوامر التسليه', callback_data="/help10"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if Text == '/help' then
if not Mod(data) then
local notText = '• عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Teext =[[
*ٴ𝙷𝙸 𝙳𝚄𝙳𝙴 * 
*܀⠤⠤⠤⠤⠤⠤܀*
*① الادمنيه*
*② للتفعيل،التعطيل،الرفع*
*③ الخدميات*
*④ اوامر المسح*
*⑤ اوامر الاعضاء*
*⑥ اومر التسليه*
*܀⠤⠤⠤⠤⠤⠤܀*
𝘊𝘩 - [BLACK](t.me/UU_KFUF)•
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '①', callback_data="/help1"},{text = '②', callback_data="/help2"},{text = '③', callback_data="/help3"},
},
{
{text = '④', callback_data="/help4"},{text = '⑤', callback_data="/help5"},
},
{
{text = 'اوامر التسليه', callback_data="/help10"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
end
if data.ID == "UpdateNewMessage" then  -- new msg
msg = data.message_
text = msg.content_.text_
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
if text and not database:sismember(bot_id..'Spam:Texting'..msg.sender_user_id_,text) then
database:del(bot_id..'Spam:Texting'..msg.sender_user_id_) 
end
--------------------------------------------------------------------------------------------------------------
if text and database:get(bot_id.."Del:Cmd:Group"..msg.chat_id_..':'..msg.sender_user_id_) == 'true' then
local NewCmmd = database:get(bot_id.."Set:Cmd:Group:New1"..msg.chat_id_..':'..text)
if NewCmmd then
database:del(bot_id.."Set:Cmd:Group:New1"..msg.chat_id_..':'..text)
database:del(bot_id.."Set:Cmd:Group:New"..msg.chat_id_)
database:srem(bot_id.."List:Cmd:Group:New"..msg.chat_id_,text)
send(msg.chat_id_, msg.id_,'•  تم حذف الامر')  
else
send(msg.chat_id_, msg.id_,' لا يوجد امر بهاذا الاسم')  
end
database:del(bot_id.."Del:Cmd:Group"..msg.chat_id_..':'..msg.sender_user_id_)
return false
end 
-------------------------------------------------------------------------------------------------------------- 
if data.message_.content_.text_ then
local NewCmmd = database:get(bot_id.."Set:Cmd:Group:New1"..msg.chat_id_..':'..data.message_.content_.text_)
if NewCmmd then
data.message_.content_.text_ = (NewCmmd or data.message_.content_.text_)
end
end
if text == "صلاحياته" and tonumber(msg.reply_to_message_id_) > 0 then    
if tonumber(msg.reply_to_message_id_) ~= 0 then 
function prom_reply(extra, result, success) 
Get_Info(msg,msg.chat_id_,result.sender_user_id_)
end  
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},prom_reply, nil)
end
end
------------------------------------------------------------------------
if text == "صلاحياتي" then 
if tonumber(msg.reply_to_message_id_) == 0 then 
Get_Info(msg,msg.chat_id_,msg.sender_user_id_)
end  
end
------------------------------------------------------------------------
if text and text:match('^صلاحياته @(.*)') then   
local username = text:match('صلاحياته @(.*)')   
if tonumber(msg.reply_to_message_id_) == 0 then 
function prom_username(extra, result, success) 
if (result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED") then
sendText(msg.chat_id_,"*- المعرف غير صحيح \n*",msg.id_/2097152/0.5,'md')
return false  end   
Get_Info(msg,msg.chat_id_,result.id_)
end  
tdcli_function ({ID = "SearchPublicChat",username_ = username},prom_username,nil) 
end 
end
if msg.date_ and msg.date_ < tonumber(os.time() - 15) then
print('OLD MESSAGE')
return false
end
if tonumber(msg.sender_user_id_) == tonumber(bot_id) then
return false
end
--------------------------------------------------------------------------------------------------------------
if msg.sender_user_id_ and Muted_User(msg.chat_id_,msg.sender_user_id_) then 
DeleteMessage(msg.chat_id_, {[0] = msg.id_})  
return false  
end
--------------------------------------------------------------------------------------------------------------
if msg.sender_user_id_ and Ban_User(msg.chat_id_,msg.sender_user_id_) then 
chat_kick(msg.chat_id_,msg.sender_user_id_) 
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false  
end
--------------------------------------------------------------------------------------------------------------
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and Ban_User(msg.chat_id_,msg.content_.members_[0].id_) then 
chat_kick(msg.chat_id_,msg.content_.members_[0].id_) 
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false
end
--------------------------------------------------------------------------------------------------------------
if msg.sender_user_id_ and GBan_User(msg.sender_user_id_) then 
chat_kick(msg.chat_id_,msg.sender_user_id_) 
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false 
end
--------------------------------------------------------------------------------------------------------------
if msg.sender_user_id_ and Gmute_User(msg.sender_user_id_) then 
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false 
end
--------------------------------------------------------------------------------------------------------------
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and GBan_User(msg.content_.members_[0].id_) then 
chat_kick(msg.chat_id_,msg.content_.members_[0].id_) 
DeleteMessage(msg.chat_id_, {[0] = msg.id_})  
end 
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageChatAddMembers" then  
database:set(bot_id.."Who:Added:Me"..msg.chat_id_..':'..msg.content_.members_[0].id_,msg.sender_user_id_)
local mem_id = msg.content_.members_  
local Bots = database:get(bot_id.."lock:Bot:kick"..msg.chat_id_) 
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and not Mod(msg) and Bots == "kick" then   
https.request("https://api.telegram.org/bot"..token.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_)
MODEDEV = https.request("https://api.telegram.org/bot"..token.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local Json_Info = JSON.decode(MODEDEV)
if Json_Info.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_})
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID,filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,tah) local admins = tah.members_ for i=0 , #admins do if tah.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not is_mod(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
end
-------------------------
if Text == '/lockdul' and Mod(data) then
local Textedit = '• تم تعطيل التنزيل '
redis:set(bot_id..'dw:bot:api'..Chat_id,true) 
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homeaddrem"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/lock_links' and Mod(data) then
local Textedit = '• تم تعطيل الرابط '
redis:del(bot_id..'MODEDEV:Link_Group'..Chat_id) 
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homeaddrem"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/lockmyphoto' and Mod(data) then
local Textedit = '• تم تعطيل صورتي '
redis:set(bot_id..'my_photo:status:bot'..Chat_id,'yazon')
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homeaddrem"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/lockwelcome' and Mod(data) then
local Textedit = '• تم تعطيل الترحيب '
redis:del(bot_id..'MODEDEV:Chek:Welcome'..Chat_id)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homeaddrem"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/lockrepall' and Mod(data) then
local Textedit = '• تم تعطيل الردود العامه '
redis:set(bot_id..'MODEDEV:Reply:Sudo'..Chat_id,true)   
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homeaddrem"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/lockide' and Mod(data) then
local Textedit = '• تم تعطيل الايدي '
redis:set(bot_id..'MODEDEV:Lock:Id:Photo'..Chat_id,true) 
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homeaddrem"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/lockidephoto' and Mod(data) then
local Textedit = '• تم تعطيل الايدي بالصوره '
redis:set(bot_id..'MODEDEV:Lock:Id:Py:Photo'..Chat_id,true) 
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homeaddrem"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/lockkiked' and Mod(data) then
local Textedit = '• تم تعطيل الحظر '
redis:set(bot_id..'MODEDEV:Lock:Ban:Group'..Chat_id,'true')
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homeaddrem"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/locksetm' and Mod(data) then
local Textedit = '• تم تعطيل الرفع '
redis:set(bot_id..'MODEDEV:Cheking:Seted'..Chat_id,'true')
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homeaddrem"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/lockaddme' and Mod(data) then
local Textedit = '• تم تعطيل ضافني '
redis:del(bot_id..'Added:Me'..Chat_id)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homeaddrem"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/locksehe' and Mod(data) then
local Textedit = '• تم تعطيل صيح '
redis:del(bot_id..'Seh:User'..Chat_id)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homeaddrem"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/lockkikedme' and Mod(data) then
local Textedit = '• تم تعطيل اطردني '
redis:set(bot_id..'MODEDEV:Cheking:Kick:Me:Group'..Chat_id,true)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homeaddrem"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/lockgames' and Mod(data) then
local Textedit = '• تم تعطيل الالعاب '
redis:del(bot_id..'MODEDEV:Lock:Game:Group'..Chat_id)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homeaddrem"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/lockrepgr' and Mod(data) then
local Textedit = '• تم تعطيل الردود '
redis:set(bot_id..'MODEDEV:Reply:Manager'..Chat_id,true)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homeaddrem"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if Text == '/unlockdul' and Mod(data) then
local Textedit = '• تم تفعيل التنزيل '
redis:del(bot_id..'dw:bot:api'..Chat_id) 
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homeaddrem"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/unlock_links' and Mod(data) then
local Textedit = '• تم تفعيل الرابط '
redis:set(bot_id..'MODEDEV:Link_Group'..Chat_id,true) 
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homeaddrem"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/unlockmyphoto' and Mod(data) then
local Textedit = '• تم تفعيل صورتي '
redis:del(bot_id..'my_photo:status:bot'..Chat_id)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homeaddrem"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/unlockwelcome' and Mod(data) then
local Textedit = '• تم تفعيل الترحيب '
redis:set(bot_id..'MODEDEV:Chek:Welcome'..Chat_id,true) 
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homeaddrem"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/unlockrepall' and Mod(data) then
local Textedit = '• تم تفعيل الردود العامه '
redis:del(bot_id..'MODEDEV:Reply:Sudo'..Chat_id)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homeaddrem"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/unlockide' and Mod(data) then
local Textedit = '• تم تفعيل الايدي '
redis:del(bot_id..'MODEDEV:Lock:Id:Photo'..Chat_id) 
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homeaddrem"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/unlockidephoto' and Mod(data) then
local Textedit = '• تم تفعيل الايدي بالصوره '
redis:del(bot_id..'MODEDEV:Lock:Id:Py:Photo'..Chat_id)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homeaddrem"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/unlockkiked' and Mod(data) then
local Textedit = '• تم تفعيل الحظر '
redis:del(bot_id..'MODEDEV:Lock:Ban:Group'..Chat_id)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homeaddrem"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/unlocksetm' and Mod(data) then
local Textedit = '• تم تفعيل الرفع '
redis:del(bot_id..'MODEDEV:Cheking:Seted'..Chat_id)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homeaddrem"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/unlockaddme' and Mod(data) then
local Textedit = '• تم تفعيل ضافني '
redis:set(bot_id..'Added:Me'..Chat_id,true)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homeaddrem"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/unlocksehe' and Mod(data) then
local Textedit = '• تم تفعيل صيح '
redis:set(bot_id..'Seh:User'..Chat_id,true)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homeaddrem"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/unlockkikedme' and Mod(data) then
local Textedit = '• تم تفعيل اطردني '
redis:del(bot_id..'MODEDEV:Cheking:Kick:Me:Group'..Chat_id)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homeaddrem"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/unlockgames' and Mod(data) then
local Textedit = '• تم تفعيل الالعاب '
redis:set(bot_id..'MODEDEV:Lock:Game:Group'..Chat_id,true) 
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homeaddrem"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/unlockrepgr' and Mod(data) then
local Textedit = '• تم تفعيل الردود '
redis:del(bot_id..'MODEDEV:Reply:Manager'..Chat_id)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homeaddrem"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/homeaddrem' and Mod(data) then
local Texti = 'تستطيع تعطيل وتفعيل عبر الازرار'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'تعطيل التنزيل', callback_data="/lockdul"},{text = 'تفعيل التنزيل', callback_data="/unlockdul"},
},
{
{text = 'تعطيل الرابط', callback_data="/lock_links"},{text = 'تفعيل الرابط', callback_data="/unlock_links"},
},
{
{text = 'تعطيل صورتي', callback_data="/lockmyphoto"},{text = 'تفعيل صورتي', callback_data="/unlockmyphoto"},
},
{
{text = 'تعطيل الترحيب', callback_data="/lockwelcome"},{text = 'تفعيل الترحيب', callback_data="/unlockwelcome"},
},
{
{text = 'تعطيل الردود العامه', callback_data="/lockrepall"},{text = 'تفعيل الردود العامه', callback_data="/unlockrepall"},
},
{
{text = 'تعطيل الايدي', callback_data="/lockide"},{text = 'تفعيل الايدي', callback_data="/unlockide"},
},
{
{text = 'تعطيل الايدي بالصوره', callback_data="/lockidephoto"},{text = 'تفعيل الايدي بالصوره', callback_data="/unlockidephoto"},
},
{
{text = 'تعطيل الحظر', callback_data="/lockkiked"},{text = 'تفعيل الحظر', callback_data="/unlockkiked"},
},
{
{text = 'تعطيل الرفع', callback_data="/locksetm"},{text = 'تفعيل الرفع', callback_data="/unlocksetm"},
},
{
{text = 'تعطيل ضافني', callback_data="/lockaddme"},{text = 'تفعيل ضافني', callback_data="/unlockaddme"},
},
{
{text = 'تعطيل صيح', callback_data="/locksehe"},{text = 'تفعيل صيح', callback_data="/unlocksehe"},
},
{
{text = 'تعطيل اطردني', callback_data="/lockkikedme"},{text = 'تفعيل اطردني', callback_data="/unlockkikedme"},
},
{
{text = 'تعطيل الالعاب', callback_data="/lockgames"},{text = 'تفعيل الالعاب', callback_data="/unlockgames"},
},
{
{text = 'تعطيل الردود', callback_data="/lockrepgr"},{text = 'تفعيل الردود', callback_data="/unlockrepgr"},
},
{
{text = 'العوده', callback_data="/help"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Texti)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if Text == '/lockjoine' and Mod(data) then
local Textedit = '• تم قفل الاضافه '
redis:set(bot_id.."MODEDEV:Lock:AddMempar"..Chat_id,"kick")  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/lockchat' and Mod(data) then
local Textedit = '• تم قفل الدردشه '
redis:set(bot_id.."MODEDEV:Lock:text"..Chat_id,true) 
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/lock_joine' and Mod(data) then
local Textedit = '• تم قفل الدخول '
redis:set(bot_id.."MODEDEV:Lock:Join"..Chat_id,"kick")  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/lockbots' and Mod(data) then
local Textedit = '• تم قفل البوتات '
redis:set(bot_id.."MODEDEV:Lock:Bot:kick"..Chat_id,"del")  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/locktags' and Mod(data) then
local Textedit = '• تم قفل الاشعارات '
redis:set(bot_id.."MODEDEV:Lock:tagservr"..Chat_id,true)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/lockedit' and Mod(data) then
local Textedit = '• تم قفل التعديل '
redis:set(bot_id.."MODEDEV:Lock:edit"..Chat_id,true) 
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/locklink' and Mod(data) then
local Textedit = '• تم قفل الروابط '
redis:set(bot_id.."MODEDEV:Lock:Link"..Chat_id,"del")  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/lockusername' and Mod(data) then
local Textedit = '• تم قفل المعرفات '
redis:set(bot_id.."MODEDEV:Lock:User:Name"..Chat_id,"del")  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/locktag' and Mod(data) then
local Textedit = '• تم قفل التاك '
redis:set(bot_id.."MODEDEV:Lock:hashtak"..Chat_id,"del")  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/locksticar' and Mod(data) then
local Textedit = '• تم قفل الملصقات '
redis:set(bot_id.."MODEDEV:Lock:Sticker"..Chat_id,'del')  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/lockgif' and Mod(data) then
local Textedit = '• تم قفل المتحركات '
redis:set(bot_id.."MODEDEV:Lock:Animation"..Chat_id,'del')  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/lockvideo' and Mod(data) then
local Textedit = '• تم قفل الفيديو '
redis:set(bot_id.."MODEDEV:Lock:Video"..Chat_id,'del')  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/lockphoto' and Mod(data) then
local Textedit = '• تم قفل الصور '
redis:set(bot_id.."MODEDEV:Lock:Photo"..Chat_id,'del')  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/lockvoise' and Mod(data) then
local Textedit = '• تم قفل الاغاني '
redis:set(bot_id.."MODEDEV:Lock:Audio"..Chat_id,'del')  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/lockaudo' and Mod(data) then
local Textedit = '• تم قفل الصوت '
redis:set(bot_id.."MODEDEV:Lock:vico"..Chat_id,'del')  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/lockfwd' and Mod(data) then
local Textedit = '• تم قفل التوجيه '
redis:set(bot_id.."MODEDEV:Lock:forward"..Chat_id,'del')  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/lockfile' and Mod(data) then
local Textedit = '• تم قفل الملفات '
redis:set(bot_id.."MODEDEV:Lock:Document"..Chat_id,'del')  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/lockphone' and Mod(data) then
local Textedit = '• تم قفل الجهات '
redis:set(bot_id.."MODEDEV:Lock:Contact"..Chat_id,'del')  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/lockposts' and Mod(data) then
local Textedit = '• تم قفل الكلايش '
redis:set(bot_id.."MODEDEV:Lock:Spam"..Chat_id,'del')  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/lockflood' and Mod(data) then
local Textedit = '• تم قفل التكرار '
redis:hset(bot_id.."MODEDEV:Spam:Group:User"..Chat_id ,"Spam:User",'del')  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/lockfarse' and Mod(data) then
local Textedit = '• تم قفل الفارسيه '
redis:set(bot_id..'lock:Fars'..Chat_id,true) 
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/lockfshar' and Mod(data) then
local Textedit = '• تم قفل السب '
redis:set(bot_id..'lock:Fshar'..Chat_id,true) 
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/lockenglish' and Mod(data) then
local Textedit = '• تم قفل الانجليزيه '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/lockinlene' and Mod(data) then
local Textedit = '• تم قفل الانلاين '
redis:set(bot_id.."MODEDEV:Lock:Inlen"..Chat_id,"del")  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if Text == '/unlockjoine' and Mod(data) then
local Textedit = '• تم فتح الاضافه '
redis:del(bot_id.."MODEDEV:Lock:AddMempar"..Chat_id)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/unlockchat' and Mod(data) then
local Textedit = '• تم فتح الدردشه '
redis:del(bot_id.."MODEDEV:Lock:text"..Chat_id) 
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/unlock_joine' and Mod(data) then
local Textedit = '• تم فتح الدخول '
redis:del(bot_id.."MODEDEV:Lock:Join"..Chat_id)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/unlockbots' and Mod(data) then
local Textedit = '• تم فتح البوتات '
redis:del(bot_id.."MODEDEV:Lock:Bot:kick"..Chat_id)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/unlocktags' and Mod(data) then
local Textedit = '• تم فتح الاشعارات '
redis:del(bot_id.."MODEDEV:Lock:tagservr"..Chat_id)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/unlockedit' and Mod(data) then
local Textedit = '• تم فتح التعديل '
redis:del(bot_id.."MODEDEV:Lock:edit"..Chat_id)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/unlocklink' and Mod(data) then
local Textedit = '• تم فتح الروابط '
redis:del(bot_id.."MODEDEV:Lock:Link"..Chat_id)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/unlockusername' and Mod(data) then
local Textedit = '• تم فتح المعرفات '
redis:del(bot_id.."MODEDEV:Lock:User:Name"..Chat_id)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/unlocktag' and Mod(data) then
local Textedit = '• تم فتح التاك '
redis:del(bot_id.."MODEDEV:Lock:hashtak"..Chat_id)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/unlocksticar' and Mod(data) then
local Textedit = '• تم فتح الملصقات '
redis:del(bot_id.."MODEDEV:Lock:Sticker"..Chat_id)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/unlockgif' and Mod(data) then
local Textedit = '• تم فتح المتحركات '
redis:del(bot_id.."MODEDEV:Lock:Animation"..Chat_id)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/unlockvideo' and Mod(data) then
local Textedit = '• تم فتح الفيديو '
redis:del(bot_id.."MODEDEV:Lock:Video"..Chat_id)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/unlockphoto' and Mod(data) then
local Textedit = '• تم فتح الصور '
redis:del(bot_id.."MODEDEV:Lock:Photo"..Chat_id)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/unlockvoise' and Mod(data) then
local Textedit = '• تم فتح الاغاني '
redis:del(bot_id.."MODEDEV:Lock:Audio"..Chat_id)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/unlockaudo' and Mod(data) then
local Textedit = '• تم فتح الصوت '
redis:del(bot_id.."MODEDEV:Lock:vico"..Chat_id)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/unlockfwd' and Mod(data) then
local Textedit = '• تم فتح التوجيه '
redis:del(bot_id.."MODEDEV:Lock:forward"..Chat_id)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/unlockfile' and Mod(data) then
local Textedit = '• تم فتح الملفات '
redis:del(bot_id.."MODEDEV:Lock:Document"..Chat_id)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/unlockphone' and Mod(data) then
local Textedit = '• تم فتح الجهات '
redis:del(bot_id.."MODEDEV:Lock:Contact"..Chat_id)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/unlockposts' and Mod(data) then
local Textedit = '• تم فتح الكلايش '
redis:del(bot_id.."MODEDEV:Lock:Spam"..Chat_id) 
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/unlockflood' and Mod(data) then
local Textedit = '• تم فتح التكرار '
redis:hdel(bot_id.."MODEDEV:Spam:Group:User"..Chat_id ,"Spam:User")  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/unlockfarse' and Mod(data) then
local Textedit = '• تم فتح الفارسيه '
redis:del(bot_id..'lock:Fars'..Chat_id) 
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/unlockfshar' and Mod(data) then
local Textedit = '• تم فتح السب '
redis:del(bot_id..'lock:Fshar'..Chat_id) 
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/unlockenglish' and Mod(data) then
local Textedit = '• تم فتح الانجليزيه '
redis:del(bot_id..'lock:Fars'..Chat_id) 
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/unlockinlene' and Manager(data) then
local Textedit = '• تم فتح الانلاين '
redis:del(bot_id.."MODEDEV:Lock:Inlen"..Chat_id)  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'القائمة الرئيسيه', callback_data="/homelocks"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Textedit)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
elseif Text == '/homelocks' and Mod(data) then
local Texti = 'تستطيع قفل وفتح عبر الازرار'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'قفل الاضافه', callback_data="/lockjoine"},{text = 'فتح الاضافه', callback_data="/unlockjoine"},
},
{
{text = 'قفل الدردشه', callback_data="/lockchat"},{text = 'فتح الدردشه', callback_data="/unlockchat"},
},
{
{text = 'قفل الدخول', callback_data="/lock_joine"},{text = 'فتح الدخول', callback_data="/unlock_joine"},
},
{
{text = 'قفل البوتات', callback_data="/lockbots"},{text = 'فتح البوتات', callback_data="/unlockbots"},
},
{
{text = 'قفل الاشعارات', callback_data="/locktags"},{text = 'فتح الاشعارات', callback_data="/unlocktags"},
},
{
{text = 'قفل التعديل', callback_data="/lockedit"},{text = 'فتح التعديل', callback_data="/unlockedit"},
},
{
{text = 'قفل الروابط', callback_data="/locklink"},{text = 'فتح الروابط', callback_data="/unlocklink"},
},
{
{text = 'قفل المعرفات', callback_data="/lockusername"},{text = 'فتح المعرفات', callback_data="/unlockusername"},
},
{
{text = 'قفل التاك', callback_data="/locktag"},{text = 'فتح التاك', callback_data="/unlocktag"},
},
{
{text = 'قفل الملصقات', callback_data="/locksticar"},{text = 'فتح الملصقات', callback_data="/unlocksticar"},
},
{
{text = 'قفل المتحركه', callback_data="/lockgif"},{text = 'فتح المتحركه', callback_data="/unlockgif"},
},
{
{text = 'قفل الفيديو', callback_data="/lockvideo"},{text = 'فتح الفيديو', callback_data="/unlockvideo"},
},
{
{text = 'قفل الصور', callback_data="/lockphoto"},{text = 'فتح الصور', callback_data="/unlockphoto"},
},
{
{text = 'قفل الاغاني', callback_data="/lockvoise"},{text = 'فتح الاغاني', callback_data="/unlockvoise"},
},
{
{text = 'قفل الصوت', callback_data="/lockaudo"},{text = 'فتح الصوت', callback_data="/unlockaudo"},
},
{
{text = 'قفل التوجيه', callback_data="/lockfwd"},{text = 'فتح التوجيه', callback_data="/unlockfwd"},
},
{
{text = 'قفل الملفات', callback_data="/lockfile"},{text = 'فتح الملفات', callback_data="/unlockfile"},
},
{
{text = 'قفل الجهات', callback_data="/lockphone"},{text = 'فتح الجهات', callback_data="/unlockphone"},
},
{
{text = 'قفل الكلايش', callback_data="/lockposts"},{text = 'فتح الكلايش', callback_data="/unlockposts"},
},
{
{text = 'قفل التكرار', callback_data="/lockflood"},{text = 'فتح التكرار', callback_data="/unlockflood"},
},
{
{text = 'قفل الفارسيه', callback_data="/lockfarse"},{text = 'فتح الفارسيه', callback_data="/unlockfarse"},
},
{
{text = 'قفل السب', callback_data="/lockfshar"},{text = 'فتح السب', callback_data="/unlockfshar"},
},
{
{text = 'قفل الانجليزيه', callback_data="/lockenglish"},{text = 'فتح الانجليزيه', callback_data="/unlockenglish"},
},
{
{text = 'قفل الانلاين', callback_data="/lockinlene"},{text = 'فتح الانلاين', callback_data="/unlockinlene"},
},
{
{text = 'العوده', callback_data="/help"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Texti)..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end







--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageChatAddMembers" then  
local mem_id = msg.content_.members_  
local Bots = database:get(bot_id.."lock:Bot:kick"..msg.chat_id_) 
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and not Mod(msg) and Bots == "del" then   
MODEDEV = https.request("https://api.telegram.org/bot"..token.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local Json_Info = JSON.decode(MODEDEV)
if Json_Info.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_})
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID,filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,tah) local admins = tah.members_ for i=0 , #admins do if tah.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not is_mod(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
end
if msg.content_.ID == 'MessagePinMessage' then
if Constructor(msg) then 
database:set(bot_id..'Pin:Id:Msg'..msg.chat_id_,msg.content_.message_id_)
else
local Msg_Pin = database:get(bot_id..'Pin:Id:Msg'..msg.chat_id_)
if Msg_Pin and database:get(bot_id.."lockpin"..msg.chat_id_) then
PinMessage(msg.chat_id_,Msg_Pin)
end
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageChatDeletePhoto" or msg.content_.ID == "MessageChatChangePhoto" or msg.content_.ID == 'MessagePinMessage' or msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" or msg.content_.ID == 'MessageChatChangeTitle' or msg.content_.ID == "MessageChatDeleteMember" then   
if database:get(bot_id..'lock:tagservr'..msg.chat_id_) then  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})       
return false
end    
end
--------------------------------------------------------------------------------------------------------------
SourceMODEDEV(data.message_,data)
plugin_Poyka(data.message_)
if Chat_Type == 'GroupBot' and ChekAdd(msg.chat_id_) == true then
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ then
database:set(bot_id..'user:Name'..msg.sender_user_id_,(data.username_))
end
--------------------------------------------------------------------------------------------------------------
if tonumber(data.id_) == tonumber(bot_id) then
return false
end
end,nil)   
end
elseif (data.ID == "UpdateMessageEdited") then
local msg = data
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.message_id_)},function(extra, result, success)
database:incr(bot_id..'edits'..result.chat_id_..result.sender_user_id_)
local Text = result.content_.text_
if database:get(bot_id.."lock_edit_med"..msg.chat_id_) and not Text and not BasicConstructor(result) then
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local username = data.username_
local name = data.first_name_
local iduser = data.id_
local users = ('[@'..data.username_..']' or iduser)
local list = database:smembers(bot_id..'Constructor'..msg.chat_id_)
t = "\n • شخص ما يحاول تعديل الميديا \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " • لايوجد منشئين"
end
send(msg.chat_id_,0,''..t..'\n≪━━━━━━━━━━━━━≫\n • تم التعديل على الميديا\n • الشخص الي قام بالتعديل\n • ايدي الشخص ◂ '..result.sender_user_id_..'\n • معرف الشخص>{ '..users..' }') 
end,nil)
DeleteMessage(msg.chat_id_,{[0] = msg.message_id_}) 
end
local text = result.content_.text_
if not Mod(result) then
------------------------------------------------------------------------
if text:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]") or text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get(bot_id.."lock:Link"..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_}) 
return false
end 
end
------------------------------------------------------------------------
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get(bot_id.."lock:Link"..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_}) 
return false
end 
end
------------------------------------------------------------------------
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get(bot_id.."lock:Link"..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_}) 
return false
end  
end
------------------------------------------------------------------------
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get(bot_id.."lock:Link"..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text:match("[hH][tT][tT][pP][sT]") or text:match("[tT][eE][lL][eE][gG][rR][aA].[Pp][Hh]") or text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa].[Pp][Hh]") then
if database:get(bot_id.."lock:Link"..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text:match("(.*)(@)(.*)") then
if database:get(bot_id.."lock:user:name"..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_}) 
return false
end  
end
------------------------------------------------------------------------
if text:match("@") then
if database:get(bot_id.."lock:user:name"..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text:match("(.*)(#)(.*)") then
if database:get(bot_id.."lock:hashtak"..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text:match("#") then
if database:get(bot_id.."lock:user:name"..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
local MODEDEVAbot = database:get(bot_id.."MODEDEV1:Add:Filter:Rp2"..text..result.chat_id_)   
if MODEDEVAbot then    
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
send(msg.chat_id_,0,"•العضو : {["..data.first_name_.."](T.ME/"..data.username_..")}\n•["..MODEDEVAbot.."] \n") 
else
send(msg.chat_id_,0,"•العضو : {["..data.first_name_.."](T.ME/UU_KFUF)}\n•["..MODEDEVAbot.."] \n") 
end
end,nil)   
DeleteMessage(msg.chat_id_,{[0] = data.message_id_}) 
return false
end
------------------------------------------------------------------------
if text:match("/") then
if database:get(bot_id.."lock:Cmd"..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_}) 
return false
end 
end 
if text:match("(.*)(/)(.*)") then
if database:get(bot_id.."lock:Cmd"..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_}) 
return false
end 
end
------------------------------------------------------------------------
if text then
local MODEDEV1_Msg = database:get(bot_id.."MODEDEV1:Add:Filter:Rp2"..text..result.chat_id_)   
if MODEDEV1_Msg then    
send(msg.chat_id_, msg.id_,"•"..MODEDEV1_Msg)
DeleteMessage(result.chat_id_, {[0] = data.message_id_})     
return false
end
end
end
end,nil)
------------------------------------------------------------------------
elseif (data.ID == "UpdateOption" and data.name_ == "my_id") then 
local list = database:smembers(bot_id.."User_Bot") 
for k,v in pairs(list) do 
tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data) end,nil) 
end         
local list = database:smembers(bot_id..'Chek:Groups') 
for k,v in pairs(list) do 
tdcli_function({ID='GetChat',chat_id_ = v
},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
database:srem(bot_id..'Chek:Groups',v)  
tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_=v,user_id_=bot_id,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
database:srem(bot_id..'Chek:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
database:srem(bot_id..'Chek:Groups',v)  
end
if data and data.code_ and data.code_ == 400 then
database:srem(bot_id..'Chek:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusEditor" then
database:sadd(bot_id..'Chek:Groups',v)  
end 
end,nil)
end

elseif (data.ID == "UpdateMessageSendSucceeded") then
local msg = data.message_
local text = msg.content_.text_
local Get_Msg_Pin = database:get(bot_id..'Msg:Pin:Chat'..msg.chat_id_)
if Get_Msg_Pin ~= nil then
if text == Get_Msg_Pin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) if d.ID == 'Ok' then;database:del(bot_id..'Msg:Pin:Chat'..msg.chat_id_);end;end,nil)   
elseif (msg.content_.sticker_) then 
if Get_Msg_Pin == msg.content_.sticker_.sticker_.persistent_id_ then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) database:del(bot_id..'Msg:Pin:Chat'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.animation_) then 
if msg.content_.animation_.animation_.persistent_id_ == Get_Msg_Pin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) database:del(bot_id..'Msg:Pin:Chat'..msg.chat_id_) end,nil)   
end
end

if (msg.content_.photo_) then
if msg.content_.photo_.sizes_[0] then
id_photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
id_photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
id_photo = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
id_photo = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
if id_photo == Get_Msg_Pin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) database:del(bot_id..'Msg:Pin:Chat'..msg.chat_id_) end,nil)   
end
end
end


end -- end new msg
end -- end callback