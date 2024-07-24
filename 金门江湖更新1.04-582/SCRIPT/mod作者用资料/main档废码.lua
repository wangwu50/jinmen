--无酒不欢：人物属性面板
--case：nil=正常浏览，else加点
function ShowPersonStatus_sub(id, page, istart, tfid, max_row, case, AI_s1, AI_s2, AI_menu_selected,AniFrame,dl)
	
	if JY.Restart == 1 then
		do return end
	end
	local size = CC.FontSmall4
	local p = JY.Person[id]
	local p0 = JY.Person[0]
	local h = size + CC.PersonStateRowPixel
	local dx = (CC.ScreenW)/1360
	local dy = (CC.ScreenH)/768
	local i = 1
	local x1, y1 = nil, nil
  		--背景图
		lib.LoadPNG(91, 20 * 2 ,0 , 0, 1)
	--无酒不欢：属性显示
	local function DrawAttrib(str, x,y,color1,size)

		--DrawString(x1, y1 + h * i, string.sub(4), color1, size)
		--额外系数显示
		--local str;
		if str == "拳掌功夫" then
			local bonus = 0
			--金丝手套
			if JY.Person[id]["武器"] == 239 then
				bonus = bonus +10
				if JY.Thing[239]["装备等级"] >= 5 then
					bonus = bonus + 30
				elseif JY.Thing[239]["装备等级"] >= 4 then
					bonus = bonus + 25
				elseif JY.Thing[239]["装备等级"] >= 3 then
					bonus = bonus + 20
				elseif JY.Thing[239]["装备等级"] >= 2 then
					bonus = bonus + 15
				end
            end
			
			--套装加成
			if JY.Person[id]["武器"] > 0 and JY.Person[id]["武器"] ~= 239 then
				local n = JY.Person[id]["武器"]
				local m = JY.Thing[n]["装备等级"]
				if m >= 2 then
					bonus = bonus + JY.Thing[n]["加拳掌功夫"]*20
				end
			end
			
			
			if bonus > 0 then
				DrawString(x,y,  string.format("↑ %s",bonus), color1, size)
			end
		end
		
		if str == "指法技巧" then
			local bonus = 0
			--金丝手套
			if JY.Person[id]["武器"] == 239 then
				bonus = bonus +10
				if JY.Thing[239]["装备等级"] >= 5 then
					bonus = bonus + 30
				elseif JY.Thing[239]["装备等级"] >= 4 then
					bonus = bonus + 25
				elseif JY.Thing[239]["装备等级"] >= 3 then
					bonus = bonus + 20
				elseif JY.Thing[239]["装备等级"] >= 2 then
					bonus = bonus + 15
				end
            end
			
			--套装加成
			if JY.Person[id]["武器"] > 0 and JY.Person[id]["武器"] ~= 239 then
				local n = JY.Person[id]["武器"]
				local m = JY.Thing[n]["装备等级"]
				if m >= 2 then
					bonus = bonus + JY.Thing[n]["加指法技巧"]*20
				end
			end
			if bonus > 0 then
				DrawString(x, y, string.format("↑ %s",bonus), color1, size)
			end
		end
		
		if str == "御剑能力" then
			local bonus = 0
			--五岳剑法
			if WuyueJFSL(id)>0 then
				bonus=bonus+ WuyueJFSL(id)*20
			end
			--战斗中的剑胆琴心加成
			if JY.Status == GAME_WMAP then
				if WAR.JDYJ[id] then
					bonus = bonus + WAR.JDYJ[id]
				end
			end
			--套装加成
			if JY.Person[id]["武器"] > 0 and JY.Person[id]["武器"] ~= 239 then
				local n = JY.Person[id]["武器"]
				local m = JY.Thing[n]["装备等级"]
				if m >= 2 then
					bonus = bonus + JY.Thing[n]["加御剑能力"]*20
				end
			end
			
			if bonus > 0 then
				DrawString(x, y, string.format("↑ %s",bonus), color1, size)
			end
		end
		
        if str == "耍刀技巧" then
			local ts = 0
            local bonus = 0
		    
			--套装加成
			if JY.Person[id]["武器"] > 0 and JY.Person[id]["武器"] ~= 239 then
				local n = JY.Person[id]["武器"]
				local m = JY.Thing[n]["装备等级"]
				if m >= 2 then
					bonus = bonus + JY.Thing[n]["加耍刀技巧"]*20
				end
			end
						
			if bonus > 0 or ts > 0 then
				DrawString(x, y, string.format("↑ %s",bonus), color1, size)
			end
		end
		
        if str == "特殊兵器" then
			local ts = 0
            local bonus = 0
			--套装加成
			if JY.Person[id]["武器"] > 0 and JY.Person[id]["武器"] ~= 239 then
				local n = JY.Person[id]["武器"]
				local m = JY.Thing[n]["装备等级"]
				if m >= 2 then
					bonus = bonus + JY.Thing[n]["加特殊兵器"]*20
				end
			end
			
			if bonus > 0 or ts > 0 then
				DrawString(x,y, string.format("↑ %s",bonus), color1, size)
			end
		end
		
		
		
		
		--战场情侣加成暗器技巧
		if JY.Status == GAME_WMAP then
				if str == "医疗能力" then
					for k,v in pairs(CC.AddDoc) do
						if match_ID(id, v[1]) then
							for wid = 0, WAR.PersonNum - 1 do
								if match_ID(WAR.Person[wid]["人物编号"], v[2]) and WAR.Person[wid]["死亡"] == false then
									DrawString(x,y, "↑ "..v[3], color1, size)
									--break
								end
							end
						end
					end
					
				end
				if str == "用毒能力" then
					for k,v in pairs(CC.AddPoi) do
						if match_ID(id, v[1]) then
							for wid = 0, WAR.PersonNum - 1 do
								if match_ID(WAR.Person[wid]["人物编号"], v[2]) and WAR.Person[wid]["死亡"] == false then
									DrawString(x,y, "↑ "..v[3], color1, size)
									--break
								end
							end
						end
					end
					
				end
				
			i = i + 1
		end
	end
	
	x1 = size*3 -10
	y1 = size + 6

	if page == 1 then
   --247 209
		local hid = nil
		hid = p["半身像"]  		
		--半身象
		local bodyw,  bodyh = lib.GetPNGXY(97, hid*2)		
	     lib.LoadPNG(90, hid * 2, dx*247, dy*209,2)  
	-------------------------------
	i = 5

	local ch = nil
	local chcl = C_CYGOLD
    local fj = {[0] = {"传说",C_ORANGE},{"宗师",M_DarkRed},{"豪侠",C_RED},{"一流",M_Pink},{"二流",M_Pink},{"三流",M_Blue},{"弟子",M_LightBlue},{"菜鸟",C_CYGOLD}}

        local fjstr = "【"..fj[p["畅想分阶"]][1].."】"
        local nametre = p["姓名"]
        local djstr = p["等级"].."级"
        
        local namex = CC.ScreenW/2-string.len(fjstr..nametre..djstr)/4*size
        local fjx = namex + string.len(nametre)/2*size
        local djx = fjx + string.len(fjstr)/2*size
		DrawString(fjx, dx*24, fjstr, fj[JY.Person[id]["畅想分阶"]][2], size*0.8)
		DrawString(namex, dx*20, nametre, C_CYGOLD, size)		
		DrawString(djx, dx*24, djstr, C_CYGOLD, size*0.8)
		--DrawString(dx*621, dx*24, "级", C_CYGOLD, size*0.8)		
		i = i + 1	
	
	    local tfx1 = dx*110
		local fty1 = dy*79
		--主角天赋
		if id == 0 then
			local main_tf;
			--标主
			if JY.Base["标准"] > 0 then
				main_tf = ZJTF[JY.Base["标准"]]
			--特殊
			elseif JY.Base["特殊"] > 0 then
				main_tf = " "
			--畅想
			elseif JY.Base["畅想"] > 0 then
				if RWTFLB[p["代号"]] ~= nil then
					main_tf = RWTFLB[p["代号"]]
				end
			end
			if main_tf ~= nil then
				DrawString(tfx1 -string.len(main_tf)/4*size*0.8, fty1, main_tf, C_CYGOLD, size*0.8)
			end
		end

		--普通角色天赋
		if id ~= 0 and RWTFLB[id] ~= nil then
			--DrawString(x1-7, y1 + h * (i)-142,RWTFLB[id], C_CYGOLD, size*0.8)
		    DrawString(tfx1 -string.len(RWTFLB[id])/4*size*0.8, fty1, RWTFLB[id], C_CYGOLD, size*0.8)	
		end
	  
		
		--主角称号
		if id == 0 then
			local main_ch;
			--标主
			if JY.Base["标准"] > 0 then
				if p["六如觉醒"] == 0 then
					main_ch = "江湖小虾米"
				else
					main_ch = "觉醒之苍龙"
				end
			--特殊
			elseif JY.Base["特殊"] > 0 then
				main_ch = ''--TSTF[JY.Base["特殊"]]
			--畅想
			elseif JY.Base["畅想"] > 0 then
				if RWWH[JY.Base["畅想"]] ~= nil and JY.Base["畅想"] ~= 35 and JY.Base["畅想"] ~= 38 and JY.Base["畅想"] ~= 49 
				and JY.Base["畅想"] ~= 626 then
					main_ch = RWWH[JY.Base["畅想"]]
				elseif JY.Base["畅想"] == 35 then
					if JY.Person[id]["个人觉醒"] >= 2 then
						DrawString(tfx1 -string.len(RWWH["35"])/4*size*0.8, dy*122,  RWWH["35"], C_CYGOLD, size*0.8)	
					elseif JY.Person[id]["个人觉醒"] >= 1 then
						--DrawString(x1-7, y1 + h * (i)-100, RWWH[35], C_CYGOLD, size*0.8)
						 DrawString(tfx1 -string.len(RWWH["35"])/4*size*0.8, dy*122,  RWWH["35"], C_CYGOLD, size*0.8)		
					end
				elseif JY.Base["畅想"] == 38 then
					if JY.Person[id]["个人觉醒"] >= 1 then
						--DrawString(x1-7, y1 + h * (i)-100, RWWH["38"], C_CYGOLD, size*0.8)
					    DrawString(tfx1 -string.len(RWWH["38"])/4*size*0.8, dy*122,  RWWH["38"], C_CYGOLD, size*0.8)		
					end
				elseif JY.Base["畅想"] == 49 then
					if JY.Person[id]["个人觉醒"] >= 1 then
						--DrawString(x1-7, y1 + h * (i)-100, RWWH["49"], C_CYGOLD, size*0.8)
					   DrawString(tfx1 -string.len(RWWH["49"])/4*size*0.8, dy*122,  RWWH["49"], C_CYGOLD, size*0.8)	
					else
					--	DrawString(x1-7, y1 + h * (i)-100, RWWH[49], C_CYGOLD, size*0.8)
					   DrawString(tfx1 -string.len(RWWH[49])/4*size*0.8, dy*122,  RWWH[49], C_CYGOLD, size*0.8)	
					end
				elseif JY.Base["畅想"] == 626 then
					if JY.Person[id]["个人觉醒"] >= 1 then
						DrawString(tfx1 -string.len(RWWH["626"])/4*size*0.8, dy*122,  RWWH["626"], C_CYGOLD, size*0.8)
						--DrawString(x1-7, y1 + h * (i)-100, RWWH["626"], C_CYGOLD, size*0.8)
					else
					--	DrawString(x1-7, y1 + h * (i)-100, RWWH[626], C_CYGOLD, size*0.8)
					 DrawString(tfx1 -string.len(RWWH[626])/4*size*0.8, dy*122,  RWWH[626], C_CYGOLD, size*0.8)		
					end
			
				end
			end
			if main_ch ~= nil then
				--DrawString(x1-7, y1 + h * (i)-100, main_ch, C_CYGOLD, size*0.8)
				 DrawString(tfx1 -string.len(main_ch)/4*size*0.8, dy*122,  main_ch, C_CYGOLD, size*0.8)	
			end
		end
		
		--其他人称号
		if RWWH[id] ~= nil and id ~= 35 and id ~= 38 and id ~= 49 then
			--DrawString(x1-7, y1 + h * (i)-100, RWWH[id], C_CYGOLD, size*0.8)
		    DrawString(tfx1 -string.len( RWWH[id])/4*size*0.8, dy*122,  RWWH[id], C_CYGOLD, size*0.8)	
			
		end

		--令狐冲
		if id == 35 then
			if JY.Person[id]["个人觉醒"] >= 2 then
				--DrawString(x1-7, y1 + h * (i)-100, RWWH["35"], C_CYGOLD, size*0.8)
				DrawString(tfx1 -string.len(RWWH["35"])/4*size*0.8, dy*122,  RWWH["35"], C_CYGOLD, size*0.8)
			elseif JY.Person[id]["个人觉醒"] >= 1 then
			--	DrawString(x1-7, y1 + h * (i)-100, RWWH[35], C_CYGOLD, size*0.8)
				 DrawString(tfx1 -string.len(RWWH["35"])/4*size*0.8, dy*122,  RWWH["35"], C_CYGOLD, size*0.8)
			end
		end

		--虚竹
		if id == 49 then
			if JY.Person[id]["个人觉醒"] >= 1 then
				--DrawString(x1-7, y1 + h * (i)-100, RWWH["49"], C_CYGOLD, size*0.8)
				  DrawString(tfx1 -string.len(RWWH["49"])/4*size*0.8, dy*122,  RWWH["49"], C_CYGOLD, size*0.8)	
			else
				--DrawString(x1-7, y1 + h * (i)-100, RWWH[49], C_CYGOLD, size*0.8)
				  DrawString(tfx1 -string.len(RWWH[49])/4*size*0.8, dy*122,  RWWH[49], C_CYGOLD, size*0.8)	
			end
		end
	  
		--石破天
		if id == 38 then
			if JY.Person[id]["个人觉醒"] >= 1 then
				--DrawString(x1-7, y1 + h * (i)-100, RWWH["38"], C_CYGOLD, size*0.8)
				  DrawString(tfx1 -string.len(RWWH["38"])/4*size*0.8, dy*122,  RWWH["38"], C_CYGOLD, size*0.8)	
			end
		end
		
		--郭襄
		if id == 626 then
			if JY.Person[id]["个人觉醒"] >= 1 then
			--	DrawString(x1-7, y1 + h * (i)-100, RWWH["626"], C_CYGOLD, size*0.8)
				  DrawString(tfx1 -string.len(RWWH["626"])/4*size*0.8, dy*122,  RWWH["626"], C_CYGOLD, size*0.8)	
			end
		end
		--萧半和
		if id == 189 then
			if JY.Person[id]["个人觉醒"] >= 1 then
			--	DrawString(x1-7, y1 + h * (i)-100, RWWH["189"], C_CYGOLD, size*0.8)
				  DrawString(tfx1 -string.len(RWWH[189])/4*size*0.8, dy*122,  RWWH[189], C_CYGOLD, size*0.8)	
			end
		end	 
		--苗人凤
		if id == 633 then
			if JY.Person[id]["个人觉醒"] >= 1 then
				--DrawString(x1-7, y1 + h * (i)-100, RWWH["633"], C_CYGOLD, size*0.8)
				DrawString(tfx1 -string.len(RWWH[633])/4*size*0.8, dy*122,  RWWH[633], C_CYGOLD, size*0.8)	
			end
		end	

		
		
		--资质
		DrawString(dx*70, dy*155, "资质", C_CYGOLD, size*0.8)
		DrawString(dx*125, dy*155, p["资质"], C_CYGOLD, size*0.8)
		--体质
		DrawString(dx*70, dy*180, "体质", C_CYGOLD, size*0.8)
		DrawString(dx*125, dy*180, p["生命增长"], C_CYGOLD, size*0.8)
        local ii = 0
        local diyx,diyy = CC.ThingPicWidth/2,CC.ThingPicHeight/2
        local ax,ay = x1, y1 + h * i + diyy * ii
        local s = 2
        ax = x1 - size
        ay = y1 + h * i + diyy * ii
		
		
		if MPPD(id) ~= 0 then
		   local mptype, mpdj = MPDISPLAY(id)
		    if mptype ~= nil then
                if MPPD(id) == 13 and match_ID(id,66) then
			        DrawString(x1 + size * 5+10 , y1 + h * (i)-160-42, "【".."波斯明教圣女".."】", M_Red, size*0.8)
			    elseif MPPD(id) == 13 and id == 0 and MPDJ(id) == 4 then
				    DrawString(x1 + size * 5+10 , y1 + h * (i)-160-42, "【".."代行使者".."】", C_GOLD, size*0.8)
				elseif MPPD(id) == 13 and id == 0 and MPDJ(id) == 3 then
						if JY.Person[13]["品德"] == 1 then
							DrawString(x1 + size * 5+10 , y1 + h * (i)-160-42, "【".."玄心狼王".."】", C_GOLD, size*0.8)
						elseif JY.Person[13]["品德"] == 100 then
							DrawString(x1 + size * 5+10 , y1 + h * (i)-160-42, "【".."赤血麟王".."】", C_GOLD, size*0.8)
						end	
				elseif MPPD(id) == 12 and match_ID(id,73) then
				    DrawString(x1 + size * 5+10 , y1 + h * (i)-160-42, "【".."神教圣姑".."】", M_Red, size*0.8)	
				elseif MPPD(id) == 12 and match_ID(id,26) then	
				    DrawString(x1 + size * 5+10 , y1 + h * (i)-160-42, "【".."神教前教主".."】", M_Red, size*0.8)	
				elseif MPPD(id) == 14 and match_ID(id,140) then	
				    DrawString(x1 + size * 5+10 , y1 + h * (i)-160-42, "【".."太上长老".."】", M_Red, size*0.8)	
				elseif MPPD(id) == 14 and match_ID(id,592) then
				    DrawString(x1 + size * 5+10 , y1 + h * (i)-160-42, "【".."剑魔".."】", M_Red, size*0.8)		
				elseif MPPD(id) == 10 and match_ID(id,588) then	
				    DrawString(x1 + size * 5+10 , y1 + h * (i)-160-42, "【".."岛主夫人".."】", M_Red, size*0.8)	
				elseif MPPD(id) == 5 and match_ID(id,577) then	
				    DrawString(x1 + size * 5+10 , y1 + h * (i)-160-42, "【".."少林祖师".."】", M_Red, size*0.8)	
				elseif MPPD(id) == 5 and match_ID(id,114) then	
				    DrawString(x1 + size * 5+10 , y1 + h * (i)-160-42, "【".."隐世高僧".."】", M_Red, size*0.8)	
				elseif MPPD(id) == 5 and match_ID(id,38) then	
				    DrawString(x1 + size * 5+10 , y1 + h * (i)-160-42, "【".."熊耳转生".."】", M_Red, size*0.8)		
				elseif MPPD(id) == 2 and match_ID(id,50) then	
				    DrawString(x1 + size * 5+10 , y1 + h * (i)-160-42, "【".."前帮主".."】", M_Red, size*0.8)
				elseif MPPD(id) == 15 and match_ID(id,499) then	
				    DrawString(x1 + size * 5+10 , y1 + h * (i)-160-42, "【".."大理先祖".."】", M_Red, size*0.8)		
				elseif MPPD(id) == 11 and match_ID(id,596) then	
				    DrawString(x1 + size * 5+10 , y1 + h * (i)-160-42, "【".."一刀流少主".."】", M_Red, size*0.8)	
				elseif MPPD(id) == 20 and match_ID(id,523) then	
				    DrawString(x1 + size * 5+10 , y1 + h * (i)-160-42, "【".."宗主夫人".."】", M_Red, size*0.8)
				elseif MPPD(id) == 24 and match_ID(id,525) then	
				    DrawString(x1 + size * 5+10 , y1 + h * (i)-160-42, "【".."杀手教头".."】", M_DeepSkyBlue, size*0.8)	
				elseif MPPD(id) == 23 and match_ID(id,634) then	
				    DrawString(x1 + size * 5+10 , y1 + h * (i)-160-42, "【".."军师".."】", M_Red, size*0.8)	
				elseif MPPD(id) == 20 and match_ID(id,745) then	
				    DrawString(x1 + size * 5+10 , y1 + h * (i)-160-42, "【".."太上师尊".."】", M_Red, size*0.8)
				elseif MPPD(id) == 26 and match_ID(id,754) then	
				    DrawString(x1 + size * 5+10 , y1 + h * (i)-160-42, "【".."万花之主".."】", M_Red, size*0.8)									
			    else
			        DrawString(x1 + size * 4+10-50, y1 + h * (i)-160-42, "【"..mptype..mpdj.."】", M_DeepSkyBlue, size*0.8)
			    end
		    else
			    DrawString(x1 + size * 5+10, y1 + h * (i)-160-42, "【江湖人士】", C_ORANGE, size*0.8)
		    end
	    else
		    DrawString(x1 + size * 5+10, y1 + h * (i)-160-42, "【江湖人士】", C_ORANGE, size*0.8)
		end
		
		
		--武器，防具
		i = i + 1
		-- if p["武器"] > -1 then
			-- lib.PicLoadCache(2, p["武器"] * 2, diyx/5+ax*8+30, diyy/4+ax*3-80, 1)
			-- DrawString( diyx/5+ax*8+32, diyy/4+ax*3-80, JY.Thing[p["武器"]]["名称"], C_CYGOLD, size*0.8)
			-- DrawString( diyx/5+ax*8+32, diyy/4+ax*3-80+size*0.7, "LV"..JY.Thing[p["武器"]]["装备等级"], M_DeepSkyBlue, size*0.7)
		-- end
		-- i = i + 1
		-- if p["防具"] > -1 then
			-- lib.PicLoadCache(2, p["防具"] * 2, diyx/5+ax*8+30, diyy/4+ax*3+83-63, 1)
			-- DrawString( diyx/5+ax*8+32, diyy/4+ax*3+20, JY.Thing[p["防具"]]["名称"], C_CYGOLD, size*0.8)
			-- DrawString( diyx/5+ax*8+32, diyy/4+ax*3+20+size*0.7, "LV"..JY.Thing[p["防具"]]["装备等级"], M_DeepSkyBlue, size*0.7)
		-- end		
		-- if p["坐骑"] > -1 then
		 -- lib.PicLoadCache(2, p["坐骑"] * 2, diyx/5+ax*8+30, diyy/4+ax*3+166-45, 1)
		-- DrawString( diyx/5+ax*8+32, diyy/4+ax*3+121, JY.Thing[p["坐骑"]]["名称"], C_CYGOLD, size*0.8)
		-- DrawString( diyx/5+ax*8+32, diyy/4+ax*3+121+size*0.7, "LV"..JY.Thing[p["坐骑"]]["装备等级"], M_DeepSkyBlue, size*0.7)
		-- end		
		--DrawString(x1, y1 + h * (i), "武器", M_LightBlue, size)
		if p["武器"] > -1 then
		--	lib.PicLoadCache(2,p["武器"] * 2, diyx/5+ax*8+30, diyy/4+ax*3-80,1,0,0,-1,-1,0,0,72)
			lib.PicLoadCache(2, p["武器"] * 2, diyx/5+ax*8+30, diyy/4+ax*3-80, 1)
			DrawString( diyx/5+ax*8+32, diyy/4+ax*3-5, JY.Thing[p["武器"]]["名称"], M_Red, size*0.8)
		--else
			--DrawString(x1 + size * 3 - 5, y1 + h * (i), "无", M_White, size)
		end
		i = i + 1
		--DrawString(x1, y1 + h * (i), "防具", M_LightBlue, size)
		if p["防具"] > -1 then
		--	lib.PicLoadCache(2,p["防具"] * 2,diyx/5+ax*8+30, diyy/4+ax*3+83-63,1,0,0,-1,-1,0,0,72)
			lib.PicLoadCache(2, p["防具"] * 2, diyx/5+ax*8+30, diyy/4+ax*3+83-63, 3)
			DrawString( diyx/5+ax*8+32, diyy/4+ax*3+100, JY.Thing[p["防具"]]["名称"], C_GOLD, size*0.8)
		--else
			--DrawString(x1 + size * 3 - 5, y1 + h * (i)+275, "无", M_White, size)
		end
		
		if p["坐骑"] > -1 then
		--lib.PicLoadCache(2,p["坐骑"] * 2,diyx/5+ax*8+30, diyy/4+ax*3+166-45,1,0,0,-1,-1,0,0,72)
		lib.PicLoadCache(2, p["坐骑"] * 2, diyx/5+ax*8+30, diyy/4+ax*3+166-45, 1)
		 DrawString( diyx/5+ax*8+32, diyy/4+ax*3+200, JY.Thing[p["坐骑"]]["名称"], M_Cyan, size*0.8)
		end
		--套装显示
		if (p["武器"] > -1 and p["防具"] > -1 and p["坐骑"] > -1) then
			if p["防具"]==p["武器"]+1 and p["坐骑"]==p["武器"]+2 then
				local color = C_RED
				local n = Setmeal[p["武器"]][4]
				if  n==4 or n==7 or n==15 or n==16 or n==2 then
					color = C_ORANGE
				elseif n==21 or n==22 or n==24 or n==26 then
				    color = M_DeepSkyBlue
				elseif n==1 or n==3 then
				    color = M_Green
				end
				--local n= #ItemInfo[p["武器"]]
				--say("数组长度"..#ItemInfo[p["武器"]],0,1)
				DrawString( bx*450+pyl,by*470+90, string.sub(ItemInfo[p["武器"]][3], 3 , 12), C_GOLD, size*0.7)
				--tjm(bx*450+pyl,by*470+20+100,"◆特效："..Xguo[Setmeal[p["武器"]][4]]..'*'.."◆特效："..FJXguo[Setmeal[p["武器"]][5]].."*".."◆特效："..ZqXguo[Setmeal[p["武器"]][6]].."*".."◆"..CC.PTFSM[Setmeal[p["武器"]][7]][1]..":"..CC.PTFSM[Setmeal[p["武器"]][7]][2],C_GOLD,size*0.5,14,size*0.5)
				if n < 5 and n ~= 0 then
					DrawString(bx*450+pyl,by*470+20+100, "◆"..string.sub(ItemInfo[p["武器"]][4]..":"..Xguo[Setmeal[p["武器"]][4]], 9 , -1), color, size*0.5)
					DrawString(bx*450+pyl,by*470+40+100,"◆"..string.sub(ItemInfo[p["武器"]][4]..":"..FJXguo[Setmeal[p["武器"]][5]], 9 , -1), color, size*0.5)
					DrawString(bx*450+pyl,by*470+60+100,"◆"..string.sub(ItemInfo[p["武器"]][4]..":"..ZqXguo[Setmeal[p["武器"]][6]], 9 , -1), color, size*0.5)
					tjm(bx*450+pyl,by*470+80+100,"◆"..CC.PTFSM[Setmeal[p["武器"]][7]][1]..":"..CC.PTFSM[Setmeal[p["武器"]][7]][2],C_RED,size*0.5,13,size*0.5)
				end
				if n >= 5 then
					DrawString(bx*450+pyl,by*470+20+100, "◆"..string.sub(ItemInfo[p["武器"]][4]..":"..Xguo[Setmeal[p["武器"]][4]], 9 , -1), color, size*0.5)
				end
				if n > 7 then
					DrawString(bx*450+pyl,by*470+40+100,"◆"..string.sub(ItemInfo[p["武器"]][4]..":"..FJXguo[Setmeal[p["武器"]][5]], 9 , -1), color, size*0.5)
					DrawString(bx*450+pyl,by*470+60+100,"◆"..string.sub(ItemInfo[p["武器"]][4]..":"..ZqXguo[Setmeal[p["武器"]][6]], 9 , -1), color, size*0.5)
				end
				if n > 9 then
					--DrawString( diyx/5+ax*8-240, diyy/4+ax*3+200+40-20,"◆"..CC.PTFSM[Setmeal[p["武器"]][7]][1]..":"..CC.PTFSM[Setmeal[p["武器"]][7]][2], C_RED, size*0.5)
					tjm(bx*450+pyl,by*470+80+100,"◆"..CC.PTFSM[Setmeal[p["武器"]][7]][1]..":"..CC.PTFSM[Setmeal[p["武器"]][7]][2],C_RED,size*0.5,13,size*0.5)
				end
				--DrawString( bx*zb2[3][1]+5-250,by*zb2[3][2]+2, string.sub(ItemInfo[p["武器"]][5], 5 , -1), M_YellowGreen, size*0.5)
				--DrawString( bx*zb2[3][1]+5-250,by*zb2[3][2]+2+20,string.sub(ItemInfo[p["武器"]][7], 5 , -1), M_YellowGreen, size*0.5)
				--DrawString( bx*zb2[3][1]+5-250,by*zb2[3][2]+2+40, string.sub(ItemInfo[p["武器"]][9], 5 , -1), M_YellowGreen, size*0.5)
			end
		end

		--第二列开始D
	---------------------------------------------------------------------		
		i = 0
	    local color = nil
		if p["受伤程度"] < 33 then
			color = RGB(236, 200, 40)
		elseif p["受伤程度"] < 66 then
			color = RGB(244, 128, 32)
		else
			color = RGB(232, 32, 44)
		end
		i = i + 1
		DrawString(dx*152, dy*412, string.format("%5d", p["生命"]), C_CYGOLD, size*0.7)
		DrawString(dx*202, dy*414, "/", C_CYGOLD, size*0.6)
		if p["中毒程度"] == 0 then
			color = RGB(252, 148, 16)
		elseif p["中毒程度"] < 50 then
			color = RGB(120, 208, 88)
		else
			color = RGB(56, 136, 36)
		end
		DrawString(dx*202, dy*412, string.format("%5s", p["生命最大值"]), C_CYGOLD, size*0.7)
		local nl = nil
		if p["内力性质"] == 0 then
			color = RGB(208, 152, 208)
			nl = "(阴)"
		elseif p["内力性质"] == 1 then
			color = RGB(236, 200, 40)
			nl = "(阳)"
        elseif	p["内力性质"] == 2 then
			color =MilkWhite
			nl = "(调和)"
		else
			color = RGB(252, 172, 92)
			nl = "(天罡)"
		end
		DrawString(dx*152, dy*436, string.format("%5d", p["内力"]), color, size*0.7)
		DrawString(dx*202, dy*440, "/", color, size*0.6)
		DrawString(dx*202, dy*436, string.format("%5d", p["内力最大值"]), color, size*0.7)
		DrawString(dx*262, dy*436, nl, color, size*0.7)
		if p["主运内功"] == 0 then
			DrawString(dx*398, dy*409, "未运内功",C_CYGOLD, size*0.7)
		else
			--if p["门派技能1"] > 0 then
				--if p["门派技能1"] > 1 then
					--DrawString(dx*398, dy*409, JY.Wugong[p["主运内功"]]["名称"].."/"..JY.Wugong[p["门派技能1"]]["名称"], TG_Red_Bright, size*0.7)
				--else
					--DrawString(dx*398, dy*409, JY.Wugong[p["主运内功"]]["名称"].."/".."无", TG_Red_Bright, size*0.7)
				--end
			--else
				DrawString(dx*398, dy*409, JY.Wugong[p["主运内功"]]["名称"], TG_Red_Bright, size*0.7)
			--end	
			lib.LoadPNG(91, 15 * 2 ,0 ,0, 1)
        end		
		if p["主运轻功"] == 0 then
			DrawString(dx*398, dy*437, "未运轻功",C_CYGOLD, size*0.7)
		else
			DrawString(dx*398, dy*437, JY.Wugong[p["主运轻功"]]["名称"], M_DeepSkyBlue, size*0.7)
			lib.LoadPNG(91, 14 * 2 ,0 ,0, 1)
		end			
	--------------------------------------------
		--第一列
        i = 0
		local x1 = dx*113
		local y1 = dy*471
        local dh = size*0.8
		local w1 = size

		--装备增加的属性
		local str_gain, def_gain, agi_gain = 0, 0, 0
		local fb = 1
		if match_ID(id,546) or match_ID(id, 9911) then
			fb = 2
		end
		if p["武器"] > -1 then
			if JY.Thing[p["武器"]]["加攻击力"] > 0 then
				str_gain = str_gain + JY.Thing[p["武器"]]["加攻击力"]*10 + JY.Thing[p["武器"]]["加攻击力"]*(JY.Thing[p["武器"]]["装备等级"]-1)*2
			elseif JY.Thing[p["武器"]]["加攻击力"] < 0 then
				str_gain = str_gain + JY.Thing[p["武器"]]["加攻击力"]*10 - JY.Thing[p["武器"]]["加攻击力"]*(JY.Thing[p["武器"]]["装备等级"]-1)*2
			end
			if JY.Thing[p["武器"]]["加防御力"] > 0 then
				def_gain = def_gain + JY.Thing[p["武器"]]["加防御力"]*10 + JY.Thing[p["武器"]]["加防御力"]*(JY.Thing[p["武器"]]["装备等级"]-1)*2
			elseif JY.Thing[p["武器"]]["加防御力"] < 0 then
				def_gain = def_gain + JY.Thing[p["武器"]]["加防御力"]*10 - JY.Thing[p["武器"]]["加防御力"]*(JY.Thing[p["武器"]]["装备等级"]-1)*2
			end
			if JY.Thing[p["武器"]]["加轻功"] > 0 then
				agi_gain = agi_gain + JY.Thing[p["武器"]]["加轻功"]*10*fb + JY.Thing[p["武器"]]["加轻功"]*(JY.Thing[p["武器"]]["装备等级"]-1)*2*fb
			elseif JY.Thing[p["武器"]]["加轻功"] < 0 then
				agi_gain = agi_gain + JY.Thing[p["武器"]]["加轻功"]*10*fb - JY.Thing[p["武器"]]["加轻功"]*(JY.Thing[p["武器"]]["装备等级"]-1)*2*fb
			end
		end
		if p["坐骑"] > -1 then
			if JY.Thing[p["坐骑"]]["加攻击力"] > 0 then
				str_gain = str_gain + JY.Thing[p["坐骑"]]["加攻击力"]*10 + JY.Thing[p["坐骑"]]["加攻击力"]*(JY.Thing[p["坐骑"]]["装备等级"]-1)*2
			elseif JY.Thing[p["坐骑"]]["加攻击力"] < 0 then
				str_gain = str_gain + JY.Thing[p["坐骑"]]["加攻击力"]*10 - JY.Thing[p["坐骑"]]["加攻击力"]*(JY.Thing[p["坐骑"]]["装备等级"]-1)*2
			end
			if JY.Thing[p["坐骑"]]["加防御力"] > 0 then
				def_gain = def_gain + JY.Thing[p["坐骑"]]["加防御力"]*10 + JY.Thing[p["坐骑"]]["加防御力"]*(JY.Thing[p["坐骑"]]["装备等级"]-1)*2
			elseif JY.Thing[p["坐骑"]]["加防御力"] < 0 then
				def_gain = def_gain + JY.Thing[p["坐骑"]]["加防御力"]*10 - JY.Thing[p["坐骑"]]["加防御力"]*(JY.Thing[p["坐骑"]]["装备等级"]-1)*2
			end
			if JY.Thing[p["坐骑"]]["加轻功"] > 0 then
				agi_gain = agi_gain + JY.Thing[p["坐骑"]]["加轻功"]*10*fb + JY.Thing[p["坐骑"]]["加轻功"]*(JY.Thing[p["坐骑"]]["装备等级"]-1)*2*fb
			elseif JY.Thing[p["坐骑"]]["加轻功"] < 0 then
				agi_gain = agi_gain + JY.Thing[p["坐骑"]]["加轻功"]*10*fb - JY.Thing[p["坐骑"]]["加轻功"]*(JY.Thing[p["坐骑"]]["装备等级"]-1)*2*fb
			end
		end
		if p["防具"] > -1 then
			local n = 2
			if MPPD(id) == 2 then
				n=4
			end	
			if JY.Thing[p["防具"]]["加攻击力"] > 0 then
				str_gain = str_gain + JY.Thing[p["防具"]]["加攻击力"]*10 + JY.Thing[p["防具"]]["加攻击力"]*(JY.Thing[p["防具"]]["装备等级"]-1)*2
			elseif JY.Thing[p["防具"]]["加攻击力"] < 0 then
				str_gain = str_gain + JY.Thing[p["防具"]]["加攻击力"]*10 - JY.Thing[p["防具"]]["加攻击力"]*(JY.Thing[p["防具"]]["装备等级"]-1)*2
			end
			if JY.Thing[p["防具"]]["加防御力"] > 0 then
				def_gain = def_gain + JY.Thing[p["防具"]]["加防御力"]*10 + JY.Thing[p["防具"]]["加防御力"]*(JY.Thing[p["防具"]]["装备等级"]-1)*n
			elseif JY.Thing[p["防具"]]["加防御力"] < 0 then
				def_gain = def_gain + JY.Thing[p["防具"]]["加防御力"]*10 - JY.Thing[p["防具"]]["加防御力"]*(JY.Thing[p["防具"]]["装备等级"]-1)*2
			end
			if JY.Thing[p["防具"]]["加轻功"] > 0 then
				agi_gain = agi_gain + JY.Thing[p["防具"]]["加轻功"]*10*fb + JY.Thing[p["防具"]]["加轻功"]*(JY.Thing[p["防具"]]["装备等级"]-1)*2*fb
			elseif JY.Thing[p["防具"]]["加轻功"] < 0 then
				agi_gain = agi_gain + JY.Thing[p["防具"]]["加轻功"]*10*fb - JY.Thing[p["防具"]]["加轻功"]*(JY.Thing[p["防具"]]["装备等级"]-1)*2*fb
			end
		end
		--易筋经加成
		local level = 0
		local gj = 0
		local qg = 0
		local fy = 0
		local str1_gain, def1_gain, agi1_gain = 0, 0, 0
        --战场各种加成 
        if JY.Status == GAME_WMAP then
            for i =1,JY.Base["武功数量"] do               -- 查找当前已经炼成武功等级
				 if JY.Person[id]["武功" .. i]==108 then
					if JY.Person[id]["武功等级" .. i] > 900 then
						level = 10
					else	
						level=math.modf(JY.Person[id]["武功等级" .. i] /100)+1;	
					end	
					if level >= 1 then
						gj = math.modf (JY.Person[id]["攻击力"]*0.03*(level))
						str1_gain = str1_gain +gj
						fy = math.modf(JY.Person[id]["防御力"]*0.03*(level))
						def1_gain = def1_gain +fy
						qg = math.modf(JY.Person[id]["轻功"]*0.03*(level))
						agi1_gain = agi1_gain +qg
						break
					end	
				end		
			end
			
			if match_ID(id, 9930) or match_ID(id,9738) then				--黑级浮屠
				gj = math.modf (JY.Person[id]["攻击力"]*0.6)
				str1_gain = str1_gain +gj
				fy = math.modf(JY.Person[id]["防御力"]*0.6)
				def1_gain = def1_gain +fy
				qg = math.modf(JY.Person[id]["轻功"]*0.6)
				agi1_gain = agi1_gain +qg	
			end
			if match_ID(id, 604) or match_ID(id, 9805) then
				str1_gain = str1_gain +JY.Person[id]["御剑能力"]
			end	
			--轻功强化加成
			if JY.Person[id]["主运轻功"] > 0 and JY.Person[id]["畅想分阶"] < 2 then
				qg = math.modf(JY.Person[id]["轻功"]*0.3)
				agi1_gain = agi1_gain +qg
			elseif JY.Person[id]["主运轻功"] > 0 and JY.Person[id]["畅想分阶"] < 4 then
				qg = math.modf(JY.Person[id]["轻功"]*0.15)
				agi1_gain = agi1_gain +qg
			end	
			--武穆遗书 标记修改
			if Curr_NG(id,199) then
				local sz=math.modf(JY.Person[id]["实战"]/2)
				if not inteam(id) then
				sz=250
				end
				str1_gain = str1_gain +sz
				def1_gain = def1_gain +sz
			end
			if match_ID(id, 604) or match_ID(id, 9805) then
				def1_gain = def1_gain +JY.Person[id]["御剑能力"]
			end	
			
			if PersonKF(id,263) or NGQH(id,175) then
				if Curr_NG(id,263) then
					gj = math.modf(gj*1.1)
				else
					gj = math.modf(gj*1.05)
				end
				str1_gain = str1_gain +gj
			end	
			
			if PersonKF(id,264) or NGQH(id,175) then
				if Curr_NG(id,264) then
					fy = math.modf(fy*1.1)
				else
					fy = math.modf(fy*1.05)
				end
				def1_gain = def1_gain +fy
			end	
			if PersonKF(id,259) or NGQH(id,175) then
				if Curr_NG(id,259) then
					qg = math.modf(qg*1.1)
				else
					qg = math.modf(qg*1.05)
				end
				agi1_gain = agi1_gain +qg
			end
			--霍青桐，我方人数人越多，防御越高    
            if match_ID(id, 74) then
				local hqtgj= 0
                for j = 0, WAR.PersonNum - 1 do
                    if WAR.Person[j]["死亡"] == false and WAR.Person[j]["我方"] == WAR.Person[i]["我方"] then
                     def1_gain =  def1_gain+10
                    end		
                end	
            end		 
            --林殊敌方人数人越多，防御越高    
            if match_ID(id, 508) then
                for j = 0, WAR.PersonNum - 1 do
                    if WAR.Person[j]["死亡"] == false and WAR.Person[j]["我方"] == false  then
                    def1_gain =  def1_gain+10
                    str1_gain =  str1_gain +10
                    end		
                end	
            end	
			
			--血淬
			if WAR.PD['血淬'][id] ~= nil and str_gain > 0 then
				str_gain = str_gain + WAR.PD['血淬'][id]
			end	
			--队友攻击力加成
			for i,v in pairs(CC.AddAtk) do
				if match_ID(id, v[1]) then
					for wid = 0, WAR.PersonNum - 1 do
						if match_ID(WAR.Person[wid]["人物编号"], v[2]) and WAR.Person[wid]["死亡"] == false then
							str1_gain = str1_gain + v[3]
						end
					end
				end
			end
			--队友防御力加成
			for i,v in pairs(CC.AddDef) do
				if match_ID(id, v[1]) then
					for wid = 0, WAR.PersonNum - 1 do
						if match_ID(WAR.Person[wid]["人物编号"], v[2]) and WAR.Person[wid]["死亡"] == false then
							def1_gain = def1_gain + v[3]
						end
					end
				end
			end
			--队友轻功加成
			for i,v in pairs(CC.AddSpd) do
				if match_ID(id, v[1]) then
					for wid = 0, WAR.PersonNum - 1 do
						if match_ID(WAR.Person[wid]["人物编号"], v[2]) and WAR.Person[wid]["死亡"] == false then
							agi1_gain = agi1_gain + v[3] 
						end
					end
				end
			end
			
		end
		
		DrawString(x1, y1, p["攻击力"] + str1_gain, M_Yellow, size*0.7)		
		DrawString(x1+w1+size/3, y1, "↑ ", M_Yellow, size*0.7)
		DrawString(x1+w1*2, y1, str_gain, M_Yellow, size*0.7)		

		DrawString(x1, y1+dh, p["防御力"] + def1_gain, M_Yellow, size*0.7)		
		DrawString(x1+w1+size/3, y1+dh, "↑ " , M_Yellow, size*0.7)
		DrawString(x1+w1*2, y1+dh, def_gain, M_Yellow, size*0.7)	
		
        DrawString(x1, y1+dh*2, p["轻功"] + agi1_gain, M_Yellow, size*0.7)		
		if agi_gain > -1 then
			DrawString(x1+w1+size/3,y1+dh*2, "↑ ", M_Yellow, size*0.7)
			DrawString(x1+w1*2,y1+dh*2, agi_gain, M_Yellow, size*0.7)			
		else
			agi_gain = -(agi_gain)
			DrawString(x1+w1+size/3,y1+dh*2, "↓ " , M_Yellow, size*0.7)
			DrawString(x1+w1*2,y1+dh*2, agi_gain, M_Yellow, size*0.7)			
		end
		
		local bonus_q,bonus_z,bonus_j,bonus_d,bonus_t = 0,0,0,0,0
		if JY.Base["周目"] > 1 then
			if JY.Base["周目"] <= 100 then
				bonus_q = bonus_q + math.modf(JY.Base["周目"]*0.8) 
				bonus_z = bonus_z + math.modf(JY.Base["周目"]*0.8) 
				bonus_j = bonus_j + math.modf(JY.Base["周目"]*0.8) 
				bonus_d = bonus_d + math.modf(JY.Base["周目"]*0.8) 
				bonus_t = bonus_t + math.modf(JY.Base["周目"]*0.8) 
			else
				bonus_q = bonus_q + math.modf(JY.Base["周目"]*0.4) 
				bonus_z = bonus_z + math.modf(JY.Base["周目"]*0.4)
				bonus_j = bonus_j + math.modf(JY.Base["周目"]*0.4)
				bonus_d = bonus_d + math.modf(JY.Base["周目"]*0.4)
				bonus_t = bonus_t + math.modf(JY.Base["周目"]*0.4)
			end	
		end	
		if JY.Status == GAME_WMAP then 
		--太玄，战场系数*140%
			--步惊云剑法 系数
            if match_ID(id, 584) then
		       local JF = 0
		       for i = 1, JY.Base["武功数量"] do
				   if JY.Wugong[JY.Person[id]["武功" .. i]]["武功类型"] == 3 then
					 JF = JF + 1
				   end
			   end
			   bonus_j = bonus_j + math.modf(JF*10)
	       end
            --林殊敌方人数人越多，系数越高    
            if match_ID(id, 508) then
                local jf = 0
                for j = 0, WAR.PersonNum - 1 do
                    if WAR.Person[j]["死亡"] == false and WAR.Person[j]["我方"] == false  then
                        jf = jf + 1
                    end				
                end					
                bonus_q = bonus_q + jf*5 
				bonus_z = bonus_z + jf*5
				bonus_j = bonus_j + jf*5
				bonus_d = bonus_d + jf*5
				bonus_t = bonus_t + jf*5
            end
			if match_ID(id,9947) then  
                for i = 1, JY.Base["武功数量"] do
                    if JY.Wugong[JY.Person[id]["武功" .. i]]["武功类型"] == 6 then
						bonus_q = bonus_q + 30
						bonus_z = bonus_z + 30
						bonus_j = bonus_j + 30
						bonus_d = bonus_d + 30
						bonus_t = bonus_t + 30
                    end
                end
            end
			if PersonKF(id,102) then
				bonus_q = math.modf((bonus_q+p["拳掌功夫"])*1.4)
				bonus_z = math.modf((bonus_z+p["指法技巧"])*1.4)
				bonus_j = math.modf((bonus_j+p["御剑能力"])*1.4)
				bonus_d = math.modf((bonus_d+p["耍刀技巧"])*1.4)
				bonus_t = math.modf((bonus_t+p["特殊兵器"])*1.4)
			end	
		end	
		
		--能力属性
		
		DrawString(dx*113, y1+dh*3.5, p["拳掌功夫"]+bonus_q, M_YellowGreen, size*0.7)
		DrawAttrib("拳掌功夫", dx*150, y1+dh*3.5,M_YellowGreen,size*0.7)
		DrawString(dx*113, y1+dh*4.5, p["指法技巧"]+bonus_z, M_YellowGreen, size*0.7)	
		DrawAttrib("指法技巧", dx*150, y1+dh*4.5,M_YellowGreen,size*0.7)
		DrawString(dx*113, y1+dh*5.5, p["御剑能力"]+bonus_j, M_YellowGreen, size*0.7)	
		DrawAttrib("御剑能力", dx*150, y1+dh*5.5,M_YellowGreen,size*0.7)
		DrawString(dx*113, y1+dh*6.5, p["耍刀技巧"]+bonus_d, M_YellowGreen, size*0.7)	
		DrawAttrib("耍刀技巧", dx*150, y1+dh*6.5,M_YellowGreen,size*0.7)
		DrawString(dx*113, y1+dh*7.5, p["特殊兵器"]+bonus_t, M_YellowGreen, size*0.7)	
		DrawAttrib("特殊兵器", dx*150, y1+dh*7.5,M_YellowGreen,size*0.7)
		
		-- local aay = 10
		-- DrawString(x1 - size * 8+15, y1*19+100, p["拳掌功夫"], M_PaleTurquoise, size*0.7)
		
		-- DrawString(x1 - size * 8+15, y1*19+112+aay, p["指法技巧"], M_PaleTurquoise, size*0.7)	
		-- DrawString(x1 - size * 8+15, y1*19+134+aay, p["御剑能力"], M_PaleTurquoise, size*0.7)
		
		-- DrawString(x1 - size * 8+15, y1*19+155+aay, p["耍刀技巧"], M_PaleTurquoise, size*0.7)	
		-- DrawString(x1 - size * 8+15, y1*19+178+aay, p["特殊兵器"], M_PaleTurquoise, size*0.7)
		
    --第二列  
        -- 医疗 用毒 暗器 
	    local x2 = dx*270
		local y2 = y1
        DrawString(x2, y2,p["医疗能力"], M_PaleGreen, size*0.7)
		DrawAttrib("医疗能力", dx*310, y2,M_PaleGreen,size*0.7)
		
        DrawString(x2, y2+dh,p["用毒能力"], M_PaleGreen, size*0.7)	
		DrawAttrib("用毒能力", dx*310, y2+dh,M_PaleGreen,size*0.7)
		
        if p["门派技能2"] > 0 then
			local str = ""
			if p["门派技能2"] == 458 then
				str = "(冰魄)"
			elseif p["门派技能2"] == 490 then
				str = "(金蛇)"	
			elseif p["门派技能2"] == 459 then
				str = "(生死)"	
			elseif p["门派技能2"] == 450 then
				str = "(霹雳)"
			elseif p["门派技能2"] == 486 then
				str = "(细雨)"					
			end	
			DrawString(x2, y2+dh*2,p["暗器技巧"]..str, C_RED, size*0.7)
		else
			DrawString(x2, y2+dh*2,p["暗器技巧"], M_Orange, size*0.7)
		end	

	   --连击 暴击 医疗 用毒    
		DrawString(x2, y2+dh*3.5,Person_LJ(id), M_DeepSkyBlue, size*0.7)
		DrawString(x2, y2+dh*4.5,Person_BJ(id), C_RED, size*0.7)
		
		DrawString(x2, y2+dh*5.5,p["抗毒能力"], M_Green, size*0.7)	
		--DrawAttrib("抗毒能力", dx*350, y2+dh*5.5,M_PaleGreen,size*0.7)
		DrawString(x2, y2+dh*6.5,p["攻击带毒"], M_Green, size*0.7)	
		
		--DrawString(x2, y2+dh*7.5,p["解毒能力"], M_Green, size*0.7)	

    --第三列
	--武常 实战 集气
	local jqz = 0
	local jqz0 = 8
	local jqz1 = 0
	local jqz3 = 0
	local x = JY.Person[id]["轻功"]
	local jqz2 = 0
    local y = JY.Person[id]["内力"]	
	local x3 = dx*427
	local y3 = y1
	DrawString(x3 , y3,p["武学常识"], C_CYGOLD, size*0.7)
     if p["实战"] >= 500 then
			DrawString(x3, y3+dh, string.format("%s", "极"), C_RED, size*0.7)
		else
			DrawString(x3, y3+dh, string.format("%s", p["实战"]), C_CYGOLD, size*0.7)
		end	
	--集气条
	
	local function getnewmove(x)
		return math.sqrt(x)
	end
	--无酒不欢：内力对于人物集气的影响函数
	local function getnewmove1(a, b)
		local x = (a * 2 + b) / 3
		if x > 5600 then
			return 8 + math.min((x - 5600) / 1200, 3)
		elseif x > 3600 then
			return 6 + (x - 3600) / 1000
		elseif x > 2000 then
			return 4 + (x - 2000) / 800
		elseif x > 800 then
			return 2 + (x - 800) / 600
		else
			return x / 400
		end
	end

	--战场轻功
	local function Qg1(i)

		id = i
		
		local qg = 0 
		
		qg = qg + JY.Person[id]['轻功']
		
		for i =1,JY.Base["武功数量"] do  
			local level = 0            
			if JY.Person[id]["武功" .. i]==108 then
				level = math.modf(JY.Person[id]["武功等级" .. i]/100)+1;
				level = limitX(level/10,0,1)
				qg = qg + math.modf(JY.Person[id]["轻功"]*0.3*level)	
				break
			end
		end
		
		return qg
	end
	
	jqz = (getnewmove(Qg1(id)) + getnewmove1(JY.Person[id]["内力"], JY.Person[id]["内力最大值"]) + JY.Person[id]["体力"] / 30)
	
	jqz = math.modf(jqz)
	
	DrawString(x3 , y3+dh*2,jqz, C_CYGOLD, size*0.7)	
 
	local zyhb = nil
	if p["左右互搏"] == 1 then
		zyhb  = "◎"
		else
		zyhb  = "※"
		end
	DrawString(x3 , y3+dh*3.5, zyhb, M_LightBlue, size*0.7)
      local zyzd = nil	
	if id == 0 and (ZhongYongZD1(id) or ZhongYongZD2(id)) then
		zyzd  = "◎"
		else
		zyzd  = "※"
		end		
	DrawString(x3,y3+dh*4.5, zyzd, M_LightBlue, size*0.7)
     local mrdz = nil	
	if MuRongDZ(id) == true  then
		mrdz  = "◎"
		else
		mrdz  = "※"
		end		
	DrawString(x3,y3+dh*5.5, mrdz, M_LightBlue, size*0.7)
	
	
	
	DrawString(dx*360 , dy*616, "修炼", C_CYGOLD, size*0.7)
	local thingid = p["修炼物品"]
		if thingid > 0 then
			--lib.PicLoadCache(2, p["修炼物品"] * 2, x1 + size*4, y1*19+96-100, 1)
            DrawString(dx*400,dy*616, JY.Thing[thingid]["名称"], M_DeepSkyBlue, size*0.7)			
			i = i + 1
			local n = TrainNeedExp(id)
			if n < math.huge then
				DrawString(dx*360, dy*638, string.format("%5d/%5d", p["修炼点数"], n), C_CYGOLD, size*0.7)
			else
				DrawString(dx*360,  dy*638, string.format("%5d/===", p["修炼点数"]), C_CYGOLD, size*0.7)
			end
		else


	  --经验值
	  i = i + 1
		DrawString(x1-130, y1 + 12*h * (i)-40, "升级", C_CYGOLD, size*0.8)
		local kk = nil
		if p["等级"] >= 30 then
			kk = "   ="
		else
			p["等级"] = limitX(p["等级"],1,30)
			kk = 2 * (p["经验"] - CC.Exp[p["等级"] - 1])
			if kk < 0 then
				kk = "  0"
			elseif kk < 10 then
				kk = "   " .. kk
			elseif kk < 100 then
				kk = "  " .. kk
			elseif kk < 1000 then
				kk = " " .. kk
			end
		end		
		
		
		
		--等级
	--	DrawString(dx*189, dy*390, kk, C_CYGOLD, size*0.8)
	--	local tmp = nil
	--	if CC.Level <= p["等级"] then
	--		tmp = "="
	--	else
	--		tmp = 2 * (CC.Exp[p["等级"]] - CC.Exp[p["等级"] - 1])
	--	end
	--	DrawString(dx*209, dy*390, "/" .. tmp, C_CYGOLD, size*0.8)
	end
	---------------------------------------------------------------
		--第四列开始 武功栏
		x1 = dx*2 - size*2-30
		y1 = size*2+30
		i = 0
		local T = {"一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "极"}
	    local SortingNum = {"01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15"} 	
		for j = 1, 15 do
			i = i + 1
			local wugong = p["武功" .. j]
			if wugong > 0 then
				lib.LoadPNG(91, 18 * 2 ,dx*500, dy*90 + h * (i), 1)
				if JY.Wugong[wugong]["武功类型"] == 1 then
					lib.LoadPNG(91, 75 * 2 ,dx*695-30, dy*90 + h * (i), 1)
				elseif JY.Wugong[wugong]["武功类型"] == 2 then
					lib.LoadPNG(91, 76 * 2 ,dx*695-30, dy*90 + h * (i), 1)
				elseif JY.Wugong[wugong]["武功类型"] == 3 then
					lib.LoadPNG(91, 77 * 2 ,dx*695-30, dy*90 + h * (i), 1)
				elseif JY.Wugong[wugong]["武功类型"] == 4 then
					lib.LoadPNG(91, 78 * 2 ,dx*695-30, dy*90 + h * (i), 1)
				elseif JY.Wugong[wugong]["武功类型"] == 5 then
					lib.LoadPNG(91, 79 * 2 ,dx*695-30, dy*90 + h * (i), 1)
				elseif JY.Wugong[wugong]["武功类型"] == 6 then
					lib.LoadPNG(91, 80 * 2 ,dx*695-30, dy*90 + h * (i), 1)
				elseif JY.Wugong[wugong]["武功类型"] == 7 then
					lib.LoadPNG(91, 81 * 2 ,dx*695-30, dy*90 + h * (i), 1)
				end
				DrawString(dx*505, dy*95 + h * (i), SortingNum[j], C_WHITE, CC.FontSMALL)
				local level = math.modf(p["武功等级" .. j] / 100) + 1
				if p["武功等级" .. j] == 999 then
					level = 11
				end
				DrawString(dx*540, dy*93 + h * (i), string.format("%s", JY.Wugong[wugong]["名称"]), M_Orange, size*0.9)
				if p["武功等级" .. j] > 900 then
					DrawString(dx*540, dy*93 + h * (i), string.format("%s", JY.Wugong[wugong]["名称"]), M_Orange, size*0.9)
					lib.SetClip(0, 0, 0, 0)
				end
				--等级
				DrawString(dx*775, dy*93 + h * (i), T[level], C_CYGOLD, size*0.9)
				--耗内
				local nl = nil
		        nl = math.modf((level + 3) / 2) * JY.Wugong[wugong]["消耗内力点数"]
				DrawString(dx*695, dy*93 + h * (i), nl, C_CYGOLD, size*0.9)
				--如果是特技，显示特技
				if secondary_wugong(wugong) then
					DrawString(dx*825, dy*93 + h * (i), "特技", M_PaleGreen, size*0.9)
				--如果不是，则显示武功威力
				else
					--威力
					local wugongwl = get_skill_power(id, wugong, level)
					--区别天赋内外功的颜色
					if Given_WG(id, wugong) or Given_NG(id, wugong) then
						DrawString(dx*825, dy*93 + h * (i), string.format("%4d",wugongwl), PinkRed, size*0.9)
					--五岳剑法组合颜色
					elseif wugong >= 30 and wugong <= 34 and WuyueJFSL(id)>1 then
						DrawString(dx*825, dy*93 + h * (i), string.format("%4d",wugongwl), LightPurple, size*0.9)
					--琴棋书画组合颜色
					elseif (wugong == 73 or wugong == 72 or wugong == 84 or wugong == 142) and WGZH(id,72,73) then
						DrawString(dx*825, dy*93 + h * (i), string.format("%4d",wugongwl), LightPurple, size*0.9)
					--紫气天罗组合颜色
					elseif (wugong == 5 or wugong == 9 or wugong == 21 or wugong == 118) and WGZH(id,21,118) then
						DrawString(dx*825, dy*93 + h * (i), string.format("%4d",wugongwl), LightPurple, size*0.9)
					--毒布武林组合颜色 标记修改
					elseif (wugong==3 or wugong==120 or wugong==220  or wugong==295  or wugong==334) and DubuWL(id) then
						DrawString(dx*825, dy*93 + h * (i), string.format("%4d",wugongwl), LimeGreen, size*0.9)
					--桃花绝技组合颜色
					elseif (wugong == 12 or wugong == 18 or wugong == 38) and WGZH(id,12,18) then
						DrawString(dx*825, dy*93 + h * (i), string.format("%4d",wugongwl), LightPurple, size*0.9)
					--举火燎原组合颜色
					elseif (wugong == 61 or wugong == 65 or wugong == 66) and WGZH(id,61,65) then
						DrawString(dx*825, dy*93 + h * (i), string.format("%4d",wugongwl), LightPurple, size*0.9)
					--利刃寒锋组合颜色
					elseif (wugong == 58 or wugong == 174 or wugong == 153) and WGZH(id,58,174) then
						DrawString(dx*825, dy*93 + h * (i), string.format("%4d",wugongwl), LightPurple, size*0.9)
					--金刚般若组合颜色
			        elseif (wugong == 22 or wugong == 189 or wugong == 108) and JinGangBR(id) then
						DrawString(dx*825, dy*93 + h * (i), string.format("%4d",wugongwl), LightPurple, size*0.9)
					elseif WGZH(id,187,244) and (wugong == 244 or wugong == 187) then	
						DrawString(dx*825, dy*93 + h * (i), string.format("%4d",wugongwl), LightPurple, size*0.9)
				    --万毒玄冰	
					--else WanDuXB(id) and (wugong == 7 or wugong == 21 or wugong == 120) then
					--	DrawString(dx*825, dy*93 + h * (i), string.format("%4d",wugongwl), LightPurple, size*0.9)						
					--世尊降魔组合颜色
					elseif (wugong == 96 or wugong == 86 or wugong == 82 or wugong == 83 ) and ShiZunXM(id) then
						DrawString(dx*825, dy*93 + h * (i), string.format("%4d",wugongwl), LightPurple, size*0.9)
					--双剑合壁的组合颜色
					elseif (wugong == 39 or wugong == 42 or wugong == 139) and WGZH(id,39,42) then
						DrawString(dx*825, dy*93 + h * (i), string.format("%4d",wugongwl), LightPurple, size*0.9)							
					elseif wugong == 377 and JY.Person[592]["论剑奖励"] == 2 and TrueYJ(id) > 750 then
						DrawString(dx*825, dy*93 + h * (i), string.format("%4d",wugongwl), LightPurple, size*0.9)	
					else
						DrawString(dx*825, dy*93 + h * (i), string.format("%4d",wugongwl), RGB(208, 152, 208), size*0.9)
					end
				end
			end
		end
		i = 17
		if p["天赋内功"] ~= 0 then

			DrawString(dx*620, dy*76+ h * 17, JY.Wugong[p["天赋内功"]]["名称"], TG_Red_Bright, size*0.8)
		end
		if p["天赋轻功"] ~= 0 then

			DrawString(dx*786,dy*76+ h * 17, JY.Wugong[p["天赋轻功"]]["名称"], M_DeepSkyBlue,  size*0.8)
			i = i + 1
		end
		if p["天赋外功1"] ~= 0 then
			DrawString(dx*619, dy*72 + h * 18, JY.Wugong[p["天赋外功1"]]["名称"], C_GOLD,  size*0.8)
		end
		if p["天赋外功2"] ~= 0 then
			--DrawString(x1, y1 + h * (i), "天赋外功", LightPurple, size)
			DrawString(dx*778, dy*72 + h * 18, JY.Wugong[p["天赋外功2"]]["名称"], C_GOLD,  size*0.8)
		end
		
		x1 = dx - size *3 -10
		i = 20
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
		if dl then
			lib.PicLoadCache(101+p["头像代号"],(dl+AniFrame)*2,diyx/5+ax*2,diyy/4+ax*5+130) 	
		end
	-------------------------------------
	--属性显示 顾	
		x1 = dx-450
		y1 = size*2+360
		i = 3
        size = CC.FontSmall4*0.7

	-------------------------------------
	--第二页
	elseif page == 2 then

	--AI设定页面
	elseif page == 3  then
		lib.LoadPNG(91, 21 * 2 , 0 , 0, 1)
		
		local wg_color1 = C_WHITE
		local wg_color2 = C_ORANGE
		if JY.Status == GAME_WMAP then
			wg_color1 = M_DimGray
			wg_color2 = M_DimGray
		end
		
		x1 = size*2 + 10
		i = 0
		--DrawString(x1+size*13+7+20, y1-13, p["姓名"], C_CYGOLD, size)
		DrawString(dx*515-string.len(JY.Person[id]["姓名"])/2*size, dy*20, JY.Person[id]["姓名"], C_CYGOLD, size)
		y1 = y1 + h * 3
		local AI_s1_name = {"行为模式","优先使用","主运内功","主运轻功","是否吃药","生命阈值","内力阈值","体力阈值","禁用AI"}
		for j = 1, 9 do
			local color = LimeGreen
			if AI_s1 == j then
				color = C_GOLD
				DrawString(x1-size-2+10, y1 + h * (j-1)*2, "☆", color, size*0.9)
			end
			if JY.Status == GAME_WMAP and (j == 3 or j == 4) then
				color = M_DimGray
			end
			DrawString(x1+10, y1 + h * (j-1)*2, AI_s1_name[j], color, size*0.9)
		end
		local AI_1_s2_name = {"自动攻击","自动防御","原地休息","逃离休息"}
		for j = 1, 4 do
			local color = C_WHITE
			if AI_s2[1] == j then
				color = C_ORANGE
			end
			DrawString(x1+h*5*j, y1 + h * (i), AI_1_s2_name[j], color, size*0.9)
		end
		i = i + 2
		if p["优先使用"] == 0 then
			DrawString(x1+h*5, y1 + h * (i), "未设定", C_WHITE, size*0.9)
		else
			DrawString(x1+h*5, y1 + h * (i), JY.Wugong[p["优先使用"]]["名称"], C_ORANGE, size*0.9)
		end
		i = i + 2
		if p["主运内功"] == 0 then
			DrawString(x1+h*5, y1 + h * (i), "未运内功", wg_color1, size*0.9)	    
		else		
			DrawString(x1+h*5, y1 + h * (i), JY.Wugong[p["主运内功"]]["名称"], wg_color2, size*0.9)	

         end		
         i = i + 2
		if p["主运轻功"] == 0 then
			DrawString(x1+h*5, y1 + h * (i), "未运轻功", wg_color1, size*0.9)
		else
			DrawString(x1+h*5, y1 + h * (i), JY.Wugong[p["主运轻功"]]["名称"], wg_color2, size*0.9)
		end
		i = i + 2
		local AI_5_s2_name = {"是","否"}
		for j = 1, 2 do
			local color = C_WHITE
			if AI_s2[5] == j then
				color = C_ORANGE
			end
			DrawString(x1+h*5*j, y1 + h * (i), AI_5_s2_name[j], color, size*0.9)
		end
		i = i + 2
		local AI_6_s2_name = {"70%","50%","30%"}
		for j = 1, 3 do
			local color = C_WHITE
			if AI_s2[6] == j then
				color = C_ORANGE
			end
			DrawString(x1+h*5*j, y1 + h * (i), AI_6_s2_name[j], color, size*0.9)
		end
		i = i + 2
		local AI_7_s2_name = {"70%","50%","30%"}
		for j = 1, 3 do
			local color = C_WHITE
			if AI_s2[7] == j then
				color = C_ORANGE
			end
			DrawString(x1+h*5*j, y1 + h * (i), AI_7_s2_name[j], color, size*0.9)
		end
		i = i + 2
		local AI_8_s2_name = {"50","30","10"}
		for j = 1, 3 do
			local color = C_WHITE
			if AI_s2[8] == j then
				color = C_ORANGE
			end
			DrawString(x1+h*5*j, y1 + h * (i), AI_8_s2_name[j], color, size*0.9)
		end
		i = i + 2
		local AI_9_s2_name = {"是","否"}
		for j = 1, 2 do
			local color = C_WHITE
			if AI_s2[9] == j then
				color = C_ORANGE
			end
			DrawString(x1+h*5*j, y1 + h * (i), AI_9_s2_name[j], color, size*0.9)
		end
		
		if AI_menu_selected == 1 or AI_menu_selected > 4 then
			DrawString(x1+h*5*(AI_s2[AI_menu_selected])-h, y1 + h * (AI_menu_selected-1)*2+2, "→", C_ORANGE, size*0.99)
		end
		
		if AI_menu_selected > 1 and AI_menu_selected < 5 then
			DrawString(x1+h*4, y1 + h * (AI_menu_selected-1)*2+2, "←", C_ORANGE, size*0.99)
			DrawString(x1+h*9+12, y1 + h * (AI_menu_selected-1)*2+2, "→", C_ORANGE, size*0.9)
		end

		x1 = dx - size *5 -15
		y1 = size*2
		i = 19
		if AI_menu_selected > 0 then
			x1 = dx - 15
			DrawString(dx*211,dy*79, "【左右键选择 回车/ESC键确认】", C_CYGOLD, size*0.8)
		else
			DrawString(dx*211,dy*79, "【上下键选择 回车键确认 ←键返回天赋页面 ESC退出】", C_CYGOLD, size*0.8)
		end
	end
end

--主菜单
function MMenu()
    local menu={{"队伍",Menu_Teaminfo,1},
	            {"物品",Menu_Thing,1},
				{"医疗",Menu_Doctor,1},
	            {"解毒",Menu_DecPoison,1},
	            {"离队",Menu_PersonExit,1},
	            {"系统",Menu_System,1}
				};

    ShowMenu(menu,6,0,CC.MainMenuX,CC.MainMenuY,0,0,1,1,CC.DefaultFont,C_ORANGE, C_WHITE)
	local x1 =CC.ScreenH/2
	local y1 =CC.ScreenW/2
	--lib.LoadPicture("./data/body/999.png",x1,y1,CC.ScreenW/677*80)
end
--队伍菜单
function Menu_Teaminfo()
	local menu = {
		{"状态查看", Menu_Status, 1}, 
		{"队伍排序", Menu_TZDY, 1}}
	
	ShowMenu(menu, 2, 0, CC.MainSubMenuX, CC.MainSubMenuY, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE)
end
--状态子菜单
function Menu_Status()
	--无酒不欢：各状态下对应X轴
	local xcor = CC.MainSubMenuX +2*CC.MenuBorderPixel+4*CC.DefaultFont+5
	if JY.Status == GAME_WMAP then
		xcor = CC.MainSubMenuX + 15
	end

    DrawStrBox(xcor,CC.MainSubMenuY,"要查阅谁的状态",LimeGreen,CC.DefaultFont,C_GOLD);
	local nexty=CC.MainSubMenuY+CC.SingleLineHeight;

    local r = SelectTeamMenu(xcor,nexty);
    if r >0 then
        --ShowPersonStatus(r)
		PersonStatus(r)
		return 1;
	else
        Cls(xcor,CC.MainSubMenuY,CC.ScreenW,CC.ScreenH);
        return 0;
	end
end
function CMenu() 
	local bx,by = CC.ScreenW/1360,CC.ScreenH/768
	local cont = 1
	local cont2 = 1
	local cont3 = 1
	local cont4 = 1
	local cot4 = 0
	local page = 1
	local menu = {'人物','物品',MJMenu,'设置'}
	local menu2 = {'状态','排序','离队'}
	local menu3 = {nil,0,1,3,4}
	local menu4 = {Menu_ReadRecord,Menu_SaveRecord,Menu_SetMusic,Menu_SetSound,Menu_WPZL,pastReview,Menu_MYDIY,Menu_Exit2}

	local jg = bx*20
	while true do
		Cls()
		if JY.Restart == 1 then
			break
		end
		for i = 1,#menu do 
			lib.PicLoadCache(92,(1+i)*2,CC.ScreenW/2-((#menu-1)*bx*140)/2+(i-1)*bx*140,CC.ScreenH/2-bx*60,2,256,nil,bx*120)
			if cont ~= i then 
				lib.PicLoadCache(92,(1+i)*2,CC.ScreenW/2-((#menu-1)*bx*140)/2+(i-1)*bx*140,CC.ScreenH/2-bx*60,6,150,nil,bx*120)
			end
		end
		
		if page == 2 then 
			for i = 1,#menu2 do 
				lib.PicLoadCache(92,(5+i)*2,CC.ScreenW/2-((#menu2-1)*bx*140)/2+(i-1)*bx*140,CC.ScreenH/2+bx*60,2,256,nil,bx*100)
				if cont2 ~= i then 
					lib.PicLoadCache(92,(5+i)*2,CC.ScreenW/2-((#menu2-1)*bx*140)/2+(i-1)*bx*140,CC.ScreenH/2+bx*60,6,150,nil,bx*100)
				end
			end
		end
		
		if page == 3 then 
			for i = 1,#menu3 do 
				lib.PicLoadCache(92,(15+i)*2,CC.ScreenW/2-((#menu3-1)*bx*140)/2+(i-1)*bx*140,CC.ScreenH/2+bx*60,2,256,nil,bx*100)
				if cont3 ~= i then 
					lib.PicLoadCache(92,(15+i)*2,CC.ScreenW/2-((#menu3-1)*bx*140)/2+(i-1)*bx*140,CC.ScreenH/2+bx*60,6,150,nil,bx*100)
				end
			end
		end
		
		if page == 4 then 
			for i = 1,4 do 
				for j = 1,2 do
					local tid = i + (j-1)*4
					lib.PicLoadCache(92,(20+tid)*2,CC.ScreenW/2-((#menu4/2-1)*bx*140)/2+(i-1)*bx*140,CC.ScreenH/2+bx*60+(j-1)*bx*120,2,256,nil,bx*100)
					if cont4+cot4*4 ~= tid then 
						lib.PicLoadCache(92,(20+tid)*2,CC.ScreenW/2-((#menu4/2-1)*bx*140)/2+(i-1)*bx*140,CC.ScreenH/2+bx*60+(j-1)*bx*120,6,150,nil,bx*100)
					end
				end
			end
		end
		
		ShowScreen()
		lib.Delay(CC.BattleDelay)
		local X,ktype,mx,my = lib.GetKey()
		if X == VK_SPACE or X == VK_RETURN then 
			if page == 1 then
				if cont == 1 then 
					page = 2
				elseif cont == 2 then
					page = 3
				elseif cont == 4 then
					page = 4
				else 
					menu[cont]()
				end
			elseif page == 2 then 
				Team({menu2[cont2]})
			elseif page == 3 then 
				ThingMenu(menu3[cont3])
				if JY.ThingUse >= 0 then 
					JY.ThingUse = 0
					return 1
				end
				if JY.Status == GAME_WMAP then
					return 1
				end
			elseif page == 4 then 	
				local r = menu4[cont4+cot4*4]()
				if cont4+cot4*4 == #menu4 or cont4+cot4*4 == 1 then
					if r == 1 then
						break
					end
				end
			end
		elseif X == VK_ESCAPE or ktype == 4 then
			if page == 2 then 
				page = 1 
				cont2 = 1
			elseif page == 3 then 
				page = 1
				cont3 = 1
			elseif page == 4 then 
				page = 1
				cont4 = 1
				cot4 = 0
			else 	
				break
			end
		elseif X == VK_LEFT then
			if page == 1 then 
				cont = cont - 1 
				if cont < 1 then 
					cont = #menu
				end
			elseif page == 2 then 
				cont2 = cont2 - 1 
				if cont2 < 1 then 
					cont2 = #menu2
				end
			elseif page == 3 then 
				cont3 = cont3 - 1 
				if cont3 < 1 then 
					cont3 = #menu3
				end
			elseif page == 4 then 
				if cont4 > 1 then 
					cont4 = cont4 - 1
				else
					if cot4 > 0 then 
						cot4 = cot4 - 1
						cont4 = 4
					else
						cont4 = 4
						cot4 = math.ceil((#menu4-cont4)/4)
					end
				end
			end
		elseif X == VK_RIGHT then
			if page == 1 then 
				cont = cont + 1 
				if cont > #menu then 
					cont = 1
				end
			elseif page == 2 then 
				cont2 = cont2 + 1 
				if cont2 > #menu2 then 
					cont2 = 1
				end
			elseif page == 3 then 
				cont3 = cont3 + 1 
				if cont3 > #menu3 then 
					cont3 = 1
				end
			elseif page == 4 then
				if cont4 + cot4*4 < #menu4 then
					if cont4 < 4 then 
						cont4 = cont4 + 1
					else 
						cont4 = 1 
						cot4 = cot4 + 1
					end
				else 
					cont4 = 1 
					cot4 = 0
				end
			end
		elseif X == VK_UP or ktype == 6 then
			if page == 4 then
				if cot4 > 0 then
					cot4 = cot4 - 1
				else 
					cot4 = math.ceil((#menu4)/4) - 1
				end
			end
		elseif X == VK_DOWN or ktype == 7 then
			if page == 4 then
				if cot4 < math.ceil((#menu4)/4) - 1 then
					cot4 = cot4 + 1
				else 
					cot4 = 0
				end
			end
		else 
			local mxx = false
			if page == 1 then 
				for i = 1,#menu do 
					if mx >= CC.ScreenW/2-((#menu-1)*bx*140)/2+(i-1)*bx*140 - bx*60 and mx <= CC.ScreenW/2-((#menu-1)*bx*140)/2+(i-1)*bx*140 + bx*60
						and my >= CC.ScreenH/2-bx*120 and my <= CC.ScreenH/2 then 
						cont = i 
						mxx = true
						break
					end
				end
			elseif page == 2 then
				for i = 1,#menu2 do 
					if mx >= CC.ScreenW/2-((#menu2-1)*bx*140)/2+(i-1)*bx*140 - bx*50 and mx <= CC.ScreenW/2-((#menu2-1)*bx*140)/2+(i-1)*bx*140 + bx*50
						and my >= CC.ScreenH/2+bx*10 and my <= CC.ScreenH/2+bx*110 then 
						cont2 = i 
						mxx = true
						break
					end
				end
			elseif page == 3 then
				for i = 1,#menu3 do 
					if mx >= CC.ScreenW/2-((#menu3-1)*bx*140)/2+(i-1)*bx*140 - bx*50 and mx <= CC.ScreenW/2-((#menu3-1)*bx*140)/2+(i-1)*bx*140 + bx*50
						and my >= CC.ScreenH/2+bx*10 and my <= CC.ScreenH/2+bx*110 then 
						cont3 = i 
						mxx = true
						break
					end
				end
			elseif page == 4 then
				for i = 1,4 do 
					for j = 1,2 do 
						if mx >= CC.ScreenW/2-((#menu4/2-1)*bx*140)/2+(i-1)*bx*140 - bx*50 and mx <= CC.ScreenW/2-((#menu4/2-1)*bx*140)/2+(i-1)*bx*140 + bx*50
							and my >= CC.ScreenH/2+bx*10+(j-1)*bx*120 and my <= CC.ScreenH/2+bx*110+(j-1)*bx*120 then 
							cont4 = i
							cot4 = j-1
							mxx = true
							break
						end
					end
				end
			end
			if mxx == true and ktype == 3 then 
				if page == 1 then
					if cont == 1 then 
						page = 2
					elseif cont == 2 then
						page = 3
					elseif cont == 4 then
						page = 4
					else 
						menu[cont]()
					end
				elseif page == 2 then 
					Team({menu2[cont2]})
				elseif page == 3 then 
					ThingMenu(menu3[cont3])
					if JY.ThingUse >= 0 then 
						JY.ThingUse = 0
						return 1
					end
					if JY.Status == GAME_WMAP then
						return 1
					end
				elseif page == 4 then 	
					local r = menu4[cont4+cot4*4]()
					if cont4+cot4*4 == #menu4 or cont4+cot4*4 == 1 then
						if r == 1 then 
							break
						end
					end
				end
			end
		end
	end

end
