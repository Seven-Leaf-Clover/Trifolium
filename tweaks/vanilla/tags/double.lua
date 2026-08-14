SMODS.Tag:take_ownership("double", {
    in_pool = function()
        return (G.GAME.round_resets.ante >= 2 and G.GAME.round_resets.ante <= 7)
    end,
})
