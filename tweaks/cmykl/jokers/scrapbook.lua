function count_keys(tbl)
    local count = 0
    for _ in pairs(tbl) do
        count = count + 1
    end
    return count
end

SMODS.Joker:take_ownership('cmykl_scrapbook', {
    cost = 9,
    rarity = 3,
    config = { extra = { }},
    
calculate = function(self, card, context)
    if context.cardarea ~= G.jokers or not context.joker_main then return end

    local unique_suits = {}
    local unique_editions = {}
    local unique_enhancements = {}
    local unique_seals = {}

    for _, played_card in ipairs(context.scoring_hand) do

        if (SMODS.get_enhancements(played_card)["m_stone"] or SMODS.get_enhancements(played_card)["m_wild"]) then
            unique_suits["Suitless"] = true
        elseif played_card.base.suit then
            unique_suits[played_card.base.suit] = true
        end 

        if played_card.edition and played_card.edition.key then
            unique_editions[played_card.edition.key] = true
        end

        if played_card.seal then
            unique_seals[played_card.seal] = true
        end

        local enhancements = SMODS.get_enhancements(played_card)    
        for enh_key, _ in pairs(enhancements) do
            unique_enhancements[enh_key] = true
        end
    end

    local total_uniques =
        count_keys(unique_suits) +
        count_keys(unique_editions) +
        count_keys(unique_enhancements) +
        count_keys(unique_seals)


    return {
        Xmult = (0.3 * total_uniques) + 1
    }

end
},true)
