let mapleader='\'
let maplocalleader='\\'

" sneak.vim mappings
let  g:sneak#nextprev_f = 0
let  g:sneak#use_ic_scs = 1
nmap F      <Plug>SneakBackward
nmap <ESC>f <Plug>SneakForward
nmap ,      <Plug>SneakNext
nmap _      <Plug>SneakPrevious
xmap ,      <Plug>VSneakNext
xmap _      <Plug>VSneakPrevious
silent! nunmap s
silent! nunmap S

" C-{hjkl} resize windows
map <silent> <C-h> <C-w><
map <silent> <C-j> <C-w>-
map <silent> <C-k> <C-w>+
map <silent> <C-l> <C-w>>

" C-{n,p} move between buffers
noremap <silent> <C-p> :bp<CR>
noremap <silent> <C-n> :bn<CR>

" ; is C-w, ;, is ,
"noremap <silent> ,  ;
"noremap <silent> ;, ,
noremap <silent> ;  <C-w>
noremap <silent> ;] <C-w><C-]>

" alt-{n,p} move between tabs, alt-t creates a new tab, alt-c closes one
noremap <silent> <Esc>n :tabnext<CR>
noremap <silent> <Esc>p :tabprev<CR>
noremap <silent> <Esc>t :tabnew<CR>
noremap <silent> <Esc>c :tabclose<CR>

" tt means :ta
noremap <silent> tt :ta 

" unite.vim
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

nnoremap <silent> ;; :<C-u>Unite -start-insert buffer<CR>
nnoremap <silent> ;t :<C-u>Unite -start-insert tag<CR>
nnoremap <silent> ;f :<C-u>Unite -start-insert file<CR>
nnoremap <silent> ;R :<C-u>Unite -start-insert file_rec<CR>
nnoremap <silent> ;r :<C-u>Unite -start-insert file_rec/async<CR>

" tree view
nnoremap <F10> :NERDTreeToggle<CR>
nnoremap ;aF   :NERDTreeFind<CR>

" taglist
nnoremap <silent> <F9> :Tlist<CR>
nnoremap <silent> ;aT  :TlistOpen

" Xorg paste escape codes
map  <ESC>[200~ :set paste<CR>a
map  <ESC>[201~ :set nopaste<CR>
imap <ESC>[200~ <C-o>:set paste<CR>
imap <ESC>[201~ <nop>
set  pastetoggle=<ESC>[201~

" neovim specifics
if has('nvim')
    tnoremap <C-a>      <C-\><C-n>
    tnoremap <C-a><C-a> <C-a>
endif


" vim: fdm=marker
