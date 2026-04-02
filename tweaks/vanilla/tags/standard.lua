SMODS.Tag:take_ownership("standard", {
    min_ante = 3,
    config = { extra = { add_cards = 2, rank = "Random" } },

    loc_vars = function(self, info_queue, tag)
        return {vars = {tag.config.extra.add_cards, tag.config.extra.rank}}
    end,
    
    apply = function(self, tag, context)
        local ranks = {}
        for k, v in pairs(G.playing_cards) do
            ranks[v:get_id()] = (ranks[v:get_id()] or 0) + v.base.times_played
        end
        local mostplayed
        local played = 0
        for k, v in pairs(ranks) do
            if v >= played then
                mostplayed = k
                played = v
            end
        end
        local mostplayedkey
        for k, v in pairs(SMODS.Ranks) do
            if v.id == mostplayed then
                mostplayedkey = v.key
            end
        end
        
        if context.type == 'immediate' then
            tag:yep('+', G.C.GOLD,function()
                for i = 1, math.min(tag.config.extra.add_cards) do
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local cards = SMODS.add_card({ set = 'Base',
                                                           rank = mostplayedkey,
                                                           area = G.deck,
                                                           key_append = 'standard_tfl'
                            })
                            SMODS.calculate_context({ playing_card_added = true, cards = { cards } })
                            return true
                        end
                    }))    
                end
            return true
            end)
            tag.triggered = true
        end
    end,
    
    set_ability = function(self)
        local ranks = {}
        for k, v in pairs(G.playing_cards) do
            ranks[v:get_id()] = (ranks[v:get_id()] or 0) + v.base.times_played
        end
        local mostplayed
        local played = 0
        for k, v in pairs(ranks) do
            if v >= played then
                mostplayed = k
                played = v
            end
        end
        local mostplayedkey
        for k, v in pairs(SMODS.Ranks) do
            if v.id == mostplayed then
                mostplayedkey = v.key
            end
        end
        self.config.extra.rank = mostplayedkey
    end,    
})
