local items = {237, 7642}
local MainBP = "backpack"
local PotionsBP = "jewelled backpack"

Module.New("Sort Supplies", function()
local bp1 = Container(MainBP)
for spot, item in bp1:iItems() do
if (table.contains(items, item.id)) then
bp1:MoveItemToContainer(spot, Container.New(PotionsBP):Index())
break
end
end
end)