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
