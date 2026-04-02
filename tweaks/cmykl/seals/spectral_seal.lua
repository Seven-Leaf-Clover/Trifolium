SMODS.Seal:take_ownership('cmykl_spectralseal', {

    loc_txt = {
        name = 'Spectral Seal',
        label = 'Spectral Seal',
        text = {
        'Creates a {C:dark_edition}Negative{}',
        '{C:spectral}Spectral{} card',
        'when {C:attention}destroyed{}'
    }
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = 'e_negative_consumable', set = 'Edition', config = { extra = 1 } }
        return {vars = {   }}
    end,

    calculate = function(self, card, context)
        if context.remove_playing_cards then
            for k, ssd in ipairs(context.removed) do
                if ssd == card then
                    return {
                        func = function()
                            local created_consumable = false
                                created_consumable = true
                                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        SMODS.add_card{
                                            set = 'Spectral',
                                            soulable = true,
                                            edition = 'e_negative',
                                            key_append = 'enhanced_card_spectral'
                                        }
                                        G.GAME.consumeable_buffer = 0
                                        return true
                                    end
                                }))
                            if created_consumable then
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {
                                    message = "+1 Spectral!",
                                    colour = G.C.SECONDARY_SET.Spectral
                                })
                            end
                            return true
                        end
                    }
                end
            end
        end
    end,
    draw = function(self, card, layer)
        if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
            G.shared_seals[card.seal].role.draw_major = card
            G.shared_seals[card.seal]:draw_shader('dissolve', nil, nil, nil, card.children.center)
            G.shared_seals[card.seal]:draw_shader('voucher', nil, card.ARGS.send_to_shader, nil, card.children.center)
        end
    end
},true)
