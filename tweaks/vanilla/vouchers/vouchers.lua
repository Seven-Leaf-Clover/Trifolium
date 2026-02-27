SMODS.Voucher:take_ownership('tarot_merchant', {
    in_pool = function()
        return (G.GAME.round_resets.ante >= 3)
    end,
},false)

SMODS.Voucher:take_ownership('planet_merchant', {
    in_pool = function()
        return (G.GAME.round_resets.ante >= 3)
    end,
},false)

SMODS.Voucher:take_ownership('magic_trick', {
    in_pool = function()
        return (G.GAME.round_resets.ante >= 3)
    end,
},false)
