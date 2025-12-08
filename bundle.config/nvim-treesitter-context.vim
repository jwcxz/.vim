lua << EOF
local ok, _ = pcall(require, 'treesitter-context')
if ok then
    require('treesitter-context').setup({
        max_lines = 5,
        trim_scope = 'inner',
        mode = 'topline',
        separator = '┈'
    })

    vim.keymap.set("n", "[c", function()
        require("treesitter-context").go_to_context(vim.v.count1)
    end, { silent = true, desc = 'Jump to context' })
end
EOF

hi clear TreesitterContext
hi link TreesitterContext TelescopeNormal

hi clear TreesitterContextLineNumber
hi link TreesitterContextLineNumber TelescopeNormal
