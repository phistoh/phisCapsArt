local addonName, phis = ...

local phisFrame = CreateFrame('Frame', addonName..'CheckFrame', UIParent)
local phisTexture = phisFrame:CreateTexture()

-------------------------
--   ADDON FUNCTIONS   --
-------------------------

-- check, if the given texture exists
-- from here: https://www.wowinterface.com/forums/showpost.php?p=337605&postcount=8
function textureExists(path)
    phisTexture:SetTexture("?")
    phisTexture:SetTexture(path)
    return (phisTexture:GetTexture() ~= "?")
end

-- first time loading the addon
local function initAddon()
	if personalCapsArt == nil then
		print('|cFF6C66CC'..GetAddOnMetadata(addonName,'Title')..' v'..GetAddOnMetadata(addonName,'Version')..'|r loaded for the first time.')
		personalCapsArt = 'default'
	end
end

-- set the caps art
local function updateCapsArt()
	initAddon()
	
	MainMenuBar.EndCaps.LeftEndCap:SetTexture('Interface\\AddOns\\phisCapsArt\\images\\'..personalCapsArt..'.tga')
	MainMenuBar.EndCaps.RightEndCap:SetTexture('Interface\\AddOns\\phisCapsArt\\images\\'..personalCapsArt..'.tga')
	MainMenuBar.EndCaps.LeftEndCap:Show()
	MainMenuBar.EndCaps.RightEndCap:Show()
end

-- change the caps art
local function changeCapsArt(filename)
	
	-- abort when texture does not exist
	if not textureExists('Interface\\AddOns\\phisCapsArt\\images\\'..filename..'.tga') then
		print('|cFF6C66CC'..addonName..':|r '..filename..'.tga not found.')
		return
	end

	personalCapsArt = filename
	updateCapsArt()
	print('|cFF6C66CC'..addonName..':|r Caps art changed to '..filename..'.tga.')
end

-------------------------
--    SLASH COMMANDS   --
-------------------------

SLASH_CFM1 = '/phiscapsart'
SLASH_CFM2 = '/pca'

SlashCmdList['PCA'] = function(args)
	changeCapsArt(args)
end

-- register event and assign function
phisFrame:RegisterEvent("PLAYER_LOGIN")
phisFrame:SetScript("OnEvent", updateCapsArt)
