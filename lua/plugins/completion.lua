return {
    {
        'saghen/blink.cmp',

        dependencies = {
            'rafamadriz/friendly-snippets',
            {
                'xzbdmw/colorful-menu.nvim',
                opts = { },
            }
        },

        version = '1.*',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = {
                preset = 'super-tab',

                ['<CR>'] = { 'accept', 'fallback' }
            },

            appearance = { nerd_font_variant = 'mono' },

            signature = {
                enabled = true,
                window = {
                    winblend = 15
                }
            },

            completion = {
                menu = {
                    winblend = 15,
                    draw = {
                        columns = {
                            --{ 'label', 'label_description', gap = 1 },
                            { 'label', gap = 1 },
                            { 'kind_icon', 'source_name', gap = 2 },
                        },
                        components = {
                            label = {
                                text = function(ctx)
                                    return require("colorful-menu").blink_components_text(ctx)
                                end,
                                highlight = function(ctx)
                                    return require("colorful-menu").blink_components_highlight(ctx)
                                end,
                            },
                        },
                    },
                },

                documentation = { auto_show = false },

                accept = {
                    auto_brackets = { enabled = false },
                },

                list = {
                    selection = {
                        preselect = false,
                        auto_insert = false,
                    },
                },
            },

            cmdline = { enabled = false },

            sources = {
                default = {
                    'lsp',
                    'path',
                    --'snippets',
                    'buffer'
                },

            providers = {
                path = {
                       opts = {
                           get_cwd = function(_)
                               return vim.fn.getcwd()
                           end,
                       }
                   }
               },
            },

            fuzzy = { implementation = "prefer_rust_with_warning" }
        },

        opts_extend = { "sources.default" }
    },
}
