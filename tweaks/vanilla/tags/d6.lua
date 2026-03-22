SMODS.Tag:take_ownership("d_six", {
    in_pool = function()
        return (G.GAME.round_resets.ante >= 2 and G.GAME.round_resets.ante <= 5)
    end,
})
