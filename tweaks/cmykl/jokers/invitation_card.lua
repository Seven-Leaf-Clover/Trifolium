SMODS.Joker:take_ownership('cmykl_invitationcard', {
    cost = 7,
    rarity = 2,
    
    config = { extra = { hype = 1, xmult_gain = 0.07 } },
    
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.hype, card.ability.extra.xmult_gain}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not G.GAME.blind.boss and not context.blueprint then
            card.ability.extra.hype = card.ability.extra.hype + card.ability.extra.xmult_gain
            return {
                message = "Hype!"
            }
        end
        if G.GAME.blind and G.GAME.blind.boss then
            if context.cardarea == G.jokers and context.joker_main  then
                    return {
                        message = "Celebrate!",
                        xmult = card.ability.extra.hype
                    }
            end
        end
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
                return {
                    message = "End!",
                    func = function()
                    card.ability.extra.hype = 1
                    return true
                end
                }
        end
    end

},true)
