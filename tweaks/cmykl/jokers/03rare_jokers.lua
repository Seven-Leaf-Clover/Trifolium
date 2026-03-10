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

SMODS.Joker:take_ownership('cmykl_themountain', { 
    cost = 9
},true)

SMODS.Joker:take_ownership('cmykl_thedune', { 
    cost = 9
},true)

SMODS.Joker:take_ownership('cmykl_thevalley', { 
    cost = 9
},true)

SMODS.Joker:take_ownership('cmykl_thecanyon', { 
    cost = 9
},true)

SMODS.Joker:take_ownership('cmykl_rebellion', { 
    cost = 6,
    rarity = 2,
    config = { extra = { Xmult = 1 } },
    
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Xmult}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.Xmult
                }
        end
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if context.other_card:is_face() then
                card.ability.extra.Xmult = 1
                return {
                    message = "Silence!",
                    colour = G.C.BLACK
                }
            end
        end
        if context.discard  then
            if (function()
    local rankFound = false
    for i, c in ipairs(context.full_hand) do
        if c:is_face() then
            if context.other_card:is_face() and not context.blueprint then rankFound = true end
            break
        end
    end
    
    return rankFound
end)() then
                return {
                    func = function()
                    card.ability.extra.Xmult = (card.ability.extra.Xmult) + 0.03
                    return true
                end
                }
            end
        end
    end
},true)

SMODS.Joker:take_ownership('cmykl_twister', { 
    cost = 8,
    config = { extra = { Xmult = 2 } },
    
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Xmult}}
    end,    
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and 
           context.other_card:get_seal() then
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
