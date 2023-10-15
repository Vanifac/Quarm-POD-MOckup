function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. " .  Are you a child of Order?  If you have come seeking the path of Discord. I require only that you give me your [Tome of Order and Discord] and I shall show you the way.  Only then will you be freed from Order's confining restraints. You may also ask me about alternate [rulesets]");
	elseif(e.message:findi("tome")) then
		e.self:Say("The Tome of Order and Discord was penned by the seventh member of the Tribunal and has become the key to a life of Discord, in spite of the author's pitiful warnings.  Do you not have one, child of Order?  Would you [like to read] it?");
	elseif(e.message:findi("read")) then
		e.self:Say("Very well. Here you go. Simply return it to me to be released from the chains of Order.");
		e.other:SetPVP(false);
		e.other:SummonCursorItem(18700); -- Item: Tome of Order and Discord
	end
	if(e.other:GetLevel() == 1 and e.other:IsSelfFound() == 0 and e.other:IsSoloOnly() == 0 and e.other:IsHardcore() == 0) then
		if(e.message:findi("rulesets")) then
			e.self:Say("I offer to bind you three different rulesets, [solo], [self found], and [hardcore]. Should you wish to bind yourself to this fate, speak the ruleset, read the tome and return any number of the 3 tomes to me at one time.");
			e.other:Message(13, "By accepting any of these options, you will immediately be completely reset and sent back to your starting location. This will be irreversible.");
		end
        elseif(e.message:findi("solo")) then
			e.self:Say("The Tome of Autonomy and Solitude is for those wishing to be purely self-reliant. You will be bound by the rules contained within should you return it to me.");
			e.other:SummonCursorItem(000000); -- Item: Tome of Autonomy and Solitude
		end
        elseif(e.message:findi("self found")) then
			e.self:Say("The Tome of Ambition and Purpose is for those wishing to claw their own triumphs from the land");
			e.other:SummonCursorItem(000000); -- Item: Tome of Ambition and Purpose
		end
        elseif(e.message:findi("hardcore")) then
			e.self:Say("The Tome of Precipice and Depair is for those chasing risk. ");
			e.other:SummonCursorItem(000000); -- Item: Tome of Precipice and Depair
		end
	else
		if(e.message:findi("rulesets")) then
		e.self:Say("I can't offer you anything as you are above the first season, or have already chosen your rulesets. Begone, mortal.");
		elseif(e.message:findi("solo")) then
			e.self:Say("I can't offer you anything as you are above the first season, or have already chosen your rulesets. Begone, mortal.");
		elseif(e.message:findi("self found")) then
			e.self:Say("I can't offer you anything as you are above the first season, or have already chosen your rulesets. Begone, mortal.");
		elseif(e.message:findi("hardcore")) then
			e.self:Say("I can't offer you anything as you are above the first season, or have already chosen your rulesets. Begone, mortal.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18700})) then
		e.self:Say("I see you wish to join us in Discord! Welcome! By turning your back on the protection of Order you are now open to many more opportunities for glory and power. Remember that you can now be harmed by those who have also heard the call of Discord.");
		e.other:SetPVP(true);
		e.other:Ding();
	end
    if(e.other:GetLevel() == 1 and e.other:IsSelfFound() == 0 and e.other:IsSoloOnly() == 0 and e.other:IsHardcore() == 0) then
	    local is_special_flag_response = false;
	    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 0000000})) then -- Item: Tome of Autonomy and Solitude
	    	e.self:Say("You will lead a life of solitude. Feast or famine, the harvest will not reap itself.");
	    	e.other:SetSoloOnly(1);
	    	is_special_flag_response = true;
	    end
	    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 0000000})) then -- Item: Tome of Ambition and Purpose
	    	e.self:Say("You will be an achiever. Feats wrought in blood. Your pedestal is");
	    	e.other:SetSelfFound(1);
	    	is_special_flag_response = true;
	    end
	    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 0000000})) then -- Item: Tome of Precipice and Depair
	    	e.self:Say("You will live your life on the precipice. Your end abrupt, your despair a clean slate.");
	    	e.other:SetHardcore(1);
	    	is_special_flag_response = true;
	    end
	    if(is_special_flag_response) then
	    	e.other:ClearPlayerInfoAndGrantStartingItems();
	    end
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Solo, SF and Hardcore options added by Secrets
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
