---------------------------------------------------------------------------------------------------------
-----------------------------------------����������������д����------------------------------------------
---------------------------------------------------------------------------------------------------------

--ShowMenu2 ȡ������0
--JYMsgBox ȡ�����ظ���
--InputNum ȡ������nil
--JY.Person[diyid]["�书11"] = 97
--JY.Person[diyid]["�书�ȼ�11"] = 900
--instruct_2(157,-1)
---[[
--WAR.JDYJ = {}
--WAR.JDYJ[0] = 1



local diyid = JY.Base["����" .. 1]
local function wupingisgongType(wuid,typeId)
	local ggid = JY.Thing[wuid]["�����书"]
	if ggid < 0 then
		return false
	end
	return JY.Wugong[ggid]["�书����"] == typeId
end


local nexty = CC.ScreenH/2-CC.DefaultFont*4 + CC.SingleLineHeight
--require("menu")
--dofile("menu")

local menu = {}
menu[1]={"ϴ����        ",nil,1}
menu[2]={"ϴ����        ",nil,1}
menu[3]={"ϴ����        ",nil,1}
menu[4]={"�����Ʒ      ",nil,1}
menu[5]={"�ı�����      ",nil,1}
menu[6]={"���������100��",nil,1}
menu[7]={"ʵս500       ",nil,1}
menu[8]={"ȫϵ������100�� ",nil,1}
menu[9]={"�����н���    ",nil,1}
menu[10]={"���ù�����    ",nil,1}
menu[11]={"���õ���      ",nil,1}
menu[12]={"��������书  ",nil,1}
menu[13]={"�ܲ�ͨ��20����",nil,1}
menu[14]={"�����书        ",nil,1}
menu[15]={"������Ʒ����װ��",nil,1}
menu[16]={"ȫ���书����  ",nil,1}
menu[17]={"����Ѫ��      ",nil,1}
menu[18]={"�ı�����      ",nil,1}
menu[19]={"Ѫ������      ",nil,1}
menu[20]={"ѧ���书      ",nil,1}
menu[21]={"��ý�Ǯ      ",nil,1}
menu[22]={"��������      ",nil,1}
menu[23]={"�������      ",nil,1}
menu[24]={"�滻����      ",nil,1}
menu[25]={"�۽�����      ",nil,1}
menu[26]={"������Ŀ      ",nil,1}
menu[27]={"װ����װ      ",nil,1}
menu[28]={"��������      ",nil,1}
menu[29]={"��ѧ����      ",nil,1}
menu[30]={"�ں��ڹ�      ",nil,1}
menu[31]={"�ں��Ṧ      ",nil,1}
menu[32]={"�����츳      ",nil,1}
menu[95]={"һ�����      ",nil,1}
menu[96]={"������Ϊ      ",nil,1}
menu[97]={"�����츳      ",nil,1}
menu[98]={"����ս��      ",nil,1}
menu[99]={"��Ʒ���      ",nil,1}
menu[100]={"ֱ��ͨ��      ",nil,1}
local xuan = ShowMenu2(menu, #menu, 3, 7, CC.ScreenW/2-CC.DefaultFont*10-20, nexty, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE,"��ѡ����Ҫ�Ĺ���")
--JY.Person[usepersonid]["��ѧ����"]
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
	Cat('�����츳')
end
if xuan == 31 then
	Cat('�ں��书',0,7)
end
if xuan == 30 then
	Cat('�ں��书',0,6)
end	
if xuan==29 then
	--PersonStatus(1,1)
	JY.Person[523]["����"] = JY.Person[523]["����"] + 100
	JY.Person[524]["����"] = JY.Person[524]["����"] + 100
	JY.Person[525]["����"] = JY.Person[525]["����"] + 100
end
if xuan == 28 then
	--say("��������"..CC.TX["��������"],0,1)
	-- for i = 1,5 do	
		-- local n =math.random(100)
		-- say("����λ��:"..JY.Person[n]["����λ��"],0,1)			
	-- end
	--say("����λ��:"..JY.Person[586]["����"],0,1)	
	local mp = {
		{"������", nil, 1, "����"},
		{"ؤ��", nil, 1, "���"},
		{"��Ĺ��", nil, 1, "����"},
		{"�䵱��", nil, 1, "����"},
		{"������", nil, 1, "����"},
		{"����", nil, 1, "����"},	
		{"��ң��", nil, 1, "����"},	
		{"����ɽ", nil, 1, "�涾"}, --�������ǣ����Ű���ɽ
		{"����", nil, 1, "���"}, --�������ǣ���������
		{"�һ���", nil, 1, "�ݼ�"}, --��Ծ�㣺�����һ���
		{"һ����", nil, 1, "�Ƶ�"}, --���磺����һ����	
		{"�������", nil, 1, "����"}, --���磺�����������
		{"����", nil, 1, "��Ӱ"}, --��Ծ�㣺��������
		{"��������", nil, 1, "����"},--��Ծ�㣺������������
		{"����", nil, 1, "����"},--��Ծ�㣺������������
		{"ȫ���", nil, 1, "����"},--��Ծ�㣺������������
		{"��ü��", nil, 1, "̫��"},--�����Σ����Ŷ�ü��
		{"�����", nil, 1, "����"},--�����Σ����������
		{"������", nil, 1, "����"},--�����Σ�tony������������
		{"ѩ����", nil, 1, "�����"},--�����Σ�tony������������
		{"������", nil, 1, "��������"},--�����Σ�tony������������
		{"�л���", nil, 1, "��������"},--�����Σ�tony������������
		{"��͢", nil, 1, "��������"},--�����Σ�tony������������
		{"ҹ��¥", nil, 1, "��������"},--�����Σ�tony������������
		{"����ɽׯ", nil, 1, "�鱨"},--�����Σ����Ż���ɽׯ
		{"���ν�", nil, 1, "��"},--�����Σ����ν�
		{"����ׯ", nil, 1, "����"},--27��ֹ����������ׯ
		{"�����", nil, 1, "����"},--28�����Σ������
		{"���ɽ�", nil, 1, "��ʥ"},--29�����Σ����ɽ�
		{"�����", nil, 1, "���"},--30�����Σ������
	}
	local wj = {
		{"���ŵ���", "�߼�����", "����"},--����
		{"�������", "�˴�����", "����", "ǰ����"},--ؤ��
		{"���ŵ���", "�߼�����", "����"},--��Ĺ
		{"���ŵ���", "��ͨ����", "�߼�����", "�״�����", "����"},--�䵱
		{"���ŵ���", "��ͨ����", "�߼�����", "��Ժ", "����"},--����
		{"����", "ɮ��", "����"},--����
		{"��ͨ����", "�м�����", "�߼�����", "����", "����"}, --��ң--��������5����������ģ��������
		{"����", "����", "ׯ��"},--����
		{"���ŵ���", "���ŵ���", "����", "����"},--����
		{"��������", "���ҵ���", "����"},--�һ���
		{"��������", "�м�����", "�߼�����", "����"},--һ����
		{"����", "����", "����", "������", "����"},--����
		{"��ͨ����", "���ĵ���", "�Ĵ���", "����ʹ��", "����"},--����
		{"��ͨ����", "�״�����", "����", "����", "����","�洫����"},--��������
		{"����", "����", "����", "��ɮ"},--����
		{"�Ĵ�����", "��������", "��������", "̫�ϳ���", "�ƽ�"}, --ȫ��
		{"����", "����", "ʹ��", "��ʦ"}, --��ü
		{"���ŵ���", "���ŵ���", "����", "����", "����"}, --���
		{"��ͨ����", "����", "����", "ǰ������", "̫�ϳ���"}, --����
		{"��������", "����", "��", "����"}, --ѩ����20
		{"����", "����", "�糾", "��������"}, --������21
		{"����", "����", "�˷�", "�ƹ�","�ϰ�"}, --�л���22
		{"����", "�ٳ�", "����", "����","Ԫ˧"}, --��͢23
		{"�༶ɱ��", "�༶ɱ��", "����ɱ��", "��¥��","¥��"},
		{"����", "��ͷ", "��̽", "��ʦ", "ׯ��"},
		{"����", "����", "����", "�ɼ�"}, 
		{"����ѧͽ", "���޽�ͷ", "��������", "����֮��"}, --����ׯ27
		{"����", "����", "����", "��ʦ"}, --����ׯ28
		{"����", "����", "����", "������","����"}, --�嶾��29
		{"����", "����", "����", "����"}, --�����30
		
	}
	-- local clone_choice= ShowMenu(mp, #mp, 20, CC.MainSubMenuX-80, CC.MainSubMenuY, 0, 0, 1, 1, CC.DefaultFont, M_YellowGreen, C_WHITE)
	
	local clone_choice=ShowMenu2(mp, #mp, 5, 7, CC.ScreenW/2-CC.DefaultFont*10-20, nexty, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE,"��ѡ��Ҫ���������")
	-- say("����"..clone_choice,0,1)
	local menu = {}
	for i = 1, #wj[clone_choice] do 
		menu[#menu+1]={wj[clone_choice][i], nil, 1}--�����Σ�tony������������
	end
	local clone_choice1 = ShowMenu(menu, #menu, 22, CC.MainSubMenuX-80, CC.MainSubMenuY, 0, 0, 1, 1, CC.DefaultFont, M_YellowGreen, C_WHITE)
	if clone_choice == nil or clone_choice1 == nil then
		do return end
	elseif clone_choice > 0 then
		if MPPD(0) == 0 then
			JoinMP(0,clone_choice,clone_choice1)
			--JY.Person[0]["����"] = clone_choice
			MPAttrib(0)
			QZXS(CC.MPINFO2[clone_choice])
		else
			if JY.Person[0]["����"] == clone_choice then
				JoinMP(0,clone_choice,clone_choice1) 
			else
				MPAttrib(0,-1)
				JoinMP(0,clone_choice,clone_choice1)
				MPAttrib(0)
				QZXS(CC.MPINFO2[clone_choice])
			end	
		end	
		
		if clone_choice1 > 0 then
			JY.Person[0]["����λ��"] = clone_choice1
		end
		--say("����"..clone_choice1,0,1)
		--MPAttrib(0)
		
	else
		do return end
	end
end
if xuan == 97 then
	local nexty = CC.MainSubMenuY + CC.SingleLineHeight
	local p = SelectTeamMenu(CC.MainSubMenuX, nexty)
	-- local sj = JY.Base["��Ŀ"]
	-- local tftable={}
	local menu={}
	if p > 0 then
		local   diyid = JY.Base["����" .. p]

		--local menu1 ={9970,9971,9972,9973,9960,9959,9958,9957,9956}
		-- for k,v in pairs(CC.PTFSM) do 
			-- menu[#menu+1]={CC.PTFSM[v[k]][1].." | "..CC.PTFSM[v[k]][2],nil,k}
		-- end
		for k,v in pairs(CC.PTFSM) do
			menu[#menu+1]={CC.PTFSM[k][1].." | "..CC.PTFSM[k][2],nil,k}
		end
		local r = ShowMenu(menu, #menu, 18, CC.MainSubMenuX-80, CC.MainSubMenuY, 0, 0, 1, 1, CC.DefaultFont*0.8, C_RED, C_WHITE)
		--say("�����츳"..p,0,1)
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
			--[[say("�����츳"..menu[r][3],0,1)
			
			if instruct_31(20000) == false then  --�ж���������
				say("���Ǯ�ƺ�����������ɲ��У���ô�ܰ�����?",1055,0,"˫��")  --�Ի�
				Cls()  --����
				do return end  --�����������¼�

			end
			--say("�����츳2"..r,0,1)
			CC.TX["�����츳"]=1]]
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
		-- --say("����츳"..CC.Tiangtf[i],0,1)
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
		-- diyid = JY.Base["����" .. p]
		-- JY.Person[diyid]["��ѧ����"]=500
		-- AddPersonAttrib(diyid, "��Ʒ��������",60000)	
	-- end
	local nexty = CC.ScreenH/2-CC.DefaultFont*4 + CC.SingleLineHeight
		local p = SelectTeamMenu(CC.MainSubMenuX, nexty)
		local menu = {}
		--string.sub(ItemInfo[p["����"]][3], 3 , 12)
		
		
		--local n=0
		if p > 0 then
			
			diyid = JY.Base["����" .. p]
			
			
			for i = 0, 129 do 
			menu[#menu+1]={string.sub(ItemInfo[548+i*3][3], 3 , 12)..Xguo[Setmeal[548+i*3][4]].."��"..FJXguo[Setmeal[548+i*3][5]].."��"..ZqXguo[Setmeal[548+i*3][6]],nil,548+i*3}
			end
		--local r = ShowMenu(menu, #menu, 18, CC.MainSubMenuX-80, CC.MainSubMenuY, 0, 0, 1, 1, CC.DefaultFont*0.7, C_RED, C_WHITE)
			local clone_choice= ShowMenu(menu, #menu, 22, CC.MainSubMenuX-80, CC.MainSubMenuY, 0, 0, 1, 1, CC.DefaultFont*0.8, M_YellowGreen, C_WHITE)
		
			
			JY.Person[diyid]["����"] = menu[clone_choice][3]--��˿���� Setmeal
			JY.Person[diyid]["����"] = menu[clone_choice][3]+1--���ļ�
			JY.Person[diyid]["����"] = menu[clone_choice][3]+2--����
			-- JY.Thing[JY.Person[diyid]["����"]]["װ���ȼ�"] = 6
			-- JY.Thing[JY.Person[diyid]["����"]]["װ���ȼ�"] = 6
			-- JY.Thing[JY.Person[diyid]["����"]]["װ���ȼ�"] = 6
		end
	
end



if xuan==25 then
	--local menu1 = {"�ܲ�ͨ","������","�ֳ�Ӣ","����","������","��������","ɨ��ɮ","������","������"}
	nexty=nexty+CC.SingleLineHeight;
    local menuzd = {}
	menuzd[1]={"�ܲ�ͨ  ",nil,1}
	menuzd[2]={"������  ",nil,1}
	menuzd[3]={"�ֳ�Ӣ  ",nil,1}
	menuzd[4]={"����  ",nil,1}
	menuzd[5]={"������  ",nil,1}
	menuzd[6]={"��������    ",nil,1}
	menuzd[7]={"ɨ��ɮ    ",nil,1}
	menuzd[8]={"������  ",nil,1}
	menuzd[9]={"������  ",nil,1}
	--menuzd[10]={"ս��������  ",nil,1}	
	local zd = ShowMenu2(menuzd, #menuzd, 4, 7, CC.ScreenW/2-CC.DefaultFont*10-20, nexty, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE,"��ѡ�۽�����")
	
	if zd == 1 then
		DrawStrBoxWaitKey("���⽱������������������ý�����50% ", LimeGreen, 36,nil, C_GOLD)
				JY.Person[64]["�۽�����"] = 1	
	elseif zd == 2 then
		DrawStrBoxWaitKey("���⽱��������˺������������20% ", LimeGreen, 36,nil, C_GOLD)
				JY.Person[129]["�۽�����"] = 1
	elseif zd == 3 then
		DrawStrBoxWaitKey("���⽱����������������������50% ", LimeGreen, 36,nil, C_GOLD)
				JY.Person[605]["�۽�����"] = 1
	elseif zd == 4 then
		DrawStrBoxWaitKey("���⽱��������������������800��", LimeGreen, 36,nil, C_GOLD)
				JY.Person[604]["�۽�����"] = 1
	elseif zd == 5 then
		if PersonKF(0, 47) then
					DrawStrBoxWaitKey("���⽱���������˶��¾Ž����洫", LimeGreen, 36,nil, C_GOLD)
					JY.Person[592]["�۽�����"] = 1
				else
					DrawStrBoxWaitKey("���ƺ������һ�������", LimeGreen, 36,nil, C_GOLD)
				end
	elseif zd == 6 then
		DrawStrBoxWaitKey("���⽱������ļ����ٶ����������8��", LimeGreen, 36,nil, C_GOLD)
				JY.Person[27]["�۽�����"] = 1
	elseif zd == 7 then
		DrawStrBoxWaitKey("���⽱���������ѧ��ʶ�����100��", LimeGreen, 36,nil, C_GOLD)
				JY.Person[114]["�۽�����"] = 1
				AddPersonAttrib(0, "��ѧ��ʶ", 100)
	elseif zd == 8 then
	    DrawStrBoxWaitKey("���⽱������Ĺ��������ϵ����ֵȫ�������", LimeGreen, 36,nil, C_GOLD)
				JY.Person[5]["�۽�����"] = 1
				AddPersonAttrib(0, "������", 30)
				AddPersonAttrib(0, "������", 30)
				AddPersonAttrib(0, "�Ṧ", 30)
				AddPersonAttrib(0, "ȭ�ƹ���", 20)
				AddPersonAttrib(0, "ָ������", 20)
				AddPersonAttrib(0, "��������", 20)
				AddPersonAttrib(0, "ˣ������", 20)
				AddPersonAttrib(0, "�������", 20)
		
		
		
	elseif zd == 9 then
		DrawStrBoxWaitKey("���⽱���������˾������ֵ�����", LimeGreen, 36,nil, C_GOLD)
				JY.Person[606]["�۽�����"] = 1
	
	end
end




--instruct_33(personid,wugongid,flag)  ѧ���书
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
			menu[#menu + 1] = {JY.Person[i]["����"], nil, JY.Person[i]["����ֽ�"], i}
		end
		
		local clone_choice = ShowMenu3(menu,#menu,7,15,CC.MainMenuX+CC.Fontsmall*1-13,CC.MainMenuY+CC.Fontsmall*3+10,CC.Fontsmall, C_GOLD, C_WHITE)
		JY.Base["����"] = clone_choice
        JY.Person[0] = JY.Person[clone_choice]--]]
		local nexty = CC.ScreenH/2-CC.DefaultFont*4 + CC.SingleLineHeight
		local menu = {}
		for i = 1, JY.PersonNum - 1 do
			menu[#menu + 1] = {JY.Person[i]["����"], nil, JY.Person[i]["����ֽ�"], i}
		end
		local clone_choice= ShowMenu2(menu, #menu, 5, 15, CC.ScreenW/2-CC.DefaultFont*10-20, nexty-200, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE,"��ѡ��ɫ")
		JY.Base["����"] = clone_choice
        JY.Person[0] = JY.Person[clone_choice]
		if clone_choice == nil then 
			do return end
		end
        -- JY.Person[0]["����"] = JY.Person[clone_choice]["����"]
	-- JY.Person[0]["���"] = JY.Person[clone_choice]["���"]
        -- JY.Person[0]["��ɫָ��"] = JY.Person[clone_choice]["��ɫָ��"]
        -- JY.Person[0]["����"] = JY.Person[clone_choice]["����"]
        -- JY.Person[0]["�Ա�"] = JY.Person[clone_choice]["�Ա�"]
        -- for i=1,5 do
			-- JY.Person[0]["���ж���֡��" .. i]=JY.Person[clone_choice]["���ж���֡��" .. i]
			-- JY.Person[0]["���ж����ӳ�" .. i]=JY.Person[clone_choice]["���ж����ӳ�" .. i]
			-- JY.Person[0]["�书��Ч�ӳ�" .. i]=JY.Person[clone_choice]["�书��Ч�ӳ�" .. i]
		-- end
		-- --���빥�������25
		-- JY.Person[0]["������"]=limitX(JY.Person[clone_choice]["������"]/4,25)
		-- JY.Person[0]["������"]=limitX(JY.Person[clone_choice]["������"]/4,25)
		-- JY.Person[0]["�Ṧ"]=limitX(JY.Person[clone_choice]["�Ṧ"]/4,25)
		-- --ҽ���ö��ⶾ���30
		-- JY.Person[0]["ҽ������"]=limitX(JY.Person[clone_choice]["ҽ������"],30)
		-- JY.Person[0]["�ö�����"]=limitX(JY.Person[clone_choice]["�ö�����"],30)
		-- JY.Person[0]["�ⶾ����"]=limitX(JY.Person[clone_choice]["�ⶾ����"],30)

		-- JY.Person[0]["��������"]=JY.Person[clone_choice]["��������"]
		-- JY.Person[0]["ȭ�ƹ���"]=JY.Person[clone_choice]["ȭ�ƹ���"]
		-- JY.Person[0]["ָ������"]=JY.Person[clone_choice]["ָ������"]
		-- JY.Person[0]["��������"]=JY.Person[clone_choice]["��������"]
		-- JY.Person[0]["ˣ������"]=JY.Person[clone_choice]["ˣ������"]
		-- JY.Person[0]["�������"]=JY.Person[clone_choice]["�������"]
		-- --������������30
		-- JY.Person[0]["��������"]=limitX(JY.Person[clone_choice]["��������"],30)

		
		-- local wxcs=JY.Person[clone_choice]["��ѧ��ʶ"]-(JY.Base["��Ŀ"]-1)*20
		
		-- if wxcs>0 then
			-- JY.Person[0]["��ѧ��ʶ"]=JY.Person[clone_choice]["��ѧ��ʶ"]-(JY.Base["��Ŀ"]-1)*20
		-- else
			-- JY.Person[0]["��ѧ��ʶ"]=10
		-- end
		
		
		-- JY.Person[0]["��������"]=JY.Person[clone_choice]["��������"]
		-- JY.Person[0]["���һ���"]=JY.Person[clone_choice]["���һ���"]
	-- --�޸��书����
		-- for i=1,12 do
			-- JY.Person[0]["�书" .. i]=JY.Person[clone_choice]["�书" .. i]
			-- JY.Person[0]["�书�ȼ�" .. i]=JY.Person[clone_choice]["�书�ȼ�" .. i]
		-- end

		-- -- for i=1,4 do
			-- -- JY.Person[0]["Я����Ʒ" .. i]=JY.Person[clone_choice]["Я����Ʒ" .. i]
			-- -- JY.Person[0]["Я����Ʒ����" .. i]=JY.Person[clone_choice]["Я����Ʒ����" .. i]
		-- -- end
		
		-- for i=1,4 do
			-- JY.Person[0]["�츳�⹦"..i]=JY.Person[clone_choice]["�츳�⹦"..i]
		-- end
		
		-- JY.Person[0]["�츳�ڹ�"]=JY.Person[clone_choice]["�츳�ڹ�"]
		-- JY.Person[0]["�츳�Ṧ"]=JY.Person[clone_choice]["�츳�Ṧ"]
		-- JY.Person[0]["����ֽ�"]=JY.Person[clone_choice]["����ֽ�"]
		-- JY.Person[0]["���2"]=JY.Person[clone_choice]["���2"]
		-- JY.Person[0]["��ɫָ��"] = JY.Person[clone_choice]["��ɫָ��"]
		-- JY.Person[0]["�ȼ�"]=JY.Person[clone_choice]["�ȼ�"]




end

if xuan == 23 then
  --[[------ ľƾע��
	lib.LoadPNG(1, 1000 * 2 , 0 , 0, 1)
		--JY.PersonNum1=JY.PersonNum
	local menu = {}
	for i = 1, JY.PersonNum - 1 do
		menu[#menu + 1] = {JY.Person[i]["����"], nil, JY.Person[i]["����ֽ�"], i}
	end
	local clone_choice = ShowMenu3(menu,#menu,9,15,CC.MainMenuX+CC.Fontsmall*1-13,CC.MainMenuY+CC.Fontsmall*3+2,CC.Fontsmall, C_GOLD, C_WHITE)
	if clone_choice == 50 then clone_choice = 539 end
	instruct_10(clone_choice)
  ------]]--

  local nexty = CC.ScreenH/2-CC.DefaultFont*4 + CC.SingleLineHeight
  local menu = {}
  for i = 1, JY.PersonNum - 1 do
		menu[#menu + 1] = {JY.Person[i]["����"], nil, JY.Person[i]["����ֽ�"], i}
  end
  local clone_choice= ShowMenu2(menu, #menu, 5, 15, CC.ScreenW/2-CC.DefaultFont*10-20, nexty-200, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE,"��ѡ��ɫ")
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
	--JY.Base["��Ŀ"] =InputNum("ѡ����Ŀ", 1, 600,1);
end
if xuan ==22 then
	
	local nexty = CC.MainSubMenuY + CC.SingleLineHeight
	local p = SelectTeamMenu(CC.MainSubMenuX, nexty)
    if p > 0 then
		diyid = JY.Base["����" .. p]
		SetHuBo(diyid)
	end
	
	--instruct_2(174,30000)
	--AddZM()
	--JY.Base["��Ŀ"] =InputNum("ѡ����Ŀ", 1, 600,1);
end

if xuan == 5 then
	local nexty = CC.MainSubMenuY + CC.SingleLineHeight
	local p = SelectTeamMenu(CC.MainSubMenuX, nexty)
    if p > 0 then
		diyid = JY.Base["����" .. p]
		local r1 = JYMsgBox("��ѡ��", "����Ҫת������������", {"����","����","����","���"}, 4, 122,1)
		if r1 == 1 then
			JY.Person[diyid]["��������"] = 0
		elseif r1==2 then
			JY.Person[diyid]["��������"] = 1
		elseif r1==3 then
			JY.Person[diyid]["��������"] = 2
		elseif r1==4 then
			JY.Person[diyid]["��������"] = 3
		else
		end
	end
	
	
elseif xuan==6 then
	local r2 = JYMsgBox("��ѡ��", "����������͵��书����Ȥ��", {"ȭ��","ָ��","����","����","����",}, 5, 122,1)
	if r2 == 1 then
		AddPersonAttrib(diyid, "ȭ�ƹ���", 100)
		DrawStrBoxWaitKey("���ȭ�ƹ�������������",C_GOLD,CC.DefaultFont,nil,LimeGreen)
		Cls()  --����
	elseif r2 == 2 then
		AddPersonAttrib(diyid, "ָ������", 100)
		DrawStrBoxWaitKey("���ָ�����ɵ����������",C_GOLD,CC.DefaultFont,nil,LimeGreen)
		Cls()  --����
	elseif r2 == 3 then
		AddPersonAttrib(diyid, "��������", 100)
		DrawStrBoxWaitKey("����������������������",C_GOLD,CC.DefaultFont,nil,LimeGreen)
		Cls()  --����
	elseif r2 == 4 then
		AddPersonAttrib(diyid, "ˣ������", 100)
		DrawStrBoxWaitKey("���ˣ�����ɵ����������",C_GOLD,CC.DefaultFont,nil,LimeGreen)
		Cls()  --����
	elseif r2 == 5 then
		AddPersonAttrib(diyid, "�������", 100)
		DrawStrBoxWaitKey("���������������������",C_GOLD,CC.DefaultFont,nil,LimeGreen)
		Cls()  --����
	end
	
elseif xuan==20 then

--��ʼ

		local k = JY.Wugong;
	local menuwai = {}
	local menu  = {}
	
	local kftype = JYMsgBox("��ѡ��", "��ѡ���书����                ", {"ȭ��","ָ��","����","����","����","�ڹ�","�Ṧ"}, 7, 347)
	
	for i = 1, JY.WugongNum - 1 do
		local kfname = k[i]["����"]
		if string.len(kfname) == 8 then
			kfname = kfname.."  "
		elseif string.len(kfname) == 6 then
			kfname = kfname.."    "
		elseif string.len(kfname) == 4 then
			kfname = kfname.."      "
		end
		menuwai[i] = {kfname,nil,2}
		if k[i]["�书����"] == kftype then
			menuwai[i][3] = 1
		end
	end
	local nexty = CC.ScreenH/2-CC.DefaultFont*4 + CC.SingleLineHeight
	local r = ShowMenu2(menuwai, #menuwai, 3, 9, CC.ScreenW/2-CC.DefaultFont*10-20, nexty, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE,"ѡ���书")
	if r == 0 then
		return
	end
	
	local nexty = CC.MainSubMenuY + CC.SingleLineHeight
	local p = SelectTeamMenu(CC.MainSubMenuX, nexty)
	diyid = JY.Base["����" .. p]
	
	--[[if CC.Kungfunum>=12 then
		return
	end --]]
	instruct_33(diyid,r,CC.Kungfunum)
	
	
	--[[for j = 1, CC.Kungfunum do
        if JY.Person[diyid]["�书"..j] > 0 then
            local wg = JY.Person[diyid]["�书"..j]
            menu[#menu+1] = {JY.Wugong[wg]["����"], nil, 1, wg, j}
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
		
		--��ʼ
		--local nexty = CC.MainSubMenuY + CC.SingleLineHeight
	--local p = SelectTeamMenu(CC.MainSubMenuX, nexty)
    if p > 0 then
		--diyid = JY.Base["����" .. p]
		--SetTianWai(diyid, tianwai, r)
		instruct_33(diyid,r,geizi+1)
		
	end
		
		
		--����
		--JY.Person[diyid]["�书"..geizi] = r
		--JY.Person[diyid]["�书�ȼ�"..geizi] = 999
	end--]]

--����






elseif xuan == 2 then
	local k = JY.Wugong;
	local menuwai = {}
	
	local kftype = JYMsgBox("��ѡ��", "��ѡ��ϲ�����츳�⹦����", {"ȭ��","ָ��","����","����","����"}, 5, 347)
	
	for i = 1, JY.WugongNum - 1 do
		local kfname = k[i]["����"]
		if string.len(kfname) == 8 then
			kfname = kfname.."  "
		elseif string.len(kfname) == 6 then
			kfname = kfname.."    "
		elseif string.len(kfname) == 4 then
			kfname = kfname.."      "
		end
		menuwai[i] = {kfname,nil,2}
		if k[i]["�书����"] == kftype then
			menuwai[i][3] = 1
		end
	end
	local nexty = CC.ScreenH/2-CC.DefaultFont*4 + CC.SingleLineHeight
	local r = ShowMenu2(menuwai, #menuwai, 3, 9, CC.ScreenW/2-CC.DefaultFont*10-20, nexty, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE,"�����츳�⹦")
	if r == 0 then
		return
	end
	
	local tianwai = JYMsgBox("��ѡ��", "ϴ�ڼ����츳�⹦��", {"����1","����2"}, 2, 347,1)
	if tianwai < 0 then
		return
	end
	if r > 0 then
		--��ʼ
		local nexty = CC.MainSubMenuY + CC.SingleLineHeight
	local p = SelectTeamMenu(CC.MainSubMenuX, nexty)
    if p > 0 then
		diyid = JY.Base["����" .. p]
		SetTianWai(diyid, tianwai, r)
		
	end
		
		
		--����
		--SetTianWai(0, tianwai, r)
	end
	
	
elseif xuan == 3 then
	local k = JY.Wugong;
	local menunei = {}
	for i = 1, JY.WugongNum - 1 do
		local kfname = k[i]["����"]
		if string.len(kfname) == 8 then
			kfname = kfname.."  "
		elseif string.len(kfname) == 6 then
			kfname = kfname.."    "
		elseif string.len(kfname) == 4 then
			kfname = kfname.."      "
		end
		menunei[i] = {kfname,nil,2}
		if k[i]["�书����"] == 6 then
			menunei[i][3] = 1
		end
	end
	local nexty = CC.ScreenH/2-CC.DefaultFont*4 + CC.SingleLineHeight
	local r = ShowMenu2(menunei, #menunei, 3, 9, CC.ScreenW/2-CC.DefaultFont*10-20, nexty, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE,"�����츳�ڹ�")
	if r > 0 then
		--��ʼ
		local nexty = CC.MainSubMenuY + CC.SingleLineHeight
	local p = SelectTeamMenu(CC.MainSubMenuX, nexty)
    if p > 0 then
		diyid = JY.Base["����" .. p]
		SetTianNei(diyid, r)
		
	end
		
		--����
		--SetTianNei(0, r)
	end
	
	
elseif xuan == 1 then
	local k = JY.Wugong;
	local menuqing = {}
	for i = 1, JY.WugongNum - 1 do
		local kfname = k[i]["����"]
		if string.len(kfname) == 8 then
			kfname = kfname.."  "
		elseif string.len(kfname) == 6 then
			kfname = kfname.."    "
		elseif string.len(kfname) == 4 then
			kfname = kfname.."      "
		end
		menuqing[i] = {kfname,nil,2}
		if k[i]["�书����"] == 7 then
			menuqing[i][3] = 1
		end
		
	end
	local nexty = CC.ScreenH/2-CC.DefaultFont*4 + CC.SingleLineHeight
	local r = ShowMenu2(menuqing, #menuqing, 3, 9, CC.ScreenW/2-CC.DefaultFont*10-20, nexty, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE,"�����츳�Ṧ")
	
	if r > 0 then
		
		--��ʼ
	local nexty = CC.MainSubMenuY + CC.SingleLineHeight
	local p = SelectTeamMenu(CC.MainSubMenuX, nexty)
    if p > 0 then
		diyid = JY.Base["����" .. p]
		
		SetTianQing(diyid, r)
	end
		
		
		--����
		--SetTianQing(0, r)
	end
	
	
elseif xuan == 4 then
	local k = JY.Thing;
	local ceshi = {}
	local wutype = JYMsgBox("��ѡ��", "��Ʒ����                                       ", {"������Ʒ","�������","�书�ؼ�","�鵤��ҩ","���˰���"}, 5, 347,1)
	if wutype < 0  then
		return
	end
	local gongtype = 0
	if wutype-1 == 2 then
		gongtype = JYMsgBox("��ѡ��", "��ѡ���ؼ�����                    ", {"ȭ��","ָ��","����","����","����","�ڹ�","�Ṧ","����"}, 8, 347)
		if gongtype < 0 then
			return
		end
	end
	for i = 0, JY.ThingNum - 1 do
		local kfname = k[i]["����"]
		if string.len(kfname) == 8 then
			kfname = kfname.."  "
		elseif string.len(kfname) == 6 then
			kfname = kfname.."    "
		elseif string.len(kfname) == 4 then
			kfname = kfname.."      "
		end
		ceshi[i] = {kfname..k[i]["����"]..i,nil,2}
		if k[i]["����"] == wutype-1 then
			ceshi[i][3] = 1
			if wutype-1 == 2 and wupingisgongType(i,gongtype)~=true then
				ceshi[i][3] = 2
			end
			if wutype-1 == 2 and JY.Thing[i]["�����书"] < 0 and gongtype == 8 then
				ceshi[i][3] = 1
			end
		end
		
	end
	local nexty = CC.ScreenH/2-CC.DefaultFont*4 + CC.SingleLineHeight
	local r = 0
	r = ShowMenu2(ceshi, #ceshi, 3, 9, CC.ScreenW/2-CC.DefaultFont*10-20, nexty, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE,"��ѡ��")
	if r == 0 then
		return
	end
	if wutype-1 == 3 or r == 174 or wutype-1 == 4 then
		local nnnum = InputNum(JY.Thing[r]["����"], 1, 30000,1)
		if nnnum == nil or nnnum <= 0 then
			return
		end
		instruct_2(r,nnnum)
		return
	end
	instruct_2(r,1)
	
	
elseif xuan == 7 then
	DrawStrBoxWaitKey("���⽱��������ʵս500", C_RED, CC.DefaultFont,nil,C_GOLD)
	JY.Person[diyid]["ʵս"] = 500
	
	
elseif xuan == 8 then
	local nexty = CC.MainSubMenuY + CC.SingleLineHeight
	local p = SelectTeamMenu(CC.MainSubMenuX, nexty)
    if p > 0 then
		diyid = JY.Base["����" .. p]
		DrawStrBoxWaitKey("���⽱������ϵ����ֵ�����ٵ�", C_RED, CC.DefaultFont,nil,C_GOLD)
		AddPersonAttrib(diyid, "ȭ�ƹ���", 100)
		AddPersonAttrib(diyid, "ָ������", 100)
		AddPersonAttrib(diyid, "��������", 100)
		AddPersonAttrib(diyid, "ˣ������", 100)
		AddPersonAttrib(diyid, "�������", 100)
	end
	
	
elseif xuan==9 then
	local nexty = CC.MainSubMenuY + CC.SingleLineHeight
	local p = SelectTeamMenu(CC.MainSubMenuX, nexty)
    if p > 0 then
		diyid = JY.Base["����" .. p]
		JY.Person[diyid]["������"] = JY.Person[diyid]["������"]+100
		JY.Person[diyid]["������"] = JY.Person[diyid]["������"]+100
		JY.Person[diyid]["�Ṧ"] = JY.Person[diyid]["�Ṧ"]+100
		DrawStrBoxWaitKey("������������ٵ�", C_RED, CC.DefaultFont,nil,C_GOLD)
		--awakening(diyid,1)
	end
	
	
elseif xuan==10 then
	local nexty = CC.MainSubMenuY + CC.SingleLineHeight
	local p = SelectTeamMenu(CC.MainSubMenuX, nexty)
    if p > 0 then
		diyid = JY.Base["����" .. p]
	end
	local shux = JYMsgBox("��ѡ��", "�����ĸ����ԣ�          ", {"������","������","�Ṧ"}, 3, 347,1)
	if shux < 0  then
		return
	end
	local nnnum = InputNum("��������ֵ", 1, 1000,1)
	if nnnum == nil or nnnum <= 0 then
		return
	end
	local temp_shu = {"������","������","�Ṧ"}
	local temp_s = temp_shu[shux]
	JY.Person[diyid][temp_s] = nnnum
	
	
elseif xuan ==11 then
	local nnnum = InputNum("��������ֵ", 1, 120,1)
	if nnnum == nil or nnnum <= 0 then
		return
	end
	JY.Person[0]["Ʒ��"] = nnnum
	
	
elseif xuan ==12 then
	local k = JY.Wugong;
	local menuwai = {}
	local menu  = {}
	
	local kftype = JYMsgBox("��ѡ��", "��ѡ���书����                ", {"ȭ��","ָ��","����","����","����","�ڹ�","�Ṧ"}, 7, 347)
	
	for i = 1, JY.WugongNum - 1 do
		local kfname = k[i]["����"]
		if string.len(kfname) == 8 then
			kfname = kfname.."  "
		elseif string.len(kfname) == 6 then
			kfname = kfname.."    "
		elseif string.len(kfname) == 4 then
			kfname = kfname.."      "
		end
		menuwai[i] = {kfname,nil,2}
		if k[i]["�书����"] == kftype then
			menuwai[i][3] = 1
		end
	end
	local nexty = CC.ScreenH/2-CC.DefaultFont*4 + CC.SingleLineHeight
	local r = ShowMenu2(menuwai, #menuwai, 3, 9, CC.ScreenW/2-CC.DefaultFont*10-20, nexty, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE,"ѡ���书")
	if r == 0 then
		return
	end
	
	
	local nexty = CC.MainSubMenuY + CC.SingleLineHeight
	local p = SelectTeamMenu(CC.MainSubMenuX, nexty)
	diyid = JY.Base["����" .. p]
	
	
	for j = 1, CC.Kungfunum do
        if JY.Person[diyid]["�书"..j] > 0 then
            local wg = JY.Person[diyid]["�书"..j]
            menu[#menu+1] = {JY.Wugong[wg]["����"], nil, 1, wg, j}
        end
	end   
	local geizi = ShowMenu2(menu, #menu, 3,10, CC.MainSubMenuX, CC.MainSubMenuY, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE)
	if geizi < 0 then
		return
	end
	if r > 0 then
		JY.Person[diyid]["�书"..geizi] = r
		JY.Person[diyid]["�书�ȼ�"..geizi] = 999
	end
	
	
elseif xuan == 13 then
	DrawStrBoxWaitKey("������һ����������������20%,�������", LimeGreen, 36,nil, C_GOLD)
	JY.Person[64]["Ʒ��"] = 80
	
	
elseif xuan == 14 then	
	 Cls()
        local nexty = CC.MainSubMenuY + CC.SingleLineHeight
        local p = SelectTeamMenu(CC.MainSubMenuX, nexty)
        if p > 0 then
                local pid = JY.Base["����" .. p]
                local menu = {}
                for i = 1, CC.Kungfunum do
                        if JY.Person[pid]["�书"..i] > 0 then
                                local wg = JY.Person[pid]["�书"..i]
                                menu[#menu+1] = {JY.Wugong[wg]["����"], nil, 1, wg, i}
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
                                if JY.Thing[i]["�����书"] > 0 and JY.Thing[i]["�����书"] == menu[r][4] then
                                        thingid = i
                                        local level = math.modf(JY.Person[pid]["�书�ȼ�" .. menu[r][5]] / 100) + 1
                                        AddPersonAttrib(pid, "�������ֵ", -JY.Thing[thingid]["���������ֵ"] * level)
                                        AddPersonAttrib(pid, "�������ֵ", -JY.Thing[thingid]["���������ֵ"] * level)
                                        AddPersonAttrib(pid, "������", -JY.Thing[thingid]["�ӹ�����"] * level)
                                        AddPersonAttrib(pid, "�Ṧ", -JY.Thing[thingid]["���Ṧ"] * level)
                                        AddPersonAttrib(pid, "������", -JY.Thing[thingid]["�ӷ�����"] * level)        
                                        AddPersonAttrib(pid, "ҽ������", -JY.Thing[thingid]["��ҽ������"] * jjj * level)
                                        AddPersonAttrib(pid, "�ö�����", -JY.Thing[thingid]["���ö�����"] * jjj * level)
                                        AddPersonAttrib(pid, "�ⶾ����", -JY.Thing[thingid]["�ӽⶾ����"] * jjj * level)
                                        AddPersonAttrib(pid, "��������", -JY.Thing[thingid]["�ӿ�������"] * jjj * level)
                                        AddPersonAttrib(pid, "ȭ�ƹ���", -JY.Thing[thingid]["��ȭ�ƹ���"] * jjj * level)
										AddPersonAttrib(pid, "ָ������", -JY.Thing[thingid]["��ָ������"] * jjj * level)
                                        AddPersonAttrib(pid, "��������", -JY.Thing[thingid]["����������"] * jjj * level)
                                        AddPersonAttrib(pid, "ˣ������", -JY.Thing[thingid]["��ˣ������"] * jjj * level)
                                        AddPersonAttrib(pid, "�������", -JY.Thing[thingid]["���������"] * jjj * level)
										AddPersonAttrib(pid, "��������", -JY.Thing[thingid]["�Ӱ�������"] * jjj * level)
                                        AddPersonAttrib(pid, "��ѧ��ʶ", -JY.Thing[thingid]["����ѧ��ʶ"] * jjj * level)     										
                                        break
                                end
                        end
                        for i = menu[r][5], #menu - 1 do
                                JY.Person[pid]["�书"..i] = JY.Person[pid]["�书"..i+1]
                                JY.Person[pid]["�书�ȼ�"..i] = JY.Person[pid]["�书�ȼ�"..i+1]
                        end
                        JY.Person[pid]["�书"..#menu] = 0
                        JY.Person[pid]["�书�ȼ�"..#menu] = 0
                        QZXS(JY.Person[pid]["����"].."�Ѿ�ϴ��"..menu[r][1])
                end
        end
	
elseif xuan == 15 then
	for id = 0,JY.ThingNum - 1 do
        if JY.Thing[id]["����"] == 1 or JY.Thing[id]["����"] == 2 or JY.Thing[id]["����"] == 0 then
				if not instruct_18(id) then
                        instruct_32(id,1)
                end
        end
	end	

   
elseif xuan == 16 then	
	local nexty = CC.MainSubMenuY + CC.SingleLineHeight
	local p = SelectTeamMenu(CC.MainSubMenuX, nexty)
    if p > 0 then
        diyid = JY.Base["����" .. p]
		for i = 1, CC.Kungfunum do
			if JY.Person[diyid]["�书�ȼ�"..i] <=900 then
				JY.Person[diyid]["�书�ȼ�"..i] = 999
			end
		end
	end
	
elseif xuan == 17 then
    for i=1,CC.TeamNum do
		if JY.Base["����" .. i]>= 0 then
			diyid = JY.Base["����" .. i]
		end
		AddPersonAttrib(diyid, "�������ֵ", 999)
		AddPersonAttrib(diyid, "�������ֵ", 9999)
		JY.Person[diyid]["����"] = JY.Person[diyid]["�������ֵ"]
		JY.Person[diyid]["����"] = JY.Person[diyid]["�������ֵ"]
	end	
	DrawStrBoxWaitKey("���⽱�������������������ֵ", C_RED, CC.DefaultFont,nil,C_GOLD)
	
elseif xuan == 18 then
	local nexty = CC.MainSubMenuY + CC.SingleLineHeight
	local p = SelectTeamMenu(CC.MainSubMenuX, nexty)
    if p > 0 then
		diyid = JY.Base["����" .. p]
		local nnnum = InputNum("����������", 1, 100,1)
		if nnnum == nil or nnnum <= 0 then
			return
		end
		JY.Person[diyid]["����"] = nnnum
	end	
elseif xuan == 95 then
	--JY.Person[0]['�书1'] = 377
	--JY.Person[0]['�书�ȼ�1'] = 999
	--JoinMP(0,14,6)
	JY.Person[0]['��ѧ��ʶ'] = 500
	JY.Person[0]['ʵս'] = 500
	--JY.Person[0]['�����ڹ�'] = 102
	--JY.Person[0]['���ɼ���1'] = 108
	JY.Person[0]['��������'] = 15
	AddPersonAttrib(0, "ȭ�ƹ���", 500)
	AddPersonAttrib(0, "ָ������", 500)
	AddPersonAttrib(0, "��������", 500)
	AddPersonAttrib(0, "ˣ������", 500)
	AddPersonAttrib(0, "�������", 500)
	AddPersonAttrib(0, "������", 500)
	AddPersonAttrib(0, "�Ṧ", 500)
	AddPersonAttrib(0, "������", 500) 
	--JY.Person[0]['�书2'] = 175
	--JY.Person[0]['�书�ȼ�2'] = 999
	JY.Person[0]['����ֽ�'] = 0
	--JY.Person[0]['�����Ṧ'] = 262
	if JY.Person[0]['���ɼ���1'] < 1 then
		JY.Person[0]['���ɼ���1'] = 1
	end
	SetJX(0,1)
	AddPersonAttrib(0,"�������ֵ",10000)
	AddPersonAttrib(0,"����",psx(0,"�������ֵ"))
	if JY.Person[0]['����'] >= 80 then
		JY.Person[0]['���ɼ���3'] = 2
	elseif JY.Person[0]['����'] <= 30 then
		JY.Person[0]['���һ���'] = 2
	else
		JY.Person[0]['��ӹ'] = 3
	end		
	Hp_Max(0)
elseif xuan == 96 then
	local nexty = CC.MainSubMenuY + CC.SingleLineHeight
	local p = SelectTeamMenu(CC.MainSubMenuX, nexty)
    if p > 0 then
		diyid = JY.Base["����" .. p]
		local nnnum = InputNum("������׼����", 0, 7,0)
		if nnnum == nil  then--or nnnum <= 0
			return
		end
		JY.Person[diyid]["����ֽ�"] = nnnum
	end		
	
elseif xuan == 19 then
	local nexty = CC.MainSubMenuY + CC.SingleLineHeight
	local p = SelectTeamMenu(CC.MainSubMenuX, nexty)
    if p > 0 then
		diyid = JY.Base["����" .. p]
		local nnnum = InputNum("������Ѫ������", 1, 30,1)
		if nnnum == nil or nnnum <= 0 then
			return
		end
		JY.Person[diyid]["Ѫ������"] = nnnum
	end	
	
	
elseif xuan == 98 then
	nexty=nexty+CC.SingleLineHeight;
    local menuzd = {}
	menuzd[1]={"սʮ��а  ",nil,1}
	menuzd[2]={"սʮ����  ",nil,1}
	menuzd[3]={"ս��ʮ��  ",nil,1}
	menuzd[4]={"ս�������  ",nil,1}
	menuzd[5]={"ս��Զɽ  ",nil,1}
	menuzd[6]={"ս�ɸ�    ",nil,1}
	menuzd[7]={"ս����    ",nil,1}
	menuzd[8]={"սʯ����  ",nil,1}
	menuzd[9]={"սŷ����  ",nil,1}
	menuzd[10]={"ս��������  ",nil,1}	
	local zd = ShowMenu2(menuzd, #menuzd, 4, 7, CC.ScreenW/2-CC.DefaultFont*10-20, nexty, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE,"��ѡ��ս��")
	
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
		local temppd = JY.Person[27]["Ʒ��"]
		JY.Person[27]["Ʒ��"] = 20
		WarMain(54, 0)	
		JY.Person[27]["Ʒ��"] = temppd
	end
	
	
elseif xuan == 99 then
	local k = JY.Thing;
	local ceshi = {}
	local kfname = 0 
	for i = 0, JY.ThingNum - 1 do
		kfname = k[i]["����"]
		if string.len(kfname) == 8 then
			kfname = kfname.."  "
		elseif string.len(kfname) == 6 then
			kfname = kfname.."    "
		elseif string.len(kfname) == 4 then
			kfname = kfname.."      "
		end
		ceshi[i] = {kfname..k[i]["����"],nil,2}
		local ggid = k[i]["�����书"]
		if k[i]["����"] == 2 and ggid >0 then
			ceshi[i] = {kfname..JY.Wugong[ggid]["�书����"],nil,2}
		end
		if true then
			ceshi[i][3] = 1
		end
		

		
		
	end
	--ceshi = {}
	--ceshi[1]={""..JY.ThingNum,nil,1}
	local nexty = CC.ScreenH/2-CC.DefaultFont*4 + CC.SingleLineHeight
	local r = ShowMenu2(ceshi, #ceshi, 3, 9, CC.ScreenW/2-CC.DefaultFont*10-20, nexty, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE,"��Ʒ���")
	if r>0 then
		instruct_2(r,1)
	end
	
end
--]]
