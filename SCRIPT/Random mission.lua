--��������
function DrawTimerA()
    local t2 = lib.GetTime();
	local name
	if JY.Status==GAME_SMAP or JY.Status==GAME_MMAP then
	if CC.Timer.status==0  then
	if  GetS(92,60,20,5)==1 then
	SetS(92,60,13,5,0);
	SetS(92,60,10,5,0);
	end
	if GetS(92,60,13,5) == 1 then
	if GetS(92,60,16,5)==419 or GetS(92,60,16,5)==440 then
		name="��˵�е�"
		else
		name="ħͷ"
		end
		    CC.Timer.status=1;
			CC.Timer.str="�����ټ��"..name..JY.Person[GetS(92,60,16,5)]["����"].."��"..JY.Scene[GetS(92,60,14,5)]["����"].."�����ˣ���ҿ�ȥΪ���������"
			CC.Timer.len=string.len(CC.Timer.str)/2+3;
		    CC.Timer.pic=127
			
			SetS(92,60,10,5,GetS(92,60,10,5)+1);
			
			if GetS(92,60,10,5)==3 then 
			SetS(92,60,13,5,0);
			SetS(92,60,10,5,0); 
			end
		
		end
		
		if GetS(92,60,12,5)==1 then 
		local tt1=GetS(92,60,21,5)
		local tt2=GetS(92,60,22,5)
		local tt3=GetS(92,60,24,5)
		local tt4=GetS(92,60,25,5)
		
		if  (tt1*60+tt2)- (tt3*60+tt4)>=(5-GetS(92,60,33,5)) then 
		SetS(92,60,15,5,1);
		SetS(92,60,27,5,2)
		JL()
		SetS(92,60,12,5,0); 
		end
		end
		if GetS(92,60,15,5)==1 then 
		local DD=GetS(92,60,14,5);
		local x=GetS(92,60,18,5)
        local y=GetS(92,60,19,5)
		SetS(92,60,11,5,1);
		SetS(92,60,12,5,2); 
		SetS(DD,x,y,2,0);
        SetS(DD,x,y,5,0);
		instruct_3(DD,168,0,0,0,0,0,0,0,0,0,0,0);
		SetS(DD,x,y,3,-1) 
		if GetS(92,60,16,5)==419 or GetS(92,60,16,5)==440 then
		name="ħ��"
		else
		name="ħͷ"
		end
		local bq ={127,128}
		local xmb={"������","������","�Ṧ","ȭ�ƹ���","��������","�������","ˣ������"}
		local rw=GetS(92,60,28,5)
		local jl=GetS(92,60,29,5)
		local xm=GetS(92,60,30,5)
		    CC.Timer.status=1;
			CC.Timer.str=name..JY.Person[GetS(92,60,16,5)]["����"].."��"..JY.Person[rw]["����"].."�������ˣ�"..JY.Person[rw]["����"]..xmb[xm].."������"..jl.."����������Ϊ�ѻ�����"
			CC.Timer.len=string.len(CC.Timer.str)/2+3;
		    CC.Timer.pic=bq[math.random(2)]
			SetS(92,60,10,5,GetS(92,60,10,5)+1);
			
			if GetS(92,60,10,5)==3 then 
			SetS(92,60,12,5,0); 
			SetS(92,60,11,5,0);
			SetS(92,60,15,5,0); 
			SetS(92,60,10,5,0);
			end
		end
		if t2-CC.Timer.stime>10000 and  GetS(92,60,31,5)==0 and  GetS(92,60,13,5) ==0 and GetS(92,60,15,5) ==0 then 
			SetS(92,60,26,5,1);
			CC.Timer.stime=t2;
			CC.Timer.status=1;
			CC.Timer.str=CC.RUNSTR[math.random(#CC.RUNSTR)];
			CC.Timer.len=string.len(CC.Timer.str)/2+3;
			CC.Timer.pic=127 
		end
		if GetS(92,60,26,5)==0 and math.random(5000)<(GetS(92,60,32,5)*35+5) and GetS(92,60,11,5) == 0  and GetS(92,60,13,5) ==0 and GetS(92,60,15,5) ==0 then
		    
			if GetS(92,60,12,5)==0 then 
			SetS(92,60,20,5,0); 
			SJRW(1);
			SetS(92,60,13,5,1);
			SetS(92,60,23,5,1);
			SetS(92,60,12,5,1); 
			end
		
		end
		
	else
		CC.Timer.fun(t2);
	end
	end
end


--����ʱ���ַ�������ʾʱ��ר��
function demostr(t)
  local tt = t - CC.Timer.stime
  tt = math.modf(tt / 10) % (CC.ScreenW + CC.Timer.len * CC.Fontsmall)
  if runword(CC.Timer.str, C_GOLD, CC.Fontsmall, 1, tt,CC.Timer.pic) == 1 and Rnd(2) == 1 then
    CC.Timer.status = 0
    CC.Timer.stime = t
	SetS(92,60,26,5,0);
  end
end

function runword(str, color, size, place, offset,pic)
  offset = CC.ScreenW - offset
  local y1, y2 = nil, nil
  if place == 0 then
    y1 = 0
    y2 = size
  elseif place == 1 then
    y1 = CC.ScreenH - size
    y2 = CC.ScreenH
  end
  lib.Background(0, y1, CC.ScreenW, y2, 128)
  if (CC.Timer.len - 1) * size < -(offset) then
    return 1
  end
  DrawString(offset, y1, str, color, size)
  lib.LoadPNG(91,pic*2,offset-20, y1+15, 2, 256);
  return 0
end


function SJRW(lv) --�������

local zdbh
local x,y
local t1
local tt
local CX 
local DD 
--lv�����ò�ͬ�ȼ��ĵ��˳���������ͳͳ����lv1
if lv==1 then

local boss={60,184,98,150,67,71,61,4,31,32,33,34,161,419,440,97,118,103,26,62,27,18,19,22,46,604,606,607,603,602,599,598} 
local place={1,3,20,23,24,30,32,35,36,44,56,59,60,61,62,63,65,94,95,96,97,100,103,105} 

CX= boss[math.random(#boss)]
DD= place[math.random(#place)]


--���ֵ�����
if DD==0 then --��쳾�
x=math.random(15,19)
y=math.random(33,36)
elseif DD==1 then --�����ջ
x=math.random(3,18)
y=math.random(29,39)
elseif DD==3 then --�м��ջ
x=math.random(17,31)
y=math.random(28,46)
elseif DD==9 then --������
x=math.random(20,35)
y=math.random(22,25)
elseif DD==19 then --������
x=math.random(14,24)
y=math.random(42,45)
elseif DD==20 then --�ٻ���
x=math.random(31,42)
y=math.random(16,30)
elseif DD==22 then --�����
x=math.random(14,30)
y=math.random(22,29)
elseif DD==23 then --�߹���
x=math.random(30,38)
y=math.random(18,28)
elseif DD==24 then --���˷��
x=math.random(26,36)
y=math.random(17,24)
elseif DD==28 then --������
x=math.random(14,18)
y=math.random(37,41)
elseif DD==30 then --ƽһָ��
x=math.random(14,18)
y=math.random(30,36)
elseif DD==32 then --ţ�Ҵ�
x=math.random(17,23)
y=math.random(30,38)
elseif DD==35 then --���޺�
x=math.random(16,24)
y=math.random(11,16)
elseif DD==36 then --�����
x=math.random(12,18)
y=math.random(26,32)
elseif DD==37 then --�嶾��
x=math.random(32,36)
y=math.random(14,21)
elseif DD==38 then --��ɽɽ´
x=math.random(15,21)
y=math.random(32,40)
elseif DD==40 then --����
x=math.random(29,35)
y=math.random(14,17)
elseif DD==41 then --����ɽ��
x=math.random(38,45)
y=math.random(15,19)
elseif DD==43 then --�䵱
x=math.random(28,35)
y=math.random(16,23)
elseif DD==44 then --������
x=math.random(29,34)
y=math.random(34,40)
elseif DD==47 then --һ�ƾ�
x=math.random(34,42)
y=math.random(17,25)
elseif DD==49 then --ҩ��ׯ
x=math.random(13,18)
y=math.random(19,33)
elseif DD==50 then --�ֻ���
x=math.random(19,27)
y=math.random(36,42)
elseif DD==53 then --�޹�ɽ
x=math.random(26,34)
y=math.random(26,30)
elseif DD==54 then --����ׯ
x=math.random(16,20)
y=math.random(16,22)
elseif DD==56 then --�����ھ�
x=math.random(20,33)
y=math.random(19,25)
elseif DD==59 then --������
x=math.random(22,28)
y=math.random(14,22)
elseif DD==60 then --���ſ�ջ
x=math.random(20,32)
y=math.random(29,38)
elseif DD==61 then --������ջ
x=math.random(23,32)
y=math.random(29,36)
elseif DD==62 then --����
x=math.random(15,22)
y=math.random(31,37)
elseif DD==63 then --������
x=math.random(32,40)
y=math.random(18,29)
elseif DD==64 then --�ﲮ���
x=math.random(18,30)
y=math.random(24,29)
elseif DD==65 then --��ʫɽ��
x=math.random(20,30)
y=math.random(14,20)
elseif DD==69 then --����Ժ
x=math.random(36,40)
y=math.random(14,27)
elseif DD==70 then --С��
x=math.random(24,32)
y=math.random(42,48)
elseif DD==73 then --���ߵ�
x=math.random(14,19)
y=math.random(32,45)
elseif DD==76 then --̨��
x=math.random(22,35)
y=math.random(14,19)
elseif DD==78 then --���ᵺ
x=math.random(22,32)
y=math.random(24,30)
elseif DD==80 then --��ɽ����
x=math.random(24,30)
y=math.random(15,23)
elseif DD==92 then --�츮
x=math.random(26,40)
y=math.random(11,16)
elseif DD==94 then --���ְ�
x=math.random(13,20)
y=math.random(28,36)
elseif DD==95 then --�󹤷�
x=math.random(23,37)
y=math.random(32,38)
elseif DD==96 then --���ɽ�
x=math.random(15,20)
y=math.random(23,30)
elseif DD==97 then --���̵�
x=math.random(16,20)
y=math.random(18,35)
elseif DD==98 then --��ϼ��
x=math.random(10,18)
y=math.random(18,29)
elseif DD==100 then --��̨ɽ
x=math.random(15,20)
y=math.random(21,40)
elseif DD==101 then --��ɽ��
x=math.random(36,40)
y=math.random(28,40)
elseif DD==103 then --ҩ����
x=math.random(28,38)
y=math.random(15,20)
elseif DD==105 then --����ũ��
x=math.random(15,28)
y=math.random(26,38)


end


--���ֵ�������ͼ��ս�����

if CX==60 then --	ŷ����
tt={3985,4109,3552,4135}
t1=tt[math.random(4)]
zdbh=264
elseif CX==184 then --������
t1=math.random(4552,4555)
zdbh=161
elseif CX==98 then --������
t1=math.random(4388,4391)
zdbh=191
elseif CX==150 then --������
t1=math.random(4442,4445)
zdbh=136
elseif CX==67 then --��ǧ��
t1=3052
zdbh=72
elseif CX==71 then --�����
tt={4106,3993,4131,4132}
t1=tt[math.random(4)]
zdbh=95
elseif CX==61 then --ŷ����
tt={3986,3986}
t1=tt[math.random(2)]
zdbh=178
elseif CX==4 then --�ֻ�
tt={4191,4192}
t1=tt[math.random(2)]
zdbh=370
elseif CX==31 then --������
t1=math.random(3023,3026)
zdbh=47
elseif CX==32 then --ͺ����
t1=math.random(3027,3030)
zdbh=47
elseif CX==33 then --�ڰ���
t1=math.random(3031,3033)
zdbh=47
elseif CX==34 then --���й�
t1=math.random(3035,3037)
zdbh=47
elseif CX==161 then --��Ī��
tt={3587,4204,4205,4206}
t1=tt[math.random(4)]
zdbh=52
elseif CX==419 then --����
t1=3112--math.random(3112,3112)
zdbh=66
elseif CX==190 then --ç�����
t1=3527--math.random(3527,3527)
zdbh=78
elseif CX==97 then --Ѫ������
t1=math.random(4372,4375)
zdbh=7
elseif CX==118 then --����ˮ
t1=math.random(4425,4428)
zdbh=333
elseif CX==103 then --�Ħ��
t1=math.random(4409,4412)
zdbh=100
elseif CX==26 then --������
t1=math.random(4508,4511)
zdbh=211
elseif CX==62 then --���ַ���
tt={4108,4005,3554,4154}
t1=tt[math.random(4)]
zdbh=114
elseif CX==27 then --��������
t1=math.random(4136,4139)
zdbh=57
elseif CX==18 then --����
t1=math.random(2648,2649)
zdbh=13

elseif CX==19 then --����Ⱥ
t1=math.random(2979,2982)
zdbh=107
elseif CX==22 then --������
tt={2617,2618,2973,2974}
t1=tt[math.random(4)]
zdbh=37

elseif CX==46 then --������
t1=2566
zdbh=86

elseif CX==603 then --����
t1=math.random(4764,4765)
zdbh=260

elseif CX==648 then --¹�ȿ�
t1=math.random(4632,4635)
zdbh=295

elseif CX==647 then --�ױ���
t1=math.random(4636,4639)
zdbh=295
elseif CX==616 then --����ֹ
t1=math.random(4355,4358)
zdbh=271
elseif CX==602 then --����
t1=4149
zdbh=259
elseif CX==595 then --����
t1=math.random(4488,4491)
zdbh=246
elseif CX==594 then --�䳤��
t1=2948
zdbh=247


end


end

if t1 == nil then
	t1 = 2948
end 

SetS(DD,x,y,3,168); 
--SetS(DD,x,y,2,5031*2);
SetS(DD,x,y,5,75);
SetS(92,60,14,5,DD);
SetS(92,60,16,5,CX);
SetS(92,60,17,5,zdbh);
SetS(92,60,18,5,x);
SetS(92,60,19,5,y);
instruct_3(DD,168,1,0,6800,0,0,t1*2,t1*2,t1*2,0,0,0);

end

newkdef[6800]=function()
--OEVENTLUA[6800] = function() 


local DD=GetS(92,60,14,5);
local CX=GetS(92,60,16,5);
local zdbh=GetS(92,60,17,5);
local x=GetS(92,60,18,5)
local y=GetS(92,60,19,5)
 SetS(DD,x,y,2,0); 
 SetS(DD,x,y,5,0);
 --say("���Ե�ͼID"..zdbh,0,1)
 
	if JY.Person[0]['�Ա�'] == 0 then
		say(string.format("��%s���������ˣ�����Сү��Ϊ���������������",JY.Person[CX]["����"]),0,1)
	else
		say(string.format("��%s���������ˣ����չ�������Ϊ���������������",JY.Person[CX]["����"]),0,1)	
	end	


    if CX==419  then
		TalkEx("�С������С�����",212,1)
		elseif CX==440 then
		TalkEx("�ɡ������ɡ�����",216,1)
		elseif CX==604 then
		TalkEx("����!!",316,1)
		elseif CX==606 then
		TalkEx("����!!",317,1)
		elseif CX==607 then
		TalkEx("����!!",322,1)
		elseif CX==603 then
		TalkEx("����!!",315,1)
		elseif CX==599 then
		say("����!!",160,1,"����")
		elseif CX==598 then
		say("����!!",140,1,"�ݳ���")
		else
		TalkEx("����!!",CX,1)
		end


if WarMain(zdbh)==true then
    SetS(92,60,27,5,1)
    instruct_13();
		if CX==419  then
		TalkEx("�㲻��������!���������ƣ�",212,1)
		TalkEx("��Ȼ���߾�������˵�˻��ˡ�",0,1)
		elseif CX==440 then
	    TalkEx("������ô�Դ�С����!���������ƣ�",216,1)
		TalkEx("��Ȼ�Ǹ�󡾫������˵�˻��ˡ�",0,1)
		elseif CX==604 then
		TalkEx("С��ͦ������!���������ƣ�",316,1)
		elseif CX==606 then
		TalkEx("С��ͦ������!���������ƣ�",317,1)
		elseif CX==607 then
		TalkEx("С��ͦ������!���������ƣ�",322,1)
	    elseif CX==603 then
		TalkEx("С��ͦ������!���������ƣ�",315,1)
		elseif CX==599 then
		say("С��ͦ������!���������ƣ�",160,1,"����")
		elseif CX==598 then
		say("С��ͦ������!���������ƣ�",140,1,"�ݳ���")
		else
		TalkEx("С��ͦ������!���������ƣ�",CX,1)
		end
			instruct_3(DD,168,0,0,0,0,0,0,0,0,0,0,0);
			local money=math.random(100,500)
			instruct_32(174,money); 
	    DrawStrBoxWaitKey(string.format("��������%s����ϲ�����%d�����ӣ�",JY.Person[CX]["����"],money),C_WHITE,CC.DefaultFont);
	  	JL()
	  	--[[local wg = {}
	  	for j = 1,JY.Base['�书����'] do
	  		if JY.Person[CX]['�书'..j] > 0 then
	  			wg[#wg+1] = JY.Person[CX]['�书'..j]
	  		end
	  	end
	  	if wg ~= nil and #wg > 0 then
	  		local n = wg[math.random(#wg)]
	  		for k = 0, JY.ThingNum-1 do	
	  			if JY.Thing[k]['�����书'] == n then
	  				instruct_2(k,1)
	  			end
	  		end
	  	end]]				
		else
	    instruct_13();
			
		if CX==419  then
	 	TalkEx("���߲��������㵱�������������������㹷����",212,1)
		TalkEx("��Ȼ���߾�������˵�˻��ˡ�",0,1)
		elseif CX==440 then
   	TalkEx("��󸲻�������㵱���Ǻ��������������㹷����",216,1)
		TalkEx("��Ȼ�Ǹ�󡾫������˵�˻��ˡ�",0,1)
		elseif CX==604 then
		 TalkEx("��֪����Ķ�����ɱ�������������ӵ��������������㹷����",316,1)
		elseif CX==606 then
		 TalkEx("��֪����Ķ�����ɱ�������������ӵ��������������㹷����",317,1)
		elseif CX==607 then
		 TalkEx("��֪����Ķ�����ɱ�������������ӵ��������������㹷����",322,1)
		elseif CX==603 then
		 TalkEx("��֪����Ķ�����ɱ�������������ӵ��������������㹷����",315,1)
		elseif CX==602 then
		say("��֪����Ķ�����ɱ�������������ӵ��������������㹷����",602,1,"����")
		elseif CX==599 then
		say("��֪����Ķ�����ɱ�������������ӵ��������������㹷����",160,1,"����")
		elseif CX==598 then
		say("��֪����Ķ�����ɱ�������������ӵ��������������㹷����",140,1,"�ݳ���")
		else
		 TalkEx("��֪����Ķ�����ɱ�������������ӵ��������������㹷����",CX,1)
		end
		
		
		
	 		instruct_3(DD,168,0,0,0,0,0,0,0,0,0,0,0);
		end
	 	SetS(92,60,20,5,1)	
    CC.Timer.status=1;
		CC.Timer.str=""
    CC.Timer.len=-99	
		SetS(92,60,12,5,0); 
    SetS(92,60,11,5,0);
    SetS(DD,x,y,3,-1);
end

function JL()--��������

local xm={"������","������","�Ṧ","ȭ�ƹ���","��������","�������","ˣ������"}
local sz={10,10,10,5,5,5,5}
local jl=math.random(7)


if GetS(92,60,27,5)==1 then
local jl2=math.random(1,sz[jl])
JY.Person[0][xm[jl]]=JY.Person[0][xm[jl]]+jl2
DrawStrBoxWaitKey(string.format("����%s��������%d",xm[jl],jl2),C_GOLD,CC.DefaultFont);

elseif GetS(92,60,27,5)==2 then
local jl3=math.random(10,20)
local rb={5,6,39,50,129,116,57,64,68,69,70,65,185,140,114,164}
local rw=rb[math.random(#rb)]

JY.Person[rw][xm[jl]]=JY.Person[rw][xm[jl]]+jl3
SetS(92,60,28,5,rw);
SetS(92,60,29,5,jl3);
SetS(92,60,30,5,jl);
end

SetS(92,60,27,5,0);

end



function Menu_GD()
local menu = {
{"������ʾ����", Menu_CGTS, 1}, 
{"������ʵ���", Menu_RWTJ, 1},
{"����ʱ�޵���", Menu_RWSX, 1},
} 
local r = ShowMenu(menu, #menu, 0, CC.MainSubMenuX+140, CC.MainSubMenuY, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE)
if r<=0 then
return 1
end
end

function Menu_CGTS()
local menu={{"��",nil,1},
            {"��",nil,1},}
if GetS(92,60,31,5)==0 then
menu[1][1]="����"
end	
if GetS(92,60,31,5)==1 then
menu[2][1]="�ء�"
end	
	
local r = ShowMenu(menu, #menu, 0, CC.MainSubMenuX+140, CC.MainSubMenuY+115, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE)				

if r==1 then
SetS(92,60,31,5,0);
SetS(92,60,26,5,0);
end
if r==2 then
SetS(92,60,31,5,1);
SetS(92,60,26,5,0);
end		
if r<=0 then
return 1
end			
end

function Menu_RWTJ()
local menu={{"��",nil,1},
            {"��",nil,1},
			{"��",nil,1},
			}
if GetS(92,60,32,5)==0 then
menu[1][1]="�͡�"
end	
if GetS(92,60,32,5)==1 then
menu[2][1]="�С�"
end	
if GetS(92,60,32,5)==2 then
menu[3][1]="�ߡ�"
end		
local r = ShowMenu(menu, #menu, 0, CC.MainSubMenuX+140, CC.MainSubMenuY+115, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE)				
if r==1 then
SetS(92,60,32,5,0);
end	
if r==2 then
SetS(92,60,32,5,1);
end	
if r==3 then
SetS(92,60,32,5,2);
end	
if r<=0 then
return 1
end
end

function Menu_RWSX()
local menu={{"�����",nil,1},
            {"�ķ���",nil,1},
			{"������",nil,1},
            {"������",nil,1},
			{"һ����",nil,1},
			}
if GetS(92,60,33,5)==0 then
menu[1][1]="����ӡ�"
end	
if GetS(92,60,33,5)==1 then
menu[2][1]="�ķ��ӡ�"
end	
if GetS(92,60,33,5)==2 then
menu[3][1]="�����ӡ�"
end	
if GetS(92,60,33,5)==3 then
menu[4][1]="�����ӡ�"
end	
if GetS(92,60,33,5)==4 then
menu[5][1]="һ���ӡ�"
end	

local r = ShowMenu(menu, #menu, 0, CC.MainSubMenuX+140, CC.MainSubMenuY+115, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE)				

if r==1 then
SetS(92,60,33,5,0);
end
if r==2 then
SetS(92,60,33,5,1);
end	
if r==3 then
SetS(92,60,33,5,2);
end
if r==4 then
SetS(92,60,33,5,3);
end	
if r==5 then
SetS(92,60,33,5,4);
end		
if r<=0 then
return 1
end			
end






