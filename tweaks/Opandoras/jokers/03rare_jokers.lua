SMODS.Joker:take_ownership('opan_pendulum', { 
    rarity = 2,
    config = {extra = {Xmult = 2, Xchips = 2, toggle = 1}}
    
},true)

SMODS.Joker:take_ownership('opan_nothanks', { 
    rarity = 2,
    cost = 7,
    
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_steel
        info_queue[#info_queue + 1] = G.P_CENTERS.m_gold
	    return {vars = {card.ability.extra, card.ability.x_mult}}
	end,
    
},true)

SMODS.Joker:take_ownership('opan_pyramid', { 
    cost = 9
    
},true)

SMODS.Joker:take_ownership('opan_fermata_tremolo', { 
    cost = 10
    
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
