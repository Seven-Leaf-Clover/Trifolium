local banned_vouchers = {
    "magic_trick",
    "illusion",
}
for i=1,#banned_vouchers do
    SMODS.Voucher:take_ownership('v_'..banned_vouchers[i], {
        no_collection = true,
        in_pool = function() return false end
    }, true)
end
