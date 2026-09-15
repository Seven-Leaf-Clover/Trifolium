SMODS.Booster:take_ownership_by_kind('Arcana', {
    in_pool = function()
        return (G.GAME.round_resets.ante >= 2)
    end,
})
