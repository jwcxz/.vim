let g:lightline = {
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

if has('nvim')
    let g:lightline['colorscheme'] = 'catppuccin'
else
    let g:lightline['colorscheme'] = 'catppuccin_mocha'
endif
