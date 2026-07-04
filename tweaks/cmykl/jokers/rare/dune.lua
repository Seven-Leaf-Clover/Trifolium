SMODS.Joker:take_ownership('cmykl_thedune', { 
    cost = 9,
    config = { extra = { heartsindeck = 0, heart_xmult = 0.15 } },
    
    loc_vars = function(self, info_queue, card)
        local hearttally = 0
        if G.playing_cards then
            if next(SMODS.find_card("j_smeared")) then
                for _, playing_card in ipairs(G.playing_cards) do
                    if playing_card:is_suit("Hearts", nil, true) and playing_card:is_suit("Diamonds", nil, true) or SMODS.has_enhancement(playing_card, 'm_wild') then hearttally = hearttally + 1 end
                end
            else
                for _, playing_card in ipairs(G.playing_cards) do
                    if playing_card:is_suit("Hearts", nil, true) or SMODS.has_enhancement(playing_card, 'm_wild') then hearttally = hearttally + 1 end
                end
            end
        end
        card.ability.extra.heartsindeck = hearttally * card.ability.extra.heart_xmult
        return {vars = {card.ability.extra.heartsindeck, card.ability.extra.heart_xmult}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.heartsindeck
            }
        end
    end
},true)
