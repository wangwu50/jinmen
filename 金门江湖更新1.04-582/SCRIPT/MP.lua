function ownMP()
	if GetS(106, 0, 0, 0) == 1 then
		return true
	end
	return false
end

function ownMPstat(flag)
	local wugong = 122
	local name = {JY.Wugong[wugong]["名称"], nil, 1, "宗师"}
	local level = {"入门弟子", "高级弟子", "掌门"}
	local attrib = {} 
	for i = 1, 9 do
		attrib[i] = JY.Wugong[wugong][i.."级杀伤内力"] * 0.1
	end
	local askill = {GRTS[JY.Wugong[wugong]["未知4"]], GRTS[JY.Wugong[wugong]["未知5"]]}
	if flag == 1 then
		return name
	elseif flag == 2 then
		return level
	elseif flag == 3 then
		return attrib
	else
		return askill
	end
end

function MPPD(tmppid)
    -- local xwperson
	-- if tmppid == JY.Base["畅想"] then
		-- xwperson = 0
	-- else
		-- xwperson = tmppid
	-- end	
	-- if JY.Person[xwperson]["门派"] == nil or JY.Person[xwperson]["门派"] < 101 then
		-- return 0
	-- end
	--return tmppid
	local xwperson = JY.Person[tmppid]["门派"]
	
	return 1
end

function MPDJ(tmppid)
    local xwperson
	if tmppid == JY.Base["畅想"] then
		xwperson = 0
	else
		xwperson = tmppid
	end	
	local mpdj
	if MPPD(xwperson) == 0 then
		return 0
	end
	mpdj = math.fmod(JY.Person[xwperson]["无用"], 100)
	return mpdj
end

function MPDISPLAY(tmppid) --门派显示
	local aa = MPPD(tmppid)
	local bb = MPDJ(tmppid)
	if aa == 63 then
		local name = ownMPstat(1)
		local level = ownMPstat(2)
		local mptype = name[1]
		local mpdj = level[bb]
		return mptype, mpdj
	end
	if CC.MP[aa][1] == nil or CC.MPDJ[aa][bb] == nil then
		return nil, nil
	end
	local mptype = CC.MP[aa][1]
	local mpdj = CC.MPDJ[aa][bb]
	return mptype, mpdj
end

--猪脚判断
function zj()
	--if GetS(103, 0, 0, 1) < 0 then
		--return 0
	--end
	--return GetS(103, 0, 0, 1)
	return 0
end

function JoinMP(tmppid, mptype, mpdj)
	if tmppid == 0 then
		tmppid = zj()
	end
	if tmppid == JY.Base["畅想"] then
		tmppid = zj()
	end
	if tmppid == 0 and  MPPD(zj()) ~= mptype then 
	   SetS(106, MPPD(zj()), 0, 0, 1)
	   SetS(106, MPPD(zj()), 1, 0, 0)
	end
	if MPPD(zj()) ~= 0 and  MPPD(zj()) ~= mptype and tmppid == 0 then 
	   SetS(106, MPPD(zj()), 0, 0, 1)
	   SetS(106, MPPD(zj()), 1, 0, 0)
	end
	if GetS(106, mptype, 0, 0) == 1 and tmppid == 0 then 
	else
	JY.Person[tmppid]["无用"] = mptype * 100 + mpdj
	AddPersonAttrib(tmppid, "内力最大值", -1)
	AddPersonAttrib(tmppid, "内力最大值", 1)
	AddPersonAttrib(tmppid, "生命最大值", -1)
	AddPersonAttrib(tmppid, "生命最大值", 1)	
	if JY.Person[tmppid]["内力"] > JY.Person[tmppid]["内力最大值"] then
		JY.Person[tmppid]["内力"] = JY.Person[tmppid]["内力最大值"]
	end
	if JY.Person[tmppid]["生命"] > JY.Person[tmppid]["生命最大值"] then
		JY.Person[tmppid]["生命"] = JY.Person[tmppid]["生命最大值"]
	end	
	end
	--clearHZ2(tmppid)
end

function MPReq(tmppid, mptype) --队友条件
	if MPPD(tmppid) == MPPD(0) and MPDJ(tmppid) == MPDJ(0) - 1 then
		return false
	end
	if mptype == 1 then
        return true
	elseif mptype == 2 or mptype == 3 then
		if JY.Person[tmppid]["品德"] >= 50 then
			return true
		end	
	elseif mptype == 4 then
		if JY.Person[tmppid]["内力最大值"] >= 2000 then
			return true
		end		
	elseif mptype == 5 then
		if JY.Person[tmppid]["内力最大值"] >= 3000 then
			return true
		end
	elseif mptype == 6 then
		if JY.Person[tmppid]["御剑能力"] >= 100 then
			return true
		end	
	elseif mptype == 7 then
		if JY.Person[tmppid]["用毒能力"] >= 75 then
			return true
		end	
	elseif mptype == 8 then
		if JY.Person[tmppid]["资质"] >= 75 then
			return true
		end	
	elseif mptype == 11 then
		if JY.Person[tmppid]["御剑能力"] >= 300 then
			return true
		end	
	elseif mptype == 12 then
		if JY.Person[tmppid]["品德"] > 50 then
			return true
		end	
	elseif mptype == 13 then
		if JY.Person[tmppid]["内力最大值"] >= 3000 then
			return true
		end
	elseif mptype == 13 then
		if JY.Person[tmppid]["御剑能力"] >= 100 then
			return true
		end				
	elseif mptype == 63 then
		return true
	end
	return false
end

function MPAttrib(pid, att)	
	local function tox(aa)
		local str = ""
		if aa == 1 then
			str = "攻击力"
		elseif aa == 2 then
			str = "防御力"
		elseif aa == 3 then
			str = "轻功"
		end
		return str
	end
	local add = 0
	if MPPD(pid) == 0 then
		add = CC.MPAttrib[MPPD(pid)][att]	
	else
	    add = CC.MPAttrib[MPPD(pid)][att]
		if MPPD(pid) == 4 and MPDJ(pid) > 2 then
			if att == 1 then
				add = 1.1
			elseif att == 2 then
				add = 1.1
			end
		end
		if att == 1 then		
			add = math.modf(add * JY.Person[pid]["攻击力"] - JY.Person[pid]["攻击力"]) 
		elseif att == 2 then
			add = math.modf(add * JY.Person[pid]["防御力"] - JY.Person[pid]["防御力"]) 
		elseif att == 3 then
			add = math.modf(add * JY.Person[pid]["轻功"] - JY.Person[pid]["轻功"]) 
		end		
	end	
	if att == 4 then

	end
	if att == 5 then
	
	end
	if att == 1 or att == 2 or att == 3 then

	end
	if att == 1 then

	elseif att == 2 then

	elseif att == 3 then

	end
	return add
end
function PJPD(pp)
	if GetS(106, pp, 0, 0) ~= 0 then
		return true
	else
		return false
	end
end

function PDReq(pid, str, aa, bb)
	if JY.Person[pid][str] >= aa and JY.Person[pid][str] <= bb then
		return true
	else
		return false
	end
end