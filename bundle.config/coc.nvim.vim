function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction


nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"

inoremap <silent><expr> <TAB>
        \ coc#pum#visible() ? coc#pum#next(1) :
        \ <SID>check_back_space() ? "\<Tab>" :
        \ coc#refresh()

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <c-f> coc#refresh()
inoremap <silent><expr> <c-space> coc#refresh()


let g:coc_global_extensions = ['coc-vimlsp', 'coc-tag', 'coc-pyright', 'coc-json', 'coc-clangd', 'coc-texlab']


call coc#config('suggest.autoTrigger', 'always')

call coc#config('clangd.arguments', ['--header-insertion=never'])
