---------------------------------------------------------------------------------------------------------
-----------------------------------------可以在下面自行书写代码------------------------------------------
---------------------------------------------------------------------------------------------------------

--ShowMenu2 取消返回0
--JYMsgBox 取消返回负数
--InputNum 取消返回nil
--JY.Person[diyid]["武功11"] = 97
--JY.Person[diyid]["武功等级11"] = 900
--instruct_2(157,-1)
---[[
--WAR.JDYJ = {}
--WAR.JDYJ[0] = 1



local diyid = JY.Base["队伍" .. 1]
local function wupingisgongType(wuid,typeId)
	local ggid = JY.Thing[wuid]["练出武功"]
	if ggid < 0 then
		return false
	end
	return JY.Wugong[ggid]["武功类型"] == typeId
end


local nexty = CC.ScreenH/2-CC.DefaultFont*4 + CC.SingleLineHeight
--require("menu")
--dofile("menu")

local menu = {}
menu[1]={"洗天轻        ",nil,1}
menu[2]={"洗天外        ",nil,1}
menu[3]={"洗天内        ",nil,1}
menu[4]={"获得物品      ",nil,1}
menu[5]={"改变内属      ",nil,1}
menu[6]={"单项兵器加100点",nil,1}
menu[7]={"实战500       ",nil,1}
menu[8]={"全系兵器加100点 ",nil,1}
menu[9]={"任我行奖励    ",nil,1}
menu[10]={"设置攻防轻    ",nil,1}
menu[11]={"设置道德      ",nil,1}
menu[12]={"设置面板武功  ",nil,1}
menu[13]={"周伯通加20左右",nil,1}
menu[14]={"遗忘武功        ",nil,1}
menu[15]={"剧情物品秘笈装备",nil,1}
menu[16]={"全部武功到极  ",nil,1}
menu[17]={"加满血内      ",nil,1}
menu[18]={"改变资质      ",nil,1}
menu[19]={"血量翻倍      ",nil,1}
menu[20]={"学会武功      ",nil,1}
menu[21]={"获得金钱      ",nil,1}
menu[22]={"解锁互搏      ",nil,1}
menu[23]={"加入队友      ",nil,1}
menu[24]={"替换主角      ",nil,1}
menu[25]={"论剑奖励      ",nil,1}
menu[26]={"增加周目      ",nil,1}
menu[27]={"装备套装      ",nil,1}
menu[28]={"加入门派      ",nil,1}
menu[29]={"武学点数      ",nil,1}
menu[30]={"融合内功      ",nil,1}
menu[31]={"融合轻功      ",nil,1}
menu[32]={"遗忘天赋      ",nil,1}
menu[95]={"一键大成      ",nil,1}
menu[96]={"设置修为      ",nil,1}
menu[97]={"设置天赋      ",nil,1}
menu[98]={"测试战斗      ",nil,1}
menu[99]={"物品面板      ",nil,1}
menu[100]={"直接通关      ",nil,1}
local xuan = ShowMenu2(menu, #menu, 3, 7, CC.ScreenW/2-CC.DefaultFont*10-20, nexty, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE,"请选择你要的功能")
--JY.Person[usepersonid]["武学点数"]
--SetTF(id,TF[i],1)
-- for i = 0,#CC.TGJL do
		-- menu[#menu+1] = CC.TGJL[i]
	 -- end	
					-- local TF = {}
					-- local tfnum = Rnd(3)
					-- if tfnum < 1 then
						-- tfnum = 1 
					-- end	
					-- for i = 1,#CC.Tiangtf do							
						-- RandFetch(TF,tfnum,#CC.Tiangtf)
						-- SetTF(0,TF[i],1)
						-- break
					-- end
if xuan == 32 then
	Cat('遗忘天赋')
end
if xuan == 31 then
	Cat('融合武功',0,7)
end
if xuan == 30 then
	Cat('融合武功',0,6)
end	
if xuan==29 then
	--PersonStatus(1,1)
	JY.Person[523]["声望"] = JY.Person[523]["声望"] + 100
	JY.Person[524]["声望"] = JY.Person[524]["声望"] + 100
	JY.Person[525]["声望"] = JY.Person[525]["声望"] + 100
end
if xuan == 28 then
	--say("忘情天书"..CC.TX["忘情天书"],0,1)
	-- for i = 1,5 do	
		-- local n =math.random(100)
		-- say("门派位阶:"..JY.Person[n]["门派位阶"],0,1)			
	-- end
	--say("门派位阶:"..JY.Person[586]["门派"],0,1)	
	local mp = {
		{"星宿派", nil, 1, "毒鼎"},
		{"丐帮", nil, 1, "乞儿"},
		{"古墓派", nil, 1, "清心"},
		{"武当派", nil, 1, "侠义"},
		{"少林寺", nil, 1, "佛性"},
		{"密宗", nil, 1, "蛮夷"},	
		{"逍遥派", nil, 1, "自在"},	
		{"白驼山", nil, 1, "奇毒"}, --武骧金星：开放白驼山
		{"唐门", nil, 1, "诡道"}, --武骧金星：开放唐门
		{"桃花岛", nil, 1, "遁甲"}, --沼跃鱼：开放桃花岛
		{"一刀流", nil, 1, "破敌"}, --豸苗：开放一刀流	
		{"日月神教", nil, 1, "不败"}, --豸苗：开放日月神教
		{"明教", nil, 1, "焚影"}, --沼跃鱼：开放明教
		{"五岳剑派", nil, 1, "正气"},--沼跃鱼：开放五岳剑派
		{"大理", nil, 1, "皇龙"},--沼跃鱼：开放五岳剑派
		{"全真教", nil, 1, "长生"},--沼跃鱼：开放五岳剑派
		{"峨眉派", nil, 1, "太清"},--竹风雨滴：开放峨眉派
		{"崆峒派", nil, 1, "迥异"},--竹风雨滴：开放崆峒派
		{"昆仑派", nil, 1, "玉虚"},--竹风雨滴＆tony：开放昆仑派
		{"雪羽宗", nil, 1, "杨冰羽"},--竹风雨滴＆tony：开放昆仑派
		{"花涧派", nil, 1, "风流和尚"},--竹风雨滴＆tony：开放昆仑派
		{"中华阁", nil, 1, "风流和尚"},--竹风雨滴＆tony：开放昆仑派
		{"朝廷", nil, 1, "风流和尚"},--竹风雨滴＆tony：开放昆仑派
		{"夜雨楼", nil, 1, "风流和尚"},--竹风雨滴＆tony：开放昆仑派
		{"护龙山庄", nil, 1, "情报"},--竹风雨滴：开放护龙山庄
		{"云梦涧", nil, 1, "万花"},--竹风雨滴：云梦涧
		{"兽王庄", nil, 1, "兽尊"},--27观止：开放兽王庄
		{"青城派", nil, 1, "龙虎"},--28竹风雨滴：青城派
		{"五仙教", nil, 1, "五圣"},--29竹风雨滴：五仙教
		{"天机宫", nil, 1, "天机"},--30竹风雨滴：天机宫
	}
	local wj = {
		{"入门弟子", "高级弟子", "掌门"},--星宿
		{"五袋弟子", "八袋弟子", "长老", "前帮主"},--丐帮
		{"入门弟子", "高级弟子", "掌门"},--古墓
		{"入门弟子", "普通弟子", "高级弟子", "亲传弟子", "掌门"},--武当
		{"入门弟子", "普通弟子", "高级弟子", "掌院", "方丈"},--少林
		{"喇嘛", "僧正", "法王"},--密宗
		{"普通弟子", "中级弟子", "高级弟子", "长老", "掌门"}, --逍遥--鱼兄掌门5是用来领悟的，这个留着
		{"弟子", "少主", "庄主"},--白驼
		{"入门弟子", "内门弟子", "长老", "堡主"},--唐门
		{"记名弟子", "入室弟子", "岛主"},--桃花岛
		{"初级弟子", "中级弟子", "高级弟子", "宗主"},--一刀流
		{"教众", "长老", "护法", "副教主", "教主"},--日月
		{"普通弟子", "核心弟子", "四大法王", "光明使者", "教主"},--明教
		{"普通弟子", "亲传弟子", "长老", "掌门", "盟主","真传盟主"},--五岳剑派
		{"侍卫", "贵族", "皇族", "高僧"},--大理
		{"四代弟子", "三代弟子", "二代弟子", "太上长老", "掌教"}, --全真
		{"弟子", "掌门", "使者", "祖师"}, --峨眉
		{"入门弟子", "内门弟子", "堂主", "长老", "掌派"}, --崆峒
		{"普通弟子", "峰主", "掌门", "前代掌门", "太上长老"}, --昆仑
		{"试炼弟子", "羽卫", "羽长", "宗主"}, --雪羽宗20
		{"如烟", "如雾", "如尘", "花涧掌门"}, --花涧派21
		{"跑堂", "厨子", "账房", "掌柜","老板"}, --中华阁22
		{"兵卒", "百长", "翎卫", "将军","元帅"}, --朝廷23
		{"青级杀手", "赤级杀手", "玄级杀手", "副楼主","楼主"},
		{"侍卫", "档头", "密探", "军师", "庄主"},
		{"佳人", "名珠", "仙子", "仙姬"}, 
		{"万兽学徒", "万兽教头", "万兽尊者", "万兽之主"}, --兽王庄27
		{"弟子", "道长", "掌门", "天师"}, --兽王庄28
		{"弟子", "护法", "长老", "副教主","教主"}, --五毒教29
		{"弟子", "堂主", "长老", "宫主"}, --天机宫30
		
	}
	-- local clone_choice= ShowMenu(mp, #mp, 20, CC.MainSubMenuX-80, CC.MainSubMenuY, 0, 0, 1, 1, CC.DefaultFont, M_YellowGreen, C_WHITE)
	
	local clone_choice=ShowMenu2(mp, #mp, 5, 7, CC.ScreenW/2-CC.DefaultFont*10-20, nexty, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE,"请选需要加入的门派")
	-- say("门派"..clone_choice,0,1)
	local menu = {}
	for i = 1, #wj[clone_choice] do 
		menu[#menu+1]={wj[clone_choice][i], nil, 1}--竹风雨滴＆tony：开放昆仑派
	end
	local clone_choice1 = ShowMenu(menu, #menu, 22, CC.MainSubMenuX-80, CC.MainSubMenuY, 0, 0, 1, 1, CC.DefaultFont, M_YellowGreen, C_WHITE)
	if clone_choice == nil or clone_choice1 == nil then
		do return end
	elseif clone_choice > 0 then
		if MPPD(0) == 0 then
			JoinMP(0,clone_choice,clone_choice1)
			--JY.Person[0]["门派"] = clone_choice
			MPAttrib(0)
			QZXS(CC.MPINFO2[clone_choice])
		else
			if JY.Person[0]["门派"] == clone_choice then
				JoinMP(0,clone_choice,clone_choice1) 
			else
				MPAttrib(0,-1)
				JoinMP(0,clone_choice,clone_choice1)
				MPAttrib(0)
				QZXS(CC.MPINFO2[clone_choice])
			end	
		end	
		
		if clone_choice1 > 0 then
			JY.Person[0]["门派位阶"] = clone_choice1
		end
		--say("门派"..clone_choice1,0,1)
		--MPAttrib(0)
		
	else
		do return end
	end
end
if xuan == 97 then
	local nexty = CC.MainSubMenuY + CC.SingleLineHeight
	local p = SelectTeamMenu(CC.MainSubMenuX, nexty)
	-- local sj = JY.Base["周目"]
	-- local tftable={}
	local menu={}
	if p > 0 then
		local   diyid = JY.Base["队伍" .. p]

		--local menu1 ={9970,9971,9972,9973,9960,9959,9958,9957,9956}
		-- for k,v in pairs(CC.PTFSM) do 
			-- menu[#menu+1]={CC.PTFSM[v[k]][1].." | "..CC.PTFSM[v[k]][2],nil,k}
		-- end
		for k,v in pairs(CC.PTFSM) do
			menu[#menu+1]={CC.PTFSM[k][1].." | "..CC.PTFSM[k][2],nil,k}
		end
		local r = ShowMenu(menu, #menu, 18, CC.MainSubMenuX-80, CC.MainSubMenuY, 0, 0, 1, 1, CC.DefaultFont*0.8, C_RED, C_WHITE)
		--say("购买天赋"..p,0,1)
		if p==1 and r >0 then
			
			if CC.PTF[0][menu[r][3]] ~= 1 then
				--CC.TG[menu[r][3]] = 1
				SetTF(0,menu[r][3],1)
				--CC.PTF[0][menu[r][3]] = 1
			else
				do return end
			end	
			
			instruct_14()
			instruct_13()
		elseif p > 1 and r > 0 then
			--[[say("购买天赋"..menu[r][3],0,1)
			
			if instruct_31(20000) == false then  --判断银两数量
				say("你的钱似乎不够啊，这可不行，怎么能白嫖呢?",1055,0,"双儿")  --对话
				Cls()  --清屏
				do return end  --无条件结束事件

			end
			--say("购买天赋2"..r,0,1)
			CC.TX["购买天赋"]=1]]
			SetTF(diyid,menu[r][3],1)
			--instruct_2(174,-20000)
			instruct_14()
			instruct_13()
		else
			do return end
		end
	else
		do return end
	end
end				
if xuan==100 then
	-- for i = 0,#CC.Tiangtf do
		-- SetTF(0, 9977,1)
		-- --say("天关天赋"..CC.Tiangtf[i],0,1)
	-- end	
	--local TF = {}
	for i = 1,#CC.Tiangtf do							
		CC.TGJL[#CC.TGJL+1] = CC.Tiangtf[i]				
	end
	instruct_62()
end
if xuan==27 then
	-- local nexty = CC.MainSubMenuY + CC.SingleLineHeight
	-- local p = SelectTeamMenu(CC.MainSubMenuX, nexty)
    -- if p > 0 then
		-- diyid = JY.Base["队伍" .. p]
		-- JY.Person[diyid]["武学点数"]=500
		-- AddPersonAttrib(diyid, "物品修炼点数",60000)	
	-- end
	local nexty = CC.ScreenH/2-CC.DefaultFont*4 + CC.SingleLineHeight
		local p = SelectTeamMenu(CC.MainSubMenuX, nexty)
		local menu = {}
		--string.sub(ItemInfo[p["武器"]][3], 3 , 12)
		
		
		--local n=0
		if p > 0 then
			
			diyid = JY.Base["队伍" .. p]
			
			
			for i = 0, 129 do 
			menu[#menu+1]={string.sub(ItemInfo[548+i*3][3], 3 , 12)..Xguo[Setmeal[548+i*3][4]].."◆"..FJXguo[Setmeal[548+i*3][5]].."◆"..ZqXguo[Setmeal[548+i*3][6]],nil,548+i*3}
			end
		--local r = ShowMenu(menu, #menu, 18, CC.MainSubMenuX-80, CC.MainSubMenuY, 0, 0, 1, 1, CC.DefaultFont*0.7, C_RED, C_WHITE)
			local clone_choice= ShowMenu(menu, #menu, 22, CC.MainSubMenuX-80, CC.MainSubMenuY, 0, 0, 1, 1, CC.DefaultFont*0.8, M_YellowGreen, C_WHITE)
		
			
			JY.Person[diyid]["武器"] = menu[clone_choice][3]--金丝手套 Setmeal
			JY.Person[diyid]["防具"] = menu[clone_choice][3]+1--佛心甲
			JY.Person[diyid]["坐骑"] = menu[clone_choice][3]+2--白马
			-- JY.Thing[JY.Person[diyid]["武器"]]["装备等级"] = 6
			-- JY.Thing[JY.Person[diyid]["防具"]]["装备等级"] = 6
			-- JY.Thing[JY.Person[diyid]["坐骑"]]["装备等级"] = 6
		end
	
end



if xuan==25 then
	--local menu1 = {"周伯通","王重阳","林朝英","阿青","风清扬","东方不败","扫地僧","张三丰","阿凡提"}
	nexty=nexty+CC.SingleLineHeight;
    local menuzd = {}
	menuzd[1]={"周伯通  ",nil,1}
	menuzd[2]={"王重阳  ",nil,1}
	menuzd[3]={"林朝英  ",nil,1}
	menuzd[4]={"阿青  ",nil,1}
	menuzd[5]={"风清扬  ",nil,1}
	menuzd[6]={"东方不败    ",nil,1}
	menuzd[7]={"扫地僧    ",nil,1}
	menuzd[8]={"张三丰  ",nil,1}
	menuzd[9]={"阿凡提  ",nil,1}
	--menuzd[10]={"战葵花尊者  ",nil,1}	
	local zd = ShowMenu2(menuzd, #menuzd, 4, 7, CC.ScreenW/2-CC.DefaultFont*10-20, nexty, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE,"请选论剑奖励")
	
	if zd == 1 then
		DrawStrBoxWaitKey("特殊奖励：你的体内消耗永久降低了50% ", LimeGreen, 36,nil, C_GOLD)
				JY.Person[64]["论剑奖励"] = 1	
	elseif zd == 2 then
		DrawStrBoxWaitKey("特殊奖励：你的伤害量永久提高了20% ", LimeGreen, 36,nil, C_GOLD)
				JY.Person[129]["论剑奖励"] = 1
	elseif zd == 3 then
		DrawStrBoxWaitKey("特殊奖励：你的连击率永久提高了50% ", LimeGreen, 36,nil, C_GOLD)
				JY.Person[605]["论剑奖励"] = 1
	elseif zd == 4 then
		DrawStrBoxWaitKey("特殊奖励：你的气防永久提高了800点", LimeGreen, 36,nil, C_GOLD)
				JY.Person[604]["论剑奖励"] = 1
	elseif zd == 5 then
		if PersonKF(0, 47) then
					DrawStrBoxWaitKey("特殊奖励：你获得了独孤九剑的真传", LimeGreen, 36,nil, C_GOLD)
					JY.Person[592]["论剑奖励"] = 1
				else
					DrawStrBoxWaitKey("你似乎错过了一项奖励……", LimeGreen, 36,nil, C_GOLD)
				end
	elseif zd == 6 then
		DrawStrBoxWaitKey("特殊奖励：你的集气速度永久提高了8点", LimeGreen, 36,nil, C_GOLD)
				JY.Person[27]["论剑奖励"] = 1
	elseif zd == 7 then
		DrawStrBoxWaitKey("特殊奖励：你的武学常识提高了100点", LimeGreen, 36,nil, C_GOLD)
				JY.Person[114]["论剑奖励"] = 1
				AddPersonAttrib(0, "武学常识", 100)
	elseif zd == 8 then
	    DrawStrBoxWaitKey("特殊奖励：你的攻防轻和五系兵器值全面提高了", LimeGreen, 36,nil, C_GOLD)
				JY.Person[5]["论剑奖励"] = 1
				AddPersonAttrib(0, "攻击力", 30)
				AddPersonAttrib(0, "防御力", 30)
				AddPersonAttrib(0, "轻功", 30)
				AddPersonAttrib(0, "拳掌功夫", 20)
				AddPersonAttrib(0, "指法技巧", 20)
				AddPersonAttrib(0, "御剑能力", 20)
				AddPersonAttrib(0, "耍刀技巧", 20)
				AddPersonAttrib(0, "特殊兵器", 20)
		
		
		
	elseif zd == 9 then
		DrawStrBoxWaitKey("特殊奖励：你获得了绝对先手的能力", LimeGreen, 36,nil, C_GOLD)
				JY.Person[606]["论剑奖励"] = 1
	
	end
end




--instruct_33(personid,wugongid,flag)  学会武功
if xuan==26 then
	AddZM()
end



-- if xuan==24 then

-- QTJX(0)


-- end
if xuan==24 then
      	lib.LoadPNG(1, 1000 * 2 , 0 , 0, 1)
		--JY.PersonNum1=JY.PersonNum
--[[	    local menu = {}
		for i = 1, JY.PersonNum - 1 do
			menu[#menu + 1] = {JY.Person[i]["姓名"], nil, JY.Person[i]["畅想分阶"], i}
		end
		
		local clone_choice = ShowMenu3(menu,#menu,7,15,CC.MainMenuX+CC.Fontsmall*1-13,CC.MainMenuY+CC.Fontsmall*3+10,CC.Fontsmall, C_GOLD, C_WHITE)
		JY.Base["畅想"] = clone_choice
        JY.Person[0] = JY.Person[clone_choice]--]]
		local nexty = CC.ScreenH/2-CC.DefaultFont*4 + CC.SingleLineHeight
		local menu = {}
		for i = 1, JY.PersonNum - 1 do
			menu[#menu + 1] = {JY.Person[i]["姓名"], nil, JY.Person[i]["畅想分阶"], i}
		end
		local clone_choice= ShowMenu2(menu, #menu, 5, 15, CC.ScreenW/2-CC.DefaultFont*10-20, nexty-200, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE,"请选角色")
		JY.Base["畅想"] = clone_choice
        JY.Person[0] = JY.Person[clone_choice]
		if clone_choice == nil then 
			do return end
		end
        -- JY.Person[0]["代号"] = JY.Person[clone_choice]["代号"]
	-- JY.Person[0]["外号"] = JY.Person[clone_choice]["外号"]
        -- JY.Person[0]["特色指令"] = JY.Person[clone_choice]["特色指令"]
        -- JY.Person[0]["姓名"] = JY.Person[clone_choice]["姓名"]
        -- JY.Person[0]["性别"] = JY.Person[clone_choice]["性别"]
        -- for i=1,5 do
			-- JY.Person[0]["出招动画帧数" .. i]=JY.Person[clone_choice]["出招动画帧数" .. i]
			-- JY.Person[0]["出招动画延迟" .. i]=JY.Person[clone_choice]["出招动画延迟" .. i]
			-- JY.Person[0]["武功音效延迟" .. i]=JY.Person[clone_choice]["武功音效延迟" .. i]
		-- end
		-- --畅想攻防轻最低25
		-- JY.Person[0]["攻击力"]=limitX(JY.Person[clone_choice]["攻击力"]/4,25)
		-- JY.Person[0]["防御力"]=limitX(JY.Person[clone_choice]["防御力"]/4,25)
		-- JY.Person[0]["轻功"]=limitX(JY.Person[clone_choice]["轻功"]/4,25)
		-- --医疗用毒解毒最低30
		-- JY.Person[0]["医疗能力"]=limitX(JY.Person[clone_choice]["医疗能力"],30)
		-- JY.Person[0]["用毒能力"]=limitX(JY.Person[clone_choice]["用毒能力"],30)
		-- JY.Person[0]["解毒能力"]=limitX(JY.Person[clone_choice]["解毒能力"],30)

		-- JY.Person[0]["抗毒能力"]=JY.Person[clone_choice]["抗毒能力"]
		-- JY.Person[0]["拳掌功夫"]=JY.Person[clone_choice]["拳掌功夫"]
		-- JY.Person[0]["指法技巧"]=JY.Person[clone_choice]["指法技巧"]
		-- JY.Person[0]["御剑能力"]=JY.Person[clone_choice]["御剑能力"]
		-- JY.Person[0]["耍刀技巧"]=JY.Person[clone_choice]["耍刀技巧"]
		-- JY.Person[0]["特殊兵器"]=JY.Person[clone_choice]["特殊兵器"]
		-- --暗器技巧至少30
		-- JY.Person[0]["暗器技巧"]=limitX(JY.Person[clone_choice]["暗器技巧"],30)

		
		-- local wxcs=JY.Person[clone_choice]["武学常识"]-(JY.Base["周目"]-1)*20
		
		-- if wxcs>0 then
			-- JY.Person[0]["武学常识"]=JY.Person[clone_choice]["武学常识"]-(JY.Base["周目"]-1)*20
		-- else
			-- JY.Person[0]["武学常识"]=10
		-- end
		
		
		-- JY.Person[0]["攻击带毒"]=JY.Person[clone_choice]["攻击带毒"]
		-- JY.Person[0]["左右互搏"]=JY.Person[clone_choice]["左右互搏"]
	-- --修改武功数量
		-- for i=1,12 do
			-- JY.Person[0]["武功" .. i]=JY.Person[clone_choice]["武功" .. i]
			-- JY.Person[0]["武功等级" .. i]=JY.Person[clone_choice]["武功等级" .. i]
		-- end

		-- -- for i=1,4 do
			-- -- JY.Person[0]["携带物品" .. i]=JY.Person[clone_choice]["携带物品" .. i]
			-- -- JY.Person[0]["携带物品数量" .. i]=JY.Person[clone_choice]["携带物品数量" .. i]
		-- -- end
		
		-- for i=1,4 do
			-- JY.Person[0]["天赋外功"..i]=JY.Person[clone_choice]["天赋外功"..i]
		-- end
		
		-- JY.Person[0]["天赋内功"]=JY.Person[clone_choice]["天赋内功"]
		-- JY.Person[0]["天赋轻功"]=JY.Person[clone_choice]["天赋轻功"]
		-- JY.Person[0]["畅想分阶"]=JY.Person[clone_choice]["畅想分阶"]
		-- JY.Person[0]["外号2"]=JY.Person[clone_choice]["外号2"]
		-- JY.Person[0]["特色指令"] = JY.Person[clone_choice]["特色指令"]
		-- JY.Person[0]["等级"]=JY.Person[clone_choice]["等级"]




end

if xuan == 23 then
  --[[------ 木凭注释
	lib.LoadPNG(1, 1000 * 2 , 0 , 0, 1)
		--JY.PersonNum1=JY.PersonNum
	local menu = {}
	for i = 1, JY.PersonNum - 1 do
		menu[#menu + 1] = {JY.Person[i]["姓名"], nil, JY.Person[i]["畅想分阶"], i}
	end
	local clone_choice = ShowMenu3(menu,#menu,9,15,CC.MainMenuX+CC.Fontsmall*1-13,CC.MainMenuY+CC.Fontsmall*3+2,CC.Fontsmall, C_GOLD, C_WHITE)
	if clone_choice == 50 then clone_choice = 539 end
	instruct_10(clone_choice)
  ------]]--

  local nexty = CC.ScreenH/2-CC.DefaultFont*4 + CC.SingleLineHeight
  local menu = {}
  for i = 1, JY.PersonNum - 1 do
		menu[#menu + 1] = {JY.Person[i]["姓名"], nil, JY.Person[i]["畅想分阶"], i}
  end
  local clone_choice= ShowMenu2(menu, #menu, 5, 15, CC.ScreenW/2-CC.DefaultFont*10-20, nexty-200, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE,"请选角色")
  --Wugongjm(menu[clone_choice][3])
  if clone_choice == nil then 
    do return end
  end
	if clone_choice == 50 then clone_choice = 539 end
	instruct_10(clone_choice)
end



if xuan ==21 then
	instruct_2(174,30000)
	--AddZM()
	--JY.Base["周目"] =InputNum("选择周目", 1, 600,1);
end
if xuan ==22 then
	
	local nexty = CC.MainSubMenuY + CC.SingleLineHeight
	local p = SelectTeamMenu(CC.MainSubMenuX, nexty)
    if p > 0 then
		diyid = JY.Base["队伍" .. p]
		SetHuBo(diyid)
	end
	
	--instruct_2(174,30000)
	--AddZM()
	--JY.Base["周目"] =InputNum("选择周目", 1, 600,1);
end

if xuan == 5 then
	local nexty = CC.MainSubMenuY + CC.SingleLineHeight
	local p = SelectTeamMenu(CC.MainSubMenuX, nexty)
    if p > 0 then
		diyid = JY.Base["队伍" .. p]
		local r1 = JYMsgBox("请选择", "你想要转换的内力性质", {"阴性","阳性","调和","天罡"}, 4, 122,1)
		if r1 == 1 then
			JY.Person[diyid]["内力性质"] = 0
		elseif r1==2 then
			JY.Person[diyid]["内力性质"] = 1
		elseif r1==3 then
			JY.Person[diyid]["内力性质"] = 2
		elseif r1==4 then
			JY.Person[diyid]["内力性质"] = 3
		else
		end
	end
	
	
elseif xuan==6 then
	local r2 = JYMsgBox("请选择", "你对哪种类型的武功感兴趣？", {"拳法","指法","剑法","刀法","奇门",}, 5, 122,1)
	if r2 == 1 then
		AddPersonAttrib(diyid, "拳掌功夫", 100)
		DrawStrBoxWaitKey("你对拳掌功夫的理解提升了",C_GOLD,CC.DefaultFont,nil,LimeGreen)
		Cls()  --清屏
	elseif r2 == 2 then
		AddPersonAttrib(diyid, "指法技巧", 100)
		DrawStrBoxWaitKey("你对指法技巧的理解提升了",C_GOLD,CC.DefaultFont,nil,LimeGreen)
		Cls()  --清屏
	elseif r2 == 3 then
		AddPersonAttrib(diyid, "御剑能力", 100)
		DrawStrBoxWaitKey("你对御剑能力的理解提升了",C_GOLD,CC.DefaultFont,nil,LimeGreen)
		Cls()  --清屏
	elseif r2 == 4 then
		AddPersonAttrib(diyid, "耍刀技巧", 100)
		DrawStrBoxWaitKey("你对耍刀技巧的理解提升了",C_GOLD,CC.DefaultFont,nil,LimeGreen)
		Cls()  --清屏
	elseif r2 == 5 then
		AddPersonAttrib(diyid, "特殊兵器", 100)
		DrawStrBoxWaitKey("你对特殊兵器的理解提升了",C_GOLD,CC.DefaultFont,nil,LimeGreen)
		Cls()  --清屏
	end
	
elseif xuan==20 then

--开始

		local k = JY.Wugong;
	local menuwai = {}
	local menu  = {}
	
	local kftype = JYMsgBox("请选择", "请选择武功类型                ", {"拳法","指法","剑法","刀法","奇门","内功","轻功"}, 7, 347)
	
	for i = 1, JY.WugongNum - 1 do
		local kfname = k[i]["名称"]
		if string.len(kfname) == 8 then
			kfname = kfname.."  "
		elseif string.len(kfname) == 6 then
			kfname = kfname.."    "
		elseif string.len(kfname) == 4 then
			kfname = kfname.."      "
		end
		menuwai[i] = {kfname,nil,2}
		if k[i]["武功类型"] == kftype then
			menuwai[i][3] = 1
		end
	end
	local nexty = CC.ScreenH/2-CC.DefaultFont*4 + CC.SingleLineHeight
	local r = ShowMenu2(menuwai, #menuwai, 3, 9, CC.ScreenW/2-CC.DefaultFont*10-20, nexty, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE,"选择武功")
	if r == 0 then
		return
	end
	
	local nexty = CC.MainSubMenuY + CC.SingleLineHeight
	local p = SelectTeamMenu(CC.MainSubMenuX, nexty)
	diyid = JY.Base["队伍" .. p]
	
	--[[if CC.Kungfunum>=12 then
		return
	end --]]
	instruct_33(diyid,r,CC.Kungfunum)
	
	
	--[[for j = 1, CC.Kungfunum do
        if JY.Person[diyid]["武功"..j] > 0 then
            local wg = JY.Person[diyid]["武功"..j]
            menu[#menu+1] = {JY.Wugong[wg]["名称"], nil, 1, wg, j}
			--instruct_33(diyid,r,j+1)
			--break()
        end
	end--]]
	
	--[[if CC.Kungfunum<=11 then
		
		instruct_33(diyid,r,CC.Kungfunum+1)
	end --]]
	
	
	
	
	
	--[[local geizi = ShowMenu2(menu, #menu, 3,10, CC.MainSubMenuX, CC.MainSubMenuY, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE)
	if geizi < 0 then
		return
	end--]]
	--[[if r > 0 then
		
		--开始
		--local nexty = CC.MainSubMenuY + CC.SingleLineHeight
	--local p = SelectTeamMenu(CC.MainSubMenuX, nexty)
    if p > 0 then
		--diyid = JY.Base["队伍" .. p]
		--SetTianWai(diyid, tianwai, r)
		instruct_33(diyid,r,geizi+1)
		
	end
		
		
		--结束
		--JY.Person[diyid]["武功"..geizi] = r
		--JY.Person[diyid]["武功等级"..geizi] = 999
	end--]]

--结束






elseif xuan == 2 then
	local k = JY.Wugong;
	local menuwai = {}
	
	local kftype = JYMsgBox("请选择", "请选择喜欢的天赋外功类型", {"拳法","指法","剑法","刀法","奇门"}, 5, 347)
	
	for i = 1, JY.WugongNum - 1 do
		local kfname = k[i]["名称"]
		if string.len(kfname) == 8 then
			kfname = kfname.."  "
		elseif string.len(kfname) == 6 then
			kfname = kfname.."    "
		elseif string.len(kfname) == 4 then
			kfname = kfname.."      "
		end
		menuwai[i] = {kfname,nil,2}
		if k[i]["武功类型"] == kftype then
			menuwai[i][3] = 1
		end
	end
	local nexty = CC.ScreenH/2-CC.DefaultFont*4 + CC.SingleLineHeight
	local r = ShowMenu2(menuwai, #menuwai, 3, 9, CC.ScreenW/2-CC.DefaultFont*10-20, nexty, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE,"领悟天赋外功")
	if r == 0 then
		return
	end
	
	local tianwai = JYMsgBox("请选择", "洗第几个天赋外功？", {"天外1","天外2"}, 2, 347,1)
	if tianwai < 0 then
		return
	end
	if r > 0 then
		--开始
		local nexty = CC.MainSubMenuY + CC.SingleLineHeight
	local p = SelectTeamMenu(CC.MainSubMenuX, nexty)
    if p > 0 then
		diyid = JY.Base["队伍" .. p]
		SetTianWai(diyid, tianwai, r)
		
	end
		
		
		--结束
		--SetTianWai(0, tianwai, r)
	end
	
	
elseif xuan == 3 then
	local k = JY.Wugong;
	local menunei = {}
	for i = 1, JY.WugongNum - 1 do
		local kfname = k[i]["名称"]
		if string.len(kfname) == 8 then
			kfname = kfname.."  "
		elseif string.len(kfname) == 6 then
			kfname = kfname.."    "
		elseif string.len(kfname) == 4 then
			kfname = kfname.."      "
		end
		menunei[i] = {kfname,nil,2}
		if k[i]["武功类型"] == 6 then
			menunei[i][3] = 1
		end
	end
	local nexty = CC.ScreenH/2-CC.DefaultFont*4 + CC.SingleLineHeight
	local r = ShowMenu2(menunei, #menunei, 3, 9, CC.ScreenW/2-CC.DefaultFont*10-20, nexty, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE,"领悟天赋内功")
	if r > 0 then
		--开始
		local nexty = CC.MainSubMenuY + CC.SingleLineHeight
	local p = SelectTeamMenu(CC.MainSubMenuX, nexty)
    if p > 0 then
		diyid = JY.Base["队伍" .. p]
		SetTianNei(diyid, r)
		
	end
		
		--结束
		--SetTianNei(0, r)
	end
	
	
elseif xuan == 1 then
	local k = JY.Wugong;
	local menuqing = {}
	for i = 1, JY.WugongNum - 1 do
		local kfname = k[i]["名称"]
		if string.len(kfname) == 8 then
			kfname = kfname.."  "
		elseif string.len(kfname) == 6 then
			kfname = kfname.."    "
		elseif string.len(kfname) == 4 then
			kfname = kfname.."      "
		end
		menuqing[i] = {kfname,nil,2}
		if k[i]["武功类型"] == 7 then
			menuqing[i][3] = 1
		end
		
	end
	local nexty = CC.ScreenH/2-CC.DefaultFont*4 + CC.SingleLineHeight
	local r = ShowMenu2(menuqing, #menuqing, 3, 9, CC.ScreenW/2-CC.DefaultFont*10-20, nexty, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE,"领悟天赋轻功")
	
	if r > 0 then
		
		--开始
	local nexty = CC.MainSubMenuY + CC.SingleLineHeight
	local p = SelectTeamMenu(CC.MainSubMenuX, nexty)
    if p > 0 then
		diyid = JY.Base["队伍" .. p]
		
		SetTianQing(diyid, r)
	end
		
		
		--结束
		--SetTianQing(0, r)
	end
	
	
elseif xuan == 4 then
	local k = JY.Thing;
	local ceshi = {}
	local wutype = JYMsgBox("请选择", "物品类型                                       ", {"剧情物品","神兵宝甲","武功秘籍","灵丹妙药","伤人暗器"}, 5, 347,1)
	if wutype < 0  then
		return
	end
	local gongtype = 0
	if wutype-1 == 2 then
		gongtype = JYMsgBox("请选择", "请选择秘籍类型                    ", {"拳法","指法","剑法","刀法","奇门","内功","轻功","杂类"}, 8, 347)
		if gongtype < 0 then
			return
		end
	end
	for i = 0, JY.ThingNum - 1 do
		local kfname = k[i]["名称"]
		if string.len(kfname) == 8 then
			kfname = kfname.."  "
		elseif string.len(kfname) == 6 then
			kfname = kfname.."    "
		elseif string.len(kfname) == 4 then
			kfname = kfname.."      "
		end
		ceshi[i] = {kfname..k[i]["类型"]..i,nil,2}
		if k[i]["类型"] == wutype-1 then
			ceshi[i][3] = 1
			if wutype-1 == 2 and wupingisgongType(i,gongtype)~=true then
				ceshi[i][3] = 2
			end
			if wutype-1 == 2 and JY.Thing[i]["练出武功"] < 0 and gongtype == 8 then
				ceshi[i][3] = 1
			end
		end
		
	end
	local nexty = CC.ScreenH/2-CC.DefaultFont*4 + CC.SingleLineHeight
	local r = 0
	r = ShowMenu2(ceshi, #ceshi, 3, 9, CC.ScreenW/2-CC.DefaultFont*10-20, nexty, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE,"请选择")
	if r == 0 then
		return
	end
	if wutype-1 == 3 or r == 174 or wutype-1 == 4 then
		local nnnum = InputNum(JY.Thing[r]["名称"], 1, 30000,1)
		if nnnum == nil or nnnum <= 0 then
			return
		end
		instruct_2(r,nnnum)
		return
	end
	instruct_2(r,1)
	
	
elseif xuan == 7 then
	DrawStrBoxWaitKey("特殊奖励：主角实战500", C_RED, CC.DefaultFont,nil,C_GOLD)
	JY.Person[diyid]["实战"] = 500
	
	
elseif xuan == 8 then
	local nexty = CC.MainSubMenuY + CC.SingleLineHeight
	local p = SelectTeamMenu(CC.MainSubMenuX, nexty)
    if p > 0 then
		diyid = JY.Base["队伍" .. p]
		DrawStrBoxWaitKey("特殊奖励：五系兵器值提升百点", C_RED, CC.DefaultFont,nil,C_GOLD)
		AddPersonAttrib(diyid, "拳掌功夫", 100)
		AddPersonAttrib(diyid, "指法技巧", 100)
		AddPersonAttrib(diyid, "御剑能力", 100)
		AddPersonAttrib(diyid, "耍刀技巧", 100)
		AddPersonAttrib(diyid, "特殊兵器", 100)
	end
	
	
elseif xuan==9 then
	local nexty = CC.MainSubMenuY + CC.SingleLineHeight
	local p = SelectTeamMenu(CC.MainSubMenuX, nexty)
    if p > 0 then
		diyid = JY.Base["队伍" .. p]
		JY.Person[diyid]["攻击力"] = JY.Person[diyid]["攻击力"]+100
		JY.Person[diyid]["防御力"] = JY.Person[diyid]["防御力"]+100
		JY.Person[diyid]["轻功"] = JY.Person[diyid]["轻功"]+100
		DrawStrBoxWaitKey("攻防轻各提升百点", C_RED, CC.DefaultFont,nil,C_GOLD)
		--awakening(diyid,1)
	end
	
	
elseif xuan==10 then
	local nexty = CC.MainSubMenuY + CC.SingleLineHeight
	local p = SelectTeamMenu(CC.MainSubMenuX, nexty)
    if p > 0 then
		diyid = JY.Base["队伍" .. p]
	end
	local shux = JYMsgBox("请选择", "设置哪个属性？          ", {"攻击力","防御力","轻功"}, 3, 347,1)
	if shux < 0  then
		return
	end
	local nnnum = InputNum("请输入数值", 1, 1000,1)
	if nnnum == nil or nnnum <= 0 then
		return
	end
	local temp_shu = {"攻击力","防御力","轻功"}
	local temp_s = temp_shu[shux]
	JY.Person[diyid][temp_s] = nnnum
	
	
elseif xuan ==11 then
	local nnnum = InputNum("请输入数值", 1, 120,1)
	if nnnum == nil or nnnum <= 0 then
		return
	end
	JY.Person[0]["品德"] = nnnum
	
	
elseif xuan ==12 then
	local k = JY.Wugong;
	local menuwai = {}
	local menu  = {}
	
	local kftype = JYMsgBox("请选择", "请选择武功类型                ", {"拳法","指法","剑法","刀法","奇门","内功","轻功"}, 7, 347)
	
	for i = 1, JY.WugongNum - 1 do
		local kfname = k[i]["名称"]
		if string.len(kfname) == 8 then
			kfname = kfname.."  "
		elseif string.len(kfname) == 6 then
			kfname = kfname.."    "
		elseif string.len(kfname) == 4 then
			kfname = kfname.."      "
		end
		menuwai[i] = {kfname,nil,2}
		if k[i]["武功类型"] == kftype then
			menuwai[i][3] = 1
		end
	end
	local nexty = CC.ScreenH/2-CC.DefaultFont*4 + CC.SingleLineHeight
	local r = ShowMenu2(menuwai, #menuwai, 3, 9, CC.ScreenW/2-CC.DefaultFont*10-20, nexty, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE,"选择武功")
	if r == 0 then
		return
	end
	
	
	local nexty = CC.MainSubMenuY + CC.SingleLineHeight
	local p = SelectTeamMenu(CC.MainSubMenuX, nexty)
	diyid = JY.Base["队伍" .. p]
	
	
	for j = 1, CC.Kungfunum do
        if JY.Person[diyid]["武功"..j] > 0 then
            local wg = JY.Person[diyid]["武功"..j]
            menu[#menu+1] = {JY.Wugong[wg]["名称"], nil, 1, wg, j}
        end
	end   
	local geizi = ShowMenu2(menu, #menu, 3,10, CC.MainSubMenuX, CC.MainSubMenuY, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE)
	if geizi < 0 then
		return
	end
	if r > 0 then
		JY.Person[diyid]["武功"..geizi] = r
		JY.Person[diyid]["武功等级"..geizi] = 999
	end
	
	
elseif xuan == 13 then
	DrawStrBoxWaitKey("你的左右互搏几率永久提高了20%,多次无用", LimeGreen, 36,nil, C_GOLD)
	JY.Person[64]["品德"] = 80
	
	
elseif xuan == 14 then	
	 Cls()
        local nexty = CC.MainSubMenuY + CC.SingleLineHeight
        local p = SelectTeamMenu(CC.MainSubMenuX, nexty)
        if p > 0 then
                local pid = JY.Base["队伍" .. p]
                local menu = {}
                for i = 1, CC.Kungfunum do
                        if JY.Person[pid]["武功"..i] > 0 then
                                local wg = JY.Person[pid]["武功"..i]
                                menu[#menu+1] = {JY.Wugong[wg]["名称"], nil, 1, wg, i}
                        end
                end        
                Cls()
                local r = ShowMenu2(menu, #menu, 3,10, CC.MainSubMenuX, CC.MainSubMenuY, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE)
				local jjj = 1
				if match_ID(pid,56) or match_ID(pid,77) then
					jjj = 2
				end 
                if r > 0 then
                        local thingid = -1
                        for i = 0, JY.ThingNum - 1 do
                                if JY.Thing[i]["练出武功"] > 0 and JY.Thing[i]["练出武功"] == menu[r][4] then
                                        thingid = i
                                        local level = math.modf(JY.Person[pid]["武功等级" .. menu[r][5]] / 100) + 1
                                        AddPersonAttrib(pid, "生命最大值", -JY.Thing[thingid]["加生命最大值"] * level)
                                        AddPersonAttrib(pid, "内力最大值", -JY.Thing[thingid]["加内力最大值"] * level)
                                        AddPersonAttrib(pid, "攻击力", -JY.Thing[thingid]["加攻击力"] * level)
                                        AddPersonAttrib(pid, "轻功", -JY.Thing[thingid]["加轻功"] * level)
                                        AddPersonAttrib(pid, "防御力", -JY.Thing[thingid]["加防御力"] * level)        
                                        AddPersonAttrib(pid, "医疗能力", -JY.Thing[thingid]["加医疗能力"] * jjj * level)
                                        AddPersonAttrib(pid, "用毒能力", -JY.Thing[thingid]["加用毒能力"] * jjj * level)
                                        AddPersonAttrib(pid, "解毒能力", -JY.Thing[thingid]["加解毒能力"] * jjj * level)
                                        AddPersonAttrib(pid, "抗毒能力", -JY.Thing[thingid]["加抗毒能力"] * jjj * level)
                                        AddPersonAttrib(pid, "拳掌功夫", -JY.Thing[thingid]["加拳掌功夫"] * jjj * level)
										AddPersonAttrib(pid, "指法技巧", -JY.Thing[thingid]["加指法技巧"] * jjj * level)
                                        AddPersonAttrib(pid, "御剑能力", -JY.Thing[thingid]["加御剑能力"] * jjj * level)
                                        AddPersonAttrib(pid, "耍刀技巧", -JY.Thing[thingid]["加耍刀技巧"] * jjj * level)
                                        AddPersonAttrib(pid, "特殊兵器", -JY.Thing[thingid]["加特殊兵器"] * jjj * level)
										AddPersonAttrib(pid, "暗器技巧", -JY.Thing[thingid]["加暗器技巧"] * jjj * level)
                                        AddPersonAttrib(pid, "武学常识", -JY.Thing[thingid]["加武学常识"] * jjj * level)     										
                                        break
                                end
                        end
                        for i = menu[r][5], #menu - 1 do
                                JY.Person[pid]["武功"..i] = JY.Person[pid]["武功"..i+1]
                                JY.Person[pid]["武功等级"..i] = JY.Person[pid]["武功等级"..i+1]
                        end
                        JY.Person[pid]["武功"..#menu] = 0
                        JY.Person[pid]["武功等级"..#menu] = 0
                        QZXS(JY.Person[pid]["姓名"].."已经洗掉"..menu[r][1])
                end
        end
	
elseif xuan == 15 then
	for id = 0,JY.ThingNum - 1 do
        if JY.Thing[id]["类型"] == 1 or JY.Thing[id]["类型"] == 2 or JY.Thing[id]["类型"] == 0 then
				if not instruct_18(id) then
                        instruct_32(id,1)
                end
        end
	end	

   
elseif xuan == 16 then	
	local nexty = CC.MainSubMenuY + CC.SingleLineHeight
	local p = SelectTeamMenu(CC.MainSubMenuX, nexty)
    if p > 0 then
        diyid = JY.Base["队伍" .. p]
		for i = 1, CC.Kungfunum do
			if JY.Person[diyid]["武功等级"..i] <=900 then
				JY.Person[diyid]["武功等级"..i] = 999
			end
		end
	end
	
elseif xuan == 17 then
    for i=1,CC.TeamNum do
		if JY.Base["队伍" .. i]>= 0 then
			diyid = JY.Base["队伍" .. i]
		end
		AddPersonAttrib(diyid, "生命最大值", 999)
		AddPersonAttrib(diyid, "内力最大值", 9999)
		JY.Person[diyid]["生命"] = JY.Person[diyid]["生命最大值"]
		JY.Person[diyid]["内力"] = JY.Person[diyid]["内力最大值"]
	end	
	DrawStrBoxWaitKey("特殊奖励：加满生命内力最大值", C_RED, CC.DefaultFont,nil,C_GOLD)
	
elseif xuan == 18 then
	local nexty = CC.MainSubMenuY + CC.SingleLineHeight
	local p = SelectTeamMenu(CC.MainSubMenuX, nexty)
    if p > 0 then
		diyid = JY.Base["队伍" .. p]
		local nnnum = InputNum("请输入资质", 1, 100,1)
		if nnnum == nil or nnnum <= 0 then
			return
		end
		JY.Person[diyid]["资质"] = nnnum
	end	
elseif xuan == 95 then
	--JY.Person[0]['武功1'] = 377
	--JY.Person[0]['武功等级1'] = 999
	--JoinMP(0,14,6)
	JY.Person[0]['武学常识'] = 500
	JY.Person[0]['实战'] = 500
	--JY.Person[0]['主运内功'] = 102
	--JY.Person[0]['门派技能1'] = 108
	JY.Person[0]['生命增长'] = 15
	AddPersonAttrib(0, "拳掌功夫", 500)
	AddPersonAttrib(0, "指法技巧", 500)
	AddPersonAttrib(0, "御剑能力", 500)
	AddPersonAttrib(0, "耍刀技巧", 500)
	AddPersonAttrib(0, "特殊兵器", 500)
	AddPersonAttrib(0, "攻击力", 500)
	AddPersonAttrib(0, "轻功", 500)
	AddPersonAttrib(0, "防御力", 500) 
	--JY.Person[0]['武功2'] = 175
	--JY.Person[0]['武功等级2'] = 999
	JY.Person[0]['畅想分阶'] = 0
	--JY.Person[0]['主运轻功'] = 262
	if JY.Person[0]['门派技能1'] < 1 then
		JY.Person[0]['门派技能1'] = 1
	end
	SetJX(0,1)
	AddPersonAttrib(0,"内力最大值",10000)
	AddPersonAttrib(0,"内力",psx(0,"内力最大值"))
	if JY.Person[0]['资质'] >= 80 then
		JY.Person[0]['门派技能3'] = 2
	elseif JY.Person[0]['资质'] <= 30 then
		JY.Person[0]['左右互搏'] = 2
	else
		JY.Person[0]['中庸'] = 3
	end		
	Hp_Max(0)
elseif xuan == 96 then
	local nexty = CC.MainSubMenuY + CC.SingleLineHeight
	local p = SelectTeamMenu(CC.MainSubMenuX, nexty)
    if p > 0 then
		diyid = JY.Base["队伍" .. p]
		local nnnum = InputNum("请输入阶级编号", 0, 7,0)
		if nnnum == nil  then--or nnnum <= 0
			return
		end
		JY.Person[diyid]["畅想分阶"] = nnnum
	end		
	
elseif xuan == 19 then
	local nexty = CC.MainSubMenuY + CC.SingleLineHeight
	local p = SelectTeamMenu(CC.MainSubMenuX, nexty)
    if p > 0 then
		diyid = JY.Base["队伍" .. p]
		local nnnum = InputNum("请输入血量翻倍", 1, 30,1)
		if nnnum == nil or nnnum <= 0 then
			return
		end
		JY.Person[diyid]["血量翻倍"] = nnnum
	end	
	
	
elseif xuan == 98 then
	nexty=nexty+CC.SingleLineHeight;
    local menuzd = {}
	menuzd[1]={"战十五邪  ",nil,1}
	menuzd[2]={"战十五正  ",nil,1}
	menuzd[3]={"战二十大  ",nil,1}
	menuzd[4]={"战独孤求败  ",nil,1}
	menuzd[5]={"战萧远山  ",nil,1}
	menuzd[6]={"战蒙哥    ",nil,1}
	menuzd[7]={"战三渡    ",nil,1}
	menuzd[8]={"战石破天  ",nil,1}
	menuzd[9]={"战欧阳峰  ",nil,1}
	menuzd[10]={"战葵花尊者  ",nil,1}	
	local zd = ShowMenu2(menuzd, #menuzd, 4, 7, CC.ScreenW/2-CC.DefaultFont*10-20, nexty, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE,"请选择战斗")
	
	if zd == 1 then
		WarMain(133, 0)	
	elseif zd == 2 then
		WarMain(134, 0)	
	elseif zd == 3 then
		WarMain(289, 0)	
	elseif zd == 4 then
		WarMain(239, 0)
	elseif zd == 5 then
		WarMain(248, 0)
	elseif zd == 6 then
		WarMain(278, 0)
	elseif zd == 7 then
		WarMain(253, 0)
	elseif zd == 8 then
	    WarMain(170, 0)
		
		
		
	elseif zd == 9 then
		WarMain(151, 0)	
	elseif zd == 10 then
		local temppd = JY.Person[27]["品德"]
		JY.Person[27]["品德"] = 20
		WarMain(54, 0)	
		JY.Person[27]["品德"] = temppd
	end
	
	
elseif xuan == 99 then
	local k = JY.Thing;
	local ceshi = {}
	local kfname = 0 
	for i = 0, JY.ThingNum - 1 do
		kfname = k[i]["名称"]
		if string.len(kfname) == 8 then
			kfname = kfname.."  "
		elseif string.len(kfname) == 6 then
			kfname = kfname.."    "
		elseif string.len(kfname) == 4 then
			kfname = kfname.."      "
		end
		ceshi[i] = {kfname..k[i]["类型"],nil,2}
		local ggid = k[i]["练出武功"]
		if k[i]["类型"] == 2 and ggid >0 then
			ceshi[i] = {kfname..JY.Wugong[ggid]["武功类型"],nil,2}
		end
		if true then
			ceshi[i][3] = 1
		end
		

		
		
	end
	--ceshi = {}
	--ceshi[1]={""..JY.ThingNum,nil,1}
	local nexty = CC.ScreenH/2-CC.DefaultFont*4 + CC.SingleLineHeight
	local r = ShowMenu2(ceshi, #ceshi, 3, 9, CC.ScreenW/2-CC.DefaultFont*10-20, nexty, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE,"物品面板")
	if r>0 then
		instruct_2(r,1)
	end
	
end
--]]
