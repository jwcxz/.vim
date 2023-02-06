lua << EOF
local ok, _ = pcall(require, 'trouble')
if ok then
    require('trouble').setup({
    })
end
EOF

noremap <F11> <cmd>TroubleToggle<cr>
