return {
    descriptions = {
       -- Vanilla Stakes
          Stake = Trifolium.config.tfl_blue_stake_rework and {
            stake_blue = {
                name = "Blue Stake",
                text = {
                    "{C:spectral}Spectral{} packs appear more often",
                    "Required score scales faster for each {C:attention}Ante",
                    "{s:0.8}Applies all previous Stakes",
                },    
             },  
         } or {},
      -- Vanilla Spectrals
         Spectral = {
            c_sigil = {
                text = {
                    "Converts all cards in",
                    "hand to {C:attention}selected suit{},",
                    "lose half of your money",
                },
            },
          -- Opandora's Spectrals  
            c_opan_summon = {
                name = "Summon",
                text= {
                    "Creates {C:attention}#1#{} random",
                    "{C:dark_edition}Negative{} {C:tarot}Tarot{} cards.",
                    "Apply {C:spectral}Perishable{} to",
                    "{C:attention}#2#{} random {C:attention}Joker",
                },
            },
         },
       --Vanilla Tags 
         Tag = {
            tag_uncommon = {
                text = { 
                    "Shop has a {C:attention}25%{} off",
                    "{C:green}Uncommon Joker",
                    "{C:inactive,s:0.8}(Without Stickers)",
                }
            },
            tag_rare = {
                text = { 
                    "Shop has a {C:attention}25%{} off",
                    "{C:red}Rare Joker",
                    "{C:inactive,s:0.8}(Without Stickers)", 
            }
            },
            tag_negative = {
                text = { 
                    "Next base edition shop",
                    "Joker is {C:attention}25%{} off and",
                    "becomes {C:dark_edition}Negative",
                    "{C:inactive,s:0.8}(Without Stickers)",
                }
            },
            tag_foil = {
                text = { 
                    "Next base edition shop",
                    "Joker is {C:attention}25%{} off and",
                    "becomes {C:dark_edition}Foil",
                    "{C:inactive,s:0.8}(Without Stickers)",
                }
            },
            tag_holo = {
                text = {
                    "Next base edition shop",
                    "Joker is {C:attention}25%{} off and",
                    "becomes {C:dark_edition}Hologrraphic",
                    "{C:inactive,s:0.8}(Without Stickers)",
                }
            },
            tag_polychrome = {
                text = {
                    "Next base edition shop",
                    "Joker is {C:attention}25%{} off and",
                    "becomes {C:dark_edition}Polychrome",
                    "{C:inactive,s:0.8}(Without Stickers)",
                }
            },
        },
       -- Opandora's Jokers 
        Joker = {
           -- Common Jokers 
            j_opan_encore = {
                 name = "Encore",
	         text = {
		     "Creates a {C:dark_edition}Negative{} {C:tarot}The Fool{}",
		     "at the {C:attention}end of the Boss Blind{}",
				
	         },
	    },
	    j_opan_bynine = {
		 name = "By The Nine!",
		 text = {
		     "Each {C:attention}9{} played gives",
		     "{C:mult}+#1#{} Mult when scored",
		 },
	    },
	    j_opan_croon = {
		 name = "Croon Joker",
		 text = {
		     "Each played",
		     "{C:attention}3{}, {C:attention}4{} and {C:attention}5{} give",
		     "{C:mult}+#1#{} Mult when scored",
		 },
	    },
	    j_opan_scratchcard = {
		 name = "Scratch Card",
		 text = {
		     "Chance to create a {C:attention}Joker{} when sold!",
		     "{C:green}1 in #5#{} to create a {C:blue}Common{}",
		     "{C:green}1 in #6#{} to create an {C:green}Uncommon{}",
		     "{C:green}1 in #7#{} to create a {C:red}Rare{}",
		     "{C:green}1 in #8#{} to create a... {C:legendary,E:1}Soul{}?!",
		     "{C:inactive}(Must have room)",
		     "{C:inactive}(Sells for {C:money}$0{C:inactive})",
		 },
	    },
	    j_opan_crumple = {
	         name = "Crumpled Lucky Card",
		 text = {
		     "{C:green}///in #4#{} //r/ {C:mult}+#7#{}////",
		     "{C:green}1 i// /{} /f///{C:chips}+#8#{}///ps",
		     "{C:green}/ //n //{} ////{X:mult,C:white}X#9#{}/u//",
		 },
	    },
	   -- Uncommon Jokers
	    j_opan_blackfriday = {
		 name = "Black Friday",
		 text = {
		     "Sell this card while", 
		     "in a {C:attention}Blind{} to create",
		     "a free {C:red}Coupon{} {C:attention}Tag{}",
		 },
	    },
	    j_opan_blob = {
		 name = "Blob",
		 text = {
		     "When {C:attention}Blind{} is selected",
		     "set {C:red}Discards{} to {C:attention}1{} and",
		     "gain {C:money}$#1#{} {C:attention}per card played",
		 },
	    },
	    j_opan_fannypack = {
		 name = "Fanny Pack",
		 text = {
		     "{C:mult}+#1#{} Mult",
		     "Gain {C:attention}+#2#{} extra {C:attention}consumable slot",
		     "{C:green}#3# in #4#{} to give {C:money}$#5#{} when sold",
                 },
            },
            j_opan_last_resort = {
		 name = "Last Resort",
		 text = {
		     "{X:mult,C:white} X#1# {} Mult if there",
		     "are {C:attention}exactly 26{} cards",
		     "{C:attention}left in deck",
		 },
	    },
	    j_opan_miner = {
		 name = "Miner",
		 text = {
		     "Retrigger all",
		     "played {C:attention}Stone{} cards twice",
		 },
	    },
	    j_opan_morethemerrier = {
		 name = "More The Merrier",
		 text = {
		     "{C:blue}Common{} Jokers",
		     "each give {X:mult,C:white}X#1#{} Mult",
		 },
	    },
	    j_opan_moolah = {
		 name = "Moolah",
		 text = {
		     "Earn {C:money}$#1#{} per {C:attention}2",
		     "{C:attention}Gold{} Cards in your",
		     "{C:attention} full deck{} at",
		     "end of round",
		     "{C:inactive}(Currently {C:money}$#2#{C:inactive})",
		 },
	    },
	   -- Rare Jokers 
            j_opan_middle_child = {
                 name = 'Middle Child',
                 text = {
                     "Gain {C:attention}+#1#{} Joker slot for each {C:attention}#2#{} Jokers held.",
                     "{C:mult}-#3#{} Mult for each Joker to the left,",
                     "{C:chips}-#4#{} Chips for each Joker to the right",
                     "{C:inactive}(Currently {C:mult}-#5#{C:inactive} Mult and {C:chips}-#6#{C:inactive} Chips){}",

                 },
            },
            j_opan_pyramid = {
	         name = "Pyramid",
		 text = {
		     "This Joker gains {X:mult,C:white} X#1# {} Mult",
		     "per {C:attention}consecutive{} hand playing",
		     "your most played {C:attention}poker hand",
		     "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
	         },
	    },
	    j_opan_fermata_tremolo = {
		 name = "Fermata's Tremolo",
		 text = {
		     "Gain {C:attention}+#1#{} per {C:attention}played hand{}.",
		     "if {C:attention}total{} number of hands is a {C:attention}whole number,",
		     "{C:attention}retrigger all{} cards equal to {C:attention}total",
		     "{C:inactive}(Currently #2#)",
		 },
	    },
	   -- Legendary Jokers
	    j_opan_mezzetino = {
		 name = "Mezzetino",
		 text = {
		     "Earn money equal to",
		     "{X:money,C:white}X#1#{} the {C:attention}sell value{}",
		     "of all other Jokers held",
		     "at end of round",
		     "{C:attention}+#3# card slot{} in shop",
		     "{C:inactive}(Currently {C:money}$#2#{C:inactive})",
		 },
	    },
	    j_opan_balanzone = {
		 name = "Balanzone",
		 text = {
		     "{C:attention}Retrigger{} all Jokers",
		     "{C:attention}one more time{}",
		     "for every {C:money}$#2#{} you have",
		     "{C:inactive}(Currently {C:attention}#3#{C:inactive} retriggers)",
		 },
	    },
	    j_opan_cicero = {
		 name = "Cicero",
		 text = {
		     "When {C:attention}Blind{} is selected, destroy",
		     "{C:attention}Joker{} to the right to create",
		     "a random {C:dark_edition}Negative{} {C:spectral}Spectral{} card",
	         },
	    },
        },		   
    },
    misc = {
        dictionary = {
             tfl_requires_restart = "Requires Restart",
             tfl_blue_stake_rework = 'Blue Stake Rework',
             tfl_enable_blue_info = {
                                 --'Replaces the base game {C:blue}Blue{} Stake',
                                 "{C:spectral}Spectral{} packs appear more often",
                                 "Required score scales faster each {C:attention}Ante",
             },
        },    
    },
}    
        
