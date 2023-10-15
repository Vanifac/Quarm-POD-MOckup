
if(e.other:GetLevel() == 1 and e.other:IsSelfFound() == 0 and e.other:IsSoloOnly() == 0 and e.other:IsHardcore() == 0) then
    local is_special_flag_response = false;
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 0000000})) then -- Item: Tome of Autonomy and Solitude