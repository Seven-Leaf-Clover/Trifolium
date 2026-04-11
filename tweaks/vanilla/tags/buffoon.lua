SMODS.Tag:take_ownership("buffoon", {
    min_ante = 1,
    in_pool = function()
        return (G.GAME.round_resets.ante <= 5)
    end,
})
