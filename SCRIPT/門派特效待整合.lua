--门派攻击抬手特效
--武当2级弟子学会纯阳用拳法
	    



    --大理3级
		if ((MPPD(pid) == 15 and MPDJ(pid) >= 3 and Curr_NG(pid,314)) or match_ID(pid,499)) and JLSD(20,55,pid) then	
			local a = JY.Person[pid]["生命"]/JY.Person[pid]["生命最大值"]
	        local b = JY.Person[pid]["内力"]/JY.Person[pid]["内力最大值"]
		    if b < a then 
				CurIDTXDH(WAR.CurID, 108, 1, "龙气自生")
				ztd(WAR.CurID,"内力点数",math.random(1000,1500))
			end 
		end	

		--大里主運天南易阳
		if PersonKF(pid,314) and JY.Person[pid]["生命"] > 0 then
			local a = JY.Person[pid]["灼烧程度"] 
			local b = JY.Person[pid]["灼烧程度"] * 2
			ztd(WAR.CurID,"内力点数",a)
			ztd(WAR.CurID,"体力点数",b)
			CurIDTXDH(WAR.CurID, 76, 1, "阳气滋补")
			War_Show_Count(WAR.CurID)
		end 

	--全真3级主运先天功
		if ((MPPD(pid) == 16 and MPDJ(pid) >= 3 and Curr_NG(pid,100)) and JLSD(10,40,pid)) or match_ID(pid,129) or match_ID(pid,64) and JY.Person[pid]["生命"] > 0 and WAR.ACT <= 5 then
	        local a = 1
			local b = 1
			local c = 1
			local mpdj = MPDJ(pid) * 300
			a = mpdj* 0.2
			b = a * 3
			c = 5 + math.modf(JY.Person[pid]["受伤程度"] / 10)
			ztd(WAR.CurID,"生命点数",a)
			ztd(WAR.CurID,"内力点数",b)
			ztd(WAR.CurID,"内伤点数",-c)
			ztd(WAR.CurID,"中毒点数",-c)
			CurIDTXDH(WAR.CurID,109, 1, "先天真气调息");
			War_Show_Count(WAR.CurID)
    	end		
		
		--大理2级主运枯禅
		if (MPPD(pid) == 15 and MPDJ(pid) >= 2 and Curr_NG(pid,207)) or match_ID(pid,499) and JY.Person[pid]["生命"] > 0 and WAR.ACT <= 5 then
			local a = 1
			local b = 1
			local c = 1
			local mpdj = MPDJ(pid) * 400
			a = mpdj * 0.25
			b = a * 2
			c = 5 + math.modf(JY.Person[pid]["受伤程度"] / 10)
			ztd(WAR.CurID,"生命点数",a)
			ztd(WAR.CurID,"内力点数",b)
			ztd(WAR.CurID,"内伤点数",-c)
			ztd(WAR.CurID,"中毒点数",-c)
			CurIDTXDH(WAR.CurID, 151, 1, "大理心法调息");
			War_Show_Count(WAR.CurID)
   		end			
			
		 	
		
		--崆峒3级
		if MPPD(pid) == 18 and MPDJ(pid) >= 3 and JLSD(20,60,pid)	and JY.Person[pid]["生命"] > 0 and WAR.ACT <= 5 then
		    local a = TrueQZ(pid)
			WAR.Person[WAR.CurID]["生命点数"] = (WAR.Person[WAR.CurID]["生命点数"] or 0) + AddPersonAttrib(pid, "生命", a);
		    WAR.Person[WAR.CurID]["内力点数"] = (WAR.Person[WAR.CurID]["内力点数"] or 0) + AddPersonAttrib(pid, "内力", a);
			CurIDTXDH(WAR.CurID, 51, 1, "上清秘气");
			War_Show_Count(WAR.CurID)
		end

		--全真先天神照	
      if NGQH(pid,100) and WAR.XTZQ[pid] ~= nil and WAR.XTZQ[pid] > 0 then
		    local cs = ""
		    local names = 
		    {
	    	{1,"一" },
		    {2, "二"},
		    {3, "三"},
		    {4, "四"},
		    {5, "五"},
				{6, "六"},
				{7, "七"},	
		    }
		    for i,v in ipairs(names) do
			    if v[1] == WAR.XTZQ[pid] then
				    cs = v[2]
				    break
			    end
		    end
        if WAR.Person[id]["特效文字1"] ~= nil then
    	    WAR.Person[id]["特效文字1"] = WAR.Person[id]["特效文字1"] .. "+" .."先天真气"..cs.."层"
        else
    	    WAR.Person[id]["特效文字1"] = "先天真气"..cs.."层"
        end
        WAR.XTZQ[pid] = WAR.XTZQ[pid] - 1
        if WAR.XTZQ[pid] <= 0 then 
          WAR.XTZQ[pid] = nil 
		    end 	
	    end

	    

	    

        


	    --云梦涧
		if MPPD(id) == 26 then
			WAR.WS = 1;
	        for i = 0, CC.WarWidth - 1 do
	            for j = 0, CC.WarHeight - 1 do
	                local effect = GetWarMap(i, j, 4)
	                if 0 < effect then
	                    local emeny = GetWarMap(i, j, 2)
	    			    if 0 <= emeny and WAR.Person[emeny]["我方"] == WAR.Person[emeny]["我方"] and emeny ~= WAR.CurID then
	    				    local tp = WAR.Person[emeny]["人物编号"];
							AddPersonAttrib(tp,"受伤程度",-JY.Person[tp]["受伤程度"])
							AddPersonAttrib(tp,"冰封程度",-JY.Person[tp]["冰封程度"])
							AddPersonAttrib(tp,"灼烧程度",-JY.Person[tp]["灼烧程度"])
							AddPersonAttrib(tp,"中毒程度",-JY.Person[tp]["中毒程度"])
							AddPersonAttrib(tp,"封穴程度",-JY.Person[tp]["封穴程度"])
							AddPersonAttrib(tp,"流血程度",-JY.Person[tp]["流血程度"])
	    				    SetWarMap(i, j, 4, 2)
	    			    end
	    		    end
	    	    end
	        end
		end	

		--丐帮帮主
	

  	--少林3级弟子易筋经
	if (MPPD(pid) == 5 and MPDJ(pid) >= 3 and Curr_NG(pid,108))	and JLSD(25,55,pid) then
		if WAR.Person[id]["特效文字3"] ~= nil then
         	WAR.Person[id]["特效文字3"] = WAR.Person[id]["特效文字3"] .. "+灭罪真言·莲华洗秽"
        else
			WAR.Person[id]["特效文字3"] = "灭罪真言·莲华洗秽"
		end
	    ng = ng + 2000
	    if (WAR.PD['极意攻击'][pid] or 0) < 9 then 
		  	WAR.PD['极意攻击'][pid] = 9
	  	end
    end
		
	--崆峒3级	
    if MPPD(pid) == 18 and MPDJ(pid) >= 3 and JLSD(20,60,pid) then 	
		if WAR.Person[id]["特效文字3"] ~= nil then
       	    WAR.Person[id]["特效文字3"] = WAR.Person[id]["特效文字3"] .. "+三焦齐逆魂飞扬"
        else
			WAR.Person[id]["特效文字3"] = "三焦齐逆魂飞扬"
		end
	    local zq = math.modf(TrueQZ(pid) / 150)
	    if (WAR.PD['极意攻击'][pid] or 0) < zq then 
	  		WAR.PD['极意攻击'][pid] = zq
	  	end
    end	
		
	--一刀流
	if MPPD(pid) == 11 and wugong == 151 then
		if WAR.ZLJS4 == 1 or WAR.ZLJS5 == 1 then
	    	ng = ng + 1500
            if (WAR.PD['极意攻击'][pid] or 0) < 7 then 
		  		WAR.PD['极意攻击'][pid] = 7
		  	end
        end
	end 	
		
	--一刀流
	if MPPD(pid) == 11 and MPDJ(pid) >= 2 and wugong == 151 and Curr_NG(pid,152) then
		if WAR.ZLJS6 == 1 then 
		    local zq = math.modf(TrueYJ(pid) / 150)
            local zq2 = TrueYJ(pid)
			ng = ng + 2000
            if (WAR.PD['极意攻击'][pid] or 0) < zq then 
		  		WAR.PD['极意攻击'][pid] = zq
		  	end
	    end
    end

   

    --冰封天下
		if MPTX(pid,14,2) and WAR.BFTX == 1 then 
			CleanWarMap(4, 0)
			for i = 0, WAR.PersonNum - 1 do
				if WAR.Person[i]["我方"] ~= WAR.Person[WAR.CurID]["我方"] and WAR.Person[i]["死亡"] == false then
					SetWarMap(WAR.Person[i]["坐标X"], WAR.Person[i]["坐标Y"], 4, 1)
				end
			end	
			WAR.WS = 1
			for j = 0, WAR.PersonNum - 1 do
    			if WAR.Person[j]["死亡"] == false and WAR.Person[j]["我方"] ~= WAR.Person[WAR.CurID]["我方"] then
					local tmppid = WAR.Person[j]["人物编号"]
					WAR.PD['利刃寒锋'][tmppid] = WAR.PD['利刃寒锋'][tmppid] or 0 + math.random(1,8)
					WAR.PD['冰冻状态'][tmppid] = WAR.PD['冰冻状态'][tmppid] or 0 + math.random(20,50)
				end
			end		
		end


		



		
        


         --改逍遥专属七宝琉璃 标记修改
       