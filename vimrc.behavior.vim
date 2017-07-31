set isk=a-z,A-Z,48-57,_
set history=50
set ttyfast
set hidden
if has('cryptv')
    set cryptmethod="blowfish"
endif

syntax enable
filetype plugin indent on

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

set grepprg=ag


if has('cscope')
    "set cscopetag cscopeverbose

    if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-
    endif

    command! -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
endif


let g:ag_highlight= 1

let g:sneak#s_next = 0
let g:sneak#use_ic_scs = 1
let g:sneak#textobject_z = 0


let g:tex_indent_brace = 0
let g:tex_flavor = "latex"
let g:tex_fast = "cmMprs"
let g:tex_conceal = ""
let g:tex_fold_enabled = 0
let g:tex_comment_nospell = 1
let g:vimtex_latexmk_enabled = 0


let g:pres_mode_enabled = 0
function! PresModeEnter()
    set guifont=SFMono-Light:h16
    let g:pres_mode_enabled = 1
endfunction

function! PresModeLeave()
    set guifont=GohuFont-Medium:h11
    let g:pres_mode_enabled = 0
endfunction

function! PresModeToggle()
    if g:pres_mode_enabled != 0
        PresModeLeave
    else
        PresModeEnter
    endif
endfunction

command! PresModeEnter call PresModeEnter()
command! PresModeLeave call PresModeLeave()
command! PresModeToggle call PresModeToggle()
map <silent> <F11> :call PresModeToggle()<CR>


function! AgSearch()
    "let searchptn = substitute(substitute(@/, '^\\<', '', ''), '\\>$', '', '')
    let lastptn = @/
    AgFromSearch
    let @/ = lastptn
endfunction

nnoremap <silent> <Leader>* *:call AgSearch()<CR>


function! SetKCmd(cmd)
    exec 'noremap <silent> K :cope<CR><C-W>J<C-W>p:'.a:cmd.'<CR>'
endfunction

command! -nargs=+ -complete=command SetKCmd call SetKCmd(<q-args>)


function! SetRunCmd(cmd)
    call SetKCmd('AsyncRun '.a:cmd)
endfunction

command! -nargs=+ -complete=shellcmd SetRunCmd call SetRunCmd(<q-args>)
nnoremap gK :SetRunCmd 


vnoremap <silent> <Leader>v :w! /tmp/x.vim<CR>:so /tmp/x.vim<CR>
nnoremap <Leader>V :so ~/.vimrc<CR>



" vim: fdm=marker
