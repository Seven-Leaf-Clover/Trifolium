SMODS.Back {
    key = "collector",
    atlas = 'deck_atlas',
    pos = { x = 4, y = 0 },
    config = { vouchers = { 'v_hone' } },
    
    apply = function(self, back)
    -- Increase shop size by 1
        change_shop_size(1)
    -- Banned Booster Packs
    -- Arcana Packs
        G.GAME.banned_keys['p_arcana_normal_1'] = true
        G.GAME.banned_keys['p_arcana_normal_2'] = true
        G.GAME.banned_keys['p_arcana_normal_3'] = true
        G.GAME.banned_keys['p_arcana_normal_4'] = true
        G.GAME.banned_keys['p_arcana_jumbo_1'] = true
        G.GAME.banned_keys['p_arcana_jumbo_2'] = true
        G.GAME.banned_keys['p_arcana_mega_1'] = true
        G.GAME.banned_keys['p_arcana_mega_2'] = true
    -- Celestial Packs   
        G.GAME.banned_keys['p_celestial_normal_1'] = true
        G.GAME.banned_keys['p_celestial_normal_2'] = true
        G.GAME.banned_keys['p_celestial_normal_3'] = true
        G.GAME.banned_keys['p_celestial_normal_4'] = true
        G.GAME.banned_keys['p_celestial_jumbo_1'] = true
        G.GAME.banned_keys['p_celestial_jumbo_2'] = true
        G.GAME.banned_keys['p_celestial_mega_1'] = true
        G.GAME.banned_keys['p_celestial_mega_2'] = true
    end,
}    
