let g:choosewin_overlay_enable = 0
let g:choosewin_blink_on_land = 0
let g:choosewin_label = 'ASDFJKLGHQWERUIOPZXCVBNM'
let g:choosewin_keymap = {
    \ 'x':     '<NOP>',
    \ 's':     '<NOP>',
    \ 'S':     '<NOP>',
    \ '`':      'swap',
    \ '~':      'swap_stay',
    \ '0':      'tab_first',
    \ '[':      'tab_prev',
    \ ']':      'tab_next',
    \ '$':      'tab_last',
    \ ';':      'win_land',
    \ '-':      'previous',
    \ "\<CR>":  'win_land',
    \ }

nmap - <Plug>(choosewin)
