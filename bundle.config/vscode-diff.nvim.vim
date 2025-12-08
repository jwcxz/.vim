lua << EOF
local ok, _ = pcall(require, 'vscode-diff')
if ok then
    require('vscode-diff').setup()
end
EOF
