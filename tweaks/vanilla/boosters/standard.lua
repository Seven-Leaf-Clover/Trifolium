-- Ante Window
SMODS.Booster:take_ownership_by_kind('Standard', {
    in_pool = function()
        return (G.GAME.round_resets.ante >= 1 and G.GAME.round_resets.ante <= 6)
    end,
})

-- Booster Pack cost change

SMODS.Booster:take_ownership('p_standard_normal_1', {
    cost = 2,
})

SMODS.Booster:take_ownership('p_standard_normal_2', {
    cost = 2,
})

SMODS.Booster:take_ownership('p_standard_normal_3', {
    cost = 2,
})

SMODS.Booster:take_ownership('p_standard_normal_4', {
    cost = 2,
})

SMODS.Booster:take_ownership('p_standard_jumbo_1', {
    cost = 3,
})

SMODS.Booster:take_ownership('p_standard_jumbo_2', {
    cost = 3,
})

SMODS.Booster:take_ownership('p_standard_mega_1', {
    cost = 5,
})

SMODS.Booster:take_ownership('p_standard_mega_2', {
    cost = 5,
})
