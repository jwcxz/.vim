return {

    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        opts = {
            flavour = 'macchiato',
            transparent_background = true,
            no_italic = true
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)
            vim.cmd.colorscheme("catppuccin")
            vim.cmd([[
                    hi SpellBad ctermfg=196 ctermbg=52 guifg=#FF8888 guibg=#660000
                    hi! link Todo SpellBad
                    hi! link CursorLine CursorColumn
                    hi! link CocInlayHint FoldColumn
            ]])
        end,
    },

    { 'jszakmeister/vim-togglecursor' },

    {
        'nvim-lualine/lualine.nvim',

        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },

        opts = {
            sections = {
                lualine_a = {
                    { 'mode',
                        fmt = function(str)
                            if str == 'V-BLOCK' then
                                return 'B'
                            else
                                return str:sub(1,1)
                            end
                        end
                    },
                    {
                        -- indicate when paste mode is enabled
                        function() return "󰆒" end,
                        cond = function() return vim.o.paste end,
                    },
                },
                lualine_b = {
                    'branch',
                    'diff',
                },
                lualine_c = {
                    { 'filename',
                        path = 3
                    }
                },
                lualine_x = {
                    'diagnostics',
                    'lsp_status'
                },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
            inactive_sections = {
                lualine_a = { },
                lualine_b = { },
                lualine_c = { 'filename' },
                lualine_x = { },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
        }
    },

    { 'vasconcelloslf/vim-interestingwords' },

}
