local banned_plantain_jokers = {
   -- Uncommon Jokers
    'three_body_problem',
}

for i=1,#banned_plantain_jokers do
    SMODS.Joker:take_ownership('pl_'..banned_plantain_jokers[i], {
        no_collection = true,
        in_pool = function() return false end
    }, true)
end
