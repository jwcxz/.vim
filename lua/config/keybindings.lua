-- non-plugin-specific keybindings

-- new leaders
vim.g.mapleader = '\\'
vim.g.maplocalleader = '\\\\'


-- C-{hjkl} resize windows
vim.keymap.set({'n','v','t'} , '<C-h>' , '<C-w><' , { remap = false , silent = true , desc = 'Shrink left' })
vim.keymap.set({'n','v','t'} , '<BS>'  , '<C-w><' , { remap = false , silent = true , desc = 'Shrink left' })
vim.keymap.set({'n','v','t'} , '<C-j>' , '<C-w>-' , { remap = false , silent = true , desc = 'Shrink down' })
vim.keymap.set({'n','v','t'} , '<C-k>' , '<C-w>+' , { remap = false , silent = true , desc = 'Shrink up' })
vim.keymap.set({'n','v','t'} , '<C-l>' , '<C-w>>' , { remap = false , silent = true , desc = 'Shrink right' })


-- C-{n,p} move between buffers
vim.keymap.set('n' , '<C-n>' , ':bn<CR>' , { remap = false , silent = true , desc = 'Next buffer' })
vim.keymap.set('n' , '<C-p>' , ':bp<CR>' , { remap = false , silent = true , desc = 'Previous buffer' })


-- ( and ) are used in place of , and ;
vim.keymap.set('' , '(' , ',' , { remap = false, silent = true, desc = 'Prev repeat' })
vim.keymap.set('' , ')' , ';' , { remap = false, silent = true, desc = 'Next repeat' })


-- ; is C-w, ;, is ,
vim.keymap.set('' , ';'  , '<C-w>'      , { remap = false , silent = true , desc = 'Ctrl+W shortcut' })
vim.keymap.set('' , ';]' , '<C-w><C-]>' , { remap = false , silent = true , desc = 'Ctrl+W] shortcut' })


-- alt-{n,p} move between tabs, alt-t creates a new tab, alt-c closes one
vim.keymap.set('n' , '<Esc>n' , ':tabnext<CR>'  , { remap = false , silent = true , desc = 'Next tab' })
vim.keymap.set('n' , '<Esc>p' , ':tabprev<CR>'  , { remap = false , silent = true , desc = 'Previous tab' })
vim.keymap.set('n' , '<Esc>t' , ':tabnew<CR>'   , { remap = false , silent = true , desc = 'New tab' })
vim.keymap.set('n' , '<Esc>c' , ':tabclose<CR>' , { remap = false , silent = true , desc = 'Close tab' })


-- system clipboard shortcuts: <leader>{y,Y,p}
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')
vim.keymap.set('n', '<leader>p', '"+p')
