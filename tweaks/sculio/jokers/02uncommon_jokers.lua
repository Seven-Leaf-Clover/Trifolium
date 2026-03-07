SMODS.Joker:take_ownership('Sculio_pop_star', { 
    config = { extra = { odds = 6 } }
},true)

SMODS.Joker:take_ownership('Sculio_stonks', { 
    cost = 3,
    rarity = 1,
    config = { extra = { chips = 5 } },
    
    loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips } }
  end,
    
    calculate = function(self, card, context)
    if context.joker_main then
      return {
        chips = card.ability.extra.chips
      }  
    end

    if context.end_of_round and not context.repetition and context.game_over == false and not context.blueprint and G.GAME.blind.boss then
      card.ability.extra.chips = card.ability.extra.chips * 2
      return { message = localize('k_upgrade_ex'), colour = G.C.BLUE }
    end
  end
},true)

SMODS.Joker:take_ownership('Sculio_rorschach', { 
    cost = 5
},true)

SMODS.Joker:take_ownership('Sculio_wacky', { 
    cost = 5,
    rarity = 1
},true)

SMODS.Joker:take_ownership('Sculio_figurine', { 
    cost = 5
},true)

SMODS.Joker:take_ownership('Sculio_critical_failure', { 
    cost = 7,
    enhancement_gate = "m_lucky"
},true)

SMODS.Joker:take_ownership('Sculio_receipt', { 
    cost = 7,
    
    set_ability = function(self, card, initial)
        card:set_rental(true)
    end,
    
    config = {extra = 2},
    
    loc_vars = function(self, info_queue, card)
           return {vars = {card.ability.extra}}
    end,
    
    calculate = function(self, card, context)
         if context.joker_main then
              return {
                      xmult = card.ability.extra
              }
         end
    end     
},true)

SMODS.Joker:take_ownership('Sculio_jokerium', { 
    cost = 5,
    rarity = 1,
    
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = 'e_negative_consumable', set = 'Edition', config = { extra = 1 } }
    end,
    calculate = function(self, card, context)
        if context.setting_blind and context.blind.boss and G.consumeables.cards[1] then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local card_to_copy, _ = pseudorandom_element(G.consumeables.cards, 'trifolium_jokerium')
                    local copied_card = copy_card(card_to_copy)
                    copied_card:set_edition("e_negative", true)
                    copied_card:add_to_deck()
                    G.consumeables:emplace(copied_card)
                    return true
                end
            }))
            return { message = localize('k_duplicated_ex'), colour = G.C.BLACK }
        end
    end,
},true)

SMODS.Joker:take_ownership('Sculio_nametag', {
    cost = 9,
    rarity = 3,
    config = { extra = { x_mult = 1, x_mult_gain = 0.10 } },
},true)
