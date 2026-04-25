SMODS.Stake:take_ownership('stake_blue', {          
    modifiers = function()
        G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) + .7
    end,    
}, true)
