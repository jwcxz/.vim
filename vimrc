" vimrc
" jwc < http://jwcxz.com>
"
" see especially the key mappings section
" also, I use ack instead of grep, so if vimgrep breaks, that's why (grepprg)

if has('vim_starting')
    set nocompatible
    let g:completer = 'youcompleteme'
endif

let g:cfg_vimcfg_dir = expand('~/.vim')

autocmd!
" stop vim from pushing # to indent level 0 on python files
autocmd Filetype python set cms=#%s | inoremap # X<C-h>#
autocmd Filetype c set grepprg=ag\ --cc
" }}}

" {{{ general behavior 
set isk=a-z,A-Z,48-57,_
set foldlevelstart=20
set history=50
set ttyfast
set hidden
set cryptmethod="blowfish"

syntax enable
filetype plugin indent on

set wildmode=longest,list
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

set modeline
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set et
set hlsearch
set incsearch

set autoindent
set smartindent
set backspace=indent,eol,start

set ignorecase
set smartcase

set grepprg=ag

let mapleader='\'
" }}}

exec 'source ' . g:cfg_vimcfg_dir.'/vimrc.neobundle.vim'
exec 'source ' . g:cfg_vimcfg_dir.'/vimrc.aesthetic.vim'
exec 'source ' . g:cfg_vimcfg_dir.'/vimrc.keymap.vim'
exec 'source ' . g:cfg_vimcfg_dir.'/vimrc.completion.vim'

" {{{ filetype commands
    autocmd Filetype tex noremap K :w<CR>:!pdflatex -halt-on-error %<CR>
" }}}

" {{{ cscope
    if has('cscope')
        "set cscopetag cscopeverbose

        if has('quickfix')
        set cscopequickfix=s-,c-,d-,i-,t-,e-
        endif

        command! -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
    endif
" }}}

" vim: fdm=marker
