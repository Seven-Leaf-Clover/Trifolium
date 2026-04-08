--- Jokers ---

local banned_Opandoras_Box_jokers = {
 -- Commons  
    "aglio_e_olio",
    "garlic",
    "olive_oil",
    "pasta",
    "red_pepper_flakes",
    "crackedegg",
 -- Uncommons
    "castor",
    "mrhands",
    "number_two",
    "numerophobia",
    "void",
    "chromahand",
 -- Rares
    "pollux",
}

for i=1,#banned_Opandoras_Box_jokers do
    SMODS.Joker:take_ownership('opan_'..banned_Opandoras_Box_jokers[i], {
        no_collection = true,
        in_pool = function() return false end
    }, true)
end

--- Consumables ---

local banned_Opandoras_Box_consumables = {
    "fragility",  
}    

for i=1,#banned_Opandoras_Box_consumables do
    SMODS.Consumable:take_ownership('opan_'..banned_Opandoras_Box_consumables[i], {
        no_collection = true,
        in_pool = function() return false end
    }, true)
end
