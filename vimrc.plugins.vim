" plugins

" vim-plug is used to manage plugins for the complete and portable profiles
" if the noplugin profile is used, this entire file is not sourced

" if the noplugin profile is being used, stop sourcing now
if CfgProfileIs('noplugin')
    finish
endif

" remote bundles are sourced from other repositories
let g:cfg_bundle_remote_dir = g:cfg_vimcfg_dir.'/bundle.remote'
" local bundles are sourced from `bundle.local/`
let g:cfg_bundle_local_dir  = g:cfg_vimcfg_dir.'/bundle.local'


" install vim-plug if it isn't installed already
if has('vim_starting')
    let cfg_bundle_plug_dir = g:cfg_vimcfg_dir.'/bundle.plug'
    let cfg_bundle_plug_file = cfg_bundle_plug_dir.'/autoload/plug.vim'

    if !filereadable(cfg_bundle_plug_file)
        exec 'silent !mkdir -p '.g:cfg_bundle_remote_dir
        exec 'silent !curl -fLo '.cfg_bundle_plug_file.' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    endif

    exec 'set runtimepath+='.cfg_bundle_plug_dir
endif


" provide a helper function to let vim-plug know whether a plugin should be
" disabled based on a condition.  This function (and the derivatives below)
" cannot be a local function because it is evaluated outside of this file's
" context
function! PlugDisable(condition)
    if a:condition
        return { 'on': [] }
    else
        return { }
    endif
endfunction

" provide helper functions to disable a given plugin for certain profiles
function! PlugDisableForPortable()
    return PlugDisable(CfgProfileIs('portable'))
endfunction

function! PlugDisableForComplete()
    return PlugDisable(CfgProfileIs('complete'))
endfunction



call plug#begin(g:cfg_bundle_remote_dir)

" aesthetics
Plug 'vim-scripts/guicolorscheme.vim'
Plug 'jszakmeister/vim-togglecursor'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'vasconcelloslf/vim-interestingwords'
Plug 'jaxbot/semantic-highlight.vim'


" colorschemes
Plug 'catppuccin/nvim', extend({'as': 'catppuccin.nvim'}, PlugDisableForPortable())
" if running in portable mode, catppuccin offers a vim-compatible option,
" which should only be used if the current profile is not `complete`
Plug 'catppuccin/vim', extend({'as': 'catppuccin.vim'}, PlugDisableForComplete())


" syntax coloration
Plug 'jwcxz/vim-todo'
Plug 'jwcxz/vim-vdb'
Plug 'jwcxz/vim-logcp'
Plug 'ARM9/arm-syntax-vim'
Plug 'nvim-treesitter/nvim-treesitter', extend({'do': ':TSUpdate'}, PlugDisableForPortable())


" window management
Plug 't9md/vim-choosewin'
Plug 'dhruvasagar/vim-zoom'


" completion
"   currently, the only supported configuration is nvim-lsp_nvim-cmp (i.e. use
"   neovim's native LSP support, add nvim-lspconfig for configuration, and add
"   nvim-cmp and some of its dependencies for auto-completion
Plug 'neovim/nvim-lspconfig', PlugDisableForPortable()
Plug 'hrsh7th/cmp-nvim-lsp', PlugDisableForPortable()
Plug 'hrsh7th/cmp-buffer', PlugDisableForPortable()
Plug 'hrsh7th/cmp-path', PlugDisableForPortable()
Plug 'hrsh7th/cmp-cmdline', PlugDisableForPortable()
Plug 'hrsh7th/nvim-cmp', PlugDisableForPortable()
Plug 'hrsh7th/cmp-vsnip', PlugDisableForPortable()
Plug 'hrsh7th/vim-vsnip', PlugDisableForPortable()
Plug 'quangnguyen30192/cmp-nvim-tags', PlugDisableForPortable()


" file hierarchy view
Plug 'scrooloose/nerdtree', PlugDisableForPortable()
Plug 'nvim-lua/plenary.nvim', PlugDisableForPortable()
Plug 'nvim-tree/nvim-web-devicons', PlugDisableForPortable()
Plug 'MunifTanjim/nui.nvim', PlugDisableForPortable()
Plug 'nvim-neo-tree/neo-tree.nvim', PlugDisableForPortable()


" selection
" requires plenary (above)
Plug 'nvim-telescope/telescope.nvim', extend({ 'branch': '0.1.x' }, PlugDisableForPortable())
Plug 'nvim-telescope/telescope-fzf-native.nvim', extend({ 'do': 'make' }, PlugDisableForPortable())
Plug 'folke/trouble.nvim', PlugDisableForPortable()
" fallback for portable usage
Plug 'Yggdroot/LeaderF', extend({ 'do': './install.sh' }, PlugDisableForComplete())


" other plugins
Plug 'vim-scripts/a.vim'
Plug 'mileszs/ack.vim'
Plug 'chrisbra/matchit'
Plug 'chrisbra/Recover.vim'
Plug 'godlygeek/tabular'
Plug 'yegappan/taglist'
Plug 'vim-scripts/verilog_systemverilog.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-surround'
Plug 'suan/vim-instant-markdown'
Plug 'jwcxz/vim-instant-wavedrom'
Plug 'tpope/vim-fugitive'
Plug 'tmhedberg/SimpylFold'


" text objects
Plug 'wellle/targets.vim'
Plug 'kana/vim-textobj-user'
Plug 'thinca/vim-textobj-between'
Plug 'coderifous/textobj-word-column.vim'
Plug 'junegunn/vim-easy-align'


" movement
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
"Plug 'easymotion/vim-easymotion'
"Plug 'haya14busa/incsearch-easymotion.vim'


" find and enable all local plugins
" TODO: currently assumes all local plugins support both `complete` and
" `portable` profiles
let localplugs = split(system('ls -1 '.g:cfg_bundle_local_dir), '\n')
for localplug in localplugs[1:]
    let localplug = substitute(localplug, '\n', '', 'g')
    Plug g:cfg_bundle_local_dir.'/'.localplug
endfor

call plug#end()


filetype plugin indent on
