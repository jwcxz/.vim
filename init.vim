" vimrc
" jwc < http://jwcxz.com >


let g:cfg_vimcfg_dir = expand('~/.vim')

" local overrides, not tracked by git
" this is sourced after all other configuration
let g:cfg_vimcfg_local = g:cfg_vimcfg_dir.'/vimrc.local.vim'


" TODO: TEMPORARY
" living on LeaderF for a bit to see if it should replace fzf as my default
" buffer manager
let g:bufmanager = 'leaderf'


if has('vim_starting')
    set nocompatible
    if !exists('g:completer')
        let node_loc = system("which node")
        let has_node = (v:shell_error == 0)

        if (has('nvim') || v:version >= 800) && has_node
            let g:completer = 'coc'
        else
            " unsupported instances will not support auto-completion
            let g:completer = ''
        endif
    endif

    if !exists('g:bufmanager')
        let fzf_loc = system("which fzf")
        let has_fzf = (v:shell_error == 0)

        if (has('terminal') || has('nvim')) && has_fzf
            let g:bufmanager = 'fzf'
        elseif has('python3') || has('python')
            let g:bufmanager = 'leaderf'
        else
            let g:bufmanager = ''
        endif
    endif
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

if filereadable(g:cfg_vimcfg_local)
    exec 'source ' . g:cfg_vimcfg_local
endif


" vim: fdm=marker
