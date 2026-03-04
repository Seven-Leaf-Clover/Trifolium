SMODS.Joker:take_ownership('cmykl_crystalgeode', {
    enhancement_gate = "m_stone",
    config = {
        extra = { dollars = 12 } },
    
    loc_vars = function(self, info_queue, card) 
        return {vars = { card.ability.extra.dollars }}
    end,

    calculate = function(self, card, context)
    if context.destroy_card and context.destroy_card.should_destroy then
        return { remove = true }
    end
    if context.individual and context.cardarea == G.play then
        if SMODS.get_enhancements(context.other_card)["m_stone"] == true then
                context.other_card.should_destroy = true
                SMODS.calculate_effect({message = "Shiny!", colour = G.C.PURPLE}, card)
                return {
                    dollars = card.ability.extra.dollars,
                }
        end
    end
end

},true)
