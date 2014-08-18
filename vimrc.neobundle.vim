" bundles

let g:cfg_bundle_remote_dir = g:cfg_vimcfg_dir.'/bundle.remote'
let g:cfg_bundle_local_dir  = g:cfg_vimcfg_dir.'/bundle.local'

let g:cfg_bundle_neobundle_dir = g:cfg_bundle_remote_dir.'/neobundle.vim'

if has('vim_starting')
    let neobundle_testfile = g:cfg_bundle_neobundle_dir.'/README.md'
    if !filereadable(neobundle_testfile)
        silent !mkdir -p g:cfg_bundle_remote_dir
        silent !git clone https://github.com/Shougo/neobundle.vim g:cfg_bundle_neobundle_dir
    endif

    set runtimepath+=~/.vim/bundle.remote/neobundle.vim
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

NeoBundle 'vim-scripts/a.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'hari-rangarajan/CCTree/'
NeoBundle 'smancill/conky-syntax.vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'vim-scripts/guicolorscheme.vim'
NeoBundle 'vim-scripts/jpythonfold.vim'
NeoBundle 'jwcxz/vim-logcp'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'graudeejs/vim-matchit'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-pathogen'
NeoBundle 'chrisbra/Recover.vim'
NeoBundle 'justinmk/vim-sneak'
NeoBundle 'godlygeek/tabular'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'coderifous/textobj-word-column.vim'
NeoBundle 'edkolev/tmuxline.vim'
NeoBundle 'jwcxz/vim-todo'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'jwcxz/vim-vdb'
NeoBundle 'vim-scripts/verilog_systemverilog.vim'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-surround'

NeoBundle 'Shougo/neocomplcache'    , { 'disabled' : g:completer !=? 'neocomplcache' }
NeoBundle 'Shougo/neocomplete'      , { 'disabled' : g:completer !=? 'neocomplete'   }
NeoBundle 'Valloric/YouCompleteMe'  , { 'disabled' : g:completer !=? 'youcompleteme',
    \ 'build' : {
        \ 'mac' : './install.sh --clang-completer --system-libclang',
        \ 'unix' : './install.sh --clang-completer --system-libclang',
        \ }
    \ }

NeoBundleLocal '~/.vim/bundle.local/'

call neobundle#end()


filetype plugin indent on
NeoBundleCheck
