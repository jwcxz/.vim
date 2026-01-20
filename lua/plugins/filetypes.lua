return {

    { 'jwcxz/vim-todo' },

    { 'jwcxz/vim-vdb' },

    { 'jwcxz/vim-logcp' },

    { 'jwcxz/vim-instant-wavedrom' },


    { 'vim-scripts/verilog_systemverilog.vim' },


    { 'suan/vim-instant-markdown' },

    { 'Kicamon/markdown-table-mode.nvim' },

    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter'
        },
        opts = {
            enabled = false,
            file_types = { 'markdown', 'codecompanion' },
            code = {
                border = 'thin',
                disable_background = { },
                position = 'right',
                width = 'block',
                min_width = 80,
                right_pad = 4,
                inline_pad = 1
            },
            -- latex = { enabled = false },
            pipe_table = { style = 'normal' },
        }
    },

}
