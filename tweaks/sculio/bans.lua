-- Jokers --
local banned_Sculio_jokers = {
  -- Common Jokers   
     'unstoppable',
     'mahjong',
     'refrigerator',
     'hammer_and_chisel',
  -- Uncommon Jokers  
     'bad_trip',
     'verified',
  -- Rare Jokers
     'beyond_reach',
     

}

for i=1,#banned_Sculio_jokers do
    SMODS.Joker:take_ownership('Sculio_'..banned_Sculio_jokers[i], {
        no_collection = true,
        in_pool = function() return false end
    }, true)
end

-- Tags --
local banned_Sculio_tags = {
     'unstoppable',

}    

for i=1,#banned_Sculio_tags do
    SMODS.Tag:take_ownership('Sculio_'..banned_Sculio_tags[i], {
        no_collection = true,
        in_pool = function() return false end
    }, true)
end
