SMODS.Back:take_ownership("green", {
    apply = function(self)
        G.GAME.banned_keys['v_seed_money'] = true
        G.GAME.banned_keys['v_money_tree'] = true
    end
})
