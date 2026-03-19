SMODS.Consumable:take_ownership('pl_spec_rebirth', {
    cost = 4,
    
    can_use = function(self, card)
        return true
    end,
    
    use = function(self, card, area)
        local used_tarot = copier or card
        Trifolium.juice_flip(used_tarot)

	    for i = 1, #G.playing_cards do
		local _suit = pseudorandom_element(SMODS.Suits, pseudoseed('tfl_rebirth_1'))
		local _rank = pseudorandom_element(SMODS.Ranks, pseudoseed('tfl_rebirth_2'))
		    G.E_MANAGER:add_event(Event({
			func = function()
			    local _card = G.playing_cards[i]
			    assert(SMODS.change_base(_card, _suit.key))
			    assert(SMODS.change_base(_card, nil, _rank.key))
			    G.playing_cards[i]:juice_up(0.3, 0.3, 0.3)

			    return true
			    end
		    }))
	    end
	    
	for i = 1, #G.hand.cards do
            local percent = 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    G.hand.cards[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
    end
}, true)
