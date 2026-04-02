SMODS.Joker:take_ownership('cmykl_stripedjoker', { 
    rarity = 2,
    config = { extra = { Xmult = 2 } },
    
    loc_vars = function(self, info_queue, card)     
	return {vars = {card.ability.extra.Xmult}}
    end,
    
    calculate = function(self, card, context)
        local hand = context.scoring_hand
        if context.cardarea == G.play then
            if #context.scoring_hand == 5 then
                local card1 = hand[1]:get_id()
                local card3 = hand[3]:get_id()
                local card5 = hand[5]:get_id()
                local card2 = hand[2]:get_id()
                local card4 = hand[4]:get_id()

            matcher = (card1 == card3 and card1 == card5 and card2 == card4 and card1 ~= card2)

            elseif #context.scoring_hand == 4 then
                local card1 = hand[1]:get_id()
                local card3 = hand[3]:get_id()
                local card2 = hand[2]:get_id()
                local card4 = hand[4]:get_id()

            matcher = (card1 == card3 and card2 == card4 and card1 ~= card2)
            end  
        end
        if matcher and context.joker_main then
            return {
                    Xmult = card.ability.extra.Xmult
            }
        end
    end
},true)
