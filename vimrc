" vimrc
" jwc < http://jwcxz.com>
"
" see especially the key mappings section
" also, I use ack instead of grep, so if vimgrep breaks, that's why (grepprg)

execute pathogen#infect('bundle.remote/{}')
execute pathogen#infect('bundle.local/{}')
execute pathogen#helptags()

" {{{ per-filetype hooks and actions
au BufWritePost *.c silent! !ctags -R &
au BufWritePost *.h silent! !ctags -R &
au BufWritePost *.cpp silent! !ctags -R &
au BufWritePost *.py silent! !ctags -R &

autocmd!
" stop vim from pushing # to indent level 0 on python files
autocmd Filetype python set cms=#%s | inoremap # X<C-H>#
" }}}

" {{{ general behavior 
set nocompatible
set isk=a-z,A-Z,48-57,_,.,-,>
set fdm=syntax
set foldlevelstart=20
set mouse=nvcr
set history=50
set ttyfast
set hidden
set cryptmethod="blowfish"

syntax enable
filetype plugin indent on

set wildmode=longest,list
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

set modeline
set foldcolumn=1
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set et
set hlsearch
set incsearch

set ruler
set laststatus=2

set autoindent
set smartindent
set backspace=indent,eol,start

set ignorecase
set smartcase

set grepprg=ack\ -a
" }}}

" {{{ key mappings 
    " C-{hjkl} resize windows
    map <silent> <C-h> <C-w><
    map <silent> <C-j> <C-W>-
    map <silent> <C-k> <C-W>+
    map <silent> <C-l> <C-w>>

    " C-{n,p} move between bufers
    noremap <silent> <C-p> :bp<CR>
    noremap <silent> <C-n> :bn<CR>

    " ; is C-w, ;, is ,
    noremap <silent> ,  ;
    noremap <silent> ;, ,
    noremap <silent> ;  <C-W>
    noremap <silent> ;] <C-W><C-]>

    " alt-{n,p} move between tabs, alt-t creates a new tab, alt-c closes one
    noremap <silent> <Esc>n :tabnext<CR>
    noremap <silent> <Esc>p :tabprev<CR>
    noremap <silent> <Esc>t :tabnew<CR>
    noremap <silent> <Esc>c :tabclose<CR>

    " tt means :ta
    noremap <silent> tt :ta 

    " buffer and file selection
    let g:LustyExplorerDefaultMappings = 0
    noremap ;; :LustyBufferExplorer<CR>
    noremap ;f :LustyFilesystemExplorerFromHere<CR>
    noremap ;af :LustyFilesystemExplorer<CR>
    noremap ;ag :LustyBufferGrep<CR>
    noremap ;aj :LustyJuggler<CR>

    " tree view
    nnoremap <F10> :NERDTreeToggle<CR>
    nnoremap ;aF   :NERDTreeFind<CR>

    " taglist
        nnoremap <silent> <F9> :Tlist<CR>
        nnoremap ;aT :TlistOpen
" }}}

" {{{ filetype commands
    autocmd Filetype tex noremap K :w<CR>:!pdflatex -halt-on-error %<CR>
" }}}

" {{{ color 
set cursorline
if &term =~ "256"
    " 256-color terminals get a modified version of lucius
    set t_Co=256
    colorscheme lucius
    LuciusDark

    " make things a little nicer
    hi Normal       ctermfg=255  ctermbg=none
    hi NonText                   ctermbg=none
    hi VertSplit    ctermfg=234  ctermbg=234
    hi SpellBad     ctermfg=203  ctermbg=88
    hi Comment      ctermfg=250  ctermbg=234
    hi Todo         ctermfg=160
    hi Pmenu        ctermfg=250  ctermbg=237
    hi PmenuSel     ctermfg=186  ctermbg=59
    hi CursorLine                ctermbg=17
    hi CursorColumn              ctermbg=17
    hi TabLineSel   ctermfg=233  ctermbg=250
    hi TabLine      ctermfg=244  ctermbg=238 cterm=underline
    hi TabLineFill  ctermfg=244  ctermbg=238 cterm=underline

    hi NStatusLine  ctermfg=254 ctermbg=237
    hi NslSep       ctermfg=240 ctermbg=237

    hi IStatusLine  ctermfg=226 ctermbg=237
    hi IslSep       ctermfg=136 ctermbg=237
    
    hi StatusLineNC ctermfg=240 ctermbg=234
else
    " otherwise, make the default a little less painful
    colorscheme default
    hi CursorLine   cterm=none  ctermbg=6
    hi CursorColumn cterm=none  ctermbg=black
    hi FoldColumn               ctermbg=cyan
    hi Folded                   ctermbg=cyan
    hi Pmenu                    ctermbg=cyan
    hi PmenuSel     cterm=none  ctermfg=yellow  ctermbg=black
    hi PmenuThumb   cterm=none  ctermfg=yellow  ctermbg=yellow
    hi PmenuSbar    cterm=none  ctermfg=cyan    ctermbg=cyan

    hi NStatusLine cterm=bold   ctermfg=yellow  ctermbg=cyan
    hi NslSep      cterm=bold   ctermfg=yellow  ctermbg=cyan

    hi IStatusLine cterm=bold   ctermfg=red   ctermbg=cyan
    hi IslSep      cterm=bold   ctermfg=red   ctermbg=cyan

    hi StatusLineNC cterm=none  ctermbg=cyan
endif

hi! link StatusLine  NStatusLine
hi! link slReadOnly  Error
hi! link slSep       NslSep

set statusline=\ %(%m\ %)%f%=%#slReadOnly#%r%*%y\ %l%#slSep#/%*%L%#slSep#\|%*%c%*\ %p%*%#slSep#%%%*

" when we're in insert mode, the status line color will change
au InsertEnter * hi! link StatusLine IStatusLine | hi! link slSep IslSep
au InsertLeave * hi! link StatusLine NStatusLine | hi! link slSep NslSep
" }}}

" {{{ neocomplcache
    runtime! plugin/neocomplcache.vim

    if exists(":NeoComplCacheEnable")
        NeoComplCacheEnable
        " Disable AutoComplPop.
        let g:acp_enableAtStartup = 0
        " Use neocomplcache.
        let g:neocomplcache_enable_at_startup = 1
        " Use smartcase.
        let g:neocomplcache_enable_smart_case = 1
        " Use camel case completion.
        let g:neocomplcache_enable_camel_case_completion = 1
        " Use underbar completion.
        let g:neocomplcache_enable_underbar_completion = 1
        " Set minimum syntax keyword length.
        let g:neocomplcache_min_syntax_length = 5
        let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

        " Define dictionary.
        let g:neocomplcache_dictionary_filetype_lists = {'default' : ''}

        " Define keyword.
        if !exists('g:neocomplcache_keyword_patterns')
            let g:neocomplcache_keyword_patterns = {}
        endif
        let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

        " Plugin key-mappings.
        imap <C-k>     <Plug>(neocomplcache_snippets_expand)
        smap <C-k>     <Plug>(neocomplcache_snippets_expand)
        inoremap <expr><C-g>     neocomplcache#undo_completion()
        inoremap <expr><C-l>     neocomplcache#complete_common_string()

        " SuperTab like snippets behavior.
        "imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

        " Recommended key-mappings.
        " <CR>: close popup and save indent.
        inoremap <expr><CR>  neocomplcache#smart_close_popup() ."\<CR>"
        " <TAB>: completion.
        "inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
        " <C-h>, <BS>: close popup and delete backword char.
        inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><C-y>  neocomplcache#close_popup()
        inoremap <expr><C-e>  neocomplcache#cancel_popup()

        " AutoComplPop like behavior.
        "let g:neocomplcache_enable_auto_select = 1

        " Enable omni completion.
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

        " Enable heavy omni completion.
        if !exists('g:neocomplcache_omni_patterns')
        let g:neocomplcache_omni_patterns = {}
        endif
        "let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
        "autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
    endif
" }}}

" {{{ cscope
    if has('cscope')
        "set cscopetag cscopeverbose

        if has('quickfix')
        set cscopequickfix=s-,c-,d-,i-,t-,e-
        endif

        "cnoreabbrev csa cs add
        "cnoreabbrev csf cs find
        "cnoreabbrev csk cs kill
        "cnoreabbrev csr cs reset
        "cnoreabbrev css cs show
        "cnoreabbrev csh cs help

        command! -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
    endif
" }}}

" vim: ts=4 sw=4 fdm=marker
