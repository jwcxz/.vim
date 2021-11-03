" bundles

let g:cfg_bundle_remote_dir = g:cfg_vimcfg_dir.'/bundle.remote'
let g:cfg_bundle_local_dir  = g:cfg_vimcfg_dir.'/bundle.local'

let g:cfg_bundle_plug_dir = g:cfg_vimcfg_dir.'/bundle.plug'
let g:cfg_bundle_plug_file = g:cfg_bundle_plug_dir.'/autoload/plug.vim'

if has('vim_starting')
    if !filereadable(g:cfg_bundle_plug_file)
        exec 'silent !mkdir -p '.g:cfg_bundle_remote_dir
        exec 'silent !curl -fLo '.g:cfg_bundle_plug_file.' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    endif

    exec 'set runtimepath+='.g:cfg_bundle_plug_dir
endif


function! PlugDisable(condition)
    if a:condition
        return { 'on': [] }
    else
        return { }
    endif
endfunction


call plug#begin(g:cfg_bundle_remote_dir)

" aesthetics
Plug 'vim-scripts/guicolorscheme.vim'
Plug 'jszakmeister/vim-togglecursor'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'vasconcelloslf/vim-interestingwords'
Plug 'jaxbot/semantic-highlight.vim'


" colorschemes
Plug 'jonathanfilip/vim-lucius'
Plug 'morhetz/gruvbox'


" syntax coloration
Plug 'jwcxz/vim-todo'
Plug 'jwcxz/vim-vdb'
Plug 'jwcxz/vim-logcp'
Plug 'ARM9/arm-syntax-vim'


" buffer management
Plug 'junegunn/fzf.vim', extend({ 'as': 'fzf-tools' }, PlugDisable(g:bufmanager !=? 'fzf'))
let fzf_base_loc = expand('~/.fzf')
if g:bufmanager ==? 'fzf' && isdirectory(fzf_base_loc)
    Plug fzf_base_loc, { 'as': 'fzf-base' }
endif

Plug 'Yggdroot/LeaderF', extend({ 'do': './install.sh' }, PlugDisable(g:bufmanager !=? 'leaderf'))


" window management
Plug 't9md/vim-choosewin'
Plug 'dhruvasagar/vim-zoom'


" completion
Plug 'neoclide/coc.nvim', extend({'branch': 'release'}, PlugDisable(g:completer !=? 'coc'))


" other plugins
Plug 'vim-scripts/a.vim'
Plug 'mileszs/ack.vim'
Plug 'vim-scripts/jpythonfold.vim'
Plug 'chrisbra/matchit'
Plug 'scrooloose/nerdtree', PlugDisable(g:tree !=? 'nerdtree')
Plug 'ms-jpq/chadtree', extend({'branch': 'chad', 'do': 'python3 -m chadtree deps'}, PlugDisable(g:tree !=? 'chadtree'))
Plug 'chrisbra/Recover.vim'
Plug 'godlygeek/tabular'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/verilog_systemverilog.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-surround'
Plug 'Konfekt/FastFold'
Plug 'tpope/vim-markdown'
Plug 'suan/vim-instant-markdown'
Plug 'jwcxz/vim-instant-wavedrom'
Plug 'tpope/vim-fugitive'


" text objects
Plug 'wellle/targets.vim'
Plug 'kana/vim-textobj-user'
Plug 'thinca/vim-textobj-between'
Plug 'coderifous/textobj-word-column.vim'
Plug 'junegunn/vim-easy-align'


" movement
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch-easymotion.vim'


" local bundles
let localplugs = split(system('ls -1 '.g:cfg_bundle_local_dir), "\n")
for localplug in localplugs[1:]
    let localplug = substitute(localplug, "", "", "g")
    Plug g:cfg_bundle_local_dir.'/'.localplug
endfor

call plug#end()


filetype plugin indent on


" vim: fdm=marker
