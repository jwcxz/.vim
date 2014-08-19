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
    au Filetype tex noremap K :w<CR>:!pdflatex -halt-on-error %<CR>
augroup END


augroup ft_vim
    au!
    au Filetype vim setlocal foldmethod=marker
augroup END


" vim: fdm=marker
