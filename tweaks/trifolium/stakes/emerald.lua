SMODS.Stake {
    name = "Emerald Stake",
    key = "emerald",
    unlocked_stake = 'purple',
    applied_stakes = { "blue" },
    above_stake = 'blue',
    prefix_config = {above_stake = {mod = false}, applied_stakes = {mod = false}},
    modifiers = function()
        change_shop_size(1)
    end,   
    colour = HEX('419757'),
    shiny = true,
    pos = { x = 0, y = 0 },
    sticker_pos = { x = 0, y = 0 },
    atlas = 'stake_atlas',
    sticker_atlas = 'stake_sticker_atlas'
}

SMODS.Stake:take_ownership('purple', {
    applied_stakes = {'tfl_emerald'},
    above_stake = 'tfl_emerald'
},true)
