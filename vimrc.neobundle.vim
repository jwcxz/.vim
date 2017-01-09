" bundles

let g:cfg_bundle_remote_dir = g:cfg_vimcfg_dir.'/bundle.remote'
let g:cfg_bundle_local_dir  = g:cfg_vimcfg_dir.'/bundle.local'

let g:cfg_bundle_neobundle_dir = g:cfg_bundle_remote_dir.'/neobundle.vim'

if has('vim_starting')
    let neobundle_testfile = g:cfg_bundle_neobundle_dir.'/README.md'
    if !filereadable(neobundle_testfile)
        exec 'silent !mkdir -p '.g:cfg_bundle_remote_dir
        exec 'silent !git clone https://github.com/Shougo/neobundle.vim '.g:cfg_bundle_neobundle_dir
    endif

    exec 'set runtimepath+='.g:cfg_bundle_neobundle_dir
endif


call neobundle#begin(g:cfg_bundle_remote_dir)

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc.vim', {
    \ 'build' : {
        \ 'windows' : 'tools\\update-dll-mingw',
        \ 'cygwin' : 'make -f make_cygwin.mak',
        \ 'mac' : 'make -f make_mac.mak',
        \ 'unix' : 'make -f make_unix.mak',
        \ },
    \ }

" aesthetics
NeoBundle 'vim-scripts/guicolorscheme.vim'
NeoBundle 'jszakmeister/vim-togglecursor'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'edkolev/tmuxline.vim'
NeoBundle 'junegunn/vim-peekaboo'
NeoBundle 'vasconcelloslf/vim-interestingwords'
NeoBundle 'jaxbot/semantic-highlight.vim'
NeoBundle 'haya14busa/incsearch.vim'

" colorschemes
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'Lokaltog/vim-distinguished'

" syntax coloration
NeoBundle 'smancill/conky-syntax.vim'
NeoBundle 'jwcxz/vim-todo'
NeoBundle 'jwcxz/vim-vdb'
NeoBundle 'jwcxz/vim-logcp'
NeoBundle 'vim-scripts/armasm'

" buffer management
NeoBundle 'itchyny/thumbnail.vim'
NeoBundle 'Shougo/unite.vim'    , { 'disabled' : g:bufmanager !=? 'unite' }
NeoBundle 'tsukkee/unite-tag'   , { 'disabled' : g:bufmanager !=? 'unite' }
NeoBundle 'Shougo/denite.nvim'  , { 'disabled' : g:bufmanager !=? 'denite' }
NeoBundle 'junegunn/fzf.vim'    , { 'disabled' : g:bufmanager !=? 'fzf', 'name': 'fzf-tools' }
if g:bufmanager ==? 'fzf'
    NeoBundle '~/.fzf'          , { 'disabled' : g:bufmanager !=? 'fzf', 'name': 'fzf-base' }
endif

" completion
NeoBundle 'Shougo/neocomplcache'    , { 'disabled' : g:completer !=? 'neocomplcache' }
NeoBundle 'Shougo/neocomplete'      , { 'disabled' : g:completer !=? 'neocomplete'   }
NeoBundle 'Valloric/YouCompleteMe'  , { 'disabled' : g:completer !=? 'youcompleteme',
    \ 'build' : {
        \ 'mac' : './install.py --clang-completer',
        \ 'unix' : './install.py --clang-completer --system-libclang',
        \ }
    \ }

" other plugins
NeoBundle 'vim-scripts/a.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'hari-rangarajan/CCTree'
NeoBundle 'vim-scripts/jpythonfold.vim'
NeoBundle 'graudeejs/vim-matchit'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-pathogen'
NeoBundle 'chrisbra/Recover.vim'
NeoBundle 'justinmk/vim-sneak'
NeoBundle 'godlygeek/tabular'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'vim-scripts/verilog_systemverilog.vim'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'skywind3000/asyncrun.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Konfekt/FastFold'
NeoBundle 'talek/obvious-resize'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'suan/vim-instant-markdown'
NeoBundle 'tpope/vim-fugitive'
"NeoBundle 'lervag/vimtex'

" text objects
NeoBundle 'wellle/targets.vim'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'thinca/vim-textobj-between'
NeoBundle 'coderifous/textobj-word-column.vim'

" local bundles
NeoBundleLocal '~/.vim/bundle.local/'

call neobundle#end()


filetype plugin indent on
NeoBundleCheck


" vim: fdm=marker
