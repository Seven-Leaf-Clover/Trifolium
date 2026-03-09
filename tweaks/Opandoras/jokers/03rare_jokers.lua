SMODS.Joker:take_ownership('opan_pendulum', { 
    rarity = 2,
    config = {extra = {Xmult = 2, Xchips = 2, toggle = 1}}   
},true)

SMODS.Joker:take_ownership('opan_nothanks', { 
    rarity = 2,
    cost = 7,
    perishable_compat = false,
    
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_steel
        info_queue[#info_queue + 1] = G.P_CENTERS.m_gold
	    return {vars = {card.ability.extra, card.ability.x_mult}}
	end,   
},true)

SMODS.Joker:take_ownership('opan_pyramid', { 
    cost = 9,
    perishable_compat = false   
},true)

SMODS.Joker:take_ownership('opan_fermata_tremolo', { 
    cost = 10,
    perishable_compat = false   
},true)

SMODS.Joker:take_ownership('opan_encore', { 
    cost = 4,
    rarity = 1,
    
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = 'e_negative_consumable', set = 'Edition', config = { extra = 1 } }
        info_queue[#info_queue + 1] = { key = 'c_fool', set = 'Tarot' }
		return {vars = {}}
           end,

	calculate = function(self, card, context)
	if context.end_of_round and G.GAME.blind.boss and context.cardarea == G.jokers then
		G.E_MANAGER:add_event(Event({func = function() 
				local card = create_card(card_type, G.consumeables, nil, nil, nil, nil, 'c_fool')
				card:set_edition({negative = true}, true)
				card:add_to_deck()
				G.consumeables:emplace(card)
				play_sound('opan_encoresfx')
			return true end }))   
		card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_encore'), colour = G.C.PURPLE})
		end
	end
},true)

SMODS.Joker:take_ownership('opan_inferno', { 
    cost = 7,   
    rarity = 2,
    config = {extra = 1},

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra}}
	end,

	calculate = function(self, card, context)
		if context.destroy_card and context.cardarea == G.play and G.GAME.current_round.hands_played == 0 and not context.blueprint then
			return {remove = true}
		end
		if context.cardarea == G.play and context.individual and G.GAME.current_round.hands_played == 0 then
			ease_dollars(-card.ability.extra)
		end
	end
    
},true)

SMODS.Joker:take_ownership('opan_lifeline', { 
    cost = 8,    
    config = {extra = {xmult = 3.5, dollars = 0}},

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.xmult, card.ability.extra.dollars}}
	end,

	calculate = function(self, card, context)
	   if context.joker_main then
	       if G.GAME.dollars == card.ability.extra.dollars then
	            return {
	                    xmult = card.ability.extra.xmult
	            }
	       end
	   end
	end   
},true)

SMODS.Joker:take_ownership('opan_baroness', { 
    rarity = 2,
    config = {extra = 1.4}   
},true)

SMODS.Joker:take_ownership('opan_sacrificialtanto', { 
    config = {extra = 0.3}   
},true)
