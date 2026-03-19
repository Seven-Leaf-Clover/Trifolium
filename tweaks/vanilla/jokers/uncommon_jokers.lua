-- Uncommons

SMODS.Joker:take_ownership('j_seance', { 
    cost = 4
})

SMODS.Joker:take_ownership('j_space', { 
    cost = 8,
    config = { 
        extra = 3
    }
})

SMODS.Joker:take_ownership('j_card_sharp', { 
    cost = 7,
    config = {extra = {Xmult = 2.5}}
})

SMODS.Joker:take_ownership('j_hack', { 
    cost = 7
})

SMODS.Joker:take_ownership('j_flower_pot', { 
    cost = 5
})

SMODS.Joker:take_ownership('j_idol', { 
    cost = 5
})

SMODS.Joker:take_ownership('j_dusk', { 
    cost = 7,
    rarity = 3,
    config = {extra = 2}
})

SMODS.Joker:take_ownership('j_mime', { 
    cost = 7,
    rarity = 3,
    in_pool = function(self, args)
     if G.playing_cards then
      for _, card in ipairs(G.playing_cards) do
       if SMODS.has_enhancement(card, 'm_gold') or SMODS.has_enhancement(card, 'm_steel') then
       return true
       end
      end
     end
    end,
})
