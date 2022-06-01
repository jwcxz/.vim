let g:Lf_ShortcutF = ''
let g:Lf_ShortcutB = ''

nnoremap <silent> ;; :Leaderf buffer --nameOnly<CR>
nnoremap <silent> ;t :Leaderf tag<CR>
nnoremap <silent> ;f :Leaderf file<CR>
nnoremap <silent> ;R :Leaderf mru<CR>
nnoremap <silent> ;r :Leaderf file<CR>

" don't ignore files in .gitignore
let g:Lf_ExternalCommand = 'rg --files --no-ignore "%s"'

let g:Lf_CommandMap = {
            \ '<Up>': ['<C-K>'],
            \ '<Down>': ['<C-J>'],
            \ '<C-K>': ['<C-P>', '<Up>'],
            \ '<C-J>': ['<C-N>', '<Down>'],
            \ '<C-P>': ['<C-O>'],
            \ '<F5>': ['<C-R>']
            \ }

let g:Lf_ShowDevIcons = 0

let g:Lf_JumpToExistingWindow = 0

let g:Lf_WindowPosition = 'popup'
