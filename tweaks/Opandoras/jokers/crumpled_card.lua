SMODS.Joker:take_ownership('opan_crumple', { 
    cost = 4,
    config = {extra = {mult = 7, chips = 77, xmult = 777, mult_odds = 2, chip_odds = 3, xmult_odds = 25}},
    
    loc_vars = function(self, info_queue, card)
        local mult_numerator, mult_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.mult_odds, 'opan_crumple_mult')
        local chip_numerator, chip_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.chip_odds, 'opan_crumple_chip')
        local xmult_numerator, xmult_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.xmult_odds, 'opan_crumple_xmult')
        return { vars = { mult_numerator, chip_numerator, xmult_numerator, mult_denominator, chip_denominator, xmult_denominator, card.ability.extra.mult, card.ability.extra.chips, card.ability.extra.xmult } }
     end,
     
     calculate = function(self, card, context)
         if context.joker_main and SMODS.pseudorandom_probability(card, 'opan_crumple_mult', 1, card.ability.extra.mult_odds) then
             return {
                 mult = card.ability.extra.mult
             }    
         elseif context.joker_main and SMODS.pseudorandom_probability(card, 'opan_crumple_chip', 1, card.ability.extra.chip_odds) then
             return {
                 chips = card.ability.extra.chips
             }  
         elseif context.joker_main and SMODS.pseudorandom_probability(card, 'opan_crumple_xmult', 1, card.ability.extra.xmult_odds) then
             return {
                 xmult = card.ability.extra.xmult
             }
         end    
      end 

	
},true)
