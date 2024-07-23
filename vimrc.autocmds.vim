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


augroup ft_markdown
    au!
    au Filetype markdown setlocal cinwords=
augroup END
