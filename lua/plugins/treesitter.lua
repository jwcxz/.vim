return {

    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate',
        opts = {
            -- TODO: make this a table that allows for customization per filetype
            -- TODO: check if filetypes are identical to treesitter parsers
            filetypes = { "c", "cpp", "gitignore", "latex", "lua", "make",
                "markdown", "markdown_inline", "python", "vim", "yaml" },
        },
        config = function(_, opts)
            local ts = require("nvim-treesitter")
            ts.install(opts.filetypes)

            vim.api.nvim_create_autocmd('FileType', {
                pattern = opts.filetypes,
                callback = function()
                -- syntax highlighting, provided by Neovim
                vim.treesitter.start()
                -- folds, provided by Neovim
                vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                vim.wo.foldmethod = 'expr'
                -- indentation, provided by nvim-treesitter
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
        end
    },

    {
        'nvim-treesitter/nvim-treesitter-context',
        lazy = false,
        dependencies = {
            'nvim-treesitter/nvim-treesitter'
        },
        opts = {
            max_lines = 5,
            trim_scope = 'inner',
            mode = 'topline',
            separator = '┈'
        },
        keys = {
            {
                "[c",
                function() require("treesitter-context").go_to_context(vim.v.count1) end,
                silent = true,
                desc = 'Jump to context'
            }
        },
        config = function(_, opts)
            require("treesitter-context").setup(opts)

            vim.cmd([[
                hi clear TreesitterContext
                hi link TreesitterContext TelescopeNormal

                hi clear TreesitterContextLineNumber
                hi link TreesitterContextLineNumber TelescopeNormal
            ]])
        end
    },

}
