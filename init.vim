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
        if has('python3')
            let g:bufmanager = 'denite'
        else
            if has('gui_running')
                let g:bufmanager = 'unite'
            else
                let fzfloc = system("which fzf")
                if v:shell_error == 0
                    let g:bufmanager = 'fzf'
                else
                    let g:bufmanager = 'unite'
                endif
            endif
        endif
    endif
endif


exec 'source ' . g:cfg_vimcfg_dir.'/vimrc.behavior.vim'
exec 'source ' . g:cfg_vimcfg_dir.'/vimrc.plug.vim'
exec 'source ' . g:cfg_vimcfg_dir.'/vimrc.aesthetic.vim'
exec 'source ' . g:cfg_vimcfg_dir.'/vimrc.keymap.vim'
exec 'source ' . g:cfg_vimcfg_dir.'/vimrc.completion.vim'
exec 'source ' . g:cfg_vimcfg_dir.'/vimrc.autocmds.vim'

exec 'source ' . g:cfg_vimcfg_dir.'/vimrc.pluginbehavior.vim'

if filereadable(g:cfg_vimcfg_local)
    exec 'source ' . g:cfg_vimcfg_local
endif


" vim: fdm=marker
