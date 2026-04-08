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
