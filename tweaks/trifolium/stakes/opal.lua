local opal_booster_costs = {
    p_standard_normal_1 = 2,
    p_standard_normal_2 = 2,
    p_standard_normal_3 = 2,
    p_standard_normal_4 = 2,

    p_standard_jumbo_1 = 3,
    p_standard_jumbo_2 = 3,

    p_standard_mega_1 = 4,
    p_standard_mega_2 = 4,
}

-- Save the normal prices once, before any stake modifies them.
local default_booster_costs = {}

for key in pairs(opal_booster_costs) do
    local booster = G.P_CENTERS[key]
    if booster then
        default_booster_costs[key] = booster.cost
    end
end

local function restore_booster_costs()
    for key, cost in pairs(default_booster_costs) do
        if G.P_CENTERS[key] then
            G.P_CENTERS[key].cost = cost
        end
    end
end

local function apply_opal_booster_costs()
    for key, cost in pairs(opal_booster_costs) do
        if G.P_CENTERS[key] then
            G.P_CENTERS[key].cost = cost
        end
    end
end

SMODS.Stake {
    name = "Opal Stake",
    key = "opal",
    --unlocked_stake = 'orange',
    applied_stakes = { "gold" },
    above_stake = 'gold',
    prefix_config = {above_stake = {mod = false}, applied_stakes = {mod = false}},
    modifiers = function()
        apply_opal_booster_costs()
    end,  
    colour = HEX('fcebc5'),
    shiny = true,
    pos = { x = 4, y = 0 },
    sticker_pos = { x = 4, y = 0 },
    atlas = 'stake_atlas',
    sticker_atlas = 'stake_sticker_atlas'
}

--SMODS.Stake:take_ownership('orange', {
--    applied_stakes = {'tfl_opal'},
--    above_stake = 'tfl_opal'
--},true)

-- Reset prices whenever a new run initializes its stake chain.
local original_setup_stake = SMODS.setup_stake

SMODS.setup_stake = function(stake_index)
    restore_booster_costs()
    return original_setup_stake(stake_index)
end
