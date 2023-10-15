
if(e.other:IsSelfFound() == 0 and e.other:IsSoloOnly() == 0 and e.other:IsHardcore() == 0) then
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12898, plat = 50})) then -- Item: Sapphire and 50 plat
        e.self:Say("Here's a cool blue gem I imbued for you.");
		e.other:QuestReward(e.self,{itemid = 22508,exp = 0}); -- Item: Imbued Sapphire
