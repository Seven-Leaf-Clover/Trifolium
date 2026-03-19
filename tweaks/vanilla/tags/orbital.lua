SMODS.Tag:take_ownership("orbital", {
    min_ante = 3,
    config = { extra = { times = 2 } },
    
    loc_vars = function(self, info_queue, tag)
        local _hand, _tally = nil, 0
        if G.GAME.hands and G.handlist then 
            for k, v in ipairs(G.handlist) do
                if SMODS.is_poker_hand_visible(v) and G.GAME.hands[v].played > _tally then
                    _hand = v
                    _tally = G.GAME.hands[v].played
                end
            end
        end
        return {vars = {tag.config.extra.times}}
    end,

    apply = function(self, tag, context)
        if context.type == 'immediate' then
            local _hand, _tally = nil, 0
            if G.GAME.hands and G.handlist then 
                for k, v in ipairs(G.handlist) do
                    if SMODS.is_poker_hand_visible(v) and G.GAME.hands[v].played > _tally then
                        _hand = v
                        _tally = G.GAME.hands[v].played
                    end
                end
            end
            if not _hand then return end
            tag:yep('+', G.C.SECONDARY_SET.Planet ,function() 
                local levels = tag.config.extra.times
                level_up_hand(nil, _hand, nil, levels)
                return true
            end)
            tag.triggered = true
        end
    end,   
})
