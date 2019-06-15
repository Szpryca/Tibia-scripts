-------------------
-- [ Settings ] ---
------------------
local radius = 3 -- Radius to consider
local spells = {{words = "exevo mas san", targets = 4, mana = 160}}
local monsters = {"Giant Spider", "Putrid Mummy", "Bonebeast"}
local playerSafe = true -- true will not cast the spell if there are players nearby (radius+2). false will execute regardless of other players, only recommended for Optional pvp.
local floorSafe = true -- true will hold fire if someone is on the floor above/below you.
local pSafeRange = radius + 10 -- how far away must other players be to cast spell
-------------------------
-- [ End of Settings ] --
-------------------------

dofile("Forgee.lua")

while true do
local targets = monstersAround(radius, unpack(monsters))
local count = 0
if playerSafe then
count = playersAround(pSafeRange)
end
if floorSafe then
local players = xrayPlayersAround(5)
for i = 1, #players do
local p = players[i]
if math.abs(Self.Position().z - p:Position().z) <= 1 then
count = count + 1
end
end
end
if count == 0 then 
if targets > 0 then
for _, spell in ipairs(spells) do
if Self.CanCastSpell(spell.words) then
if Self.Mana() > spell.mana and targets >= spell.targets then
Self.Say(spell.words)
wait(200,600)
end
end 
end
end
end
wait(400, 600)
end