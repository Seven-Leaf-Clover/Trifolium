SMODS.Joker:take_ownership('opan_scratchcard', { 
    cost = 4,
    config = {extra = {comm_odds = 2, unco_odds = 5, rare_odds = 10, soul_odds = 20}},
    
    loc_vars = function(self, info_queue, card)
        local comm_numerator, comm_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.comm_odds, 'opan_scratch_comm')
        local unco_numerator, unco_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.unco_odds, 'opan_scratch_unco')
        local rare_numerator, rare_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.rare_odds, 'opan_scratch_rare')
        local soul_numerator, soul_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.soul_odds, 'opan_scratch_soul')
        return { vars = { comm_numerator, unco_numerator, rare_numerator, soul_numerator, comm_denominator, unco_denominator, rare_denominator, soul_denominator } }
     end,
     
     calculate = function(self, card, context)
         if context.selling_self and G.jokers and #G.jokers.cards < G.jokers.config.card_limit and not context.blueprint and  SMODS.pseudorandom_probability(card, 'opan_scratch_comm', 1, card.ability.extra.comm_odds) then
            G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                SMODS.add_card({ set = 'Joker',
                                 rarity = 'Common'
                })
                return true
            end
            }))
        end    
        
        if context.selling_self and G.jokers and #G.jokers.cards < G.jokers.config.card_limit and not context.blueprint and  SMODS.pseudorandom_probability(card, 'opan_scratch_unco', 1, card.ability.extra.unco_odds) then
            G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                SMODS.add_card({ set = 'Joker',
                                 rarity = 'Uncommon'
                })
                return true
            end
            }))
        end
        
        if context.selling_self and G.jokers and #G.jokers.cards < G.jokers.config.card_limit and not context.blueprint and  SMODS.pseudorandom_probability(card, 'opan_scratch_rare', 1, card.ability.extra.rare_odds) then
            G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.7,
            func = function()
                SMODS.add_card({ set = 'Joker',
                                 rarity = 'Rare'
                })
                return true
            end
            }))
        end
        
        if context.selling_self and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit and not context.blueprint and  SMODS.pseudorandom_probability(card, 'opan_scratch_soul', 1, card.ability.extra.soul_odds) then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1 
            G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                SMODS.add_card({ set = 'Spectral',
                                 key = 'c_soul'
                })
                G.GAME.consumeable_buffer = 0
                play_sound('opan_jackpothit')
                return true
            end
            }))
            return {
                --play_sound('opan_jackpothit'),            
                message = localize('k_lotterysoul'),
                colour = G.C.PURPLE,
            }
        end    
    end,    
         

	
},true)
