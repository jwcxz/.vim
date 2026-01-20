return {

    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate',
        opts = {
            ensure_installed = { "c", "cpp", "gitignore", "latex", "lua", "make",
                "markdown", "markdown_inline", "python", "vim", "yaml" },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { "markdown" },
            },
            indent = {
                enable = true,
                disable = { "markdown", "yaml" },
            }
        },
        config = function(_, opts)
            require("nvim-treesitter").setup(opts)

            vim.opt.foldmethod = 'expr'
            vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
            vim.opt.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
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
