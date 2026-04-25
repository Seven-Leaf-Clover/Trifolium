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
    calculate = function(self,context)
        if context.modify_weights and context.pool_types.Booster then
            for _, pack in pairs(context.pool) do
                if pack.key == "p_spectral_normal_1" or
                    pack.key == "p_spectral_normal_2" or
                    pack.key == "p_spectral_jumbo_1" or
                    pack.key == "p_spectral_mega_1" then
                    pack.weight = pack.weight * 1.8
                end    
            end
        end
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
