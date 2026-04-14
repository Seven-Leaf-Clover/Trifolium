SMODS.Atlas{
  key = "modicon",
  path = "modicon.png",
  px = 32,
  py = 32
}

SMODS.Atlas {
    key = "deck_atlas",
    path = "decks.png",
    px = 71,
    py = 95
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





----- Trifolium

-- Decks
local subdir = "tweaks/trifolium/decks"
local decks = NFS.getDirectoryItems(SMODS.current_mod.path .. "/" .. subdir)  
    for k, filename in pairs(decks) do
        assert(SMODS.load_file(subdir .. "/" .. filename))()  
    end
--





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
-- Bans
assert(SMODS.load_file('tweaks/vanilla/bans.lua'))()





----- Opandora's Box

-- Common Jokers
local subdir = "tweaks/opandoras/jokers/common"
local jokers = NFS.getDirectoryItems(SMODS.current_mod.path .. "/" .. subdir)  
    for k, filename in pairs(jokers) do
        assert(SMODS.load_file(subdir .. "/" .. filename))()  
    end
-- Uncommon Jokers
local subdir = "tweaks/opandoras/jokers/uncommon"
local jokers = NFS.getDirectoryItems(SMODS.current_mod.path .. "/" .. subdir)  
    for k, filename in pairs(jokers) do
        assert(SMODS.load_file(subdir .. "/" .. filename))()  
    end
-- Rare Jokers
local subdir = "tweaks/opandoras/jokers/rare"
local jokers = NFS.getDirectoryItems(SMODS.current_mod.path .. "/" .. subdir)  
    for k, filename in pairs(jokers) do
        assert(SMODS.load_file(subdir .. "/" .. filename))()  
    end
-- Legendary Jokers
local subdir = "tweaks/opandoras/jokers/legendary"
local jokers = NFS.getDirectoryItems(SMODS.current_mod.path .. "/" .. subdir)  
    for k, filename in pairs(jokers) do
        assert(SMODS.load_file(subdir .. "/" .. filename))()  
    end
-- Spectral and Tag
local subdir = "tweaks/opandoras/other"
local other = NFS.getDirectoryItems(SMODS.current_mod.path .. "/" .. subdir)  
    for k, filename in pairs(other) do
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
-- Spectrals
local subdir = "tweaks/plantain/spectrals"
local spectral = NFS.getDirectoryItems(SMODS.current_mod.path .. "/" .. subdir)  
    for k, filename in pairs(spectral) do
        assert(SMODS.load_file(subdir .. "/" .. filename))()  
    end



----- Cmykl

--- Common Jokers
local subdir = "tweaks/cmykl/jokers/common"
local jokers = NFS.getDirectoryItems(SMODS.current_mod.path .. "/" .. subdir)  
    for k, filename in pairs(jokers) do
        assert(SMODS.load_file(subdir .. "/" .. filename))()  
    end 
-- Uncommon Jokers
local subdir = "tweaks/cmykl/jokers/uncommon"
local jokers = NFS.getDirectoryItems(SMODS.current_mod.path .. "/" .. subdir)  
    for k, filename in pairs(jokers) do
        assert(SMODS.load_file(subdir .. "/" .. filename))()  
    end 
-- Rare Jokers    
local subdir = "tweaks/cmykl/jokers/rare"
local jokers = NFS.getDirectoryItems(SMODS.current_mod.path .. "/" .. subdir)  
    for k, filename in pairs(jokers) do
        assert(SMODS.load_file(subdir .. "/" .. filename))()  
    end 
-- Seal
local subdir = "tweaks/cmykl/seals"
local seal = NFS.getDirectoryItems(SMODS.current_mod.path .. "/" .. subdir)  
    for k, filename in pairs(seal) do
        assert(SMODS.load_file(subdir .. "/" .. filename))()  
    end
-- Bans
assert(SMODS.load_file('tweaks/cmykl/bans.lua'))()
