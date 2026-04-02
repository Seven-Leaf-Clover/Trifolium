SMODS.Joker:take_ownership('cmykl_rockjoker', {
    cost = 6,
    rarity = 2,
    enhancement_gate = "m_stone",
    config = { extra = { chips = 2 } },
    
    loc_vars = function(self, info_queue, card)
      info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
      local stone_tally = 0
      if G.playing_cards then
         for _, playing_card in ipairs(G.playing_cards) do
           if SMODS.has_enhancement(playing_card, 'm_stone') then stone_tally = stone_tally + 1 end
         end
      end
        return { vars = { card.ability.extra.chips, card.ability.extra.chips * stone_tally } }
    end,
    
    calculate = function(self, card, context)
        local stone_tally = 0
        for _, playing_card in ipairs(G.playing_cards) do
           if SMODS.has_enhancement(playing_card, 'm_stone') then stone_tally = stone_tally + 1 end 
        end   
        if context.individual and context.cardarea == G.play and stone_tally > 0 then          
         context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) + (card.ability.extra.chips * stone_tally)
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.GREY
            }    
      end
    end

},true)
