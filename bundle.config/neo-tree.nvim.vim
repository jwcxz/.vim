lua << EOF
local ok, _ = pcall(require, 'neo-tree')
if ok then
    require("neo-tree").setup({})
end
EOF

nnoremap <F10> <cmd>Neotree toggle show<CR>
