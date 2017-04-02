" airline / tmuxline {{{
let g:airline_theme = 'murmur'
let g:airline_left_sep = '»'
let g:airline_right_sep = '«'

let g:tmuxline_theme = 'airline'
let g:tmuxline_preset = 'tmux'
let g:tmuxline_powerline_separators = 0

if !has('vim_starting')
    AirlineRefresh
endif
" }}}


" incsearch {{{
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1
" }}}


" easymotion {{{
map ,        <Plug>(easymotion-prefix)
map <Space>  <Plug>(easymotion-prefix)

map <Space>f <Plug>(easymotion-f2)
map <Space>s <Plug>(easymotion-s2)
map <Space>t <Plug>(easymotion-t2)

nmap <Space>; <Plug>(easymotion-next)
nmap <Space>, <Plug>(easymotion-prev)

nmap <Tab>    <Plug>(easymotion-next)
nmap <S-Tab>  <Plug>(easymotion-prev)
" }}}


" buffer managers {{{
if g:bufmanager ==? 'fzf'

    nnoremap <silent> ;; :Buffers<CR>
    nnoremap <silent> ;t :Tags<CR>
    nnoremap <silent> ;f :Files<CR>
    nnoremap <silent> ;R :Files<CR>
    nnoremap <silent> ;r :Files<CR>

elseif g:bufmanager ==? 'denite'

    nnoremap <silent> ;; :Denite buffer<CR>
    nnoremap <silent> ;f :Denite file_rec<CR>
    nnoremap <silent> ;R :Denite file_rec<CR>
    nnoremap <silent> ;r :Denite file_rec<CR>

    call denite#custom#option('_', 'auto_resize', 'true')
    call denite#custom#option('_', 'direction', 'botright')
    call denite#custom#option('_', 'reversed', 'true')
    call denite#custom#option('_', 'highlight_matched_char',  'Underlined')
    call denite#custom#option('_', 'highlight_matched_range', 'Normal')
    call denite#custom#option('_', 'highlight_mode_normal', 'CursorLine')
    call denite#custom#option('_', 'highlight_mode_insert', 'CursorLine')

    call denite#custom#map('insert', "<C-n>",  '<denite:move_to_next_line>',     'noremap')
    call denite#custom#map('normal', "<C-n>",  '<denite:move_to_next_line>',     'noremap')
    call denite#custom#map('insert', "<C-p>",  '<denite:move_to_previous_line>', 'noremap')
    call denite#custom#map('normal', "<C-p>",  '<denite:move_to_previous_line>', 'noremap')

    call denite#custom#map('insert', "<C-n>",  '<denite:move_to_next_line>',     'noremap')
    call denite#custom#map('normal', "<C-n>",  '<denite:move_to_next_line>',     'noremap')
    call denite#custom#map('insert', "<C-p>",  '<denite:move_to_previous_line>', 'noremap')
    call denite#custom#map('normal', "<C-p>",  '<denite:move_to_previous_line>', 'noremap')

    call denite#custom#map('insert', "<Up>",   '<denite:move_to_previous_line>', 'noremap')
    call denite#custom#map('normal', "<Up>",   '<denite:move_to_previous_line>', 'noremap')
    call denite#custom#map('insert', "<Down>", '<denite:move_to_next_line>',     'noremap')
    call denite#custom#map('normal', "<Down>", '<denite:move_to_next_line>',     'noremap')

elseif g:bufmanager ==? 'unite'

    call unite#filters#matcher_default#use(['matcher_fuzzy'])

    autocmd FileType unite call s:unite_custom_settings()
    function! s:unite_custom_settings()
        nmap <buffer> <ESC> <Plug>(unite_all_exit)
        nmap <buffer> ;c    <Plug>(unite_all_exit)
        nmap <buffer> '     <Plug>(unite_quick_match_default_action)

        imap <buffer> <TAB> <Plug>(unite_select_next_line)
        imap <buffer> '     <Plug>(unite_quick_match_default_action)
        imap <buffer> <C-o> <ESC><Plug>(unite_all_exit)
        imap <buffer> ;     <Esc><Plug>(unite_all_exit)
        imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
        imap <buffer> <C-l> <Plug>(unite_redraw)
    endfunction

    nnoremap <silent> ;; :<C-u>Unite -direction=dynamicbottom -start-insert buffer<CR>
    nnoremap <silent> ;t :<C-u>Unite -direction=dynamicbottom -start-insert tag<CR>
    nnoremap <silent> ;f :<C-u>Unite -direction=dynamicbottom -start-insert file<CR>
    nnoremap <silent> ;R :<C-u>Unite -direction=dynamicbottom -start-insert file_rec<CR>
    nnoremap <silent> ;r :<C-u>Unite -direction=dynamicbottom -start-insert file_rec/async<CR>

endif
" }}}


" NERDTree {{{
nnoremap <F10> :NERDTreeToggle<CR>
nnoremap ;aF   :NERDTreeFind<CR>
" }}}


" taglist {{{
nnoremap <silent> <F9> :<C-u>Tlist<CR>
nnoremap <silent> ;aT  :<C-u>TlistOpen<CR>
" }}}


" vim: fdm=marker
