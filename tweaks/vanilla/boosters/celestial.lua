SMODS.Booster:take_ownership_by_kind('Celestial', {
    in_pool = function()
        return (G.GAME.round_resets.ante >= 3)
    end,
})
