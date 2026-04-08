SMODS.Joker:take_ownership('opan_fannypack', { 
    rarity = 1,
    config = {extra = { mult = 4, slot = 1, money = 10, odds = 4}},

	loc_vars = function(self, info_queue, card)
		return {vars = { card.ability.extra.mult, card.ability.extra.slot,''..(G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds, card.ability.extra.money}}
	end,

	add_to_deck = function(self, card, from_debuff)
		G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.slot
	end,

	remove_from_deck = function(self, card, from_debuff)
		G.consumeables.config.card_limit = G.consumeables.config.card_limit - card.ability.extra.slot 
	end,

	calculate = function(self, card, context)
	    if context.joker_main then
		return { mult = card.ability.extra.mult}
	    end   
		
	    if context.selling_self and pseudorandom('opan_fannypack') < G.GAME.probabilities.normal/card.ability.extra.odds then
		ease_dollars(card.ability.extra.money)
	    end
	end

},true)
