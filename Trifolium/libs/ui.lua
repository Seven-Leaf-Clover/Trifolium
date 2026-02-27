--- Config UI ---

SMODS.current_mod.config_tab = function()
  return {
    n = G.UIT.ROOT,
    config = { align = 'cm', padding = 0.05, emboss = 0.05, r = 0.1, colour = G.C.BLACK },
    nodes = {
      { n = G.UIT.R, config = {align = 'cm', padding = 0.05, emboss = 0.05, r = 0.1, colour = HEX('465255')}, nodes = {
        {
          n = G.UIT.R,
          config = { align = 'cm', minh = 1 },
          nodes = {
            { n = G.UIT.T, config = { text = localize('tfl_requires_restart'), colour = G.C.GREEN, scale = 0.5 } }
          }
        },
        {n = G.UIT.R, config = {align = 'cm', padding = 0.05, emboss = 0.05, r = 0.1, colour = HEX('4a6972'), minw = 8.5}, nodes = {
          {
            n = G.UIT.R,
            nodes = {
            }
          },
          {
            n = G.UIT.R,
            nodes = {
              {
                n = G.UIT.C,
                config = {tooltip = {text = localize('tfl_enable_blue_info')}},
                nodes = {
                  create_toggle {
                    label = localize('tfl_blue_stake_rework'),
                    ref_table = Trifolium.config,
                    ref_value = "tfl_blue_stake_rework"
                  },
                },
              }
            },
          },
      }},
      }},
    }
  }  
end

--- Main UI ---

SMODS.current_mod.description_loc_vars = function(self)
    return {
        text_colour = G.C.GREEN,
        background_colour = HEX("00000000"),
        scale = 2
    }
end
