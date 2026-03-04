local banned_cmykl_jokers = {
 -- Rares
    "twister",
 -- Legendaries
    "medrano",
}

for i=1,#banned_cmykl_jokers do
    SMODS.Joker:take_ownership('cmykl_'..banned_cmykl_jokers[i], {
        no_collection = true,
        in_pool = function() return false end
    }, true)
end

local banned_cmykl_boosters = {
    "mega_spectral_pack",  
}

for i=1,#banned_cmykl_boosters do
    SMODS.Booster:take_ownership('cmykl_'..banned_cmykl_boosters[i], {
        no_collection = true,
        in_pool = function() return false end
    }, true)
end
