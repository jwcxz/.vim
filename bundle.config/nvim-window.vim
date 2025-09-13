lua << EOF
local ok, _ = pcall(require, 'nvim-window')
if ok then
    require('nvim-window').setup({
        chars = {
            'a', 's', 'd', 'f', 'j', 'k', 'l', 'z', 'x', 'c', 'v', 'n', 'm', 'q', 'w',
            'e', 'r', 'u', 'i', 'o', 'p', 'g', 'h', 'b', 't', 'y'
        },
        border = 'bold',
    })
end
EOF

map <silent> ;<Space> :lua require('nvim-window').pick()<CR>
