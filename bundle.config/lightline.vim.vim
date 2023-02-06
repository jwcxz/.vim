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

" the `complete` profile and `portable` profile have different requirements
" for specifying the colorscheme, as they load different versions of the
" catppuccin plugin
" TODO: clean this up by querying which plugin was installed directly
if CfgProfileIs('complete')
    let g:lightline['colorscheme'] = 'catppuccin'
else
    let g:lightline['colorscheme'] = 'catppuccin_mocha'
endif
