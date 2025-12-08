lua << EOF
local ok, _ = pcall(require, 'treesitter-context')
if ok then
    require('treesitter-context').setup()
end
EOF
