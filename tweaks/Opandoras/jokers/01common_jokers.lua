SMODS.Joker:take_ownership('opan_cobblestonejoker', { 
    cost = 6,
    rarity = 2,
    enhancement_gate = "m_stone",
    
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_stone    
	    return {vars = {card.ability.extra, card.ability.mult}}
	    end,
    
},true)

SMODS.Joker:take_ownership('opan_croon', { 
    cost = 5,
    config = {extra = 4}
},true)

SMODS.Joker:take_ownership('opan_bynine', { 
    config = {extra = 9},

	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra}}
	end,

	calculate = function(self, card, context)
		if context.cardarea == G.play and context.individual then
			if context.other_card:get_id() == 9 then
			return {
				mult = card.ability.extra
			}
		end
	end
end
},true)

SMODS.Joker:take_ownership('opan_lord', { 
    cost = 7,
    rarity = 2,
    
    loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { key = 'e_negative_consumable', set = 'Edition', config = { extra = 1 } }
    info_queue[#info_queue + 1] = { key = 'c_emperor', set = 'Tarot' }
    return {vars = {card.ability.extra}}
	end,
},true)

SMODS.Joker:take_ownership('opan_tab', {
    eternal_compat = false,
    cost = 2
},true)
