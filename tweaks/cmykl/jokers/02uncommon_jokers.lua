SMODS.Joker:take_ownership('cmykl_yellowmark', {

config = { extra = { illustrative_dollar_gain = 2, dollar_mult = 2 } },
    loc_vars = function(self, info_queue, card)
        local vouchers_used = 0
        for k, v in pairs(G.GAME.used_vouchers) do vouchers_used = vouchers_used + 1 end
        return { vars = { card.ability.extra.illustrative_dollar_gain, vouchers_used * card.ability.extra.dollar_mult } }
    end,
    calc_dollar_bonus = function(self, card)
        local vouchers_used = 0
        for k, v in pairs(G.GAME.used_vouchers) do
            vouchers_used = vouchers_used + 1 end
        return vouchers_used > 0 and vouchers_used * card.ability.extra.dollar_mult or nil
    end,

},true)

SMODS.Joker:take_ownership('cmykl_stickerbomb', {
    cost = 8,
    config = {
        extra = { odds = 8 } },
},true)

SMODS.Joker:take_ownership('cmykl_polycoria', {
    cost = 7
},true)

SMODS.Joker:take_ownership('cmykl_apparition', {
    cost = 5,
    config = {
        extra = { odds = 4 } },
},true)

SMODS.Joker:take_ownership('cmykl_companyid', {
    cost = 6
},true)

SMODS.Joker:take_ownership('cmykl_licenseplate', {
    cost = 7
},true)

SMODS.Joker:take_ownership('cmykl_cubedjoker', {
    rarity = 3,
    cost = 7,
    
    config = { extra = { xmult = 4, cards = 64 } },
    
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, card.ability.extra.cards}}
    end,
    
    calculate = function(self, card, context)
        if context.joker_main then
            if #G.playing_cards >= card.ability.extra.cards then
                return {
                        xmult = card.ability.extra.xmult
                }
            end
        end
    end    
},true)
