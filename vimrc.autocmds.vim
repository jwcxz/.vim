augroup ft_python
    au!
    au Filetype python setlocal cms=#%s
    au Filetype python inoremap # X<C-h>#
augroup END


augroup ft_c_cpp
    au!
    au Filetype c,cpp setlocal grepprg=ag\ --cc
    " TODO: find a better way to do this
    if !CfgProfileIs('complete')
        au Filetype c,cpp setlocal foldmethod=syntax | FastFoldUpdate
    endif
augroup END


autocmd WinClosed * nested call s:HandleWinClosed(expand('<amatch>'))

function! s:HandleWinClosed(closed_win_id)
    if win_getid() != str2nr(a:closed_win_id)
        return
    endif
    wincmd p
endfunction
