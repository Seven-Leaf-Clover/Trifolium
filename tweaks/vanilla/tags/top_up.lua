SMODS.Tag:take_ownership("top_up", {
    min_ante = 1,
    in_pool = function()
        return (G.GAME.round_resets.ante <= 2)
    end,
})
