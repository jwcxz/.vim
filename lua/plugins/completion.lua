return {
    'saghen/blink.cmp',

    dependencies = { 'rafamadriz/friendly-snippets' },

    version = '1.*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            preset = 'enter',

            ['<Up>'] = { function(cmp) return cmp.select_prev({ auto_insert = false }) end, 'fallback' },
            ['<Down>'] = { function(cmp) return cmp.select_next({ auto_insert = false }) end, 'fallback' },
        },

        appearance = { nerd_font_variant = 'mono' },

        signature = { enabled = true },

        completion = {
            menu = {
                border = 'rounded',
                winblend = 15,
                draw = {
                    columns = {
                        { 'label', 'label_description', gap = 1 },
                        { 'kind_icon', 'source_name', gap = 2 },
                    },
                },
            },

            documentation = { auto_show = false },

            accept = {
                auto_brackets = { enabled = false },
            },
        },

        sources = {
            default = {
                'lsp',
                'path',
                --'snippets',
                'buffer'
            },
        },

        fuzzy = { implementation = "prefer_rust_with_warning" }
    },

    opts_extend = { "sources.default" }
}
