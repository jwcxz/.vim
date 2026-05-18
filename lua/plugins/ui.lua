return {
    {
        'rcarriga/nvim-notify',
        lazy = false,
        opts = {
            background_colour = "#000000",
            opacity = 85,
            timeout = 5000,
            top_down = false
        },
        config = function(_, opts)
            local notify = require("notify")
            notify.setup(opts)
            vim.notify = notify
        end
    },

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
        },
        opts = {
            source_selector = {
                winbar = true,
            },

            window = {
                mappings = {
                    ["Y"] = {
                        function(state)
                            local node = state.tree:get_node()
                            local path = node:get_id()
                            local rel_path = vim.fn.fnamemodify(path, ":.")
                            vim.fn.setreg("+", rel_path, "c")
                            vim.notify("Copied: " .. rel_path)
                        end,
                        desc = "Copy path to clipboard",
                    },
                },
            },

            default_component_configs = {
                file_size = { enabled = false },
                type = { enabled = false },
                last_modified = { enabled = false},
                created = { enabled = false },
                symlink_target = { enabled = false },
            },

            filesystem = {
                follow_current_file = { enabled = true },
                use_libuv_file_watcher = true,

                filtered_items = {
                    always_show = {
                        ".gitignore",
                        ".agents",
                        ".claude",
                    }
                }
            },

        }
    },

    {
        'nvim-telescope/telescope.nvim', version = '*',
        lazy = false,
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

            local function copy_path_to_clipboard(prompt_bufnr)
                local actions = require("telescope.actions")
                local action_state = require("telescope.actions.state")
                -- Get the current selection from Telescope
                local entry = action_state.get_selected_entry()
                local rel_path = vim.fn.fnamemodify(entry.value, ":.")

                if rel_path then
                    vim.fn.setreg("+", rel_path)
                    vim.notify("Copied: " .. rel_path)
                end

                -- Close Telescope after copying (optional)
                actions.close(prompt_bufnr)
            end

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
                            ["<C-y>"] = copy_path_to_clipboard,

                            ["<C-j>"] = "move_selection_next",
                            ["<C-k>"] = "move_selection_previous",

                            ["<C-t>"] = trouble.open,

                            ["<C-f>"] = "insert_symbol_i",
                        },
                        n = {
                            ["<C-t>"] = trouble.open,

                            ["Y"] = copy_path_to_clipboard,
                            ["<C-y>"] = copy_path_to_clipboard,
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

            -- insert mode
            { '<C-f>', '<cmd>Telescope find_files follow=true<cr>', silent = true, remap = false, mode = 'i' },
        }
    },

    {
        "error311/wayfinder.nvim",
        opts = { },
        cmd = 'WayFinder',
        keys = {
            { '<leader>wf', '<Plug>(WayfinderOpen)', desc = "Wayfinder" },

            { '<leader>wtn', '<Plug>(WayfinderTrailNext)', desc = "Wayfinder Trail Next" },
            { '<leader>wtp', '<Plug>(WayfinderTrailPrev)', desc = "Wayfinder Trail Prev" },
            { '<leader>wto', '<Plug>(WayfinderTrailOpen)', desc = "Wayfinder Trail Open" },
            { '<leader>wts', '<Plug>(WayfinderTrailShow)', desc = "Wayfinder Trail Show" },
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
        "https://codeberg.org/andyg/leap.nvim.git",
        lazy = false,
        dependencies = { "tpope/vim-repeat" },
        opts = { },
        config = function()
            vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap)')
        end,
    },
}
