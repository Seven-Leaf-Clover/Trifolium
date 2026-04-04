SMODS.Joker:take_ownership('cmykl_rebellion', { 
    cost = 6,
    rarity = 2,
    config = { extra = { Xmult = 1, xmult_gain = 0.04 } },
    
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Xmult, card.ability.extra.xmult_gain}}
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
                    card.ability.extra.Xmult = (card.ability.extra.Xmult) + card.ability.extra.xmult_gain
                    return true
                end
                }
            end
        end
    end
},true)
