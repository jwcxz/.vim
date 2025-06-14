lua << EOF
local ok, _ = pcall(require, 'render-markdown')
if ok then
    require('render-markdown').setup({
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
    })
end
EOF
