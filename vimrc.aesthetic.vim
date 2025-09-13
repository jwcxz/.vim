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

        let &t_8f="\e[38;2;%ld;%ld;%ldm"
        let &t_8b="\e[48;2;%ld;%ld;%ldm"
        set termguicolors

        " TODO: clean this up by querying which plugin was installed directly
        if has('nvim') && CfgProfileIs('complete')
            lua << EOF
            local ok, _ = pcall(require, 'catppuccin')
            if ok then
                vim.g.catppuccin_flavour = "macchiato"
                require('catppuccin').setup({
                    transparent_background = true,
                    no_italic = true
                })
            end
EOF
            colorscheme catppuccin
        elseif CfgProfileIs('portable')
            colorscheme catppuccin_mocha
        else
            colorscheme slate
        endif

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

if has('nvim')
    set pumblend=15
    set winblend=15
    set signcolumn=yes
    set winborder=rounded
lua << EOF
    -- https://dev.to/elvessousa/taking-neovim-to-the-moon-274g
    -- TODO: refactor
    vim.diagnostic.config({
        float = { source = "always", border = "rounded",
                    header={"※  DIAGNOSTICS  ※", "FloatBorder"} },
        virtual_text = false,
        signs = true,
    })
    --vim.cmd([[ autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
    local bufopts = { noremap=true, silent=true, buffer=0 }
    vim.keymap.set('n', 'gx', function() vim.diagnostic.open_float(nil, {focus=false}) end, bufopts)
EOF
endif


let g:sneak#prompt = '〉'
hi link SneakPluginTarget   DiffAdd
hi link SneakPluginScope    DiffChange
