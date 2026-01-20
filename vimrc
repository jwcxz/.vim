" .vimrc
" jwc < https://jwcxz.com >

" Minimal vim configuration for when neovim is not installed
" This is a mostly-unorganized dump of a previous modular configuration


" bootstrapping
" -------------

if has('vim_starting')
    set nocompatible
endif


" behavior
" --------

let mapleader='\'
let maplocalleader='\\'

set isk=a-z,A-Z,48-57,_
set history=50
set ttyfast
set hidden
if has('cryptv')
    set cryptmethod="blowfish"
endif

syntax enable
filetype plugin indent on

set sessionoptions-=folds

set wildmode=longest,list
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

set modeline
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set hlsearch
set incsearch

set autoindent
set smartindent
set backspace=indent,eol,start

set ignorecase
set smartcase

if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
    set grepformat=%f:%l:%c:%m,%f:%l:%m,%f
endif

set signcolumn=no

let g:tex_indent_brace = 0
let g:tex_flavor = "latex"
let g:tex_fast = "cmMprs"
let g:tex_conceal = ""
let g:tex_fold_enabled = 0
let g:tex_comment_nospell = 1
let g:vimtex_latexmk_enabled = 0

nnoremap <silent> <Leader>] :exec("ltag ".expand("<cword>"))<CR>:lopen<CR><C-W>J
nnoremap <silent> <Leader>[ :exec("ptjump ".expand("<cword>"))<CR>

function! ShowFullPath()
    echo expand('%:p')
endfunction

command! ShowFullPath call ShowFullPath()
nnoremap <Leader>f :ShowFullPath<CR>


" aesthetics
" ----------

scriptencoding utf-8
set encoding=utf-8

set noshowcmd
set lazyredraw

set updatetime=300

set cursorline
set laststatus=2
set foldlevelstart=99
set mouse=a
set foldcolumn=1

set noruler
set noshowmode

if has('multi_byte')
    set list
    set listchars=tab:»·,trail:·
    set fillchars=vert:┃
    set fillchars+=foldopen:▾,foldsep:│,foldclose:▸
endif

function! SetColorscheme()
    if has('gui_running') || &term =~ "256"

        let &t_8f="\e[38;2;%ld;%ld;%ldm"
        let &t_8b="\e[48;2;%ld;%ld;%ldm"
        set termguicolors
        colorscheme slate

        hi SpellBad     ctermfg=196  ctermbg=52   guifg=#FF8888 guibg=#660000
        hi! link Todo SpellBad
        hi! link CursorLine CursorColumn
        hi! link CocInlayHint FoldColumn

    else

        colorscheme murphy
        hi CursorLine   term=underline
        hi CursorColumn term=underline
        hi PmenuSel     cterm=none  ctermfg=yellow  ctermbg=black
        hi PmenuThumb   cterm=none  ctermfg=yellow  ctermbg=yellow
        hi PmenuSbar    cterm=none  ctermfg=cyan    ctermbg=cyan

    endif
endfunction

call SetColorscheme()


" misc keybindings
" ---- -----------

" open file explorer
noremap <silent> <F10> :Vexplore<CR>

" C-{hjkl} resize windows
noremap <silent> <C-h> <C-w><
noremap <silent> <BS>  <C-w><
noremap <silent> <C-j> <C-w>-
noremap <silent> <C-k> <C-w>+
noremap <silent> <C-l> <C-w>>

" C-{n,p} move between buffers
noremap <silent> <C-p> :bp<CR>
noremap <silent> <C-n> :bn<CR>

" ( and ) are used in place of , and ;
noremap <silent> ( ,
noremap <silent> ) ;

" ; is C-w, ;, is ,
noremap <silent> ;  <C-w>
noremap <silent> ;] <C-w><C-]>

" alt-{n,p} move between tabs, alt-t creates a new tab, alt-c closes one
noremap <silent> <Esc>n :tabnext<CR>
noremap <silent> <Esc>p :tabprev<CR>
noremap <silent> <Esc>t :tabnew<CR>
noremap <silent> <Esc>c :tabclose<CR>

" fold manipulation
function! FoldToggle()
    if foldlevel('.') > 0
        if foldclosed('.') == -1
            foldclose!
        else
            foldopen!
        endif
    endif
endfunction

nnoremap <silent> <Enter> :call FoldToggle()<CR>
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" linux specifics
if has('unix') && !has('mac')
    " Xorg paste escape codes
    map  <ESC>[200~ :set paste<CR>a
    map  <ESC>[201~ :set nopaste<CR>
    imap <ESC>[200~ <C-o>:set paste<CR>
    imap <ESC>[201~ <nop>
    set  pastetoggle=<ESC>[201~
endif

" easy system clipboard access
noremap <leader>y "+y
noremap <leader>p "+p


" autocmds
" --------

augroup ft_python
    au!
    au Filetype python setlocal cms=#%s
    au Filetype python inoremap # X<C-h>#
augroup END


autocmd WinClosed * nested call s:HandleWinClosed(expand('<amatch>'))

function! s:HandleWinClosed(closed_win_id)
    if win_getid() != str2nr(a:closed_win_id)
        return
    endif
    wincmd p
endfunction
