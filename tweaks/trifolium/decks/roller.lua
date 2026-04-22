SMODS.Back {
    key = "roller",
    atlas = 'deck_atlas',
    pos = { x = 5, y = 0 },
    config = { vouchers = { 'v_reroll_surplus' } },
    
    apply = function(self, back)
        SMODS.change_booster_limit(-1)
    end,    
}    
