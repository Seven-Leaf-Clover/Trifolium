SMODS.Voucher:take_ownership('tarot_merchant', {
    in_pool = function()
        return (G.GAME.round_resets.ante >= 3)
    end,
})

SMODS.Voucher:take_ownership('planet_merchant', {
    in_pool = function()
        return (G.GAME.round_resets.ante >= 3)
    end,
})

SMODS.Voucher:take_ownership('telescope', {
    in_pool = function()
        return (G.GAME.round_resets.ante >= 3)
    end,
})

SMODS.Voucher:take_ownership('seed_money', {
    in_pool = function()
        return (G.GAME.round_resets.ante >= 3)
    end,
})

SMODS.Voucher:take_ownership('directors_cut', {
    in_pool = function()
        return (G.GAME.round_resets.ante >= 3)
    end,
})

SMODS.Voucher:take_ownership('blank', {
    in_pool = function()
        return (G.GAME.round_resets.ante >= 3)
    end,
})
