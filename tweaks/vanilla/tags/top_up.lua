SMODS.Tag:take_ownership("top_up", {
    in_pool = function()
        return (G.GAME.round_resets.ante >= 1 and G.GAME.round_resets.ante <= 3)
    end,
})
