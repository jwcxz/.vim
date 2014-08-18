set cursorline
set laststatus=2
set foldlevelstart=99
set mouse=a
set foldcolumn=1

set ruler

let g:airline_theme = 'murmur'
let g:airline_left_sep = '⧽'
let g:airline_right_sep = '⧼'

let g:tmuxline_theme = 'airline'
let g:tmuxline_preset = 'tmux'
let g:tmuxline_powerline_separators = 0

if !has('vim_starting')
    NeoBundleSource airline
    AirlineRefresh
endif


if &term =~ "256"

    " 256-color terminals get a modified version of lucius
    set t_Co=256
    colorscheme lucius
    LuciusDark

    " make things a little nicer
    hi Normal       ctermfg=255  ctermbg=none
    hi NonText                   ctermbg=none
    hi VertSplit    ctermfg=234  ctermbg=234
    hi Comment      ctermfg=250
    hi Todo         ctermfg=160
    hi Pmenu        ctermfg=250  ctermbg=237
    hi PmenuSel     ctermfg=186  ctermbg=59
    hi CursorLine                ctermbg=17
    hi CursorColumn              ctermbg=17
    hi TabLine      ctermfg=244  ctermbg=238 cterm=underline
    hi TabLineFill  ctermfg=244  ctermbg=238 cterm=underline

else

    colorscheme murphy
    hi CursorLine   term=underline
    hi CursorColumn term=underline
    hi PmenuSel     cterm=none  ctermfg=yellow  ctermbg=black
    hi PmenuThumb   cterm=none  ctermfg=yellow  ctermbg=yellow
    hi PmenuSbar    cterm=none  ctermfg=cyan    ctermbg=cyan

endif
