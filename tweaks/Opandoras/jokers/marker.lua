SMODS.Tag:take_ownership("opan_focus", {
    config = { extra = { enhance = 4 } },

    loc_vars = function(self, info_queue, tag)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_mult
        info_queue[#info_queue + 1] = G.P_CENTERS.m_bonus
        info_queue[#info_queue + 1] = G.P_CENTERS.m_wild
        return {vars = {tag.config.extra.enhance}}
    end,
    
    apply = function(self, tag, context)
        if context.type == 'immediate' then
            tag:yep('+', G.C.DARK_EDITION,function()
                for i = 1, math.min(tag.config.extra.enhance) do
                    local deck_cards = {}
                    for i = 1, #G.deck.cards do
                        if next(SMODS.get_enhancements(G.deck.cards[i])) == nil then
                            table.insert(deck_cards, G.deck.cards[i])
                        end
                    end
                    if #deck_cards > 0 then
                      local playing_card = pseudorandom_element(deck_cards, pseudoseed('marker_tfl'))
                      local enhancement = SMODS.poll_enhancement({guaranteed = true, options = {'m_wild', 'm_bonus', 'm_mult'}})
                      playing_card:set_ability(enhancement, true, true)
                    else
                      break
                    end
                end
            return true
            end)
            tag.triggered = true
        end
    end,    
                
},true)
