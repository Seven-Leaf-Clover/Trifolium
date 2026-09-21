-- Ante Window
SMODS.Booster:take_ownership_by_kind('Standard', {
    in_pool = function()
        return (G.GAME.round_resets.ante >= 1 and G.GAME.round_resets.ante <= 6)
    end,
})
