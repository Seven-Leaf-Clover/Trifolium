SMODS.Consumable {
    key = 'pit',
    atlas = 'consumable_atlas',
    pos = { x = 0, y = 0 },
    discovered = true,
    set = 'Spectral',
    cost = 4,
    config = { extra = { destroy = 3, rerolls = 3 } },
    
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.destroy, card.ability.extra.rerolls } }
    end,
    
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 1
    end,
    
    use = function(self, card, area, copier)
        local destroyed_cards = {}
        local temp_hand = {}

        for _, playing_card in ipairs(G.hand.cards) do 
            temp_hand[#temp_hand + 1] = playing_card 
        end
        
        table.sort(temp_hand,
            function(a, b)
                local rank_a = SMODS.Ranks[a.base.value]
                local rank_b = SMODS.Ranks[b.base.value]
                
                local val_a = (rank_a.nominal or 0) + (rank_a.face_nominal or 0)
                local val_b = (rank_b.nominal or 0) + (rank_b.face_nominal or 0)
                
                return val_a > val_b
            end
        )

        for i = 1, math.min(card.ability.extra.destroy, #temp_hand) do 
            destroyed_cards[#destroyed_cards + 1] = temp_hand[i] 
        end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        SMODS.destroy_cards(destroyed_cards)

        delay(0.3)
        G.GAME.current_round.free_rerolls = G.GAME.current_round.free_rerolls + card.ability.extra.rerolls
        calculate_reroll_cost(true)
    end,
}    
