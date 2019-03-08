scriptencoding utf-8
set encoding=utf-8

if has('gui_running') && has('nvim')
    " work around neovim-dot-app slowness bug
    set noshowcmd
    set nolazyredraw
elseif has('gui_running')
    set showcmd
    set lazyredraw
else
    set noshowcmd
    set lazyredraw
endif

set cursorline
set laststatus=2
set foldlevelstart=99
set mouse=a
set foldcolumn=1

set ruler

if has('multi_byte')
    set list
    set listchars=tab:»·,trail:·
    set fillchars=vert:┃
endif

if has('termtruecolor')
    let &t_8f="\e[38;2;%ld;%ld;%ldm"
    let &t_8b="\e[48;2;%ld;%ld;%ldm"
    set guicolors
endif

if &term =~ "256" || has('nvim')
    set t_Co=256
endif

if has('gui_running')
    set guifont=GohuFont

    set guioptions-=m
    set guioptions-=T
    set guioptions-=e
    set guioptions-=r
    set guioptions-=L
endif


function! SetColorscheme()
    if has('gui_running') || &term =~ "256" || has('nvim')

        colorscheme lucius
        LuciusBlack

        hi Normal       guibg=#202020

        hi SpellBad     ctermfg=196  ctermbg=52   guifg=#FF8888 guibg=#660000
        hi VertSplit    ctermfg=237  ctermbg=234  guifg=#2b2b2b guibg=#1c1c1c

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


let g:sneak#prompt = '〉'
hi link SneakPluginTarget   DiffAdd
hi link SneakPluginScope    DiffChange


" vim: fdm=marker
