" vimrc
" jwc < http://jwcxz.com >


let g:cfg_vimcfg_dir = expand('~/.vim')

" local overrides, not tracked by git
" this is sourced before all other configuration (besides the code inside
"   `if has ('vim_starting')`
let g:cfg_vimcfg_local_before = g:cfg_vimcfg_dir.'/vimrc.local.before.vim'
" this is sourced after all other configuration
let g:cfg_vimcfg_local_after = g:cfg_vimcfg_dir.'/vimrc.local.after.vim'


if has('vim_starting')
    set nocompatible
    if !exists('g:completer')
        if has('nvim')
            let g:completer = 'nvim-lsp_nvim-cmp'
        else
            " unsupported instances will not support auto-completion
            let g:completer = ''
        endif
    endif

    if !exists('g:bufmanager')
        let fzf_loc = system("which fzf")
        let has_fzf = (v:shell_error == 0)

        if has('python3') || has('python')
            let g:bufmanager = 'leaderf'
        elseif (has('terminal') || has('nvim')) && has_fzf
            let g:bufmanager = 'fzf'
        else
            let g:bufmanager = ''
        endif
    endif

    if !exists('g:tree')
        if has('nvim')
            "let g:tree = 'chadtree'
            let g:tree = 'neo-tree'
        else
            let g:tree = 'nerdtree'
        endif
    endif
endif


if filereadable(g:cfg_vimcfg_local_before)
    exec 'source ' . g:cfg_vimcfg_local_before
endif

exec 'source ' . g:cfg_vimcfg_dir.'/vimrc.behavior.vim'
exec 'source ' . g:cfg_vimcfg_dir.'/vimrc.plug.vim'
exec 'source ' . g:cfg_vimcfg_dir.'/vimrc.aesthetic.vim'
exec 'source ' . g:cfg_vimcfg_dir.'/vimrc.keymap.vim'
if has('gui_running')
    " TODO: support terminal features in terminal vim instances
    exec 'source ' . g:cfg_vimcfg_dir.'/vimrc.terminal.vim'
endif
exec 'source ' . g:cfg_vimcfg_dir.'/vimrc.autocmds.vim'

exec 'source ' . g:cfg_vimcfg_dir.'/vimrc.pluginbehavior.vim'

if filereadable(g:cfg_vimcfg_local_after)
    exec 'source ' . g:cfg_vimcfg_local_after
endif


" vim: fdm=marker
