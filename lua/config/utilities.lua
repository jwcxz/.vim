-- miscellaneous small utilities

-- TODO: convert to Lua

vim.cmd([[
function! QSearch()
    "let searchptn = substitute(substitute(@/, '^\\<', '', ''), '\\>$', '', '')
    let lastptn = @/
    Rg <cword>
    let @/ = lastptn
endfunction

nnoremap <silent> <Leader>* *:call QSearch()<CR>


nnoremap <silent> <Leader>] :exec("ltag ".expand("<cword>"))<CR>:lopen<CR><C-W>J
nnoremap <silent> <Leader>[ :exec("ptjump ".expand("<cword>"))<CR>


function! SetKCmd(cmd)
    exec 'noremap <silent> K :cope<CR><C-W>J<C-W>p:'.a:cmd.'<CR>'
endfunction

command! -nargs=+ -complete=command SetKCmd call SetKCmd(<q-args>)


function! SetRunCmd(cmd)
    call SetKCmd('AsyncRun '.a:cmd)
endfunction

command! -nargs=+ -complete=shellcmd SetRunCmd call SetRunCmd(<q-args>)
nnoremap gK :SetRunCmd 


function! ShowFullPath()
    echo expand('%:p')
endfunction

command! ShowFullPath call ShowFullPath()
nnoremap <Leader>f :ShowFullPath<CR>
]])
