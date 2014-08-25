" vimrc
" jwc < http://jwcxz.com>


let g:cfg_vimcfg_dir = expand('~/.vim')

if has('vim_starting')
    set nocompatible
    if !exists('g:completer')
        if has('python')
            let g:completer = 'youcompleteme'
        elseif has('lua')
            let g:completer = 'neocomplete'
        else
            let g:completer = 'neocomplcache'
        endif
    endif
endif


exec 'source ' . g:cfg_vimcfg_dir.'/vimrc.behavior.vim'
exec 'source ' . g:cfg_vimcfg_dir.'/vimrc.neobundle.vim'
exec 'source ' . g:cfg_vimcfg_dir.'/vimrc.aesthetic.vim'
exec 'source ' . g:cfg_vimcfg_dir.'/vimrc.keymap.vim'
exec 'source ' . g:cfg_vimcfg_dir.'/vimrc.completion.vim'
exec 'source ' . g:cfg_vimcfg_dir.'/vimrc.autocmds.vim'


" vim: fdm=marker
