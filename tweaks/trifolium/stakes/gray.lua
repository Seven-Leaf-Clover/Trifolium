SMODS.Stake {
    name = "Gray Stake",
    key = "gray",
    unlocked_stake = 'gold',
    applied_stakes = { "orange" },
    above_stake = 'orange',
    prefix_config = {above_stake = {mod = false}, applied_stakes = {mod = false}},
    calculate = function(self,context)
        if context.end_of_round and context.game_over == false and context.main_eval then
            if not G.GAME.blind.boss then
                G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) + .07
            end
        end    
    end,   
    colour = HEX('acabb8'),
    shiny = false,
    pos = { x = 3, y = 0 },
    sticker_pos = { x = 0, y = 0 },
    atlas = 'stake_atlas',
    sticker_atlas = 'stake_sticker_atlas'
}

SMODS.Stake:take_ownership('gold', {
    applied_stakes = {'tfl_gray'},
    above_stake = 'tfl_gray'
},true)
