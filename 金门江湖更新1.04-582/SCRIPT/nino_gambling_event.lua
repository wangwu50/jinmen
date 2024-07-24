--instruct_3(3,1,-2,-2,30015,-2,-2,-2,-2,-2,-2,-2,-2)
--instruct_3(60,0,-2,-2,30015,-2,-2,-2,-2,-2,-2,-2,-2)
--instruct_3(61,3,-2,-2,30015,-2,-2,-2,-2,-2,-2,-2,-2)

local function char(aa)
	local str = ""
	local names = 
		{{1,"һ"},
		{2, "��"},
		{3, "��"},
		{4, "��"},
		{5, "��"},
		{6, "��"},
		{7, "��"},
		{8, "��"},
		{9, "��"},
		{10, "һʮ"},
		{11, "һʮһ"},
		{12,"һʮ��" },
		{13, "һʮ��"},
		{14, "һʮ��"},
		{15, "һʮ��"},
		{16, "һʮ��"},
		{17, "һʮ��"},
		{18, "һʮ��"},	
	}
	for i = 1, #names do
		if aa == i then
			str = names[i][2]
			break
		end
	end
	return str
end

function play()
	local a, b, c = 0
	local count = math.random(10, 20) 
	local bg = CONFIG.PicturePath .. "game.jpg"
	local x = CC.ScreenW / 2
	local y = CC.ScreenH / 2	
	for i = 1, count do
		a = math.random(401, 406)
		b = math.random(401, 406)
		c = math.random(401, 406)
		Cls()
		--lib.LoadPicture(bg, -1, -1)
		lib.LoadPNG(91,a*2,x - 180, y)
		lib.LoadPNG(91,b*2,x, y)
		lib.LoadPNG(91,c*2,x + 180, y)
		ShowScreen()
		lib.Delay(100)
		if i >= count - 5 then
			lib.Delay(300)
		end
		if i >= count - 2 then
			lib.Delay(500)
		end		
	end
	lib.Delay(700)
	a = a - 400
	b = b - 400
	c = c - 400
	return a, b, c
end

function daxiao() --��С
		Cls()	
		local nexty = CC.ScreenH/2-CC.DefaultFont*4 + CC.SingleLineHeight
		local dx = {
				{"��",nil,1},   
				{"С",nil,1},
			}	
		local bet = {0, 0}
		local r2 =ShowMenu2(dx, #dx, 4, 5, CC.ScreenW/2-CC.DefaultFont*10-20, nexty, 0, 0, 1, 0, CC.DefaultFont, C_ORANGE, C_WHITE,"���ĸ�")
		--local r2 = ShowMenu(dx, #dx, 2, -2, -2, -2, -2, 1, 0, 30, C_GOLD, C_WHITE, "���ĸ���")		
		if r2 == 1 then
			bet = {11, 17}
		else
			bet = {4, 10}
		end
		local a, b, c = play()
		local sum = a + b + c
		local word = ""	
		if a == b and b == c then
			Cls()
			say(char(a).."��"..char(b).."��"..char(c).."��Χ����ׯ��ͨ�ԣ�",220,0,"��ְС��") 	
			return false	
		end
		if sum >= 11 and sum <= 17 then
			word = "��"
		end
		if sum >= 4 and sum <= 10 then
			word = "С"
		end			
		if sum >= bet[1] and sum <= bet[2] then
			Cls()
			say(char(a).."��"..char(b).."��"..char(c).."��"..word.."���м�Ӯ��",220,0,"��ְС��") 			
			return true
		else
			Cls()
			say(char(a).."��"..char(b).."��"..char(c).."��"..word.."��ׯ��Ӯ��",220,0,"��ְС��") 		
			return false
		end
	end
	
function twodie() --����
	Cls()	
	local nexty = CC.ScreenH/2-CC.DefaultFont*4 + CC.SingleLineHeight
	local dx = {
			{"һ",nil,1},   
			{"��",nil,1},
			{"��",nil,1},   
			{"��",nil,1},
			{"��",nil,1},   
			{"��",nil,1},				
		}	
	--local x = ShowMenu3(dx, #dx, 3, -2, -2, -2, -2, 1, 0, 30, C_GOLD, C_WHITE, "��ѡ��һ������", "", M_DimGray)	
	local x =ShowMenu2(dx, #dx, 4, 5, CC.ScreenW/2-CC.DefaultFont*10-20, nexty, 0, 0, 1, 0, CC.DefaultFont, C_ORANGE, C_WHITE,"��ѡ��һ������")
	dx[x][3] = 2
	Cls()
	--local y = ShowMenu3(dx, #dx, 3, -2, -2, -2, -2, 1, 0, 30, C_GOLD, C_WHITE, "��ѡ�ڶ�������", "", M_DimGray)	
	local y =ShowMenu2(dx, #dx, 4, 5, CC.ScreenW/2-CC.DefaultFont*10-20, nexty, 0, 0, 1, 0, CC.DefaultFont, C_ORANGE, C_WHITE,"��ѡ��һ������")
	local a, b, c = play()
	local pd = 0
	if a == x or b == x or c == x then
		pd = pd + 1
	end
	if a == y or b == y or c == y then
		pd = pd + 1
	end
	if pd == 2 then
		Cls()
		say(char(a).."��"..char(b).."��"..char(c).."����"..char(x).."��"..char(y).."�����������������ˣ�",220,0,"��ְС��") 	
		return true
	else
		Cls()
		say(char(a).."��"..char(b).."��"..char(c).."���ܱ�Ǹ��������ˣ�",220,0,"��ְС��") 			
		return false
	end
end	

function doubledie() --�p��
	Cls()	
	local nexty = CC.ScreenH/2-CC.DefaultFont*4 + CC.SingleLineHeight
	local dx = {
			{"һ",nil,1},   
			{"��",nil,1},
			{"��",nil,1},   
			{"��",nil,1},
			{"��",nil,1},   
			{"��",nil,1},				
		}	
	local x =ShowMenu2(dx, #dx, 4, 5, CC.ScreenW/2-CC.DefaultFont*10-20, nexty, 0, 0, 1, 0, CC.DefaultFont, C_ORANGE, C_WHITE,"��ѡ��һ������")
	--local x = ShowMenu3(dx, #dx, 3, -2, -2, -2, -2, 1, 0, 30, C_GOLD, C_WHITE, "��ѡ��һ������", "", M_DimGray)		
	local a, b, c = play()
	local pd = 0
	if a == x then
		pd = pd + 1
	end
	if b == x then
		pd = pd + 1
	end
	if c == x then
		pd = pd + 1
	end		
	if pd >= 2 then
		Cls()
		say(char(a).."��"..char(b).."��"..char(c).."��˫�����������ˣ�",220,0,"��ְС��") 	
		return true
	else
		Cls()
		say(char(a).."��"..char(b).."��"..char(c).."���ܱ�Ǹ��������ˣ�",220,0,"��ְС��") 			
		return false
	end
end		

function tripledie() --����
	Cls()	
	local nexty = CC.ScreenH/2-CC.DefaultFont*4 + CC.SingleLineHeight
	local dx = {
			{"һ",nil,1},   
			{"��",nil,1},
			{"��",nil,1},   
			{"��",nil,1},
			{"��",nil,1},   
			{"��",nil,1},				
		}	
	local x =ShowMenu2(dx, #dx, 4, 5, CC.ScreenW/2-CC.DefaultFont*10-20, nexty, 0, 0, 1, 0, CC.DefaultFont, C_ORANGE, C_WHITE,"��ѡ��һ������")
	--local x = ShowMenu3(dx, #dx, 3, -2, -2, -2, -2, 1, 0, 30, C_GOLD, C_WHITE, "��ѡ��һ������", "", M_DimGray)		
	local a, b, c = play()
	local pd = 0
	if a == x then
		pd = pd + 1
	end
	if b == x then
		pd = pd + 1
	end
	if c == x then
		pd = pd + 1
	end		
	if pd > 2 then
		Cls()
		say(char(a).."��"..char(b).."��"..char(c).."��Χ"..char(x).."���������ˣ�",220,0,"��ְС��") 	
		return true
	else
		Cls()
		say(char(a).."��"..char(b).."��"..char(c).."���ܱ�Ǹ��������ˣ�",220,0,"��ְС��") 			
		return false
	end
end			

function samedie() --ȫ��

		Cls()		
		local a, b, c = play()
		local pd = 0
		if a == b then
			pd = pd + 1
		end
		if b == c then
			pd = pd + 1
		end	
		if pd > 1 then
			Cls()
			say(char(a).."��"..char(b).."��"..char(c).."�����ӣ��������ˣ�",220,0,"��ְС��") 	
			return true
		else
			Cls()
			say(char(a).."��"..char(b).."��"..char(c).."���ܱ�Ǹ��������ˣ�",220,0,"��ְС��") 			
			return false
		end	
	end
	
newkdef[30015] = function() --�Ĳ�	
	Cls()
	local nexty = CC.ScreenH/2-CC.DefaultFont*4 + CC.SingleLineHeight
	say("���������ְ����ҵ���͹�Ҫ��Ҫ��㶫�����Ĳ�ÿ�ֶ���������Ϸÿ���������",220,0,"��ְС��") 	
	local menuItem = {
			{"�Ĳ�",nil,1},   
			{"��Ϸ",nil,1},
			{"�ҽ�",nil,1},
			{"ȡ��",nil,1},
		}
	local r = 0
	Cls()
	r=ShowMenu(menuItem,#menuItem,0,CC.MainMenuX,CC.MainMenuY,0,0,1,1,CC.DefaultFont,C_ORANGE, C_WHITE)
	--r =ShowMenu2(menuItem, #menuItem, 4, 5, CC.ScreenW/2-CC.DefaultFont*10-20, nexty, 0, 0, 1, 0, CC.DefaultFont, C_ORANGE, C_WHITE,"Ҫ��ʲô")
	--r = ShowMenu3(menuItem, #menuItem, 1, -2, -2, -2, -2, 1, 0, 30, C_GOLD, C_WHITE, "Ҫ��ʲô��")
	if r < 1 or r == 4 then
		do return end
	end	
	if r == 2 then
		if instruct_31(500) == false then
			Cls()
			say("�����ϵ�Ǯ������",220,0,"��ְС��") 		
			do return end
		end	
		newkdef[4000]()
		do return end
	end	
	if r == 3 then
		if (JY.Thing[203]["δ֪7"] or 0) < 0 then
			do return end
		end
		newkdef[4001]()
		do return end
	end
	if instruct_31(500) == false then
		Cls()
		say("�����ϵ�Ǯ������",220,0,"��ְС��") 		
		do return end
	end	
	Cls()
	say("������ʾ��С�����飬��������͹����������С�",220,0,"��ְС��") 	
	local menuItem = {
			{"��С",nil,1},   
			{"����",nil,1},
			{"˫��",nil,1},
			{"Χ��",nil,1},
			{"ȫΧ",nil,1},
		}
	local r = 0
	Cls()
	r = ShowMenu(menuItem,#menuItem,0,CC.MainMenuX,CC.MainMenuY,0,0,1,1,CC.DefaultFont,C_ORANGE, C_WHITE)
	--r =ShowMenu2(menuItem, #menuItem, 4, 5, CC.ScreenW/2-CC.DefaultFont*10-20, nexty, 0, 0, 1, 0, CC.DefaultFont, C_ORANGE, C_WHITE,"Ҫ����������")
	--r = ShowMenu3(menuItem, #menuItem, 5, -2, -2, -2, -2, 1, 0, 30, C_GOLD, C_WHITE, "Ҫ���������ӣ�")
	if r < 1 then
		do return end
	end
	local win = false
	local ratio = 0
	instruct_2(174, -200)
	if r == 1 then
		Cls()
		say("�Ĵ�С������ʮ��ΪС��ʮһ��ʮ�ߵ�Ϊ����Χ��ׯ��ͨ�ԡ�����һ��һ��",220,0,"��ְС��") 
		win = daxiao() 	
		ratio = 1
	elseif r == 2 then
		Cls()
		say("�������ӣ�������ö������������ö��������Ӯ������һ���塣",220,0,"��ְС��") 
		win = twodie() 	
		ratio = 5		
	elseif r == 3 then
		Cls()
		say("˫����ָ��һ�����֣������ö�����г����������ϵ�ָ��������Ӯ������һ��ʮ��",220,0,"��ְС��") 
		win = doubledie() 
		ratio = 10
	elseif r == 4 then
		Cls()
		say("Χ����ָ��һ�����֣������ö����ȫΪָ��������Ӯ������һ��һ�ٰ�ʮ��",220,0,"��ְС��") 
		win = tripledie()
		ratio = 180 		
	elseif r == 5 then
		Cls()
		say("ȫΧ���ֳƱ��ӣ�����Ҫָ�����֣������ö����������ͬ��Ӯ������һ����ʮ��",220,0,"��ְС��") 
		win = samedie()
		ratio = 30 		
	end
	if not win then
		say("�������������ã�û��ϵ������һ�ְɣ�",220,0,"��ְС��") 
		do return end
	end
	say("��ϲ���������Ľ�Ʒ��",220,0,"��ְС��") 
	instruct_2(174, math.modf(200 + 200 * ratio))
	--tb(jiadian(ratio * 2))
end
	
newkdef[4000] = function() --��Ϸ
	local gf = {CONFIG.DataPath .. "game.idx", CONFIG.DataPath .. "game.grp"}
	local nexty = CC.ScreenH/2-CC.DefaultFont*4 + CC.SingleLineHeight
	lib.PicLoadFile(gf[1], gf[2], 8)
	if instruct_31(2000) == false then
		Cls()
		say("�����ϵ�Ǯ������",220,0,"��ְС��") 		
		do return end
	end
	Cls()
	say("������ʾ����Ϸ�������񣬿͹����������С�",220,0,"��ְС��") 
	local menuItem = {
			{"��ҩ��",nil,1},   
			{"�ڱ���",nil,1},
			{"�ڰ���",nil,1},
			{"ȱ��ͼ",nil,1},
			{"����",nil,1},
		}
	local r = 0
	Cls()
	r = ShowMenu(menuItem,#menuItem,0,CC.MainMenuX,CC.MainMenuY,0,0,1,1,CC.DefaultFont,C_ORANGE, C_WHITE)
	--r =ShowMenu2(menuItem, #menuItem, 4, 5, CC.ScreenW/2-CC.DefaultFont*10-20, nexty, 0, 0, 1, 0, CC.DefaultFont, C_ORANGE, C_WHITE,"Ҫ��������Ϸ��")
	--r = ShowMenu3(menuItem, #menuItem, 1, -2, -2, -2, -2, 1, 0, 30, C_GOLD, C_WHITE, "Ҫ��������Ϸ��")
	if r < 1 then
		do return end
	end
	local win = false
	instruct_2(174, -2000)		
	if r == 1 then
		win = plant(-1, math.random(1, 2), 1)
		if win then
			say("��ϲ���������Ľ�Ʒ��",220,0,"��ְС��") 
			instruct_2(math.random(0, 35), math.random(1, 2))
			instruct_2(174, math.random(5) * 100)
			
			local n = math.random(20,40)
			JY.Thing[203]["δ֪7"] = JY.Thing[203]["δ֪7"] + n
			DrawStrBoxWaitKey("���Ļ���������"..n.."��", C_GOLD, CC.DefaultFont,nil,LimeGreen)
			--tb(jiadian(100))
			do return end
		end
	elseif r == 2 then
		local coin, item, treasure = mining()
		local total = coin * 2 + item * 10 + treasure * 200
		local aaa = 0
		for i = coin, 1, -1 do
			aaa = aaa + math.random(10, 50)		
		end
		instruct_2(174, aaa)
		for i = item, 1, -1 do
			instruct_2(math.random(0, 35), math.random(1, 2))
		end
		if treasure ~= 0 then
			tb("��ϲ�ڵ����أ�")
			instruct_2(174, math.random(10000, 20000))
		end		
		tb("�͹�����Ȥ����һ�Σ�")--(jiadian(total))	
		do return end
	elseif r == 3 then
		win = chess2()
		if win then
			say("��ϲ���������Ľ�Ʒ��",220,0,"��ְС��") 
			AddPersonAttrib(0, "��������", math.random(13, 25))
			tb(JY.Person[0]["����"].."��������������")	
			instruct_2(174, math.random(3) * 100)
			--tb(jiadian(200))	
			local n = math.random(20,40)
			JY.Thing[203]["δ֪7"] = JY.Thing[203]["δ֪7"] + n
			DrawStrBoxWaitKey("���Ļ���������"..n.."��", C_GOLD, CC.DefaultFont,nil,LimeGreen)
			do return end
		end	
	elseif r == 4 then
		win = puzzle()
		if win then
			say("��ϲ���������Ľ�Ʒ��",220,0,"��ְС��") 
			AddPersonAttrib(0, "ȭ�ƹ���", math.random(9, 12))
			AddPersonAttrib(0, "ָ������", math.random(9, 12))
			AddPersonAttrib(0, "��������", math.random(9, 12))
			AddPersonAttrib(0, "ˣ������", math.random(9, 12))
			AddPersonAttrib(0, "�������", math.random(9, 12))
			tb(JY.Person[0]["����"].."��ϵ����ֵ������")	
			instruct_2(174, math.random(6, 10) * 100)
			local n = math.random(20,40)
			JY.Thing[203]["δ֪7"] = JY.Thing[203]["δ֪7"] + n
			DrawStrBoxWaitKey("���Ļ���������"..n.."��", C_GOLD, CC.DefaultFont,nil,LimeGreen)
			--tb(jiadian(250))				
			do return end
		end		
	elseif r == 5 then
		local total = hunt()
		tb("������"..total.."ֻ���")
		if total >= 20 then
			AddPersonAttrib(0, "�Ṧ", math.modf(total / 20))
			tb(JY.Person[0]["����"].."�Ṧ����"..math.modf(total / 20).."�㣡")
		end	

				
		instruct_2(174, math.random(2) * 100)
		
		local n = math.random(20,40)
		JY.Thing[203]["δ֪7"] = JY.Thing[203]["δ֪7"] + n
		DrawStrBoxWaitKey("���Ļ���������"..n.."��", C_GOLD, CC.DefaultFont,nil,LimeGreen)
		--tb(jiadian(total * 2))		
	end
	Cls()
	say("�͹�Ҫ��Ҫ����һ�֣�",220,0,"��ְС��") 
	do return end
end
	
	
newkdef[4001] = function() --���ֻ���
	local x1 = CC.MainSubMenuX
	local y1 = CC.MainSubMenuY
	
	Cls()
	DrawStrBox(x1, y1, "����"..JY.Thing[203]["δ֪7"].."����ֿ���",C_WHITE, CC.DefaultFont);
	local menu = {
		{"��Ʒ", nil, 1},
		{"װ��", nil, 1},
		{"�ؼ�", nil, 1},
	--	{"ӡ��", nil, 1},
	}
	local r = ShowMenu(menu,#menu,0,x1,y1+CC.SingleLineHeight,0,0,1,1,CC.DefaultFont,C_ORANGE,C_WHITE);
	if r <= 0 then do return end end
	local list = {}
	local price = {}
	if r == 1 then
		list = {8, 14}
		list = {2, 6, 8, 11, 13, 14, 15, 16, 17, 256, 257, 258, 28, 29, 30, 31, 32, 33, 34, 35}
		for i = 0, JY.ThingNum - 1 do
			 if JY.Thing[i]["����"] == 3 then
				 list[#list + 1] = i
			 end
		 end
	elseif r == 2 then
		list = {53,41,42,62,46,39,45,48,50,230,245,243,248}
		for i = 0, JY.ThingNum - 1 do
			if JY.Thing[i]["����"] == 1 then
				list[#list + 1] = i
			end
		end		
	elseif r == 3 then
		if (JY.Thing[203]["δ֪7"] or 0) < 3 then
			do return end
		end
		for i = 0, JY.ThingNum - 1 do
			if JY.Thing[i]["����"] == 2 then
				list[#list + 1] = i
			end
		end
	-- elseif r == 4 then
		-- if (JY.Thing[203]["δ֪6"] or 0) < 5 then
			-- do return end
		-- end
		-- for i = 1, #CC.HZ do
			-- list[i] = i
		-- end
		-- local menu = {}
		-- for i = 1, #list do
			-- menu[i] = {string.format("%-12s %5d",CC.HZ[list[i]][2],25000), nil, 1}
			-- if hasHZ(i) then
				-- menu[i][3] = 0
			-- end
		-- end
		-- local r = ShowMenu(menu,#menu,15,x1,y1+CC.SingleLineHeight,0,0,1,1,CC.DefaultFont,C_ORANGE,C_WHITE);
		-- if r <= 0 then do return end end
		-- if JY.Thing[203]["δ֪7"] < 3000 then
			-- say("�Բ��𣬿͹���Ļ��ֲ�����",220,0,"��ְС��") 	
			-- do return end
		-- end
		--addHZ(r)
		--tb(jiadian(-25000))

		else
		do return end
		
	end
	for i = 1, #list do
		--if r == 1 then
		--	price[i] = math.modf(JY.Thing[list[i]]["��Ǯ"] / 10)
		--elseif r == 2 then
		--	price[i] = math.modf(JY.Thing[list[i]]["��Ǯ"] / 7)
		--elseif r == 3 then
		--	price[i] = math.modf(JY.Thing[list[i]]["��Ǯ"] / 4)
		--end
		--price[i] = JY.Thing[list[i]]["��Ǯ"]
		price[i] =2000 --math.random(1000,3000)
	end	
	local menu = {};
	for i = 1, #list do
		menu[i] = {string.format("%-12s %5d",JY.Thing[list[i]]["����"],price[i]), nil, 1};
		if r == 2 or r == 3 then
			if hasthing(list[i]) then
				menu[i][3] = 0
			end
		end		
	end

	local r = ShowMenu(menu,#menu,15,x1,y1+CC.SingleLineHeight,0,0,1,1,CC.DefaultFont,C_ORANGE,C_WHITE);
	if r <= 0 then do return end end
	if JY.Thing[203]["δ֪7"] < price[r] then
		say("�Բ��𣬿͹���Ļ��ֲ�����",220,0,"��ְС��") 	
		do return end
	end
	JY.Thing[203]["δ֪7"] = JY.Thing[203]["δ֪7"] - price[r]
	DrawStrBoxWaitKey("���Ļ��ּ�����"..price[r].."��", C_GOLD, CC.DefaultFont,nil,LimeGreen)
	instruct_2(list[r], 1)
	
	
	
	
	--tb(jiadian(-price[r]))
end
function hasthing(pp)
	return instruct_18(pp)
end	
function plant(need, number, flag)
	local a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16
	local sx = 70
	local sy = 70
	local x0 = CC.ScreenW/2 - (sx/2 + 10) * 7
	local y0 = CC.ScreenH/2 - (sy/2 + 10) * 4
	local chance = math.modf(JY.Person[0]["ҽ������"] / 30)	 --5�λ���
	if number > 1 then
		chance = chance + 3
	end
	local bg = CONFIG.PicturePath .. "game.jpg"

	local tmp = {
		{1, 133, x0 + sx, y0},
		{2, 134, x0 + sx, y0},
		{3, 135, x0 + sx, y0},
		{4, 136, x0 + sx, y0},
		{5, 137, x0 + sx, y0},
		{6, 138, x0 + sx, y0},
		{7, 139, x0 + sx, y0},
		{8, 140, x0 + sx, y0},
		{9, 141, x0 + sx, y0},
		{10, 142, x0 + sx, y0},
		{11, 143, x0 + sx, y0},
		{12, 144, x0 + sx, y0},
		{13, 145, x0 + sx, y0},
		{14, 146, x0 + sx, y0},
		{15, 147, x0 + sx, y0},
		{16, 148, x0 + sx, y0},
	}
	if need == -1 then
		need = math.random(#tmp)
	end	
	local dup = -1
	if flag ~= nil and flag == 1 then
		dup = math.random(1, #tmp)
	end	

	-- for i = 1, #tmp do
		-- tmp[i][2] = CONFIG.PicturePath .. i ..".png"
	-- end
	
	-- if dup ~= -1 then
		-- tmp[dup][2] = CONFIG.PicturePath .. need ..".png"
	-- end
	
	for i = 2, 6 do
		tmp[i][3] = tmp[i - 1][3] + sx + 10
	end
	for i = 7, 9 do
		tmp[i][3] = tmp[i - 1][3] 
		tmp[i][4] = tmp[i - 1][4] + sy + 10
	end
	for i = 10, 14 do
		tmp[i][3] = tmp[i - 1][3] - sx - 10
		tmp[i][4] = tmp[i - 1][4]
	end
	for i = 15, 16 do
		tmp[i][3] = tmp[i - 1][3]
		tmp[i][4] = tmp[i - 1][4] - sy - 10
	end
	
	local total = #tmp
	local target = need
	if target == 0 then
		target = math.random(#tmp)
	end
	local size = 30
	Cls()
	
	lib.LoadPicture(CONFIG.PicturePath .."game.png",-1,-1);
	--lib.LoadPicture(bg, -1, -1)
	--lib.LoadPNG(91,tmp[target][2]*2,-1, -1)
	lib.LoadPicture(tmp[target][2], CC.ScreenW/2 - sx/2, CC.ScreenH/2 - sy * 2)
	
	
	DrawBox3(CC.ScreenW/2 - sx/2 - 5, CC.ScreenH/2 - sy * 2 - 5, CC.ScreenW/2 - sx/2 + sx + 5, CC.ScreenH/2 - sy * 2 + sx + 5, C_RED)
	DrawStrBox(CC.ScreenW/2 - size * 7, CC.ScreenH/2 - size, "��������Ҫ��ժ��ҩ�ݣ����"..number.."��", C_WHITE, size)	
	ShowScreen()
	local p = WaitKey()
	
	while true do
		Cls()
		lib.LoadPicture(CONFIG.PicturePath .."game.png",-1,-1);
		--lib.LoadPicture(bg, -1, -1)
		for i = 1, total do
			lib.LoadPNG(91,tmp[i][2]*2,tmp[i][3]+35, tmp[i][4]+35)
			--lib.LoadPicture(tmp[i][2], tmp[i][3], tmp[i][4])
			DrawBox3(tmp[i][3] - 5, tmp[i][4] - 5, tmp[i][3] + sx + 5, tmp[i][4] + sy + 5, C_WHITE)
		end
		local times = 1
		local count
		local count2 = #tmp * 1 + 2 * math.random(0, #tmp)
		local start = math.random(#tmp)
		
		for i = start, count2 + start do
			count = i
			if count > total * times then 
				count = i - total * times	
				times = math.modf(i / total)
			end
			if count ~= 1 then
				DrawBox3(tmp[count - 1][3] - 5, tmp[count - 1][4] - 5, tmp[count - 1][3] + sx + 5, tmp[count - 1][4] + sy + 5, C_WHITE)
			else
				DrawBox3(tmp[total][3] - 5, tmp[total][4] - 5, tmp[total][3] + sx + 5, tmp[total][4] + sy + 5, C_WHITE)
			end
			DrawBox3(tmp[count][3] - 5, tmp[count][4] - 5, tmp[count][3] + sx + 5, tmp[count][4] + sy + 5, C_BLACK)
			--lib.LoadPicture(tmp[target][2], CC.ScreenW/2 - sx/2 - 5, CC.ScreenH/2 - sy/2 - 20)
			lib.LoadPNG(91,tmp[target][2]*2,CC.ScreenW/2 - sx/2 - 5+35, CC.ScreenH/2 - sy/2 - 20+35)
			DrawBox3(CC.ScreenW/2 - sx/2 - 10, CC.ScreenH/2 - sy/2 - 25, CC.ScreenW/2 - sx/2 + sx, CC.ScreenH/2 - sy/2 + sy - 15, C_RED)		
			ShowScreen()
			lib.Delay(20)
			lib.Delay(times * 50 + i * 5)				
		end	
		ShowScreen()
		local p = WaitKey()
		chance = chance - 1
		Cls()
		lib.LoadPicture(CONFIG.PicturePath .."game.png",-1,-1);
		--tb2(target.."::"..count)
		--count = 1
		if target == count or (dup ~= -1 and count == dup) then
			local word = "�ɵ���һ��ҩ�ݣ�"
			number = number - 1
			if number > 0 then
				word = word.."����Ҫ"..number.."�á�"
			end	
			tb2(word)
		else
			local word = "���ϧ����һ��͵����ˣ�"
			if chance > 0 then
				word = word.."����"..chance.."�λ��ᡣ"
			end		
			tb2(word)	
		end
		ShowScreen()
		WaitKey()
		if number <= 0 or chance <= 0 then
			break
		end
	end
	if number <= 0 then
		tb("���ڲɵ�������Ҫ��ҩ�ݣ�������")
		local n = math.random(50,100)
		JY.Thing[203]["δ֪7"] = JY.Thing[203]["δ֪7"] + n
		DrawStrBoxWaitKey("���Ļ���������"..n.."��", C_GOLD, CC.DefaultFont,nil,LimeGreen)
		return true
	else	
		tb("ʧ���ˣ���")
		return false
	end
	
end	

function mining()
  local sx = 80
  local sy = 80
  local x0 = CC.ScreenW / 2 - (sx / 2 + 10) * 6
  local y0 = CC.ScreenH / 2 - (sy / 2 + 10) * 5
  local chance = 5 + math.modf((101 - JY.Person[0]["����"]) * 0.1)
  local bg = CONFIG.PicturePath .. "game.jpg"
  local tmp = {}
  local num = 0
  local coin = 0
  local item = 0
  local treasure = 0
  for i = 1, 7 do
    for j = 1, 6 do
      local thing = 1
      if math.random(100) <= 50 then
        if math.random(100) <= 70 then
          thing = 2
        elseif 80 >= math.random(100) then
          thing = 3
        else
          thing = 4
        end
      end
      num = num + 1
      tmp[num] = {
        x0 + (i - 1) * sx + 30,
        y0 + (j - 1) * sy + 50,
        0,
        thing
      }
    end
  end
  local current = 1
  while true do
    Cls()
    lib.LoadPicture(CONFIG.PicturePath .."game.png",-1,-1);
    for i = 1, #tmp do
      if tmp[i][3] == 0 then
	  --lib.PicLoadCache(2
        lib.PicLoadCache(8, 0, tmp[i][1], tmp[i][2])
		--lib.PicLoadCache(2, 0, tmp[i][1], tmp[i][2], 2)
      else
        --lib.PicLoadCache(2, tmp[i][4] * 2, tmp[i][1], tmp[i][2], 2)
		lib.PicLoadCache(8, tmp[i][4] * 2, tmp[i][1], tmp[i][2])
      end
    end
    DrawBox3(tmp[current][1] - 5 - 35, tmp[current][2] - 40, tmp[current][1] + sx - 40, tmp[current][2] + sy - 40, C_RED)
    DrawString(x0 + 30 + 490 + 50, y0 + sy - 70, "���᣺" .. chance, M_Wheat, 30)
    DrawString(x0 + 30 + 490 + 50, y0 + sy - 35, "���ӣ�" .. coin, M_Wheat, 30)
    DrawString(x0 + 30 + 490 + 50, y0 + sy, "��Ʒ��" .. item, M_Wheat, 30)
    DrawString(x0 + 30 + 490 + 50, y0 + sy + 35, "���أ�" .. treasure, M_Wheat, 30)
    -- ShowScreen()
    -- local p = WaitKey()
	
	ShowScreen()
	lib.Delay(CC.BattleDelay)
	local X, ktype, mx, my = lib.GetKey();	
    if chance <= 0 then
      break
    end
    if X == VK_SPACE or X == VK_RETURN then
      if tmp[current][3] ~= 1 then
        chance = chance - 1
        tmp[current][3] = 1
        if tmp[current][4] == 2 then
          coin = coin + 1
        elseif tmp[current][4] == 3 then
          item = item + 1
        elseif tmp[current][4] == 4 then
          treasure = treasure + 1
        end
		
      end
	--  say("��ǰλ��"..current,0,1)
    elseif X == VK_UP then
      current = limitX(current - 1, 1, 42)
	--	say("��ǰλ��"..current,0,1)
    elseif X == VK_DOWN then
      current = limitX(current + 1, 1, 42)
	--  say("��ǰλ��"..current,0,1)
    elseif X == VK_LEFT then
      current = limitX(current - 6, 1, 42)
	--  say("��ǰλ��"..current,0,1)
    elseif X == VK_RIGHT then
      current = limitX(current + 6, 1, 42)
	--  say("��ǰλ��"..current,0,1)
    end
  end
  for i = coin, 1, -1 do
    instruct_2(174, math.random(10, 100))
  end
  for i = item, 1, -1 do
    instruct_2(math.random(0, 35), math.random(1, 2))
  end
  if treasure ~= 0 then
    tb("��ϲ�ڵ����أ�")
    local list = {
      36,
      37,
      38,
      39,
      40,
      41,
      42,
      43,
      44,
      45,
      46,
      47,
      48,
      49,
      50,
      51,
      52,
      53,
      54,
      58,
      59,
      60,
      61,
      62,
      63,
      243,
      244,
      245,
      246,
      247,
      248,
      249,
      250,
      252,
      253,
      236
    }
    for i = treasure, 1, -1 do
      instruct_2(174, math.random(500, 2000))
      if math.random(100) <= 50 then
        instruct_2(list[math.random(#list)], 1)
      else
        instruct_2(math.random(9, 15), 1)
      end
    --  addHZ(math.random(#CC.HZ))
    end
	--instruct_2(list[math.random(#list)], 1)
	--instruct_2(174, math.random(500, 2000))
	local n = math.random(50,100)
	JY.Thing[203]["δ֪7"] = JY.Thing[203]["δ֪7"] + n
	DrawStrBoxWaitKey("���Ļ���������"..n.."��", C_GOLD, CC.DefaultFont,nil,LimeGreen)
  end
  return coin, item, treasure
end
function chess()
  local sx = 80
  local sy = 80
  local x0 = CC.ScreenW / 2 - (sx / 2 + 10) * 6
  local y0 = CC.ScreenH / 2 - (sy / 2 + 10) * 5
  local move = 0
  local bg = CONFIG.PicturePath .. "game.jpg"
  local picstart = 5
  local tmp = {}
  local num = 0
  for j = 1, 4 do
    for i = 1, 4 do
      num = num + 1
      tmp[num] = {
        x0 + i * sx + 105,
        y0 + (j - 1) * sy + 105,
        1
      }
    end
  end
  tmp[6][3] = 0
  tmp[7][3] = 0
  tmp[10][3] = 0
  tmp[11][3] = 0
  local function flipown(a)
    if tmp[a][3] == 0 then
      tmp[a][3] = 1
    elseif tmp[a][3] == 1 then
      tmp[a][3] = 0
    end
  end
  local function flipup(a)
    if a <= 4 then
      return
    end
    flipown(a - 4)
  end
  local function flipdown(a)
    if 12 < a then
      return
    end
    flipown(a + 4)
  end
  local function flipleft(a)
    if math.fmod(a, 4) == 1 then
      return
    end
    flipown(a - 1)
  end
  local function flipright(a)
    if math.fmod(a, 4) == 0 then
      return
    end
    flipown(a + 1)
  end
  local function flip(a)
    flipown(a)
    flipleft(a)
    flipright(a)
    flipup(a)
    flipdown(a)
  end
  local function gameend()
    local ok = 0
    for i = 1, #tmp do
      if tmp[i][3] == 1 then
        ok = 1
        break
      end
    end
    if ok == 1 then
      return false
    else
      return true
    end
  end
  local times = math.random(3, 10)
  for i = 1, times do
    flip(math.random(#tmp))
  end
  local current = 1
  local win = false
  while true do
    Cls()
    --lib.LoadPicture(bg, -1, -1)
	lib.LoadPicture(CONFIG.PicturePath .."game.png",-1,-1);
    DrawBox(x0 + sx - 10, y0 + 50 - 50, x0 + sx + sx * 5 + 60, y0 + sy * 5 + 40, C_WHITE)
    for i = 1, #tmp do
      if tmp[i][3] == 0 then
        --lib.LoadPNG(91, 137*2, tmp[i][1], tmp[i][2])
		lib.PicLoadCache(8, 10, tmp[i][1], tmp[i][2])
      else
        lib.PicLoadCache(8, 12, tmp[i][1], tmp[i][2])
		--lib.LoadPNG(91, 138*2, tmp[i][1], tmp[i][2])
      end
    end
    DrawBox3(tmp[current][1] - 5 - 35, tmp[current][2] - 40, tmp[current][1] + sx - 40, tmp[current][2] + sy - 40, C_RED)
    DrawString(x0 + 150 + 100, y0 + sy * 5, "������" .. move, C_GOLD, 30)
    -- ShowScreen()
    -- local p = WaitKey()
	ShowScreen()
	lib.Delay(CC.BattleDelay)
	local X, ktype, mx, my = lib.GetKey();	
	
    win = gameend()
    if win == true then
		
      lib.Delay(200)
      break
    end
    if X == VK_ESCAPE then
      Cls()
      --lib.LoadPicture(bg, -1, -1)
	  lib.LoadPicture(CONFIG.PicturePath .."game.png",-1,-1);
      if DrawStrBoxYesNo(-1, -1, "������", C_WHITE, CC.DefaultFont) == true then
        break
      end
    elseif X == VK_SPACE or X == VK_RETURN then
      move = move + 1
      flip(current)
	  --say("����: "..move,0,1)
    elseif X == VK_UP then
      current = limitX(current - 4, 1, 16)
    elseif X == VK_DOWN then
      current = limitX(current + 4, 1, 16)
    elseif X == VK_LEFT then
      current = limitX(current - 1, 1, 16)
    elseif X == VK_RIGHT then
      current = limitX(current + 1, 1, 16)
    end
  end
  if win == true then
    tb("��ϲ����Ӯ�ˣ�")
	
	local n = math.random(50,100)
	JY.Thing[203]["δ֪7"] = JY.Thing[203]["δ֪7"] + n
	DrawStrBoxWaitKey("���Ļ���������"..n.."��", C_GOLD, CC.DefaultFont,nil,LimeGreen)
	
  end
  return win
end
function chess2()
  local sx = 80
  local sy = 80
  local x0 = CC.ScreenW / 2 - (sx / 2 + 10) * 6
  local y0 = CC.ScreenH / 2 - (sy / 2 + 10) * 5
  local move = 0
  local bg = CONFIG.PicturePath .. "game.jpg"
  local picstart = 5
  local tmp = {}
  local num = 0
  for j = 1, 5 do
    for i = 1, 5 do
      num = num + 1
      tmp[num] = {
        x0 + i * sx + 70,
        y0 + (j - 1) * sy + 50,
        1
      }
    end
  end
  local function flipown(a)
    if tmp[a][3] == 0 then
      tmp[a][3] = 1
    elseif tmp[a][3] == 1 then
      tmp[a][3] = 0
    end
  end
  local function flipup(a)
    if a <= 5 then
      return
    end
    flipown(a - 5)
  end
  local function flipdown(a)
    if 20 < a then
      return
    end
    flipown(a + 5)
  end
  local function flipleft(a)
    if math.fmod(a, 5) == 1 then
      return
    end
    flipown(a - 1)
  end
  local function flipright(a)
    if math.fmod(a, 5) == 0 then
      return
    end
    flipown(a + 1)
  end
  local function flip(a)
    flipown(a)
    flipleft(a)
    flipright(a)
    flipup(a)
    flipdown(a)
  end
  local function gameend()
    local ok = 0
    for i = 1, #tmp do
      if tmp[i][3] == 1 then
        ok = 1
        break
      end
    end
    if ok == 1 then
      return false
    else
      return true
    end
  end
  local times = math.random(3, 10)
  for i = 1, times do
    flip(math.random(#tmp))
  end
  local win = false
  local current = 1
  while true do
    Cls()
    lib.LoadPicture(CONFIG.PicturePath .."game.png",-1,-1);
    DrawBox(x0 + sx - 10, y0 + 50 - 70, x0 + sx + sx * 5 + 70, y0 + sy * 5 + 60, C_WHITE)
    for i = 1, #tmp do
      if tmp[i][3] == 0 then
     --   lib.LoadPNG(91, 137*2, tmp[i][1], tmp[i][2])
	 
		lib.PicLoadCache(8, 10, tmp[i][1], tmp[i][2])
      else
        lib.PicLoadCache(8, 12, tmp[i][1], tmp[i][2])
	  
     --   lib.LoadPNG(91, 138*2, tmp[i][1], tmp[i][2])
      end
    end
    DrawBox3(tmp[current][1] - 5 - 35, tmp[current][2] - 40, tmp[current][1] + sx - 40, tmp[current][2] + sy - 40, C_RED)
    DrawString(x0 + 150 + 100, y0 + sy * 5 + 20, "������" .. move, C_GOLD, 30)
    -- ShowScreen()
    -- local X = WaitKey()
	
    win = gameend()
	
    if win == true then
		
      lib.Delay(200)
      break
    end
	ShowScreen()
	lib.Delay(CC.BattleDelay)
	local X, ktype, mx, my = lib.GetKey();	
	
    if X == VK_ESCAPE then
      Cls()
      --lib.LoadPicture(bg, -1, -1)
	  lib.LoadPicture(CONFIG.PicturePath .."game.png",-1,-1);
      if DrawStrBoxYesNo(-1, -1, "������", C_WHITE, CC.DefaultFont) == true then
        break
      end
    elseif X == VK_SPACE or X == VK_RETURN then
      move = move + 1
      flip(current)
	--  say("����: "..move,0,1)
    elseif X == VK_UP then
      current = limitX(current - 5, 1, 25)
    elseif X == VK_DOWN then
      current = limitX(current + 5, 1, 25)
    elseif X == VK_LEFT then
      current = limitX(current - 1, 1, 25)
    elseif X == VK_RIGHT then
      current = limitX(current + 1, 1, 25)
    end
  end
  if win == true then
    tb("��ϲ����Ӯ�ˣ�")
	local n = math.random(50,100)
	JY.Thing[203]["δ֪7"] = JY.Thing[203]["δ֪7"] + n
	DrawStrBoxWaitKey("���Ļ���������"..n.."��", C_GOLD, CC.DefaultFont,nil,LimeGreen)
  end
  return win
end
function puzzle()
  local sx = 60
  local sy = 60
  local x0 = CC.ScreenW / 2 - (sx / 2 + 10) * 6
  local y0 = CC.ScreenH / 2 - (sy / 2 + 10) * 5
  local move = 0
  local blank = 1
  local bg = CONFIG.PicturePath .. "game.jpg"
  local start = {
    11,
    36,
    61,
    86,
    111,
    136,
    161,
    186
  }
  local picstart = start[math.random(#start)]
  local empty = 10
  local tmp = {}
  local sample = {}
  local num = 0
  Cls()
  --lib.LoadPicture(bg, -1, -1)
  lib.LoadPicture(CONFIG.PicturePath .."game.png",-1,-1);
  for i = 1, 5 do
    for j = 1, 5 do
      num = num + 1
      tmp[num] = {
        num,
        j * sx + 400,
        y0 + (i - 1) * sy + 50,
        num,
        num + picstart - 1
      }
      sample[num] = {
        num,
        j * sx + 50,
        y0 + (i - 1) * sy + 50,
        num,
        num + picstart - 1
      }
    end
  end
  tmp[1][1] = 0
  tmp[1][4] = 0
  tmp[1][5] = 10
  sample[1][5] = 10
  local function gameend()
    if move == 0 then
      return false
    end
    local a = true
    for i = 1, num do
      if tmp[i][1] ~= tmp[i][4] then
        a = false
        break
      end
    end
    return a
  end
  local function canmove(a)
    if blank == a + 1 or blank == a - 1 or blank == a + 5 or blank == a - 5 then
      return true
    end
    return false
  end
  local function moveit(a)
    if canmove(a) then
      local b = tmp[a][5]
      local c = tmp[a][4]
      tmp[a][5] = tmp[blank][5]
      tmp[a][4] = tmp[blank][4]
      tmp[blank][5] = b
      tmp[blank][4] = c
      local d = blank
      blank = a
    end
    return a
  end
  local moveup = function(a)
    if a <= 5 then
      return -1
    end
    return a - 5
  end
  local movedown = function(a)
    if 20 < a then
      return -1
    end
    return a + 5
  end
  local moveleft = function(a)
    if math.fmod(a, 5) == 1 then
      return -1
    end
    return a - 1
  end
  local moveright = function(a)
    if math.fmod(a, 5) == 0 then
      return -1
    end
    return a + 1
  end
  local function randommove()
    local store = {}
    local n = 0
    local up = moveup(blank)
    local down = movedown(blank)
    local left = moveleft(blank)
    local right = moveright(blank)
    if up ~= -1 then
      n = n + 1
      store[n] = up
    end
    if down ~= -1 then
      n = n + 1
      store[n] = down
    end
    if left ~= -1 then
      n = n + 1
      store[n] = left
    end
    if right ~= -1 then
      n = n + 1
      store[n] = right
    end
    local result = store[math.random(#store)]
    return result
  end
  local function generate()
    local a = math.random(100, 300)
    for i = 1, a do
      local result = randommove()
      moveit(result)
    end
  end
  generate()
  local win = false
  local current = 1
  while true do
    Cls()
    --lib.LoadPicture(bg, -1, -1)
	lib.LoadPicture(CONFIG.PicturePath .."game.png",-1,-1);
    for i = 1, num do
      lib.PicLoadCache(8, 2 * sample[i][5], sample[i][2], sample[i][3])
      lib.PicLoadCache(8, 2 * tmp[i][5], tmp[i][2], tmp[i][3])
      DrawBox3(tmp[i][2] - 30, tmp[i][3] - 30, tmp[i][2] + sx - 30, tmp[i][3] + sy - 30, M_LightBlue)
      DrawBox3(sample[i][2] - 30, sample[i][3] - 30, sample[i][2] + sx - 30, sample[i][3] + sy - 30, M_LightBlue)
    end
    DrawBox3(tmp[current][2] - 30, tmp[current][3] - 30, tmp[current][2] + sx - 30, tmp[current][3] + sy - 30, C_RED)
    DrawString(x0 + 150 - 110, y0 + sy * 5 + 20, "��Ʒ", C_GOLD, 30)
    DrawString(x0 + 150 + 205, y0 + sy * 5 + 20, "������" .. move, C_GOLD, 30)
    ShowScreen()
    local p = WaitKey()
    win = gameend()
    if win == true then
      lib.Delay(200)
      break
    end
    if p == VK_ESCAPE then
      Cls()
      --lib.LoadPicture(bg, -1, -1)CONFIG.PicturePath .. 
	  lib.LoadPicture(CONFIG.PicturePath .."game.png",-1,-1);
      if DrawStrBoxYesNo(-1, -1, "������", C_WHITE, CC.DefaultFont) == true then
        break
      end
    elseif p == VK_SPACE or p == VK_RETURN then
      if canmove(current) then
        move = move + 1
      end
      current = moveit(current)
    elseif p == VK_UP then
      current = limitX(current - 5, 1, 25)
    elseif p == VK_DOWN then
      current = limitX(current + 5, 1, 25)
    elseif p == VK_LEFT then
      current = limitX(current - 1, 1, 25)
    elseif p == VK_RIGHT then
      current = limitX(current + 1, 1, 25)
    end
  end
  if win == true then
    tb("��ϲ����Ӯ�ˣ�")
	local n = math.random(50,100)
	JY.Thing[203]["δ֪7"] = JY.Thing[203]["δ֪7"] + n
	DrawStrBoxWaitKey("���Ļ���������"..n.."��", C_GOLD, CC.DefaultFont,nil,LimeGreen)
  end
  return win
end

function tb(s)
	DrawStrBoxWaitKey(s, C_GOLD, 30)
end

function hunt()	
	local bg = CONFIG.PicturePath .. "game.jpg"
	local bg2 = CONFIG.PicturePath .. "hunt.png"
	local start = 212
	local width = 100
	local height = 145
	local current = 1
	local shoot = false
	local path = 1
	local m = 1
	local arrow = 10 --��ʸ��
	local limit = 60000
	limit = math.modf(50 * (JY.Person[0]["������"] + JY.Person[0]["������"] + JY.Person[0]["�Ṧ"]))
	local aa = math.modf(limit / 1000)
	local menu = { --num, x, y, type, dead
	}
	local menu2 = {}
	local menu3 = {
		{1, "��", 0},
		{2, "��", 0},
		{3, "��", 0},
		{4, "��", 0},
		{5, "¹", 0},
		{6, "��", 0},
	}
	local p
	for i = 1, 8 do
		menu[i] = {i, 50 + width * (i - 1), 130, nil, false}
		menu2[i] = {i, 50 + width * (i - 1), 540, 211, false}
	end
	
	menu2[1][5] = true
	
	
	for i = 1, 8 do
		if menu[i][4] ~= nil and menu[i][5] then
			menu[i][4] = menu[i][4] + 6
		elseif math.random(8) == 1 then
			menu[i][4] = math.random(start, start + 5)
		else
			menu[i][4] = nil
		end
	end
	local t1 = lib.GetTime()
	local starttime = lib.GetTime()
		
	while true do
		local t2 = lib.GetTime();
		if t2 - t1 > 2000 then --����
			for i = 1, 8 do
				if math.random(5) == 1 then
					menu[i][4] = math.random(start, start + 5)
				else
					menu[i][4] = nil
				end
				menu[i][5] = false
			end
			t1 = t2
		end	
		--for i = 1, 40 do
		Cls()		
		--lib.LoadPicture(bg2, -1, -1)	
		--lib.LoadPNG(91,132*2, -1, -1)
		lib.LoadPicture(CONFIG.PicturePath .. "hunt.png",-1,-1);
		--lib.PicLoadCache(8, 2 * 211, 400, 550 - i * 10)
		for i = 1, 8 do
			if menu[i][4] ~= nil then
				if menu[i][5] then
					lib.PicLoadCache(8, 2 * (menu[i][4] + 6), menu[i][2], menu[i][3])
				else
					lib.PicLoadCache(8, 2 * menu[i][4], menu[i][2], menu[i][3])
				end
			end
			if menu2[i][5] then
				lib.PicLoadCache(8, 2 * menu2[i][4], menu2[i][2], menu2[i][3])
			end
		end
		if shoot then
			lib.PicLoadCache(8, 2 * menu2[path][4], menu2[path][2], menu2[path][3] - m * 10)
			m = m + 1		
			if m == 38 then --�䵽������
				shoot = false
				m = 1
				if menu[path][4] ~= nil and not menu[path][5] then
					menu[path][5] = true
					menu3[menu[path][4] - start + 1][3] = menu3[menu[path][4] - start + 1][3] + 1
					PlayWavAtk(3)
				end
			end
			--lib.PicLoadCache(8, 2 * 211, 400, 550 - i * 10)			
		end
		for i = 1, #menu3 do
			DrawString(CC.ScreenW / 2 + 22 * 3 * (i - 1), 0, menu3[i][2]..":"..menu3[i][3], C_GOLD, 20)
		end
		DrawString(10, 0, "ʣ��ʱ��:"..aa.."��", C_GOLD, 20)
		ShowScreen()
		p = lib.GetKey()
		if p == VK_ESCAPE then
		--	say("�˳���Ϸ",0,1)
			break
		elseif p == VK_RIGHT  then
			--say("������",0,1)
			menu2[current][5] = false
			current = limitX(current + 1, 1, 8)
			menu2[current][5] = true
		elseif p == VK_LEFT then
			menu2[current][5] = false
			current = limitX(current - 1, 1, 8)
			menu2[current][5] = true
		elseif (p == VK_SPACE or p == VK_RETURN) and not shoot then
			shoot = true
			path = current
		end
		local endtime = lib.GetTime()
		local diff = endtime - starttime
		aa = math.modf((limit - diff) / 1000)
		if aa == -1 then
			break
		end
		lib.Delay(10)
	end
	local total = 0
	for i = 1, #menu3 do
		total = total + menu3[i][3]
	end	
	return total, menu3
end	

function craft (weapon)
	local starttime = lib.GetTime() --��ʼʱ��
	local endtime = -1 --����ʱ��
	local duration = 30 * 1000 --��ʱ�䣬���������Ѷȱ任��*1000=��
	local timer = math.modf(duration / 1000) --��ʾʣ��ʱ�䣬= duration - (endtime - starttime) all divided by 1000
	local key
	--local weapon = 36 --����Ķ������
	local iron = 0 --����ֵ 600 100%�ɹ� 550-600��1-50%���ʳɹ�
	local level = 100 -- ÿ�ɹ�һ������ֵ������ô�࣬�Ѷ�Խ�����ԽС���������й�
	local count = 1
	local win = 0 --��� 0--ʱ�䵽 1/2--����ɹ�
	local group = {
		{0, 0, 180, 320, false}, --num, direction, x, y, clicked 0/1
		{0, 0, 280, 320, false},
		{0, 0, 380, 320, false},
		{0, 0, 480, 320, false},
		{0, 0, 580, 320, false},
	}
	local function randomgroup()
		local a = {{232, VK_LEFT}, {233, VK_RIGHT}, {234, VK_UP}, {235, VK_DOWN}}
		for i = 1, #group do
			local r = math.random(#a)
			group[i][1] = a[r][1]
			group[i][2] = a[r][2]
			group[i][5] = false
		end
		count = 1
	end
	randomgroup()
	while true do
		Cls()		
		--lib.LoadPicture(CONFIG.PicturePath .. "131.png", -1, -1)
		--lib.LoadPicture(CONFIG.PicturePath .."game.png",-1,-1);
		lib.LoadPicture(CONFIG.PicturePath .."game.png",-1,-1);
		lib.PicLoadCache(8, 231 * 2, 100, 200, 1)
		lib.SetClip(100, 200, 100 + iron, 300)  
		lib.PicLoadCache(8, 230 * 2, 100, 200, 1)
		lib.SetClip(0, 0, 0, 0)
		DrawString(10, 0, "ʣ��ʱ��:"..timer.."��", C_GOLD, 25)
		DrawString(10, 30, "������Ʒ:"..JY.Thing[weapon]["����"], C_ORANGE, 25)
		DrawString(10, 60, "�����Ѷ�:".."�߼�", C_RED, 25)
		for i = 1, #group do
			if not group[i][5] then
				lib.PicLoadCache(8, group[i][1] * 2, group[i][3], group[i][4], 1)
			else
				lib.PicLoadCache(8, group[i][1] * 2, group[i][3], group[i][4], 3, 150)
			end
		end
		ShowScreen()
		key = lib.GetKey()
		if key == VK_ESCAPE then
			break
		elseif key == group[count][2] or key == VK_RETURN then
			group[count][5] = true
			count = count + 1
		elseif key > 99999 then
		
		elseif key ~= -1 then
			randomgroup()			
			iron = limitX(iron - 20, 0, 600)
			lib.PicLoadCache(8, 237 * 2, 300, 400, 1)	
			ShowScreen()
			lib.Delay(200)	
		end
		if count > 5 then
			iron = iron + level
			randomgroup()
			lib.PicLoadCache(8, 236 * 2, 300, 400, 1)
			ShowScreen()
			lib.Delay(200)	
		end
		lib.Delay(10)
		if iron >= 600 then
			win = 1
			break
		end
		endtime = lib.GetTime()
		timer = math.modf((duration - (endtime - starttime)) / 1000)
		if timer < 0 then
			if iron >= 550 then
				if JLSD(10, 10 + (iron - 550), 0) then
					win = 2
				end	
			end
			break
		end		
	end
	return win
	--[[Cls()
	lib.LoadPicture(CONFIG.PicturePath .. "game.jpg", -1, -1)
	if win == 1 then
		tb2("����ɹ���", nil, nil, C_ORANGE, 30)
		ShowScreen()
		WaitKey()
		instruct_2(weapon, 1)
	elseif win == 2 then
		tb2("�콵����������ɹ���", nil, nil, C_ORANGE, 30)
		ShowScreen()
		WaitKey()
		instruct_2(weapon, 1)
	else
		tb2("ʧ���ˣ����ϧ��", nil, nil, C_ORANGE, 30)
		ShowScreen()
		WaitKey()
	end]]
end

function makedrug(drug)
	local top = 120
	local bottom = 530
	local count = 1
	local current = 1
	local column = 8
	local key
	local fire = 0
	local grass = 0
	local water = 0
	local drop = {}
	local win = false
	lib.PicLoadFile(CC.GamePicFile[1], CC.GamePicFile[2], 8)
	for i = 1, 20 do
		 --#, x, y, speed, location
		drop[i] = {[0] = 0, math.random(238, 240), 40 + math.random(column) * 80, top, math.random(10), 1}
		if math.random(10) <= 2 then
			drop[i][0] = 1
		end
	end
	while true do
		Cls()
		--lib.LoadPicture(CONFIG.PicturePath .. "131.png", -1, -1)
		lib.LoadPicture(CONFIG.PicturePath .."game.png",-1,-1);
		lib.PicLoadCache(8, 239 * 2, 50, 5, 1)
		lib.PicLoadCache(8, 240 * 2, 270, 5, 1)
		lib.PicLoadCache(8, 242 * 2, 100, 20, 1)
		lib.PicLoadCache(8, 242 * 2, 320, 20, 1)

		lib.SetClip(100, 20, 100 + fire, 50)  
		lib.PicLoadCache(8, 243 * 2, 100, 20, 1)

		lib.SetClip(320, 20, 320 + grass, 50) 
		lib.PicLoadCache(8, 244 * 2, 320, 20, 1)

		lib.SetClip(0, 0, 0, 0)
		for i = 1, 5 do
			lib.PicLoadCache(8, 238 * 2, 490 + (i - 1) * 50, 5, 1)
		end

		for i = 1, water do
			lib.PicLoadCache(8, 245 * 2, 490 + (i - 1) * 50, 5, 1)
		end

		DrawBox(60, top - 50, 740, bottom + 60, C_GOLD)
		for i = 1, #drop do
			if drop[i][0] ~= 0 then
				if current == (drop[i][2] - 40) / 80 and top + (drop[i][5] + 1) * drop[i][4] > bottom - 30 then
					if drop[i][1] == 239 then
						fire = fire + 20
					elseif drop[i][1] == 240 then
						grass = grass + 20
					elseif drop[i][1] == 238 then
						water = water + 1
					end
					drop[i] = {[0] = 0, math.random(238, 240), 40 + math.random(column) * 80, top, math.random(10), 1}
				else
					lib.PicLoadCache(8, drop[i][1] * 2, drop[i][2], top + drop[i][5] * drop[i][4])
				end
				drop[i][5] = drop[i][5] + 1
				if top + drop[i][5] * drop[i][4] > bottom + 30 then
					drop[i] = {[0] = 0, math.random(238, 240), 40 + math.random(column) * 80, top, math.random(10), 1}
				end
			else
				if math.random(200) <= 1 then
					drop[i][0] = 1
				end
			end
		end
		lib.PicLoadCache(8, 241 * 2, 40 + current * 80, bottom)
		ShowScreen()
		if water >= 5 then
			lib.PicLoadCache(8, 245 * 2, 490 + 4 * 50, 5, 1)
			tb2("��ҩʧ�ܣ�", nil, nil, C_GOLD, 50)	
			ShowScreen()
			lib.Delay(1500)
			WaitKey()
			break
		end
		if fire >= 160 and grass >= 160 then
			lib.PicLoadCache(8, 239 * 2, 50, 5, 1)
			lib.PicLoadCache(8, 240 * 2, 270, 5, 1)
			lib.PicLoadCache(8, 242 * 2, 100, 20, 1)
			lib.PicLoadCache(8, 242 * 2, 320, 20, 1)

			lib.SetClip(100, 20, 100 + fire, 50)  
			lib.PicLoadCache(8, 243 * 2, 100, 20, 1)

			lib.SetClip(320, 20, 320 + grass, 50) 
			lib.PicLoadCache(8, 244 * 2, 320, 20, 1)

			lib.SetClip(0, 0, 0, 0)
			tb2("��ҩ�ɹ���", nil, nil, C_GOLD, 50)	
			local n = math.random(50,100)
			JY.Thing[203]["δ֪7"] = JY.Thing[203]["δ֪7"] + n
			DrawStrBoxWaitKey("���Ļ���������"..n.."��", C_GOLD, CC.DefaultFont,nil,LimeGreen)

			ShowScreen()
			lib.Delay(1500)
			WaitKey()
			win = true
			break
		end
		key = lib.GetKey()
		if key == VK_RIGHT then
			current = limitX(current + 1, 1, column)
		elseif key == VK_LEFT then
			current = limitX(current - 1, 1, column)
		elseif key == VK_ESCAPE then
			break
		end

		lib.Delay(20)
	end
	return win
end
function DrawBox3(x1, y1, x2, y2, color)
  lib.DrawRect(x1, y1, x2, y1, color)
  lib.DrawRect(x1, y2, x2, y2, color)
  lib.DrawRect(x1, y1, x1, y2, color)
  lib.DrawRect(x2, y1, x2, y2, color)
end

function jiadian(ds)
	JY.Thing[203]["δ֪7"] = JY.Thing[203]["δ֪7"] + ds
	return JY.Thing[203]["δ֪7"]
end

function tb2(s, x, y, color, size)
	if color == nil then color = C_GOLD end
	if size == nil then size = 30 end
	local ll = #s
	if x == nil or x == -1 then
		x = (CC.ScreenW-size/2*#s-2*CC.MenuBorderPixel)/2
	end
	if y == nil or y == -1 then
        y=(CC.ScreenH-size-2*CC.MenuBorderPixel)/2
	end	
	DrawString(x, y, s, color, size)
end