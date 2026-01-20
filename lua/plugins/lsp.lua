return {
    {
        'neovim/nvim-lspconfig'
    },

    {
        "hrsh7th/cmp-nvim-lsp",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            --{ "antosha417/nvim-lsp-file-operations", config = true },
            --{ "folke/lazydev.nvim", opts = {} },
        },
        config = function()
            -- import cmp-nvim-lsp plugin
            local cmp_nvim_lsp = require("cmp_nvim_lsp")

            -- used to enable autocompletion (assign to every lsp server config)
            local capabilities = cmp_nvim_lsp.default_capabilities()
            -- disable snippet support
            capabilities.textDocument.completion.completionItem.snippetSupport = false

            vim.lsp.config("*", {
            capabilities = capabilities,
            })
        end,
    },

    -- TODO: something about this plugin is broken; need to debug before
    -- enabling
    -- {
    --     "ray-x/lsp_signature.nvim",
    --     event = "InsertEnter",
    --     opts = {
    --         bind = true,
    --         hint_enable = false,
    --         handler_opts = {
    --             border = "rounded"
    --         }
    --     },
    -- },

}
