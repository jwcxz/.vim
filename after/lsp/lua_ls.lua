return {
    on_init = function(client)
        -- apply the configuration below only if we're editing the Neovim configuration
        -- reference: https://github.com/neovim/nvim-lspconfig/blob/master/lsp/lua_ls.lua

        if not client.config or not client.config.root_dir then
            return
        end

        local path = client.config.root_dir
        if path ~= vim.fn.stdpath('config') and path ~= cfg_nvimcfg_dir then
            return
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                version = 'LuaJIT',
                path = {
                'lua/?.lua',
                'lua/?/init.lua',
                },
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME
                }
            }
        })
    end,
    settings = {
        Lua = {}
    }
}
