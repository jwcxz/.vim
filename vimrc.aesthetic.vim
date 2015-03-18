scriptencoding utf-8
set encoding=utf-8

set lazyredraw
set cursorline
set laststatus=2
set foldlevelstart=99
set mouse=a
set foldcolumn=1

set ruler

if has('multi_byte')
    set list
    set listchars=tab:»·,trail:·
    set fillchars=stl:\ ,stlnc:\ ,vert:│
endif

let g:airline_theme = 'murmur'
let g:airline_left_sep = '»'
let g:airline_right_sep = '«'

let g:tmuxline_theme = 'airline'
let g:tmuxline_preset = 'tmux'
let g:tmuxline_powerline_separators = 0

if !has('vim_starting')
    NeoBundleSource airline
    AirlineRefresh
endif

if has('termtruecolor')
    let &t_8f="\e[38;2;%ld;%ld;%ldm"
    let &t_8b="\e[48;2;%ld;%ld;%ldm"
    set guicolors
endif

if &term =~ "256"

    " 256-color terminals get a modified version of lucius
    set t_Co=256
    colorscheme distinguished

    " make things a little nicer
    hi Normal       ctermfg=255  ctermbg=none guifg=#FFFFFF guibg=#000000
    hi Todo         ctermfg=160  ctermbg=233  guifg=#D70000 guibg=#121212

else

    colorscheme murphy
    hi CursorLine   term=underline
    hi CursorColumn term=underline
    hi PmenuSel     cterm=none  ctermfg=yellow  ctermbg=black
    hi PmenuThumb   cterm=none  ctermfg=yellow  ctermbg=yellow
    hi PmenuSbar    cterm=none  ctermfg=cyan    ctermbg=cyan

endif


" vim: fdm=marker
