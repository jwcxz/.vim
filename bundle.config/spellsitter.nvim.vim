lua << EOF
local ok, _ = pcall(require, 'spellsitter')
if ok then
    require('spellsitter').setup()
end
EOF
