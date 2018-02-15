-- initialize variables
local phis_f = CreateFrame("Frame", 'phisCapsArtFrame', UIParent)
local phis_playername = ''
local phis_capsart = phis_textures['default']

-- update function
local function phisOnEvent()
	-- get player name and realm (UniName() only returns realm names when they differ from the player's realm)
	phis_playername = UnitName('player')
	phis_playername = phis_playername..'-'..GetRealmName()
	
	-- get corresponding texture
	if phis_textures[phis_playername] == nil then
		phis_capsart = phis_textures['default']
		print('No image for '..phis_playername..' found.')
	else
		phis_capsart = phis_textures[phis_playername]
	end
	
	-- set texture
	MainMenuBarLeftEndCap:SetTexture('Interface\\AddOns\\phisCapsArt\\images\\'..phis_capsart..'.tga')
	MainMenuBarRightEndCap:SetTexture('Interface\\AddOns\\phisCapsArt\\images\\'..phis_capsart..'.tga')
	MainMenuBarLeftEndCap:Show()
	MainMenuBarRightEndCap:Show()
end

-- register event and assign function
phis_f:RegisterEvent("PLAYER_LOGIN")
phis_f:SetScript("OnEvent", phis_OnEvent)
