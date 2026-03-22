SMODS.Joker:take_ownership('pl_matryoshka', {
    cost = 7,
},true)

SMODS.Joker:take_ownership('pl_el_dorado', {
    cost = 6,
    config = { extra = { money_mod = 2 } },
},true)

SMODS.Joker:take_ownership('pl_black_cat', {
    cost = 9,
    rarity = 3
},true)

SMODS.Joker:take_ownership('pl_loose_batteries', {
    cost = 7,
},true)

SMODS.Joker:take_ownership('pl_painterly_joker', {
    cost = 6,
},true)

SMODS.Joker:take_ownership('pl_hot_air_balloon', {
    cost = 5,
    perishable_compat = true,
    config = { extra = { money = 2, money_mod = 1 } },
    
    set_ability = function(self, card, initial)
        card:set_perishable(true)
    end,
    
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.money, card.ability.extra.money_mod } }
  end,
  
  calc_dollar_bonus = function(self, card)
    local bonus = card.ability.extra.money
    if bonus > 0 then return bonus end
  end,

  calculate = function(self, card, context)
    if context.using_consumeable and not context.blueprint and not context.repetition and not context.individual and (context.consumeable.ability.set == "Tarot") then
        card.ability.extra.money = card.ability.extra.money + card.ability.extra.money_mod
        return {
            message = localize('k_upgrade_ex'),
            colour = G.C.PURPLE
        }
    end
  end
},true)

SMODS.Joker:take_ownership('pl_three_body_problem', {
    cost = 8,
    rarity = 3,   
    config = {extra = {xmult = 4, dollars = 25, jokers = 4, cards = 52}},
    
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmult, 
                        card.ability.extra.dollars, 
                        card.ability.extra.jokers, 
                        card.ability.extra.cards
        }}
    end,
    
    calculate = function(self, card, context)
        if context.joker_main then
            if G.GAME.dollars > card.ability.extra.dollars 
                and #G.jokers.cards == card.ability.extra.jokers
                    and #G.playing_cards < card.ability.extra.cards then
                        return {
                                xmult = card.ability.extra.xmult
                        }
            end
        end
    end    
},true)
