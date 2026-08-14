SMODS.Tag:take_ownership("charm", {
    in_pool = function()
        return (G.GAME.round_resets.ante >= 3 and G.GAME.round_resets.ante <= 7)
    end,
})
