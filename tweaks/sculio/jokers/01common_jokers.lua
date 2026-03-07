SMODS.Joker:take_ownership('Sculio_schrodinger', { 
    cost = 5,
    config = { extra = { odds = 2, mult = 12 } },
    
    loc_vars = function(self, info_queue, card)
    local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'schrodinger')
    return { vars = { numerator, denominator, card.ability.extra.mult } }
  end,
  calculate = function(self, card, context)
    if context.joker_main and SMODS.pseudorandom_probability(card, 'schrodinger', 1, card.ability.extra.odds) then
      return {
        mult = card.ability.extra.mult
      }
    end
  end
},true)

SMODS.Joker:take_ownership('Sculio_gumball', { 
    cost = 5,
    config = { extra = { mult = 3, mult_add_open = 2, mult_add_skip = -5, mult_min = 0 } }
},true)

SMODS.Joker:take_ownership('Sculio_sticky_keys', { 
    cost = 4,
    config = { extra = { mult = 4, hands_until_change = 3, hands_elapsed = 0 } }
},true)

SMODS.Joker:take_ownership('Sculio_binary', { 
    cost = 3,
},true)

SMODS.Joker:take_ownership('Sculio_soup', { 
    cost = 6,
    rarity = 2,
    config = { extra = { x_mult = 1.0, x_mult_gain = 0.05, x_mult_max = 2.5 } }
},true)
