SMODS.Joker:take_ownership('cmykl_doubletap', {
    cost = 5,
    
    config = { extra = { repetitions = 1, mult = 2 } },
    
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.repetitions, card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and (context.other_card == context.scoring_hand[#context.scoring_hand]) then
              return {
                repetitions = card.ability.extra.repetitions,
                message = "Bang!",
                colour = G.C.BLACK
              }
        end
        
        if context.individual and context.cardarea == G.play and (context.other_card == context.scoring_hand[#context.scoring_hand]) then
           return {
               mult = card.ability.extra.mult,
               card = context.other_card
             }
        end
    end,

},true)

SMODS.Joker:take_ownership('cmykl_humanity', {
    cost = 2
},true)
