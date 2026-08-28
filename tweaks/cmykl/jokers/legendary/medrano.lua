SMODS.Joker:take_ownership('cmykl_medrano', {
    config = {
        extra = {
            chips = 160,
            mult = 30,
            Xmult = 3,
            spectral = 1,
            tarot = 2,
            level = 5,
            
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.mult, 
                    card.ability.extra.chips, 
                    card.ability.extra.Xmult, 
                    card.ability.extra.spectral,
                    card.ability.extra.tarot,
                    card.ability.extra.level
            }
        }
    end,
    
    calculate = function(self, card, context)
        if context.setting_blind then
            return {
                    message = 'Boum Boum!',
                    colour = G.C.BLACK,
            }
        end    
        if context.joker_main then
            local roll = pseudorandom_element({'mult',
                                               'chips',
                                               'xmult',
                                               'spectral',
                                               'tarot',
                                               'level'
                         })
            if roll == 'mult' then
                return {
                    mult = card.ability.extra.mult,
                }
            elseif roll == 'chips' then
                return {
                    chips = card.ability.extra.chips,
                }
            elseif roll == 'xmult' then
                return {
                    x_mult = card.ability.extra.Xmult,
                }
            elseif roll == 'spectral' then
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        for _ = 1, card.ability.extra.spectral do
                            SMODS.add_card {
                                set = 'Spectral',
                                soulable = true,
                                edition = 'e_negative',
                                key_append = 'cmykl_medrano_spectral'
                            }
                        end
                        return true
                    end)
                }))
                return {
                    message = localize('k_spectral'),
                    colour = G.C.SECONDARY_SET.Spectral
                }
            elseif roll == 'tarot' then
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        for _ = 1, card.ability.extra.tarot do
                            SMODS.add_card {
                                set = 'Tarot',
                                edition = 'e_negative',
                                key_append = 'cmykl_medrano_tarot'
                            }
                        end
                        return true
                    end)
                }))
                return {
                    message = localize('k_tarot'),
                    colour = G.C.SECONDARY_SET.Tarot
                }
            elseif roll == 'level' then
                local _poker_hands = {}
                local random_hands = {}
                for _, k in ipairs(G.handlist) do
                    local v = G.GAME.hands[k]
                    if v.visible then
                        _poker_hands[#_poker_hands + 1] = k
                    end
                end
                for i = 1, card.ability.extra.level do
                    local random_hand = pseudorandom_element(_poker_hands, pseudoseed('tfl_mdrn')) or "High Card"
                    table.insert(random_hands, random_hand)
                    for i = #_poker_hands, 1, -1 do
                        if _poker_hands[i] == random_hand then
                        table.remove(_poker_hands, i)
                        end
                    end
                end
                local levels = 1
                update_hand_text({sound = 'button',volume = 0.7,pitch = 0.8,delay = 0.3}, {
                handname = localize('tfl_meteor'),
                chips = "...",
                mult = "...",
                level = "..."
                })
                for i = 1, #random_hands do
                    level_up_hand(nil, random_hands[i], true, levels)
                end
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    func = function()
                        play_sound('tarot1')
                        G.TAROT_INTERRUPT_PULSE = true
                        return true
                    end
                }))
                update_hand_text({delay = 0}, {mult = "+",StatusText = true})
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.9,
                    func = function()
                        play_sound('tarot1')
                        return true
                    end
                }))
                update_hand_text({delay = 0}, {chips = "+",StatusText = true})
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.9,
                    func = function()
                        play_sound('tarot1')
                        G.TAROT_INTERRUPT_PULSE = nil
                        return true
                    end
                }))
                update_hand_text({sound = 'button',volume = 0.7,pitch = 0.9,delay = 0}, {level = "+" .. levels})
                delay(1.3)
                update_hand_text({sound = 'button',volume = 0.7,pitch = 1.1,delay = 0}, {mult = 0,chips = 0,handname = '',level = ''})
                return {
                    message = localize('k_level_up_ex'),
                    colour = G.C.SECONDARY_SET.Planet
                }    
            end
        end
    end
},true)
