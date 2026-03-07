SMODS.Atlas{
  key = "modicon",
  path = "modicon.png",
  px = 32,
  py = 32
}

-- Global Table
Trifolium = {}

-- Configuration related things
Trifolium.config = SMODS.current_mod.config 

-- Lovely Fixes
SMODS.load_file("lovely/fixes.toml")

-- Libs
assert(SMODS.load_file('libs/utils.lua'))()
assert(SMODS.load_file('libs/ui.lua'))()


-- Bans




----- Vanilla

-- Jokers
assert(SMODS.load_file('tweaks/vanilla/jokers/common_jokers.lua'))()
assert(SMODS.load_file('tweaks/vanilla/jokers/uncommon_jokers.lua'))()
assert(SMODS.load_file('tweaks/vanilla/jokers/rare_jokers.lua'))()
-- Consumables
assert(SMODS.load_file('tweaks/vanilla/consumables/tarots.lua'))()
assert(SMODS.load_file('tweaks/vanilla/consumables/spectrals.lua'))()
-- Vouchers
assert(SMODS.load_file('tweaks/vanilla/vouchers/vouchers.lua'))()
-- Tags
local subdir = "tweaks/vanilla/tags"
local tags = NFS.getDirectoryItems(SMODS.current_mod.path .. "/" .. subdir)  
    for k, filename in pairs(tags) do
        assert(SMODS.load_file(subdir .. "/" .. filename))()  
    end
-- Stakes
if Trifolium.config.tfl_blue_stake_rework then
  assert(SMODS.load_file('tweaks/vanilla/stakes/blue.lua'))()
end
-- Decks
assert(SMODS.load_file('tweaks/vanilla/decks/green.lua'))()





----- Opandora's Box

-- Jokers and Summon (Spectral)
local subdir = "tweaks/opandoras/jokers"
local jokers = NFS.getDirectoryItems(SMODS.current_mod.path .. "/" .. subdir)  
    for k, filename in pairs(jokers) do
        assert(SMODS.load_file(subdir .. "/" .. filename))()  
    end
-- Bans
assert(SMODS.load_file('tweaks/opandoras/bans.lua'))()



----- Plantain

--- Jokers and Deck
local subdir = "tweaks/plantain/jokers"
local jokers = NFS.getDirectoryItems(SMODS.current_mod.path .. "/" .. subdir)  
    for k, filename in pairs(jokers) do
        assert(SMODS.load_file(subdir .. "/" .. filename))()  
    end    
-- Bans
assert(SMODS.load_file('tweaks/plantain/bans.lua'))()



----- Cmykl

--- Jokers and Seal
local subdir = "tweaks/cmykl/jokers"
local jokers = NFS.getDirectoryItems(SMODS.current_mod.path .. "/" .. subdir)  
    for k, filename in pairs(jokers) do
        assert(SMODS.load_file(subdir .. "/" .. filename))()  
    end 
-- Bans
assert(SMODS.load_file('tweaks/cmykl/bans.lua'))()



----- Sculio

--- Jokers
local subdir = "tweaks/sculio/jokers"
local jokers = NFS.getDirectoryItems(SMODS.current_mod.path .. "/" .. subdir)  
    for k, filename in pairs(jokers) do
        assert(SMODS.load_file(subdir .. "/" .. filename))()  
    end 
-- Bans
assert(SMODS.load_file('tweaks/sculio/bans.lua'))()
