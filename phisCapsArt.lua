local addonName, phis = ...

phis.texture_path = 'Interface\\AddOns\\phisCapsArt\\images\\'

local phisFrame = CreateFrame('Frame', addonName..'CheckFrame', UIParent)
local phisTexture = phisFrame:CreateTexture()

-------------------------
--   ADDON FUNCTIONS   --
-------------------------

-- check, if the given texture exists
-- from here: https://www.wowinterface.com/forums/showpost.php?p=337605&postcount=8
function textureExists(path)
    phisTexture:SetTexture(path)
	return (phisTexture:GetTexture() ~= nil)
end

-- first time loading the addon
local function initAddon()
	if personalCapsArt == nil then
		print('|cFF6C66CC'..GetAddOnMetadata(addonName,'Title')..' v'..GetAddOnMetadata(addonName,'Version')..'|r loaded for the first time.')
		personalCapsArt = 'squid'
	end
end

-- set the caps art
local function updateCapsArt()
	initAddon()
	
	MainMenuBar.EndCaps.LeftEndCap:SetTexture(phis.texture_path..personalCapsArt..'.tga')
	MainMenuBar.EndCaps.RightEndCap:SetTexture(phis.texture_path..personalCapsArt..'.tga')
	
	-- mirror right texture horizontally
	local ULx, ULy, LLx, LLy, URx, URy, LRx, LRy = MainMenuBar.EndCaps.RightEndCap:GetTexCoord()
	MainMenuBar.EndCaps.RightEndCap:SetTexCoord(URx, URy, LRx, LRy, ULx, ULy, LLx, LLy)
	
	MainMenuBar.EndCaps:SetShown(true)
end

-- change the caps art
local function changeCapsArt(filename)
	-- abort when texture does not exist
	if not textureExists(phis.texture_path..filename..'.tga') then
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

SLASH_PCA1 = '/phiscapsart'
SLASH_PCA2 = '/pca'

SlashCmdList['PCA'] = function(args)
	if args == nil or args == '' then
		print('|cFF6C66CC'..addonName..':|r Usage: /pca filename')
	else
		changeCapsArt(args)
	end
end

-- register event and assign function
phisFrame:RegisterEvent("PLAYER_LOGIN")
phisFrame:SetScript("OnEvent", updateCapsArt)