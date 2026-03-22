SMODS.Tag:take_ownership("coupon", {
    in_pool = function()
        return (G.GAME.round_resets.ante >= 1 and G.GAME.round_resets.ante <= 5)
    end,
})
