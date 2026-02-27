local function tfl_middle_calc_effect(card, extramult, extrachips)
    if not G.jokers then
        -- viewing card outside a run
        return {
            chips = 0,
            mult = 0
        }
    end
    local my_pos = nil
    local cards_to_left = 0
    local cards_to_right = 0
    for i = 1, #G.jokers.cards do
        if G.jokers.cards[i] == card then
            my_pos = i
        elseif my_pos == nil then
            cards_to_left = cards_to_left + 1
        else
            cards_to_right = cards_to_right + 1
        end
    end
    local chips = cards_to_right * extrachips
    local mult = cards_to_left * extramult
    if my_pos == nil then
        chips = 0
        mult = 0
    end
    return {
        chips = chips,
        mult = mult
    }
end


SMODS.Joker:take_ownership('opan_middle_child', {
    config = {extra = {slot = 1, jokers = 2, calc_slot = 0, mult = 4, chips = 20}},
    
    loc_vars = function(self, info_queue, card)
        local effect = tfl_middle_calc_effect(card, card.ability.extra.mult, card.ability.extra.chips)
        return {vars = {card.ability.extra.slot, card.ability.extra.jokers, card.ability.extra.mult, card.ability.extra.chips, effect.mult, effect.chips}}
	end,

    calculate = function(self, card, context)
        if context.joker_main then
            local target_card = context.blueprint_card or card
            local effect = tfl_middle_calc_effect(target_card, card.ability.extra.mult, card.ability.extra.chips)
        
            if effect.mult > 0 then
                return {
                mult = -effect.mult
                }
            end
            
            if effect.chips > 0 then
                return {
                chips = -effect.chips
                }
            end
        end    
        
        if context.cardarea == G.jokers then
        local joker_count = 0
	    for _, v in pairs(G.jokers.cards) do
	            if v ~= card then
			joker_count = joker_count + 1
		    end
	end
	local new_calc_slot = math.floor(joker_count / card.ability.extra.jokers) * card.ability.extra.slot

        if new_calc_slot ~= card.ability.extra.calc_slot then
        local sumndifferent = new_calc_slot - card.ability.extra.calc_slot
	G.jokers.config.card_limit = G.jokers.config.card_limit + sumndifferent
	card.ability.extra.calc_slot = new_calc_slot
        end
    end
end,
	remove_from_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.calc_slot
	end
}, true)
