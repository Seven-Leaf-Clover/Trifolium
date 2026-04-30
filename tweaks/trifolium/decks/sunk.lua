SMODS.Back {
    key = "gambler",
    atlas = 'deck_atlas',
    pos = { x = 0, y = 1 },
    config = { consumable_slot = -1 },
    
    calculate = function(self, back, context)
        if context.skip_blind or context.setting_blind then
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        SMODS.add_card({
                            set = 'Tarot',
                            key = 'c_wheel_of_fortune',
                            area = G.consumables,
                            key_append = 'tfl_gambling',
                    })
                    G.GAME.consumeable_buffer = 0
                    return true
                end
                }))
            end
        end
    end    
}    
