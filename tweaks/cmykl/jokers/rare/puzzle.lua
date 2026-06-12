SMODS.Joker:take_ownership('cmykl_puzzle', { 
    cost = 7,
    rarity = 2,
    
    config = { extra = { Xmult_gain = 0.1, Xmult = 1 } },
    
    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.Xmult_gain, card.ability.extra.Xmult, localize((G.GAME.current_round.cmykl_rank_card or {}).rank or 'Ace', 'ranks') }}
    end,

    calculate = function(self, card, context)
        if context.discard and not context.other_card.debuff and
            context.other_card:get_id() == G.GAME.current_round.cmykl_rank_card.id then
            card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.MULT
            }
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.Xmult
            }
        end
    end
},true)

local function reset_cmykl_puzzle_rank()
    G.GAME.current_round.cmykl_rank_card = { rank = 'Ace' }
    local valid_puzzle_cards = {}
    for _, playing_card in ipairs(G.playing_cards) do
        if not SMODS.has_no_rank(playing_card) then
            valid_puzzle_cards[#valid_puzzle_cards + 1] = playing_card
        end
    end
    local puzzle_card = pseudorandom_element(valid_puzzle_cards, 'cmykl_puzzle' .. G.GAME.round_resets.ante)
    if puzzle_card then
        G.GAME.current_round.cmykl_rank_card.rank = puzzle_card.base.value
        G.GAME.current_round.cmykl_rank_card.id = puzzle_card.base.id
    end
end

function SMODS.current_mod.reset_game_globals(run_start)
    reset_cmykl_puzzle_rank() 
end   
