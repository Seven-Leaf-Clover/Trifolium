SMODS.Consumable:take_ownership('opan_summon', {
    config = { extra = { tarots = 2, perish = 1 } },
    loc_vars = function(self, info_queue, card)
    --info_queue[#info_queue+1] = { key = 'perishable', set = 'Other' }
    info_queue[#info_queue + 1] = { key = 'e_negative_consumable', set = 'Edition', config = { extra = 1 } }
        return { vars = { card.ability.extra.tarots, card.ability.extra.perish } }
    end,  
        
    use = function(self, card, area, copier)
        for i = 1, math.min(card.ability.extra.tarots) do
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                --delay = 0.4,
                func = function()
                        --play_sound('timpani')
                        SMODS.add_card({ set = 'Tarot', 
                                         edition= 'e_negative',
                        })
                        card:juice_up(0.3, 0.5)
                    --end
                    return true
                end
            }))
        end
        delay(0.6)
    
    local available_jokers = {}    
        for _, joker in pairs(G.jokers.cards) do
            if not joker.ability.perishable and not joker.ability.eternal then
                available_jokers[#available_jokers + 1] = joker
            end
        end
        for i=1, card.ability.extra.perish do
            G.E_MANAGER:add_event(Event({
                trigger = 'after', delay = 0.7,
                func = function()
                    local joker, pos = pseudorandom_element(available_jokers, pseudoseed('summon_perish'))
                    if joker then
                    joker:add_sticker('perishable', true)
                    joker:juice_up()
                    play_sound('tarot1')
                    card:juice_up(0.3, 0.5)
                    table.remove(available_jokers, pos)
                    end
                    return true
                end  
            }))
        end
        can_use = function(self, card)
        return true
    end
 end

}, true)
