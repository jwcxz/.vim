lua << EOF
local ok, _ = pcall(require, 'context')
if ok then
    local context = require('context')
    context.setup({
        picker = context.pickers.telescope,
        prompts = {
            see = "See {position}"
        }
    })

    vim.keymap.set({'n', 'v'}, '<leader>c', function()
        require("context").pick()
    end, { silent = true, desc = 'Context' })
end
EOF
