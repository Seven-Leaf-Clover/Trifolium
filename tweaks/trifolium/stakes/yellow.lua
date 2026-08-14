SMODS.Stake {
    name = "Yellow Stake",
    key = "yellow",
    unlocked_stake = 'purple',
    applied_stakes = { "tfl_emerald" },
    above_stake = 'tfl_emerald',
    prefix_config = {above_stake = {mod = false}, applied_stakes = {mod = false}},
    calculate = function(self,context)
        if context.end_of_round and context.game_over == false and context.main_eval then
            if not G.GAME.blind.boss and (G.GAME.round_resets.ante >= 5 and G.GAME.round_resets.ante <= G.GAME.win_ante) then
                G.GAME.inflation = G.GAME.inflation + 1
            end    
        end
        
        if context.ante_change and G.GAME.won then
            G.GAME.inflation = 0
        end    
    end,   
    colour = HEX('ebc313'),
    shiny = false,
    pos = { x = 2, y = 0 },
    sticker_pos = { x = 0, y = 0 },
    atlas = 'stake_atlas',
    sticker_atlas = 'stake_sticker_atlas'
}

SMODS.Stake:take_ownership('purple', {
    applied_stakes = {'tfl_yellow'},
    above_stake = 'tfl_yellow'
},true)
