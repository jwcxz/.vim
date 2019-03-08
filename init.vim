" vimrc
" jwc < http://jwcxz.com>


let g:cfg_vimcfg_dir = expand('~/.vim')
let g:cfg_vimcfg_local = g:cfg_vimcfg_dir.'/vimrc.local.vim'

if has('vim_starting')
    set nocompatible
    if !exists('g:completer')
        if has('python3') || has('python')
            let g:completer = 'youcompleteme'
        elseif has('lua')
            let g:completer = 'neocomplete'
        else
            let g:completer = 'neocomplcache'
        endif
    endif

    if !exists('g:bufmanager')
        let fzf_loc = system("which fzf")
        let has_fzf = (v:shell_error == 0)

        if (has('terminal') || has('nvim')) && has_fzf
            let g:bufmanager = 'fzf'
        elseif has('python3')
            let g:bufmanager = 'denite'
        else
            let g:bufmanager = 'unite'
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
exec 'source ' . g:cfg_vimcfg_dir.'/vimrc.completion.vim'
exec 'source ' . g:cfg_vimcfg_dir.'/vimrc.autocmds.vim'

exec 'source ' . g:cfg_vimcfg_dir.'/vimrc.pluginbehavior.vim'

if filereadable(g:cfg_vimcfg_local)
    exec 'source ' . g:cfg_vimcfg_local
endif


" vim: fdm=marker
