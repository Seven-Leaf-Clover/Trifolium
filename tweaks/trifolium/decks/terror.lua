SMODS.Back {
    key = "terror",
    atlas = 'deck_atlas',
    pos = { x = 3, y = 0 },
    config = {  },

    loc_vars = function(self, info_queue, back)
        return { vars = { }}
    end,
    
    apply = function(self, back)
        G.GAME.tarot_rate = 0
        G.GAME.edition_rate = 0
      -- Banned Tags  
        G.GAME.banned_keys['tag_holo'] = true
        G.GAME.banned_keys['tag_foil'] = true
        G.GAME.banned_keys['tag_negative'] = true
        G.GAME.banned_keys['tag_polychrome'] = true
      -- Banned Vouchers
        G.GAME.banned_keys['v_hone'] = true
        G.GAME.banned_keys['v_glow_up'] = true
        G.GAME.banned_keys['v_tarot_merchant'] = true
        G.GAME.banned_keys['v_tarot_tycoon'] = true
    end,    
    
    calculate = function(self, back, context)
        if context.round_eval and G.GAME.last_blind and G.GAME.last_blind.boss then
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + G.consumeables.config.card_limit - #G.consumeables.cards
                local to_fill = G.consumeables.config.card_limit - #G.consumeables.cards
                for i=1, to_fill do
		    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer - to_fill
		    G.E_MANAGER:add_event(Event({
		        func = function()
                            SMODS.add_card({ set = 'Tarot',
                                             key = 'c_hanged_man',
                                             area = G.consumeables,
                                             key_append = 'tfl_terror'
                            })
                            return true
                        end
                    }))
                end
            end
        end
    end,    
}
