SMODS.Tag:take_ownership("foil", {
    apply = function(self, tag, context)
            if context.type == 'store_joker_modify' and not context.card.edition and not context.card.temp_edition and context.card.config.center.set == 'Joker' then
                local lock = tag.ID
                G.CONTROLLER.locks[lock] = true
                context.card.temp_edition = true
                if not G.GAME.modifiers.all_eternal then
                    context.card:set_eternal(false)
                end
                context.card:set_perishable(false)
                context.card:set_rental(false)
                tag:yep('+', G.C.DARK_EDITION,function()
                    context.card:set_edition({foil = true}, true)
                    context.card.ability.couponed = true
                    context.card.cost = (math.floor(context.card.cost * .75))
                    context.card.temp_edition = nil
                    G.CONTROLLER.locks[lock] = nil
                    return true
                end)
                applied = true

                tag.triggered = true

                local choice = pseudorandom("sticker_tag_" .. "foil")
                if choice < 0.1 then
                    context.card:set_eternal(false)
                elseif choice < 0.2 and not G.GAME.modifiers.all_eternal then
                    context.card:set_perishable(false)
                end

                if pseudorandom("sticker_tag_" .. "foil") < 0.1 then
                    context.card:set_rental(false)
                end
            end
        end

})
