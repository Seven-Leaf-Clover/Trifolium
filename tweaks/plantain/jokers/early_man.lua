SMODS.Joker:take_ownership('pl_early_man', {
    cost = 5,
    
    calculate = function (self, card, context)
    if context.skip_blind or context.setting_blind and not (context.blueprint_card or self).getting_sliced and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
      G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
      G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
      G.E_MANAGER:add_event(Event({func = function()
        SMODS.add_card{set = 'Tarot', area = G.consumeables, key = 'c_wheel_of_fortune'}
        G.GAME.consumeable_buffer = 0
        return true
      end}))
      return {
          message = localize('k_plus_tarot'),
          colour = G.C.SECONDARY_SET.Tarot,
          card = card
      }
    end
  end
},true)
