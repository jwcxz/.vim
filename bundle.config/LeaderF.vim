let g:Lf_ShortcutF = ''
let g:Lf_ShortcutB = ''

nnoremap <silent> ;; :Leaderf buffer<CR>
nnoremap <silent> ;t :Leaderf tags<CR>
nnoremap <silent> ;f :Leaderf file<CR>
nnoremap <silent> ;R :Leaderf mru<CR>
nnoremap <silent> ;r :Leaderf file<CR>

" don't ignore files in .gitignore
let g:Lf_ExternalCommand = 'rg --files --no-ignore "%s"'

let g:Lf_CommandMap = {
            \ '<C-K>': ['<C-P>'],
            \ '<C-J>': ['<C-N>']
            \ }

let g:Lf_ShowDevIcons = 0

let g:Lf_JumpToExistingWindow = 0

let g:Lf_WindowPosition = 'popup'
