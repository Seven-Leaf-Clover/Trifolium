SMODS.Joker:take_ownership('cmykl_matchingcolorchip', {

    rarity = 1,
    config = { extra = { mult = 0, mult_gain = 1 } },
    
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
            card.ability.extra.mult,
            card.ability.extra.mult_gain,
            colours = { HEX('e974db') }
            },
    }
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main and not context.blueprint then
            local sCount = 0
            local cCount = 0
            local dCount = 0
            local hCount = 0
            for i, playing_card in ipairs(context.scoring_hand) do
                if playing_card:is_suit("Spades") then
                    sCount = sCount + 1
                end
                if playing_card:is_suit("Clubs") then
                    cCount = cCount + 1
                end
                if playing_card:is_suit("Diamonds") then
                    dCount = dCount + 1
                end
                if playing_card:is_suit("Hearts") then
                    hCount = hCount + 1
                end
            end
            if (sCount >= 3) or (cCount >= 3) or (dCount >= 3) or (hCount >= 3)  then
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
            end
            return {
                            mult = card.ability.extra.mult
                        }
                    end
                end

},true)
