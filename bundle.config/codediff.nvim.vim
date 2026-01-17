lua << EOF
local ok, _ = pcall(require, 'codediff')
if ok then
    require('codediff').setup()
end
EOF
