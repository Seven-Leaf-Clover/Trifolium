SMODS.Back:take_ownership("green", {
    apply = function(self)
     -- Banned Vouchers
        G.GAME.banned_keys['v_seed_money'] = true
        G.GAME.banned_keys['v_money_tree'] = true
     -- Banned Jokers   
        G.GAME.banned_keys['j_to_the_moon'] = true
    end
})
