SMODS.Back {
    key = "seance",
    atlas = 'deck_atlas',
    pos = { x = 2, y = 0 },
    config = { spectral_rate = 3 },

    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.spectral_rate } }
    end,

    apply = function(self, back)
        SMODS.change_booster_limit(-2)
        change_shop_size(2)
     -- Banned Vouchers   
        G.GAME.banned_keys['v_cmykl_mispack'] = true
        G.GAME.banned_keys['v_cmykl_fatstacks'] = true
     -- Banned Jokers   
        G.GAME.banned_keys['j_red_card'] = true
        G.GAME.banned_keys['j_hallucination'] = true
        G.GAME.banned_keys['j_pl_pop_up_joker'] = true
    end
}
