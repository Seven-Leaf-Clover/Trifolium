SMODS.Joker:take_ownership('opan_fannypack', { 
    rarity = 1,
    config = {extra = { mult = 4, slot = 1, money = 10, odds = 4}},

	loc_vars = function(self, info_queue, card)
		return {vars = { card.ability.extra.mult, card.ability.extra.slot,''..(G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds, card.ability.extra.money}}
	end,

	add_to_deck = function(self, card, from_debuff)
		G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.slot
	end,

	remove_from_deck = function(self, card, from_debuff)
		G.consumeables.config.card_limit = G.consumeables.config.card_limit - card.ability.extra.slot 
	end,

	calculate = function(self, card, context)
		if context.joker_main then
		   return { mult = card.ability.extra.mult}
		end   
		
		if context.selling_self and pseudorandom('opan_fannypack') < G.GAME.probabilities.normal/card.ability.extra.odds then
			ease_dollars(card.ability.extra.money)
		end
	end

},true)

SMODS.Joker:take_ownership('opan_disciple', { 
    cost = 8,
    rarity = 3,
    enhancement_gate = "m_bonus",
    config = {extra = 1.25},
    
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_bonus     
	    return {vars = {card.ability.extra}}
	end,
},true)

SMODS.Joker:take_ownership('opan_ansaunum', { 
    Opandoras_Box = {
        only_shop_pool = true,
        only_booster_pool = true
    },
    
    cost = 7,
    
    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,

},true)

SMODS.Joker:take_ownership('opan_caveman', { 
    cost = 6,
},true)

SMODS.Joker:take_ownership('opan_blackfriday', { 
    cost = 6,
    
loc_vars = function(self, info_queue, card)
       info_queue[#info_queue + 1] = { key = 'tag_coupon', set = 'Tag' }
           return {vars = {localize{type = 'name_text', set = 'Tag', key = 'tag_coupon', nodes = {}}}}
           end,

	calculate = function(self, card, context)
		if context.selling_self and G.GAME.blind.in_blind then
			G.E_MANAGER:add_event(Event({
				func = (function()
					add_tag(Tag('tag_coupon'))
					play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
					play_sound('opan_blackfriday')
					return true end)}))
				end
	end



},true)

SMODS.Joker:take_ownership('opan_blob', { 
    cost = 5,
    
    config = {extra = 1},

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra}}
	end,

	calculate = function(self, card, context)
		--setting hands to 1
		if context.setting_blind  and not (context.blueprint_card or card).getting_sliced then
			G.E_MANAGER:add_event(Event({func = function()
				G.GAME.current_round.discards_left = 1
				play_sound('card1')
				card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_blob'), colour = G.C.BLUE}) 
			return true end }))
		end

		--giving money when playing cards
		if context.individual and context.cardarea == G.play then
			return {
				dollars = card.ability.extra
			}
		end

	end
    
},true)

SMODS.Joker:take_ownership('opan_eyeforaneye', { 
    cost = 6,
    enhancement_gate = "m_bonus",
    config = {extra = 0.75},
    
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_bonus
		return {vars = {card.ability.extra, card.ability.x_chips}}
	end,
},true)

SMODS.Joker:take_ownership('opan_framework', { 
    cost = 6,
    config = {extra = {odds = 7}}
},true)

SMODS.Joker:take_ownership('opan_leprechaun', { 
    cost = 8,
    enhancement_gate = "m_lucky",
    
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_lucky
	    return {vars = {card.ability.extra+1}}
	end,
},true)

SMODS.Joker:take_ownership('opan_last_resort', { 
    cost = 7,
    config = {extra = 4},
    
    loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra}}
	end,

	calculate = function(self, card, context)
		if context.joker_main and #G.deck.cards == 26 then
			return {
				message = localize{type='variable',key='a_xmult',vars={card.ability.extra}},
				Xmult_mod = card.ability.extra
			}
		end
	end
},true)

SMODS.Joker:take_ownership('opan_litany', { 
    config = {extra = 0.6, Xmult = 1},
},true)

SMODS.Joker:take_ownership('opan_miner', { 
    cost = 6,
    config = {extra = 2},
    
    set_ability = function(self, card, initial)
        card:set_rental(true)
    end,
    
},true)

SMODS.Joker:take_ownership('opan_moolah', { 
    cost = 6,
    config = {extra = 3},
    enhancement_gate = "m_gold",
    
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_gold
	return {vars = {card.ability.extra, card.ability.extra * math.floor((card.ability.gold_tally or 0) / 2)}}
	end,
},true)

SMODS.Joker:take_ownership('opan_morethemerrier', {
    cost = 7,
    config = {extra = 1.25},

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra, (G.jokers and G.jokers.cards and #G.jokers.cards or 0)*card.ability.extra}}
	end,

	calculate = function(self, card, context)
	if context.other_joker and context.other_joker.config.center.rarity == 1 then
			G.E_MANAGER:add_event(Event({func = function()
				context.other_joker:juice_up(0.5, 0.5)
				return true end })) 
				return {
				xmult = card.ability.extra
				}
			end
	end
},true)

SMODS.Joker:take_ownership('opan_multitool', {
    config = {extra = {mult = 4, chips = 0, chip_mod = 20}},
},true)

SMODS.Joker:take_ownership('opan_pickpocket', {
    config = {extra = {odds = 3, money = 0, multiplier = 2}},
},true)

SMODS.Joker:take_ownership('opan_whitecollar', { 
    cost = 6,
    config = {extra = 0.5},
},true)
