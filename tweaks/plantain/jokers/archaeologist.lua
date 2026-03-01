SMODS.Joker:take_ownership('pl_archaeologist', {

config = { extra = { mult = 3 } },
  loc_vars = function(self, info_queue, card)
    return {vars = { localize(card.ability.extra.suit, 'suits_singular'), card.ability.extra.mult, colours = {G.C.SUITS[card.ability.extra.suit]}}}
  end,
  
  set_ability = function(self, card, initial, delay_sprites)
    local suits = {'Diamonds', 'Clubs', 'Hearts', 'Spades'}
    local new_suit = pseudorandom_element(suits, pseudoseed('mandjtv'..G.GAME.round_resets.ante))
    card.ability.extra.suit = new_suit
	end,

  calculate = function (self, card, context)
    if context.cardarea == G.hand and not context.end_of_round and context.individual and not context.repetition and context.other_card:is_suit(card.ability.extra.suit) then
      return {
        mult_mod = card.ability.extra.mult,
        card = context.other_card,
        message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
      }
    end
    if context.end_of_round and not context.repetition and not context.individual then
      local suits = {'Diamonds', 'Clubs', 'Hearts', 'Spades'}
      for k, v in ipairs(suits) do
        if v == card.ability.extra.suit then
          suits[k] = nil
        end
      end
      local new_suit = pseudorandom_element(suits, pseudoseed('mandjtv'..G.GAME.round_resets.ante))
      card.ability.extra.suit = new_suit
    end
  end
},true)
