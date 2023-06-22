local function apply_config(conf, opts) -- luacheck: no unused args
    return true
end

return {
    role_name = 'app.roles.custom',
    apply_config = apply_config,
}
