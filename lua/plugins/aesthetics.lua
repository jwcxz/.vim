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

    -- TODO: replace with lualine
    {
        'itchyny/lightline.vim',

        config = function(_, opts)
            vim.g.lightline = {
                colorscheme = 'catppuccin',
                enable = {
                    statusline = 1,
                    tabline = 0
                },
                active = {
                    left = {
                        { 'mode', 'paste' },
                        { 'modified', 'relativepath', 'readonly' } },
                    right = {
                        { 'lineinfo' },
                        { 'percent' } }
                },
                separator = {
                    left = '',
                    right = ''
                },
                subseparator = {
                    left = '',
                    right = ''
                },
            }
        end
    },

    { 'vasconcelloslf/vim-interestingwords' },

}
