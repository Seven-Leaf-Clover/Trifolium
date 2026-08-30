SMODS.Joker:take_ownership('j_ticket', {
    blueprint_compat = false,
    cost = 4,
    enhancement_gate = "m_gold",
    config = { extra = { off = 1 } },
    
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_gold
        local gold_tally = 0
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_gold') then gold_tally = gold_tally + 1 end
        end
        return { vars = { card.ability.extra.off, card.ability.extra.off * gold_tally } }
    end, 
    
    add_to_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
            func = function()
                for _, other_card in pairs(G.I.CARD) do
                    if other_card.set_cost then other_card:set_cost() end
                end
                return true
            end
        }))
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
            func = function()
                for _, other_card in pairs(G.I.CARD) do
                    if other_card.set_cost then other_card:set_cost() end
                end
                return true
            end
        }))
    end,
    
    calculate = function(self, card, context)
        -- Recalculate booster cost whenever a card changes
        if context.setting_ability then
            G.E_MANAGER:add_event(Event({
                func = function()
                    for _, other_card in pairs(G.I.CARD) do
                        if other_card.set_cost then other_card:set_cost() end
                    end
                    return true
                end
            }))
        end
    end
})

local card_set_cost_value_ref = Card.set_cost_value
function Card:set_cost_value(...)
    local ret = card_set_cost_value_ref(self, ...)
    if next(SMODS.find_card("j_ticket")) then
        if self.ability.set == 'Booster' then
            local gold_tally = 0
            for _, playing_card in ipairs(G.playing_cards or {}) do
                if SMODS.has_enhancement(playing_card, 'm_gold') then gold_tally = gold_tally + 1 end
            end
            self.cost = math.max(0, self.cost - gold_tally)
        end
    end
    return ret
end
