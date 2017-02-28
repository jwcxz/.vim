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


" sneak {{{
nmap , <Plug>SneakNext
nmap _ <Plug>SneakPrevious
xmap , <Plug>VSneakNext
xmap _ <Plug>VSneakPrevious
nmap f <Plug>Sneak_s
nmap F <Plug>Sneak_S
xmap f <Plug>Sneak_s
xmap F <Plug>Sneak_S
omap f <Plug>Sneak_s
omap F <Plug>Sneak_S
" }}}


" incsearch {{{
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
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

    call denite#custom#option('default', 'highlight_matched_char', 'Search')
    call denite#custom#option('default', 'highlight_matched_range', 'Visual')

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
