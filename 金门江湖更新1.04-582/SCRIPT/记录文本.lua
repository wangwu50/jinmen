主运内功 Curr_NG(id,152)
主运轻功 Curr_QG(id,186)
被动内功 PersonKF(id, 93)

if case == nil then
	if JY.Status ~= GAME_WMAP then
		DrawString(x1-size*5, y1 + h * (i)+2, "上下键换人 →键显示人物天赋 ESC退出", M_PaleTurquoise, size*0.7)
	else
		DrawString(x1-size*5, y1 + h * (i)+2, "上下键换人 →键显示人物天赋 ESC退出", Snow3, size*0.7)
	end
else
	DrawString(x1-size*5, y1 + h * (i)+2, "上下键选择属性 左右键减少/增加 回车键确认加点", Snow3, size*0.7)
end
--动画显示
		local diyx,diyy = CC.ThingPicWidth/2,CC.ThingPicHeight/2
		local m = 0
		local dl = 0
		for j=1,5 do
			if JY.Person[id]['出招动画帧数'..j]>0 then
				if j>1 then
					m=j
					break;
				end
				dl=dl+JY.Person[id]['出招动画帧数'..j]*4
			end
		end
        dl=dl+JY.Person[id]['出招动画帧数'..m]*3
		if dl then
			lib.PicLoadCache(101+p["头像代号"],(dl+AniFrame)*2,diyx/5+ax*2,diyy/4+ax*5+130) 	
		end
		
		AniFrame = AniFrame + 1
		if AniFrame == JY.Person[id]['出招动画帧数'..m] then
			AniFrame = 0
		end
				local kfmenu = {}
				local p = JY.Person[id]
			
			
				for i = 1 ,JY.Base["武功数量"] do
					local wugong1 = p["武功"..i]
					local thingid = 0
					
					if wugong1 > 0 then		
						local wgdj = {p["武功等级"..i]}
						local level = math.modf(p["武功等级" .. i]/ 100) + 1
						if p["武功等级" .. i] == 999 then
							level = 11
						end
									
						local wglx1 = JY.Wugong[wugong1]["武功类型"]	
						local wugongwl = get_skill_power(id, wugong1, level)
						for j = 0, JY.ThingNum - 1 do  --读取物品
							if JY.Thing[j]["练出武功"] >= 0 and JY.Thing[j]["练出武功"] == p["武功"..i] then											
								thingid = j
							end	
						end
						
						kfmenu[#kfmenu+1] ={JY.Wugong[wugong1]["名称"],nil,thingid}
					end
				
				end
				if	#kfmenu > 0 then
					--detailed_info(1)
					local nexty = CC.ScreenH/2-CC.DefaultFont*4 + CC.SingleLineHeight
					local clone_choice= ShowMenu(kfmenu, #kfmenu, 15, CC.MainSubMenuX-80, CC.MainSubMenuY, 0, 0, 1, 1, CC.DefaultFont*0.8, M_YellowGreen, C_WHITE)
					--say("武功数量"..#kfmenu,0,1)
					if clone_choice > 0 then
					detailed_info(kfmenu[clone_choice][3])
					end
					do return end
				end


detailed_info(cur_thing)
psx(id,'武功'..k)
lb[3][#lb[3]+1] ={ psx(id,'武功'..k),k}
PersonKF(id, 90) and PersonKF(id, 95)
","Ｗ◇
if PersonKF(pid, 252) and JLSD(0, 50, pid) then
		dng =  0
	end
--全真教	if MPPD(0) == 0 and JY.Person[0]["品德"] >= 80 and JY.Person[0]["内力最大值"] >= 5000 then
	JoinMP(0, 16, 2)
		
		MPAttrib(0)
		QZXS(CC.MPINFO2[16])
end
--昆仑派	if MPPD(0) == 0 and JY.Person[0]["御剑能力"] >= 300 and JY.Person[0]["内力最大值"] >= 5000 then
JoinMP(0, 19, 2)
		
		MPAttrib(0)
		QZXS(CC.MPINFO2[19])
end
--崆峒派	if MPPD(0) == 0 and JY.Person[0]["拳掌功夫"] >= 300 and JY.Person[0]["内力最大值"] >= 5000 then
	JoinMP(0, 18, 3)
		
		MPAttrib(0)
		QZXS(CC.MPINFO2[18])
	end
--武当派	if MPPD(0) == 0 and JY.Person[0]["品德"] >= 95 and JY.Person[0]["御剑能力"] >= 100 and JY.Person[0]["拳掌功夫"] >= 100 then
	JoinMP(0, 4, 4)
	
	MPAttrib(0)
	QZXS(CC.MPINFO2[4])
	--do return end
end	
--明教		if MPPD(0) == 0 and JY.Person[0]["耍刀技巧"] >= 200 and JY.Person[0]["内力最大值"] >= 4000 then
    JoinMP(0, 13, 4) 
		
		MPAttrib(0)
		QZXS(CC.MPINFO2[13])
    end
--古墓		if MPPD(0) == 0 and JY.Person[0]["品德"] >= 85 and JY.Person[0]["轻功"] >= 450 then
		JoinMP(0, 3, 2)
		
		MPAttrib(0)
		QZXS(CC.MPINFO2[3])
	    --do return end
    end		
--密宗		if MPPD(0) == 0 and JY.Person[0]["耍刀技巧"] >= 150 and JY.Person[0]["内力最大值"] >= 4500 then

	    JoinMP(0, 6, 2)
		
		MPAttrib(0)
		QZXS(CC.MPINFO2[6])
	end	
--大理		if MPPD(0) == 0 and JY.Person[0]["指法技巧"] >= 100 and JY.Person[0]["内力最大值"] >= 5000 then
	    JoinMP(0, 15, 1)
		
		MPAttrib(0)
		QZXS(CC.MPINFO2[15])

	end	
--峨嵋		if MPPD(0) == 0 and JY.Person[0]["品德"] >= 85 then 
			-- JoinMP(0, 17, 3)
	
	-- MPAttrib(0)
	-- QZXS(CC.MPINFO2[17])
	-- end

--桃花岛	if MPPD(0) == 0 and JY.Person[0]["资质"] >= 80 and JY.Person[0]["御剑能力"] >= 80 and JY.Person[0]["拳掌功夫"] >= 80 and JY.Person[0]["指法技巧"] >= 80 then
	    JoinMP(0, 10, 1)
		
				MPAttrib(0)
		QZXS(CC.MPINFO2[10])

	end	
--白驼山	if MPPD(0) == 0 and JY.Person[0]["用毒能力"] >= 100 and JY.Person[0]["内力最大值"] >= 3500 then 
		JoinMP(0, 8, 2)
		--instruct_2(82,1) --逆运真经
		
				MPAttrib(0)
		QZXS(CC.MPINFO2[8])
		
	end
--丐帮		if MPPD(0) == 0 and JY.Person[0]["品德"] >= 95 then
			JoinMP(0, 2, 2)
			instruct_2(351,1)	--擒龙功
			
					MPAttrib(0)
		QZXS(CC.MPINFO2[2])
		
		end	
--星宿派	if MPPD(0) == 0 and JY.Person[0]["品德"] <= 30 and JY.Person[0]["用毒能力"] >= 100 then 	
			JoinMP(0, 1, 2)
			instruct_2(66,1) --化功大法
			
					MPAttrib(0)
		QZXS(CC.MPINFO2[1])
			do return end
		end
--逍遥派	if MPPD(0) == 0 and JY.Person[0]["资质"] >= 80 then
	    JoinMP(0, 7, 2)
	    --instruct_2(317,1) --不老长春功
		
				MPAttrib(0)
		QZXS(CC.MPINFO2[7])
  
	end
--少林派	if MPPD(0) == 0 and JY.Person[0]["品德"] >= 90 then
	JoinMP(0, 5, 1)
	
			MPAttrib(0)
		QZXS(CC.MPINFO2[5])

end	
--五岳剑派	if MPPD(0) == 0 and JY.Person[0]["御剑能力"] >= 150 and JY.Person[0]["品德"] >= 70 then
	    JoinMP(0, 14, 2)
		
				MPAttrib(0)
		QZXS(CC.MPINFO2[14])

	end	
--日月神教	if MPPD(0) == 0 and JY.Person[0]["品德"] <= 30 and JY.Person[0]["内力最大值"] >= 4500 then
	JoinMP(0, 12, 4)
	instruct_2(65, 1) --吸星大法
	
			MPAttrib(0)
		QZXS(CC.MPINFO2[12])
	--do return end
end 



--中毒恢复
if WAR.PD['中毒恢复'][jqid]~=nil and WAR.PD['中毒恢复'][jqid] > 0 then
	local n = WAR.PD['中毒恢复'][jqid]
	if WAR.SSX_Counter == n then
		AddPersonAttrib(jqid,'受伤程度',-1)
	end
end
CurIDTXDH(WAR.CurID, 78,1,"越女剑仙.九霄仙息",C_ORANGE);

CC.TX["抱元守一"] == 1
['内伤恢复'] = {},
['冰封恢复'] = {},
['灼烧恢复'] = {},
['封穴恢复'] = {},
['中毒恢复'] = {},
['流血恢复'] = {},
['体力恢复'] = {},
['必连击'] = {},
['杀内力'] = {},
['增加气攻'] = {},
['必暴击'] = {},
['负面状态'] = {},
['必冰封'] = {},
['必灼烧'] = {},
['点燃'] = {},
['集气速度'] = {},
['闪避'] = {},

          
            ['梨花酒'] = {},
			['玉露酒'] = {},
            ['五宝花蜜酒'] = {},			
            ['即墨老酒'] = {},
            ['白云熊胆'] = {},
            ['天香续命'] = {},
            ['小还丹'] = {},
            ['黄连解毒'] = {},
            ['牛黄血蝎'] = {},
            ['六阳正气'] = {},

解毒能力
抗毒能力--陆菲青
攻击带毒
JLSD(10,35,eid)
--套装效果免疫反击
	if PDTZ(id,JY.Person[id]["武器"]) and JLSD(0, 30, id) then
		local n = JY.Person[id]["武器"]
		if Setmeal[n][5] == 9 then
			return true
		end
	end
inteam(personid) true 为我方  false 敌方
WAR.PD['醉八仙'][pid] ~= nil --醉八仙

WAR.PD['锁喉1'][pid]--锁喉
WAR.PD['三笑逍遥散'][pid]--三笑逍遥散
WAR.PD['魅惑状态'][pid]--魅惑状态
WAR.PD['以静制动1'][pid]--以静制动1
WAR.PD['以静制动2'][pid]--以静制动2
WAR.PD['以静制动3'][pid]--以静制动3迟缓状态
WAR.PD['迟缓状态'][pid]--迟缓状态 金刚不坏
WAR.PD['金刚不坏'][pid]
WAR.PD['血魔'][pid]--换血
WAR.PD['换血'][pid] --武骧金星
WAR.PD['万毒归元'][pid]--凌波微步闪避
WAR.PD['凌波微步闪避'][pid]--九花玉露
WAR.PD['九花玉露'][pid]
WAR.PD['神教逆杀'][pid]--神教逆杀
WAR.PD['冰冻状态'][pid]--冰冻状态
WAR.PD['冰冻状态'][pid]--冰冻状态
WAR.PD["利刃寒锋"][pid] --利刃寒锋
WAR.PD["混乱状态"][pid] = 1
WAR.PD["秘孔战术"][pid] 
WAR.PD["集气速度"][pid] --集气速度
WAR.PD['戳字决'][pid]--封穴
JY.Person[eid]["灼烧程度"]
--回魂仙梦
WAR.PD["回魂仙梦"][pid]
--封印
WAR.PD["封印"][pid]
--闪避
WAR.PD["闪避"][pid]
WAR.PD["虚弱状态"][pid] 
WAR.PD["集气速度"][pid]
WAR.PD["昆仑门派指令1"][pid]
WAR.PD["昆仑门派指令2"][pid]
WAR.PD["两倍攻击"][pid]
WAR.PD["明教指令1"][pid]
WAR.PD["明教指令2"][pid]
WAR.PD["明教指令3"][pid]
WAR.PD["明教指令4"][pid]
WAR.PD['必冰封'][pid] = 1
WAR.PD['必灼烧'][pid] = 1
WAR.PD['点燃'][pid] = 3


JY.Person[0]["攻击力"]=limitX(JY.Person[clone_choice]["攻击力"]/4,55,75)
JY.Person[0]["防御力"]=limitX(JY.Person[clone_choice]["防御力"]/4,55,75)
JY.Person[0]["轻功"]=limitX(JY.Person[clone_choice]["轻功"]/4,55,75)
--医疗用毒解毒最低30
JY.Person[0]["医疗能力"]=limitX(JY.Person[clone_choice]["医疗能力"],30)
JY.Person[0]["用毒能力"]=limitX(JY.Person[clone_choice]["用毒能力"],30)
JY.Person[0]["解毒能力"]=limitX(JY.Person[clone_choice]["解毒能力"],30)
JY.Person[0]["暗器技巧"]=limitX(JY.Person[clone_choice]["暗器技巧"],30)
JY.Person[0]["抗毒能力"]=JY.Person[clone_choice]["抗毒能力"]

JY.Person[0]["拳掌功夫"]=limitX(JY.Person[clone_choice]["拳掌功夫"],30,70)
JY.Person[0]["指法技巧"]=limitX(JY.Person[clone_choice]["指法技巧"],30,70)
JY.Person[0]["御剑能力"]=limitX(JY.Person[clone_choice]["御剑能力"],30,70)	
JY.Person[0]["耍刀技巧"]=limitX(JY.Person[clone_choice]["耍刀技巧"],30,70)
JY.Person[0]["特殊兵器"]=limitX(JY.Person[clone_choice]["特殊兵器"],30,70)
mptype = MPPD(pid)
if instruct_11() == false then  --是/否
	do return end  --无条件结束事件
	Cls()  --清屏

end
Cat('清除所有异常',WAR.CurID)
if DrawStrBoxYesNo(-1, -1, "要拜师吗？", C_WHITE, 30) == true then
	say("晚辈愿意。",0)
	Cls()  --清屏
	say("好！这些全真精要你看好了！", 64, 0)  --对话
	Cls()  --清屏	
	instruct_2(122,1) --全真剑法
	instruct_2(98, 1)  --得到空明拳
	JoinMP(0, 16, 2)
else
	say("小娃娃没眼光，不和你玩了！", 64, 0)  --对话
	Cls()  --清屏
end	
if WAR.Person[j]["我方"] ~= WAR.Person[WAR.CurID]["我方"] and WAR.Person[j]["死亡"] == false and match_ID(WAR.Person[j]["人物编号"],50) then
WAR.PD["混乱状态"][eid] = math.random(2,4)
			Set_Eff_Text(enemyid,3,"混乱")
			elseif DN==2 then
			WAR.PD["迟缓状态"][eid] = math.random(5,15)	
			Set_Eff_Text(enemyid,3,"迟缓")
			elseif DN==3 then
			WAR.PD["虚弱状态"][eid] = math.random(30,50)	
			Set_Eff_Text(enemyid,3,"虚弱")
			elseif DN==4 then
			WAR.PD["昏迷状态"][eid] = 1
			Set_Eff_Text(enemyid,3,"昏迷")
			elseif DN==5 then
			WAR.PD["散功状态"][eid] = math.random(35,55)
			Set_Eff_Text(enemyid,3,"散功")
			elseif DN==6 then
			WAR.PD["灵蛇拳"][eid] = math.random(20,40)
			Set_Eff_Text(enemyid,3,"迷茫")
			elseif DN==7 then
			WAR.PD["同归状态"][eid] = 1
			Set_Eff_Text(enemyid,3,"同归")
			elseif DN==8 then
			WAR.PD["无名业火"][eid] = math.random(25,45)
			Set_Eff_Text(enemyid,3,"业火")
			elseif DN==9 then
			WAR.PD["利刃寒锋"][eid] = math.random(5,10)
			Set_Eff_Text(enemyid,3,"冻结")
			elseif DN==10 then
			WAR.PD['创伤'][eid] = math.random(20,35)
			Set_Eff_Text(enemyid,3,"撕裂")
			elseif DN==11 then
			WAR.PD["盲目状态"][eid] = 2
			Set_Eff_Text(enemyid,3,"盲目")
			elseif DN==12 then
			WAR.PD["一空到底"][eid] = math.random(10,20)
			Set_Eff_Text(enemyid,3,"失智")
			elseif DN==13 then
			WAR.PD["冰冻状态"][eid] = math.random(5,15)	
			Set_Eff_Text(enemyid,3,"冰冻")
			elseif DN==14 then
			WAR.PD["恐惧状态"][eid] = 1	
			Set_Eff_Text(enemyid,3,"止戈")
			elseif DN==15 then
			WAR.PD["放下屠刀"][eid] = math.random(3,5)	
			Set_Eff_Text(enemyid,3,"佛系")
			elseif DN==16 then
			WAR.JHLY[eid] = math.random(10,25)	
			Set_Eff_Text(enemyid,3,"点燃")
















{"门派", War_MPMenu, WAR.OWN}
if MPPD(pid) == 0 then
		warmenu[9][3] = 0
	else
		local mptype = MPPD(pid)
		local mpdj = MPDJ(pid)
		if mpdj < 2 or JY.Person[pid]["体力"] <= 50 then
			warmenu[9][3] = 0
		end
		if mptype == 7 then
			if JY.Base["天书数量"] < 7 or hasthing(66) == false then
				warmenu[9][3] = 0
			end
		end
	end	



if MPPD(id) ~= 0 then
		    local mptype, mpdj = MPDISPLAY(id)
		    if mptype ~= nil then
                if MPPD(id) == 13 and match_ID(id,66) then
			        DrawString(x1 + size * 5+10 , y1 + h * (i)-160, "【".."波斯明教圣女".."】", M_Red, size*0.8)
			    elseif MPPD(id) == 13 and (id == 0 and JY.Base["畅想"] == 0) then
			        DrawString(x1 + size * 5+10 , y1 + h * (i)-160, "【".."明教代行使者".."】", C_GOLD, size*0.8)
				elseif MPPD(id) == 12 and match_ID(id,73) then
				    DrawString(x1 + size * 5+10 , y1 + h * (i)-160, "【".."日月神教圣姑".."】", M_Red, size*0.8)	
				elseif MPPD(id) == 12 and match_ID(id,26) then	
				    DrawString(x1 + size * 5+10 , y1 + h * (i)-160, "【".."日月神教前教主".."】", M_Red, size*0.8)	
				elseif MPPD(id) == 14 and match_ID(id,140) then	
				    DrawString(x1 + size * 5+10 , y1 + h * (i)-160, "【".."五岳剑派太上长老".."】", M_Red, size*0.8)		
				elseif MPPD(id) == 10 and match_ID(id,588) then	
				    DrawString(x1 + size * 5+10 , y1 + h * (i)-160, "【".."桃花岛主夫人".."】", M_Red, size*0.8)	
				elseif MPPD(id) == 5 and match_ID(id,577) then	
				    DrawString(x1 + size * 5+10 , y1 + h * (i)-160, "【".."少林祖师".."】", M_Red, size*0.8)	
				elseif MPPD(id) == 5 and match_ID(id,114) then	
				    DrawString(x1 + size * 5+10 , y1 + h * (i)-160, "【".."隐世高僧".."】", M_Red, size*0.8)				
			    else
			        DrawString(x1 + size * 5+10, y1 + h * (i)-160, "【"..mptype..mpdj.."】", M_DeepSkyBlue, size*0.8)
			    end
		    else
			    DrawString(x1 + size * 5+10, y1 + h * (i)-160, "【江湖人士】", C_ORANGE, size*0.8)
		    end
	    else
		    DrawString(x1 + size * 5+10, y1 + h * (i)-160, "【江湖人士】", C_ORANGE, size*0.8)
	  end



















--套装效果坐骑
	if PDTZ(id,JY.Person[id]["武器"]) then
		
		local n = JY.Person[id]["武器"]
		local m = Setmeal[n][6]
		if m == 1 or m == 6 or m == 7 then
			WAR.Person[i].TimeAdd = WAR.Person[i].TimeAdd + 6
		elseif m == 2 then
			WAR.Person[i].TimeAdd = WAR.Person[i].TimeAdd + 8
		elseif m == 3 or m == 5 then
			WAR.Person[i].TimeAdd = WAR.Person[i].TimeAdd + 4
		elseif m == 4 then
			WAR.Person[i].TimeAdd = WAR.Person[i].TimeAdd * 1.2
		end
			
	end




--套装效果抗封穴
	if PDTZ(eid,JY.Person[eid]["武器"]) then
		local n = JY.Person[eid]["武器"]
		if Setmeal[n][5] == 1 then
			fxsz = fxsz - math.random(5,10)
		end
		
	end

Ct['套装效果.挪移'] = function(i,bs,lx,auto)
	local nx,ny = nil,nil
	local id = WAR.Person[i]['人物编号']
	if lx == nil then 
		lx = 0
	end	
    local at = WAR.CurID
	--auto 自动
	if WAR.Person[i]['我方'] == false or WAR.AutoFight == 1 or auto == '自动' or WAR.ZDDH == 354 then 
		--say('1')
		local menu = {}
		local menu2 = {}
		War_CalMoveStep(i, bs, lx)
		local xi,yi = WAR.Person[i]['坐标X'],WAR.Person[i]['坐标Y']
		--记录所有可以移动的坐标
		for ix = limitX(xi-bs,0,xi),limitX(xi+bs,xi,62) do 
			for iy = limitX(yi-bs,0,yi), limitX(yi+bs,yi,62) do 
				if GetWarMap(ix, iy, 3) ~= 255 and GetWarMap(ix, iy, 2) < 0 and GetWarMap(ix, iy, 4) <= 0 then 
				   menu[#menu+1] = {ix,iy}
				end
			end 
		end
		--随机选择一个可以移动的坐标，记录当前坐标地图层2的数值，设定当前坐标
		if #menu > 0 then 
		   local a = math.random(#menu)
			nx = menu[a][1]
			ny = menu[a][2]
		end
	else 
		WAR.CurID = i
		War_CalMoveStep(i, bs, lx)
		while true do
			--WAR.Person[WAR.CurID]["移动步数"] = 2
			--War_CalMoveStep(WAR.CurID, WAR.Person[WAR.CurID]["移动步数"], 0)
			nx, ny = War_SelectMove() --显示+选择步数
			if nx ~= nil then
				if GetWarMap(nx, ny, 3) ~= 255 and GetWarMap(nx, ny, 2) < 0 then 
				   break
				end
			elseif nx == nil then 
				break
			end
		end
	end
    
	if nx ~= nil and ny ~= nil then 
	    PlayWavE(5)
        WAR.CurID = i
	    WarDrawMap(0)
	    CurIDTXDH(WAR.CurID, 89,1, "套装效果.挪移")
	    SetWarMap(WAR.Person[WAR.CurID]["坐标X"], WAR.Person[WAR.CurID]["坐标Y"], 5, -1)
	    SetWarMap(WAR.Person[WAR.CurID]["坐标X"], WAR.Person[WAR.CurID]["坐标Y"], 2, -1)
        SetWarMap(WAR.Person[WAR.CurID]["坐标X"], WAR.Person[WAR.CurID]["坐标Y"], 10, -1)
	    WarDrawMap(0)
	    WAR.Person[WAR.CurID]["坐标X"], WAR.Person[WAR.CurID]["坐标Y"] = nx, ny
	    SetWarMap(WAR.Person[WAR.CurID]["坐标X"], WAR.Person[WAR.CurID]["坐标Y"], 5, WAR.Person[WAR.CurID]["贴图"])
	    SetWarMap(WAR.Person[WAR.CurID]["坐标X"], WAR.Person[WAR.CurID]["坐标Y"], 2, WAR.CurID)
        SetWarMap(WAR.Person[WAR.CurID]["坐标X"], WAR.Person[WAR.CurID]["坐标Y"], 10, JY.Person[WAR.Person[WAR.CurID]["人物编号"]]['头像代号'])
	    CurIDTXDH(WAR.CurID, 89,1, "套装效果.挪移")
    end
    WAR.CurID = at
end  
