local poker_hands = {
    --["High Card"] = {  }, -- Pluto
    --["Pair"] = {  }, --Mercury
    --["Two Pair"] = {  }, -- Uranus
    --["Three of a Kind"] = {  }, -- Venus
    --["Straight"] = {  }, -- Saturn
    ["Flush"] = { 2, 20 }, -- Jupiter
    --["Full House"] = {  }, -- Earth
    --["Four of a Kind"] = {  }, -- Mars
    --["Straight Flush"] = {  }, -- Neptune
    ["Five of a Kind"] = { 3, 40 }, --Planet X
    --["Flush House"] = {  }, -- Ceres
    --["Flush Five"] = {  }, -- Eris
}

local raw_Game_init_game_object = Game.init_game_object
function Game:init_game_object()
    local ret = raw_Game_init_game_object(self)
    for k, v in pairs(poker_hands) do
        ret.hands[k].l_mult = v[1]
        ret.hands[k].l_chips = v[2]
        if v[3] then
            ret.hands[k].mult = v[3]
            ret.hands[k].s_mult = v[3]
            ret.hands[k].chips = v[4]
            ret.hands[k].s_chips = v[4]
        end
    end
    return ret
end
