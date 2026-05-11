return {

    { 'jwcxz/vim-todo' },

    { 'jwcxz/vim-vdb' },

    { 'jwcxz/vim-logcp' },

    { 'jwcxz/vim-instant-wavedrom' },


    { 'vim-scripts/verilog_systemverilog.vim' },


    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        keys = {
            {
                "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>",
                silent = true, mode = { 'n' }, desc = "Toggle live Markdown preview"
            },
        },
        build = "cd app && npm install && git restore .",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
    },

    {
        'Kicamon/markdown-table-mode.nvim',
        cmd = { "Mtm" },
        opts = { }
    },

    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter'
        },
        cmd = { "RenderMarkdown" },
        ft = { "markdown", "codecompanion" },
        keys = {
            {
                "<leader>mr", "<cmd>RenderMarkdown buf_toggle<CR>",
                silent = true, mode = { 'n' }, desc = "Toggle render-markdown"
            },
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
            win_options = {
                wrap = { default = true, rendered = true },
                linebreak = { default = true, rendered = true },
                breakindent = { default = true, rendered = true }
            }
        }
    },

}
