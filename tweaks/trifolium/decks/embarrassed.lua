SMODS.Back {
    key = "embarrassed",
    atlas = 'deck_atlas',
    pos = { x = 1, y = 0 },
    config = { vouchers = { 'v_seed_money' },
               dollars = -9 },
             
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.dollars } }
    end,
    
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                if G.playing_cards then
                    add_tag(Tag('tag_coupon'))
                    play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                    return true
                end
            end,
        }))
    end,
}    
