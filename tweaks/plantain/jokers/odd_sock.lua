SMODS.Joker:take_ownership('pl_odd_sock', {
    cost = 6,
    config = { extra = { xmult_mod = 0.1, xmult = 1 } },
    
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.xmult_mod, card.ability.extra.xmult } }
  end,
  
  calculate = function(self, card, context)
    if context.pre_discard and not context.blueprint then
      local pair = false
      for k, v in ipairs(context.full_hand) do
        local first_card = v:get_id()
        local matches = 0
        for l, w in ipairs(context.full_hand) do
          if w:get_id() == first_card then matches = matches + 1 end
        end
        if matches > 1 then pair = true end
      end
      if not pair then
        card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
        return {
          message = localize('k_upgrade_ex'),
          colour = G.C.MULT,
          card = card
        }
      else
        card.ability.extra.xmult = 1
        return {
          message = localize('k_reset'),
          colour = G.C.RED
        }
      end
    end
    if context.joker_main then
      return {
        xmult = card.ability.extra.xmult
      }
    end
  end,
},true)
