SMODS.Joker:take_ownership('j_ticket', {
    blueprint_compat = false,
    cost = 4,
    enhancement_gate = 'm_gold',
    config = { extra = 1 },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_gold
        local gold_tally = 0
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_gold') then gold_tally = gold_tally + 1 end
        end
        return { vars = { card.ability.extra, card.ability.extra * gold_tally } }
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
        -- Recalculate booster costs whenever a card enhancement changes
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

-- Booster pack cost reduction
local card_set_cost_ref = Card.set_cost
function Card:set_cost(...)
    local ret = card_set_cost_ref(self, ...)
    if next(SMODS.find_card('j_ticket')) then
        if self.ability and self.ability.set == 'Booster' then
            local gold_tally = 0
            for _, playing_card in ipairs(G.playing_cards or {}) do
                if SMODS.has_enhancement(playing_card, 'm_gold') then gold_tally = gold_tally + 1 end
            end
            self.cost = math.max(0, self.cost - gold_tally)
        end
    end
    return ret
end

-- Disable the hardcoded vanilla Golden Ticket behavior
local card_calculate_joker_ref = Card.calculate_joker
function Card:calculate_joker(context)
    local is_custom_golden_ticket =
        self.config
        and self.config.center_key == 'j_ticket'
        and self.ability

    if not is_custom_golden_ticket then
        return card_calculate_joker_ref(self, context)
    end

    local original_name = self.ability.name
    self.ability.name = '__custom_golden_ticket__'

    local success, result = xpcall(function()
        return card_calculate_joker_ref(self, context)
    end, debug.traceback)

    -- Always restore the original name, including if an error occurs
    self.ability.name = original_name

    if not success then
        error(result)
    end
    return result
end
