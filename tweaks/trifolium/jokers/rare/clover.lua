SMODS.Joker {
    key = 'clover',
    atlas = 'joker_atlas',
    pos = { x = 0, y = 0 },
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 3,
    cost = 9,
    config = { extra = {  } },
    
    loc_vars = function(self, info_queue, card)
        return { vars = {  } }
    end,
    
    calculate = function(self, card, context)
        if context.mod_probability and not context.blueprint then
            return {
                numerator = context.numerator * 3
            }    
        end
    end       
}  
