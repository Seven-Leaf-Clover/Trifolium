SMODS.Joker:take_ownership('pl_postcard', {
    cost = 3,
    config = { extra = { Xmult = 1 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.Xmult + (G.GAME.pl_postcards_sold or 0), card.ability.extra.planets } }
  end,
  
  calculate = function(self, card, context)
    if context.selling_self then
      G.GAME.pl_postcards_sold = (G.GAME.pl_postcards_sold or 0) + 1
    end
    if context.joker_main and context.cardarea == G.jokers then
      if G.GAME.pl_postcards_sold ~= nil then
        return {
          Xmult_mod = card.ability.extra.Xmult + G.GAME.pl_postcards_sold,
          message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult + G.GAME.pl_postcards_sold } }
        }
      end
    end
    
    if context.selling_self and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit and not context.blueprint then
    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
    local planet_pool = {'c_pluto', 'c_mercury', 'c_uranus', 'c_venus', 'c_saturn', 'c_jupiter', 'c_earth'}
    local planet_key = pseudorandom_element(planet_pool, pseudoseed('postcard_tfl'))
    G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                SMODS.add_card({
                    set = 'Planet',
                    key = planet_key,
                    area = G.consumables,
                    key_append = 'post_tfl',
                })
                G.GAME.consumeable_buffer = 0
                play_sound('whoosh')
                return true
            end
            }))
            
            return {
                message = 'Hello!',
                colour = G.C.BLUE
            }
        end
    end
},true)
