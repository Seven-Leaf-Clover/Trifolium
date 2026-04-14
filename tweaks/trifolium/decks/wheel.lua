SMODS.Back {
    key = "fortunae",
    atlas = 'deck_atlas',
    pos = { x = 0, y = 0 },
    config = { joker_slot = 1 },
    
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.joker_slot } }
    end,
    
    calculate = function(self, back, context)
        if context.round_eval and G.GAME.last_blind and G.GAME.last_blind.boss then
	    for i = 1, #G.playing_cards do
		local _suit = pseudorandom_element(SMODS.Suits, pseudoseed('tfl_fortunae_1'))
		local _rank = pseudorandom_element(SMODS.Ranks, pseudoseed('tfl_fortunae_2'))
		G.E_MANAGER:add_event(Event({
		    func = function()
		        local _card = G.playing_cards[i]
		        assert(SMODS.change_base(_card, _suit.key))
		        assert(SMODS.change_base(_card, nil, _rank.key))
		        G.playing_cards[i]:juice_up(0.3, 0.3, 0.3)
		        return true
		    end
		}))
	    end
        end
    end    
}    
