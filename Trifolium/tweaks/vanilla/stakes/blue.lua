SMODS.Stake:take_ownership('stake_blue', {          
      modifiers = function()
          G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) + .7
      end,    
}, false) 
   
-- Spectral Pack rate up   
SMODS.Booster:take_ownership_by_kind('Spectral', {
    get_weight = function(self)
        if G.GAME.stake >= 5 then
            return self.weight * 1.8
        end
        return self.weight
    end
}, true)

       --[[loc_txt = {
            stake_blue = {
                name = "Blue Stake",
                text = {
                    "{C:spectral}Spectral{} packs appear more often",
                    "Required score scales faster for each {C:attention}Ante",
                    "{s:0.8}Applies all previous Stakes",
                },    
            },
        },]]

