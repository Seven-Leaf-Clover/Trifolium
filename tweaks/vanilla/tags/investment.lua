SMODS.Tag:take_ownership("investment", {
    in_pool = function()
        return (G.GAME.round_resets.ante >= 1 and G.GAME.round_resets.ante <= 7)
    end,
    config = {type = 'eval', dollars = 20}
})    
