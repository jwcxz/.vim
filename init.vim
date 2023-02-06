" vimrc
" jwc < http://jwcxz.com >

" see README.md for background information, requirements, etc.


" bootstrapping
" -------------

" get the true path of $MYVIMRC and set the configuration directory to its
" parent directory.  This allows for alternate configurations with this
" repository's directory structure to be resolved automatically when using
" `[n]vim -u`.

let g:cfg_resolved_vimrc = resolve(expand($MYVIMRC))
" https://stackoverflow.com/q/16485748
let g:cfg_vimcfg_dir = fnamemodify(g:cfg_resolved_vimrc, ':h')

" configuration files for local overrides (ignored by git)
" the "before" override is sourced before all other configuration (besides the
" rest of this bootstrapping code
let g:cfg_vimcfg_local_before = g:cfg_vimcfg_dir.'/vimrc.local.before.vim'
" the "after" override is sourced after all other configuration
let g:cfg_vimcfg_local_after = g:cfg_vimcfg_dir.'/vimrc.local.after.vim'



if has('vim_starting')
    " there are no situations where I will ever require compatible mode, so
    " set that here
    " TODO: determine if this is the right way to do this (e.g. see
    " https://vi.stackexchange.com/q/25149)
    set nocompatible

    " determine the operation profile:
    "   complete: only works with neovim, has dependencies that require manual
    "             installation
    "   portable: works with both neovim and vim, with a minimal set of
    "             plugins to make both useful
    "   noplugin: works with both neovim and vim, with no plugins (just
    "             behavioral configuration)

    " if the profile is already provided, it is not overridden

    if !exists('$CFG_PROFILE')
        " currently, the selection criteria is purely based on whether running
        " neovim or vim
        " TODO: add criteria for automatically determining whether to use
        " noplugin profile
        if has('nvim')
            let $CFG_PROFILE = 'complete'
        else
            let $CFG_PROFILE = 'portable'
        endif
    endif
endif


" provide a helpful function for determining if the configuration profile is a
" certain query
function! CfgProfileIs(query)
    return $CFG_PROFILE ==? a:query
endfunction


if filereadable(g:cfg_vimcfg_local_before)
    exec 'source ' . g:cfg_vimcfg_local_before
endif

exec 'source ' . g:cfg_vimcfg_dir.'/vimrc.behavior.vim'
exec 'source ' . g:cfg_vimcfg_dir.'/vimrc.plugins.vim'
exec 'source ' . g:cfg_vimcfg_dir.'/vimrc.aesthetic.vim'
exec 'source ' . g:cfg_vimcfg_dir.'/vimrc.keymap.vim'
exec 'source ' . g:cfg_vimcfg_dir.'/vimrc.autocmds.vim'

exec 'source ' . g:cfg_vimcfg_dir.'/vimrc.pluginbehavior.vim'

if filereadable(g:cfg_vimcfg_local_after)
    exec 'source ' . g:cfg_vimcfg_local_after
endif
