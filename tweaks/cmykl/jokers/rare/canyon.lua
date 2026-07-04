SMODS.Joker:take_ownership('cmykl_thecanyon', { 
    cost = 9,
    config = { extra = { diamondsindeck = 0, canyon_money = 1.3 } },
    
    loc_vars = function(self, info_queue, card)
        local diamondtally = 0
        if G.playing_cards then
            if next(SMODS.find_card("j_smeared")) then
                for _, playing_card in ipairs(G.playing_cards) do
                    if playing_card:is_suit("Diamonds", nil, true) and playing_card:is_suit("Hearts", nil, true) or SMODS.has_enhancement(playing_card, 'm_wild') then diamondtally = diamondtally + 1 end
                end
            else
                for _, playing_card in ipairs(G.playing_cards) do
                    if playing_card:is_suit("Diamonds", nil, true) or SMODS.has_enhancement(playing_card, 'm_wild') then diamondtally = diamondtally + 1 end
                end
            end
        end
        card.ability.extra.diamondsindeck = math.floor(diamondtally * card.ability.extra.canyon_money)
        return {vars = {(card.ability.extra.diamondsindeck) or 0, card.ability.extra.canyon_money}}
    end,

    calc_dollar_bonus = function(self, card)
        return G.GAME.blind.boss and (card.ability.extra.diamondsindeck) or nil
    end,
},true)    
