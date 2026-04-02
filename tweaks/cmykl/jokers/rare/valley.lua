SMODS.Joker:take_ownership('cmykl_thevalley', { 
    cost = 9,
    config = { extra = { clubsindeck = 0, club_mult = 2 } },
    
    loc_vars = function(self, info_queue, card)
        local clubtally = 0
        if G.playing_cards then
            if next(SMODS.find_card("j_smeared")) then
                for _, playing_card in ipairs(G.playing_cards) do
                    if playing_card:is_suit("Clubs") and playing_card:is_suit("Spades") or SMODS.has_enhancement(playing_card, 'm_wild') then clubtally = clubtally + 1 end
                end
            else
                for _, playing_card in ipairs(G.playing_cards) do
                    if playing_card:is_suit("Clubs") or SMODS.has_enhancement(playing_card, 'm_wild') then clubtally = clubtally + 1 end
                end
            end
        end
        card.ability.extra.clubsindeck = clubtally * card.ability.extra.club_mult
        return {vars = {card.ability.extra.clubsindeck, card.ability.extra.club_mult}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    mult = card.ability.extra.clubsindeck
                }
        end
    end
},true)
