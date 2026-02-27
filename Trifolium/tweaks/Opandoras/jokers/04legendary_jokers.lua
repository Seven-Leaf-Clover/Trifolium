SMODS.Joker:take_ownership('opan_mezzetino', { 
    config = {extra = {gain = 2, total = 0, shop_slot = 1}},
},true)

SMODS.Joker:take_ownership('opan_balanzone', { 
    config = {extra = {retriggers= 1, dollars = 40}},
    
    loc_vars = function(self, info_queue, card)
		return {vars = { card.ability.extra.retriggers, card.ability.extra.dollars, card.ability.extra.retriggers * math.floor(((G.GAME.dollars or 0) + (G.GAME.dollar_buffer or 0)) / card.ability.extra.dollars) } }
	end,

	calculate = function(self, card, context)
		local messages = {
			'Behold!',
			'More of me!',
			'Yes!',
			'Once more!',
			'Anew!',
			'Come forth!',
			'Furthermore!',
			'Repetition!',
			'Rehearse!',
			'Recapitulation!',
			'Echolalia!',
			'Duplication!',
			'Recite!',
			'Encore!',
			'Reiterate!',
			'Reoccurence!',
			'Ah-ha!',
			'Keep going!'
		}

		if context.repetition_only or (context.retrigger_joker_check) then
                for i = 1, #G.jokers.cards do
                    return {
                        repetitions = card.ability.extra.retriggers * math.floor(((G.GAME.dollars or 0) + (G.GAME.dollar_buffer or 0)) / card.ability.extra.dollars),
                        card = G.jokers.cards[i],
                        colour = G.C.RED,
                        message = messages[math.random(#messages)],
                    }  
                end
	    end
	end
},true)

SMODS.Joker:take_ownership('opan_cicero', { 
    
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = 'e_negative_consumable', set = 'Edition', config = { extra = 1 } }
        return {vars = {   }}
    end,

    calculate = function(self, card, context)
        local messages = {
                'Brrrr... Chilly',
                'hee, hee, hee',
                'ho, ho, ho',
                'Stab, stab, stab!',
                'Sharp Sharp',
                'Crazy? Cicero?',
                'Tra la la',
                'Tra la lee',
                'Oh so deadly...',
                'Maidenless?',
                'Foolish Cicero...',       
        }
        if context.setting_blind and not context.blueprint then
            local my_pos = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                    break
                end
            end
            if my_pos and G.jokers.cards[my_pos + 1] and not SMODS.is_eternal(G.jokers.cards[my_pos + 1], card) and not G.jokers.cards[my_pos + 1].getting_sliced then
                local sliced_card = G.jokers.cards[my_pos + 1]
                sliced_card.getting_sliced = true
                G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.joker_buffer = 0
                        card:juice_up(0.8, 0.8)
                        sliced_card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
                        play_sound('slice1', 0.96 + math.random() * 0.08)
                        SMODS.add_card({ set = 'Spectral',
                                         edition = 'e_negative'
                                         })
                        return true
                    end
                }))  
                return {
                    message = messages[math.random(#messages)],
                    colour = G.C.PURPLE,
                }
                end
            end
        end   
                      
},true)
