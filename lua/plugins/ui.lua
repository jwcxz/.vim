return {
    {
        'yorickpeterse/nvim-window',
        opts = {
            chars = {
                'a', 's', 'd', 'f', 'j', 'k', 'l', 'z', 'x', 'c', 'v', 'n', 'm', 'q', 'w',
                'e', 'r', 'u', 'i', 'o', 'p', 'g', 'h', 'b', 't', 'y'
            },
            border = 'bold',
        },
        keys = {
            {
                ';<Space>',
                function() require('nvim-window').pick() end,
                silent = true,
                desc = 'Select window'
            }
        }
    },

    -- TODO: vim-zoom doesn't work with neo-tree; find a replacement

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        lazy = false,
        keys = {
            {
                "<F10>",
                "<cmd>Neotree toggle show<CR>",
                silent = true
            }
        }
    },

    {
        'nvim-telescope/telescope.nvim', version = '*',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            'nvim-telescope/telescope-ui-select.nvim',
            'jonarrien/telescope-cmdline.nvim',
            'stevearc/aerial.nvim',
            'folke/trouble.nvim'
        },
        config = function()
            local ts = require('telescope')
            local trouble = require('trouble.sources.telescope')
            ts.setup({
                defaults = {
                    winblend = 15,
                    border = true,
                    wrap_results = true,
                    sorting_strategy = "ascending",
                    layout_strategy = "vertical",
                    layout_config = {
                        vertical = {
                            mirror = true,
                            prompt_position = "top",
                            },
                        },
                    mappings = {
                        i = {
                            ["<C-u>"] = false,
                            ["<C-d>"] = false,
                            ["<C-y>"] = "preview_scrolling_up",
                            ["<C-e>"] = "preview_scrolling_down",

                            ["<C-j>"] = "move_selection_next",
                            ["<C-k>"] = "move_selection_previous",

                            ["<C-t>"] = trouble.open,
                        },
                        n = {
                            ["<C-t>"] = trouble.open,
                        }
                    }
                },
                extensions = {
                    aerial = {
                        show_nesting = {
                            ["_"] = false,
                            json = true,
                            yaml = true,
                        },
                        show_columns = "both",
                    }
                },
            })
            ts.load_extension('fzf')
            ts.load_extension('ui-select')
            ts.load_extension('cmdline')
        end,
        keys = {
            { 'Q', '<cmd>Telescope cmdline<cr>', silent = true, remap = false, mode = 'n' },

            { '<space>r', '<cmd>Telescope find_files follow=true<cr>', silent = true, remap = false, mode = 'n' },
            { '<space>f', '<cmd>Telescope find_files follow=true<cr>', silent = true, remap = false, mode = 'n' },
            { '<space>g', '<cmd>Telescope live_grep<cr>', silent = true, remap = false, mode = 'n' },
            { '<space><space>', '<cmd>Telescope buffers<cr>', silent = true, remap = false, mode = 'n' },
            { '<space>t', '<cmd>Telescope tags<cr>', silent = true, remap = false, mode = 'n' },
            { '<space>h', '<cmd>Telescope help_tags<cr>', silent = true, remap = false, mode = 'n' },
            { '<space>c', '<cmd>Telescope command_history<cr>', silent = true, remap = false, mode = 'n' },
            { '<space>p', '<cmd>Telescope builtin<cr>', silent = true, remap = false, mode = 'n' },
            { '<space>s', '<cmd>Telescope treesitter<cr>', silent = true, remap = false, mode = 'n' },
            { '<space>*', '<cmd>Telescope grep_string<cr>', silent = true, remap = false, mode = 'n' },
            { '<space>a', '<cmd>Telescope aerial<cr>', silent = true, remap = false, mode = 'n' },

            -- force of habit
            { ';r', '<cmd>Telescope find_files follow=true<cr>', silent = true, remap = false, mode = 'n' },
            { ';f', '<cmd>Telescope find_files follow=true<cr>', silent = true, remap = false, mode = 'n' },
            { ';;', '<cmd>Telescope buffers<cr>', silent = true, remap = false, mode = 'n' },
            { ';a', '<cmd>Telescope aerial<cr>', silent = true, remap = false, mode = 'n' },
        }
    },

    {
        'stevearc/aerial.nvim',
        opts = {
            on_attach = function(bufnr)
                vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
                vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
            end,
        },
        keys = {
            { '<F9>', '<cmd>AerialToggle!<cr>' }
        }
    },

    {
        'folke/trouble.nvim',
        cmd = "Trouble",
        opts = { },
        keys = {
            { '<F11>', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', silent = True, remap = false }
        }
    },

    {
        'ahkohd/context.nvim',
        config = function()
            local context = require('context')
            context.setup({
                picker = context.pickers.telescope,
                prompts = {
                    see = "See {position}"
                }
            })
        end,
        keys = {
            {
                '<leader>c',
                function() require("context").pick() end,
                { silent = true, desc = 'Context' },
                mode = { 'n', 'v' }
            }
        }
    },

    {
        "esmuellert/codediff.nvim",
        dependencies = { "MunifTanjim/nui.nvim" },
        cmd = "CodeDiff",
    },

    {
        'haya14busa/incsearch.vim',
        keys = {
            { '/', '<Plug>(incsearch-forward)' },
            { '?', '<Plug>(incsearch-backward)' },
        }
    },

}
