lua << EOF
local ok, _ = pcall(require, 'markdown-table-mode')
if ok then
    require('markdown-table-mode').setup()
end
EOF
