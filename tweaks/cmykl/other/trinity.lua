SMODS.Consumable:take_ownership('cmykl_trinity', {
    cost = 4,
    
    use = function(self, card, area, copier)
	for i = 1, #G.hand.highlighted do
	    local highlighted = G.hand.highlighted[i]
	    G.E_MANAGER:add_event(Event({func = function()
		play_sound('tarot1')
		card:juice_up(0.3, 0.5)
	    return true end }))
				
	    G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
		highlighted:set_seal('cmykl_spectralseal', nil, true)
	    return true end }))
				
	    delay(0.5)
	    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
	end
    end,
    
    can_use = function(self, card, area)
	if G.hand and (#G.hand.highlighted == 1) and G.hand.highlighted[1] then
	    return true
	else
	    return false
	end
    end
}, true)
