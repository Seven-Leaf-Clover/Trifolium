SMODS.Joker:take_ownership('cmykl_themountain', { 
    cost = 9,
    config = { extra = { spadesindeck = 0, spade_chip = 9 } },
    
    loc_vars = function(self, info_queue, card)
        local spadetally = 0
        if G.playing_cards then
            if next(SMODS.find_card("j_smeared")) then
                for _, playing_card in ipairs(G.playing_cards) do
                    if playing_card:is_suit("Spades") and playing_card:is_suit("Clubs") or SMODS.has_enhancement(playing_card, 'm_wild') then spadetally = spadetally + 1 end
                end
            else
                for _, playing_card in ipairs(G.playing_cards) do
                    if playing_card:is_suit("Spades") or SMODS.has_enhancement(playing_card, 'm_wild') then spadetally = spadetally + 1 end
                end
            end
        end
        card.ability.extra.spadesindeck = spadetally * card.ability.extra.spade_chip
        return {vars = {card.ability.extra.spadesindeck, card.ability.extra.spade_chip}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    chips = card.ability.extra.spadesindeck
                }
        end
    end
},true)
