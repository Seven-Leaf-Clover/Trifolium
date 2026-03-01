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
SMODS.load_file('libs/utils.lua')()
SMODS.load_file('libs/ui.lua')()


-- Bans




----- Vanilla

-- Jokers
SMODS.load_file('tweaks/vanilla/jokers/common_jokers.lua')()
SMODS.load_file('tweaks/vanilla/jokers/uncommon_jokers.lua')()
SMODS.load_file('tweaks/vanilla/jokers/rare_jokers.lua')()
-- Consumables
SMODS.load_file('tweaks/vanilla/consumables/tarots.lua')()
SMODS.load_file('tweaks/vanilla/consumables/spectrals.lua')()
-- Vouchers
SMODS.load_file('tweaks/vanilla/vouchers/vouchers.lua')()
-- Tags
local subdir = "tweaks/vanilla/tags"
local tags = NFS.getDirectoryItems(SMODS.current_mod.path .. "/" .. subdir)  
    for k, filename in pairs(tags) do
        assert(SMODS.load_file(subdir .. "/" .. filename))()  
    end
-- Stakes
if Trifolium.config.tfl_blue_stake_rework then
  SMODS.load_file('tweaks/vanilla/stakes/blue.lua')()
end
-- Decks
SMODS.load_file('tweaks/vanilla/decks/green.lua')()





----- Opandora's Box

-- Jokers and Summon (Spectral)
local subdir = "tweaks/opandoras/jokers"
local jokers = NFS.getDirectoryItems(SMODS.current_mod.path .. "/" .. subdir)  
    for k, filename in pairs(jokers) do
        assert(SMODS.load_file(subdir .. "/" .. filename))()  
    end
-- Bans
SMODS.load_file('tweaks/opandoras/bans.lua')()



----- Plantain

--- Jokers and Deck
local subdir = "tweaks/plantain/jokers"
local jokers = NFS.getDirectoryItems(SMODS.current_mod.path .. "/" .. subdir)  
    for k, filename in pairs(jokers) do
        assert(SMODS.load_file(subdir .. "/" .. filename))()  
    end    
-- Bans
SMODS.load_file('tweaks/plantain/bans.lua')()
    
