SMODS.Joker:take_ownership('opan_pyramid', { 
    cost = 9,
    perishable_compat = false,
    config = {extra = { gain = 0.1, xmult = 1} },

    loc_vars = function(self, info_queue, card)
	return {vars = {card.ability.extra.gain, card.ability.extra.xmult}}
    end,

    calculate = function(self, card, context)
	if context.before and not context.blueprint then
	    local reset = true
	    local play_more_than = (G.GAME.hands[context.scoring_name].played or 0)
	    local most_played_hand = nil
	    local highest_play_count = 0
	    for k, v in pairs(G.GAME.hands) do
		if v.played > highest_play_count and v.visible then
		    highest_play_count = v.played
		    most_played_hand = k
		end
	    end
	    if context.scoring_name == most_played_hand then
		reset = false
	    end
	    if reset then
		if card.ability.extra.xmult > 1 then
		    card.ability.extra.xmult = 1
		    return {
			    message = localize('k_reset')
		    }
		end
	    else card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.gain
	        return {
			message = localize('k_upgrade_ex')
		}
	    end
	end
	
	if context.joker_main then
	    return {
                    xmult = card.ability.extra.xmult
            }
        end
    end
},true)
