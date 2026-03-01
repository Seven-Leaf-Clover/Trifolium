SMODS.Joker:take_ownership('pl_raw_meat', {
    cost = 5,
    rarity = 2,
    
    config = { extra = { current_rounds = 0, total_rounds = 2, antes = 1 }},
    
    loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.total_rounds, card.ability.extra.current_rounds, card.ability.extra.antes
      }
    }
  end,
  
  calculate = function(self, card, context)
    if context.selling_self and (card.ability.extra.current_rounds >= card.ability.extra.total_rounds) and not context.blueprint then
      ease_ante(-card.ability.extra.antes)
      G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante - card.ability.extra.antes
      return { message = localize('pl_raw_meat_ante_down'), colour = G.C.BLACK }
    end

    if context.end_of_round and G.GAME.blind.boss and context.game_over == false and context.main_eval and not context.blueprint then
      card.ability.extra.current_rounds = card.ability.extra.current_rounds + 1
      if card.ability.extra.current_rounds == card.ability.extra.total_rounds then
        local eval = function(card) return not card.REMOVED end
        juice_card_until(card, eval, true)
      end
      return {
        message = (card.ability.extra.current_rounds < card.ability.extra.total_rounds) and (card.ability.extra.current_rounds .. '/' .. card.ability.extra.total_rounds) or localize('k_active_ex'), colour = G.C.FILTER
      }
    end
  end
    
},true)
