let g:lightline = {
            \ 'colorscheme': 'materia',
            \ 'enable': {
                \ 'statusline': 1,
                \ 'tabline': 0
                \ },
            \ 'active': {
                \ 'left': [
                    \ [ 'mode', 'paste' ],
                    \ [ 'modified', 'relativepath', 'readonly' ] ],
                \ 'right': [
                    \ [ 'lineinfo' ],
                    \ [ 'percent' ]
                    \ ]
                \ },
            \ 'separator': {
                \ 'left': '',
                \ 'right': ''
                \ },
            \ 'subseparator': {
                \ 'left': '',
                \ 'right': ''
                \ },
            \ }
