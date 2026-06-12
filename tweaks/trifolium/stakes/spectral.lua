SMODS.Stake {
    name = "Azure Stake",
    key = "spectral",
    unlocked_stake = 'gold',
    applied_stakes = { "orange" },
    above_stake = 'orange',
    prefix_config = {above_stake = {mod = false}, applied_stakes = {mod = false}},
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
    colour = HEX('6592e6'),
    shiny = true,
    pos = { x = 1, y = 0 },
    sticker_pos = { x = 1, y = 0 },
    atlas = 'stake_atlas',
    sticker_atlas = 'stake_sticker_atlas'
}

SMODS.Stake:take_ownership('gold', {
    applied_stakes = {'tfl_spectral'},
    above_stake = 'tfl_spectral'
},true)
