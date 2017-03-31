augroup ft_python
    au!
    au Filetype python setlocal foldmethod=syntax
    au Filetype python setlocal cms=#%s
    au Filetype python inoremap # X<C-h>#
augroup END


augroup ft_c_cpp
    au!
    au Filetype c,cpp setlocal grepprg=ag\ --cc
    au Filetype c,cpp setlocal foldmethod=syntax
augroup END


augroup ft_tex
    au!

    au Filetype tex setlocal isk+=\\

    " todo: replace with a proper formatexpr that correctly formats item
    " blocks fully
    au Filetype tex setlocal fo+=2
    au Filetype tex abbreviate \item \item<Space><Space>

    au Filetype tex setlocal spell
    au Filetype tex syn spell toplevel

    au Filetype tex set suffixesadd=.tex
augroup END


augroup ft_vim
    au!
    au Filetype vim setlocal foldmethod=marker
augroup END


" vim: fdm=marker
