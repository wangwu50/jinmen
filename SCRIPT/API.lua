--迷之少女4100
--开启  691
--4506 开图
--颜色Ｒ=redＧ=goldＢ=black  Ｒ Ｗ=whiteＯ=orange Ｌ=绿色 Ｚ= 紫色 "ＬＤ＜＞"Ｗ  Ｄ =蓝  ……
instruct_25(38,51,31,51)  --场景移动
instruct_40(0)  --主角面向右 0右 1下  2 左  3 上
DrawStrBoxWaitKey("胡一刀领悟刀剑归真奥义", C_GOLD, CC.DefaultFont,nil, C_RED)
My_Enter_SubScene(110,28,32,0)  --场景跳跃
SetTF(id,tf,1) --设定天赋
SetTF(id,tf,nil) --删天赋
awakening(633, 1) --觉醒
"..JY.Person[0]["姓名"].."
if JY.Person[0]["性别"] == 0 then
	TalkEx("什么添麻烦，是我帮了他的大忙才对！", 77, 1)  --对话
else
	TalkEx("什么添麻烦，是我帮了她的大忙才对！", 77, 1)  --对话
end
local size = 60
local x = CC.ScreenW/2;
local y = CC.ScreenH/2;
local offx = (#"第二日")*size/4
local offy = size/2
lib.Background(0,y-50,CC.ScreenW,y+50,98)
DrawString(x-offx,y-offy,"第二日",M_DeepSkyBlue,size);  --静夜思
ShowScreen();
lib.Delay(1500);
Cls()
addevent(4, 5, 1, 4218, 1, 4342*2)
1,场景位置编号
2,事件位置编号
3,通过/不通过
4,事件剧本文件编号
5,触发事件方式
6,贴图

jymain.lua 函数列表


function IncludeFile()              --导入其他模块
function SetGlobal()   --设置游戏内部使用的全程变量
function JY_Main()        --主程序入口
function myErrFun(err)      --错误处理，打印错误信息
function JY_Main_sub()        --真正的游戏主程序入口
function NewGame()     --选择新游戏，设置主角初始属性
local function DrawAttrib(str)    --定义内部函数
function Game_Cycle()       --游戏主循环
function Game_MMap()      --主地图
function GetMyPic()      --计算主角当前贴图
function AddMyCurrentPic()        ---增加当前主角走路动画帧,
function CanEnterScene(id,x,y)         --场景是否可进
function MMenu()      --主菜单
function Menu_System()         --系统子菜单
function Menu_Exit()      --离开菜单
function Menu_SaveRecord()         --保存进度菜单
function Menu_ReadRecord()        --读取进度菜单
function Menu_Status()           --状态子菜单
function Menu_PersonExit()        --离队Exit
function SelectTeamMenu(x,y)          --队伍选择人物菜单
function ShowPersonStatus(id)        --显示人状态
local function DrawAttrib(str,color1,color2,v)    --定义内部函数
function TrainNeedExp(id)         --计算人物修炼物品成功需要的点数
function Menu_Doctor()       --医疗菜单
function ExecDoctor(id1,id2)      --执行医疗
function Menu_DecPoison()         --解毒
function ExecDecPoison(id1,id2)     --执行解毒
function Menu_Thing()       --物品菜单
function SelectThing(thing,thingnum)        --显示物品供选择
function Game_SMap()         --场景处理主函数
function SceneCanPass(x,y)  --场景坐标(x,y)是否可以通过
function DtoSMap()          ---D*中的事件数据复制到S*中，同时处理动画效果。
function DrawSMap()       --绘场景地图
function LoadRecord(id)       -- 读取游戏进度
function SaveRecord(id)         -- 写游戏进度
function filelength(filename)         --得到文件长度
function GetS(id,x,y,level)       --读S×数据
function SetS(id,x,y,level,v)       --写S×
function GetD(Sceneid,id,i)          --读D*
function SetD(Sceneid,id,i,v)         --写D×
function LoadData(t,t_struct,data)        --读取R×数据
function SaveData(t,t_struct,data)      --写R×数据
function limitX(x,minv,maxv)       --限制x的范围
function RGB(r,g,b)          --设置颜色RGB
function GetRGB(color)      --分离颜色的RGB分量
function WaitKey()       --等待键盘输入
function DrawBox(x1,y1,x2,y2,color)         --绘制一个带背景的白色方框
function DrawBox_1(x1,y1,x2,y2,color)       --绘制四角凹进的方框
function DrawString(x,y,str,color,size)         --显示阴影字符串
function DrawStrBox(x,y,str,color,size)         --显示带框的字符串
function DrawStrBoxYesNo(x,y,str,color,size)        --显示字符串并询问Y/N
function DrawStrBoxWaitKey(s,color,size)          --显示字符串并等待击键
function Rnd(i)           --随机数
function AddPersonAttrib(id,str,value)            --增加人物属性
function PlayMIDI(id)             --播放midi
function PlayWavAtk(id)             --播放音效atk***
function PlayWavE(id)              --播放音效e**
function ShowScreen()              --刷新屏幕显示
function ShowMenu(menuItem,numItem,numShow,x1,y1,x2,y2,isBox,isEsc,size,color,selectColor)     --通用菜单函数
function UseThing(id)             --物品使用
function DefaultUseThing(id)                --缺省物品使用函数
function UseThing_Type0(id)              --剧情物品使用
function UseThing_Type1(id)            --装备物品使用
function CanUseThing(id,personid)           --判断一个人是否可以装备或修炼一个物品
function UseThing_Type2(id)               --秘籍物品使用
function UseThing_Type3(id)        --药品物品使用
function UseThingEffect(id,personid)          --药品使用实际效果
local function ThingAddAttrib(s)     ---定义局部函数，处理吃药后增加属性
function UseThing_Type4(id)             --暗器物品使用
function EventExecute(id,flag)               --事件调用主入口
function oldEventExecute(flag)            --调用原有的指定位置的函数
function ChangeMMap(x,y,direct)          --改变大地图坐标
function ChangeSMap(sceneid,x,y,direct)       --改变当前场景
function Cls(x1,y1,x2,y2)                    --清除屏幕
function GenTalkString(str,n)              --产生对话显示需要的字符串
function Talk(s,personid)            --最简单版本对话
function TalkEx(s,headid,flag)          --复杂版本对话
function instruct_test(s)
function instruct_0()         --清屏
function instruct_1(talkid,headid,flag)        --对话
function instruct_2(thingid,num)            --得到物品
function instruct_2_sub()               --声望>200以及14天书后得到武林帖
function instruct_3(sceneid,id,v0,v1,v2,v3,v4,v5,v6,v7,v8,v9,v10)     --修改D*
        函数的定义：function instruct_3(sceneid,id,v0,v1,v2,v3,v4,v5,v6,v7,v8,v9,v10)
        最复杂的函数，修改事件内容（D*事件），一共有13个参数
        第1个参数：场景编号，-2表示当前场景
        第2个参数：场景位置编号
        第3个参数：是否能通过，0可以通过，1被拦住走不过
        第4个参数：不明白，都是写0
        第5个参数：第一个事件编号，空格触发，不想触发直接写0
        第6个参数：第二个事件编号，使用物品触发
        第7个参数：第三个事件编号，走过时自动触发
        第8个参数：开始贴图编号，-2表示贴图不变，0表示清除贴图
        第9个参数：结束贴图编号，-2表示贴图不变，0表示清除贴图
        第10个参数：临时贴图编号，-2表示贴图不变，0表示清除贴图
        第11个参数：动画延迟，-2表示不变
        第12个参数：横坐标X，-2表示不变，当场景位置为0时，此XY参数生效
        第13个参数：纵坐标Y，-2表示不变
function instruct_4(thingid)         --是否使用物品触发
function instruct_5()         --选择战斗
function instruct_6(warid,tmp,tmp,flag)      --战斗
function instruct_7()                 --已经翻译为return了
function instruct_8(musicid)            --改变主地图音乐
function instruct_9()                --是否要求加入队伍
function instruct_10(personid)            --加入队员
function instruct_11()              --是否住宿
function instruct_12()             --住宿，回复体力
function instruct_13()            --场景变亮
function instruct_14()             --场景变黑
function instruct_15()          --game over
function instruct_16(personid)      --队伍中是否有某人
function instruct_17(sceneid,level,x,y,v)     --修改场景图形
function instruct_18(thingid)           --是否有某种物品
function instruct_19(x,y)             --改变主角位置
function instruct_20()                 --判断队伍是否满
function instruct_21(personid)               --离队
function instruct_22()            --内力降为0
function instruct_23(personid,value)           --设置用毒
function instruct_24()
function instruct_25(x1,y1,x2,y2)             --场景移动
function instruct_26(sceneid,id,v1,v2,v3)           --增加D*编号
function instruct_27(id,startpic,endpic)           --显示动画
function instruct_28(personid,vmin,vmax)          --判断品德
function instruct_29(personid,vmin,vmax)           --判断攻击力
function instruct_30(x1,y1,x2,y2)                --主角走动
function instruct_30_sub(direct)            --主角走动sub
function instruct_31(num)             --判断是否够钱
function instruct_32(thingid,num)           --增加物品
function instruct_33(personid,wugongid,flag)           --学会武功
function instruct_34(id,value)              --资质增加
function instruct_35(personid,id,wugongid,wugonglevel)         --设置武功
function instruct_36(sex)               --判断主角性别
function instruct_37(v)              --增加品德
function instruct_38(sceneid,level,oldpic,newpic)         --修改场景某层贴图
function instruct_39(sceneid)             --打开场景
function instruct_40(v)                --改变主角方向
function instruct_41(personid,thingid,num)        --其他人员增加物品
function instruct_42()          --队伍中是否有女性
function instruct_43(thingid)        --是否有某种物品
function instruct_44(id1,startpic1,endpic1,id2,startpic2,endpic2)     --同时显示两个动画
function instruct_45(id,value)        --增加轻功
function instruct_46(id,value)            --增加内力
function instruct_47(id,value)     --增加攻击力
function instruct_48(id,value)         --增加生命
function instruct_49(personid,value)       --设置内力属性
function instruct_50(id1,id2,id3,id4,id5)       --判断是否有5种物品
function instruct_51()     --问软体娃娃
function instruct_52()       --看品德
function instruct_53()        --看声望
function instruct_54()        --开放其他场景
function instruct_55(id,num)      --判断D*编号的触发事件
function instruct_56(v)             --增加声望
function instruct_57()       --高昌迷宫劈门
function instruct_58()           --武道大会比武
function instruct_59()           --全体队员离队
function instruct_60(sceneid,id,num)          --判断D*图片
function instruct_61()               --判断是否放完14天书
function instruct_62(id1,startnum1,endnum1,id2,startnum2,endnum2)      --播放时空机动画，结束
function instruct_63(personid,sex)          --设置性别
function instruct_64()                 --小宝卖东西
function instruct_65()           --小宝去其他客栈
function instruct_66(id)       --播放音乐
function instruct_67(id)      --播放音效
function WarSetGlobal()            --设置战斗全程变量
function WarLoad(warid)               --战斗主函数
function WarMain(warid,isexp)
function War_PersonLostLife()             --计算战斗后每回合由于中毒或受伤而掉血
function War_EndPersonData(isexp,warStatus)            --战斗以后设置人物参数
function War_AddPersonLevel(pid)      --人物是否升级
function War_PersonTrainBook(pid)           --战斗后修炼秘籍是否成功
function War_PersonTrainDrug(pid)         --战斗后是否修炼出物品
function War_isEnd()           --战斗是否结束
function WarSelectTeam()            --选择我方参战人
function WarSelectMenu(newmenu,newid)            --选择战斗人菜单调用函数
function WarSelectEnemy()            --选择敌方参战人
function WarLoadMap(mapid)          --读取战斗地图
function WarDrawMap(flag,movex,movey)            --绘战斗地图
function WarDrawEffect(pic)           --显示武功效果
function WarPersonSort()               --战斗人物按轻功排序
function WarSetPerson()            --设置战斗人物位置
function WarCalPersonPic(id)       --计算战斗人物贴图
function War_Manual()                --手动战斗
function WarShowHead()               --显示战斗人头像
function War_MoveMenu()           --执行移动菜单
function War_CalMoveStep(id,stepmax,flag)                   --计算可移动步数
function War_SelectMove()              ---选择移动位置
function War_MovePerson(x,y)            --移动人物到位置x,y
function War_FightMenu()              --执行攻击菜单
function War_Fight_Sub(id,wugongnum,x,y)          --执行战斗
function War_FightSelectType0(wugong,level,x1,y1)          --选择点攻击
function War_FightSelectType1(wugong,level,x,y)            --选择线攻击
function War_FightSelectType2(wugong,level)                 --选择十字攻击
function War_FightSelectType3(wugong,level,x1,y1)            --选择面攻击
function War_Direct(x1,y1,x2,y2)             --计算人方向
function War_ShowFight(pid,wugong,wugongtype,eft)              --显示战斗动画
function War_WugongHurtLife(emenyid,wugong,level)             --计算武功伤害生命
function War_WugongHurtNeili(enemyid,wugong,level)           --计算武功伤害内力
function War_PoisonMenu()              ---用毒菜单
function War_PoisonHurt(pid,emenyid)     --计算敌人中毒点数
function War_DecPoisonMenu()          ---解毒菜单
function War_DoctorMenu()            ---医疗菜单
function War_ExecuteMenu(flag,thingid)            ---执行医疗，解毒用毒暗器
function War_ExecuteMenu_Sub(x1,y1,flag,thingid)     ---执行医疗，解毒用毒暗器的子函数，自动医疗也可调用
function War_ThingMenu()            --战斗物品菜单
function War_UseAnqi(id)          ---战斗使用暗器
function War_AnqiHurt(pid,emenyid,thingid)         --计算暗器伤害
function War_RestMenu()           --休息
function War_WaitMenu()            --等待，把当前战斗人调到队尾
function War_StatusMenu()          --战斗中显示状态
function War_AutoMenu()           --设置自动战斗
function War_Auto()             --自动战斗主函数
function War_Think()           --思考如何战斗
function War_ThinkDrug(flag)             --能否吃药增加参数
function War_ThinkDoctor()          --考虑是否给自己医疗
function War_AutoFight()             ---执行自动战斗
function War_AutoSelectWugong()           --自动选择合适的武功
function War_AutoSelectEnemy()             --选择战斗对手
function War_AutoSelectEnemy_near()              --选择最近对手
function War_AutoMove(wugongnum)              --自动往敌人方向移动
function War_GetCanFightEnemyXY(scope)             --得到可以走到攻击到敌人的最近位置
function War_AutoCalMaxEnemy(x,y,wugongid,level)       --计算从(x,y)开始攻击最多能够击中几个敌人
function War_AutoExecuteFight(wugongnum)            --自动执行战斗，显示攻击动画
function War_AutoEscape()                --逃跑
function War_AutoEatDrug(flag)          ---吃药加参数
function War_AutoDoctor()            --自动医疗
-- 240道德50已用
-- 241道德50已用
-- 242道德50已用
-- 27道德已用
-- 萧中慧道德已用
--64周伯通道德已用
--小昭道德已用
--344品德已用
--658品德已用
--191 品德已用（侠正）
--192 品德已用（侠邪）
--JY.Person[193]["品德"] ==80（中庸）
--JY.Person[194]["品德"] ==60（鸳鸯刀紫竹庵）