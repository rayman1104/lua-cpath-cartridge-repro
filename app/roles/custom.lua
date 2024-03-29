local function apply_config(conf, opts) -- luacheck: no unused args
    box.schema.func.create('tokio_hyper.start_server', {language = 'C', if_not_exists = true})
    box.schema.user.grant('guest', 'execute', 'function', 'tokio_hyper.start_server', {if_not_exists = true})

    box.schema.space
       .create('fruit', {
        format = {{'id', 'unsigned'}, {'name', 'string'}, {'weight', 'number'}},
        if_not_exists = true,
    })
       :create_index('pk', { if_not_exists = true })

    box.func['tokio_hyper.start_server']:call()

    return true
end

return {
    role_name = 'app.roles.custom',
    apply_config = apply_config,
}
