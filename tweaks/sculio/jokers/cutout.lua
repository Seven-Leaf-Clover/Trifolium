SMODS.Joker:take_ownership('Sculio_cutout', { 
    config = { joker_slots = 1, extra = { x_mult = 0.6 } },  
    
  get_x_mult_mod = function(self)
    if G.jokers and #G.jokers.cards > 1 then
      return 1 + (self.config.extra.x_mult * (#G.jokers.cards - 1))
    else
      return 1
    end
  end,
  
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.joker_slots, card.ability.extra.x_mult, self:get_x_mult_mod(self) } }
  end,
  
  add_to_deck = function(self, card, from_debuff)
	G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.joker_slots
	end,
  remove_from_deck = function(self, card, from_debuff)
	G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.joker_slots
	end,
  
  calculate = function(self, card, context)
    local x_mult_mod = self:get_x_mult_mod(self)

    if context.joker_main and x_mult_mod > 1 then
      return {
        Xmult_mod = x_mult_mod,
        message = localize { type = 'variable', key = 'a_xmult', vars = { x_mult_mod } }
      }
    end
  end   
},true)
