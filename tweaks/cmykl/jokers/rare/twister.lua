SMODS.Joker:take_ownership('cmykl_twister', { 
    cost = 8,
    config = { extra = { Xmult = 2 } },
    
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Xmult}}
    end,    
    
    calculate = function(self, card, context)
        if context.individual and (context.cardarea == G.play or context.cardarea == G.hand) 
            and context.other_card:get_seal() and not context.end_of_round then
                return {
                        xmult = card.ability.extra.Xmult
                }
        end
    end,
    
    in_pool = function(self, args)
        if G.GAME and G.playing_cards then
            for _, card in ipairs(G.playing_cards) do
                if card.seal then
                    return true
                end
            end
        end
        return false
    end,
},true)
