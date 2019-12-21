module("extensions.customcards", package.seeall)
extension = sgs.Package("customcards", sgs.Package_CardPack)

local cards = {}
local file = io.open("./extensions/custom-cards.txt", "r")
for line in file:lines() do
	local t = line:split(" ")
	local s = sgs.Card_NoSuit
	if t[2] == "diamond" then
		s = sgs.Card_Diamond
	elseif t[2] == "heart" then
		s = sgs.Card_Heart
	elseif t[2] == "spade" then
		s = sgs.Card_Spade
	elseif t[2] == "club" then
		s = sgs.Card_Club
	end
	table.insert(cards, sgs.Sanguosha:cloneCard(t[1], s, t[3]))
--	table.insert(cards, sgs.Sanguosha:cloneCard("shit", sgs.Card_Diamond, 3))
end
file:close()

for _, card in ipairs(cards) do
	card:setParent(extension)
end

-- 方片Q火攻
-- for i=1,52,1 do
-- 	local card1 = sgs.Sanguosha:cloneCard("fire_attack", sgs.Card_Diamond, 12)
-- 	card1:setParent(extension)
-- end


sgs.LoadTranslationTable{
	["customcards"] = "自定义卡牌包",
}
