" use <C-K> instead of <C-W> as the terminal window key
if has('nvim')
    tnoremap <C-K> <C-\>
else
    set termwinkey=<C-K>
endif


let $TERM='xterm-256color'
let $LANG='en_US.UTF-8'

let g:terminal_ansi_colors = [
            \ "#3e3e3e", "#f54a40", "#9de154", "#f6f361", "#66caf5", "#f777f5", "#31eea2", "#c5c5c5",
            \ "#161616", "#f8817c", "#c3ef93", "#f8f69f", "#9edcf8", "#faa6f8", "#9df6cd", "#dedede"
            \ ]


function! TermStart(cmd, opts)
    if has('nvim')
        return termopen(a:cmd, a:opts)
    else
        return term_start(a:cmd, a:opts)
    endif
endfunction


function! StartPopTerm()

    if exists('g:popterm_buf') && buflisted(g:popterm_buf)
        return
    endif

    let g:popterm_buf = TermStart($SHELL, {
                \ 'term_name': 'Pop-Up Terminal',
                \ 'term_finish': 'close',
                \ 'term_kill': 'kill',
                \ 'hidden': 1,
                \ })

    if g:popterm_buf == 0
        unlet g:popterm_buf
        return
    endif

    " go back to terminal-normal mode
    call feedkeys("\<C-K>N")

endfunction

function! TogglePopTerm(full)
    call StartPopTerm()

    if bufnr('%') == g:popterm_buf
        " current buffer is popterm

        let half_height = screenrow() / 2

        if a:full == 1 && winheight(0) <= half_height
            " requested fullscreen, but the current window height is <= half
            " the screen height, so switch to fullscreen mode
            wincmd J
            1000wincmd +
            call feedkeys("i")
        elseif a:full == 0 && winheight(0) > half_height
            " requested halfscreen, but the current window height is > half
            " the screen height, so switch to halfscreen mode
            wincmd J
            call feedkeys("i")
        else
            " otherwise, window height is the same as the requested height, so
            " close the window
            close!
            " go back to previously-selected window
            exec winnr('#').'wincmd w'
        endif
    else
        let existing_win = bufwinnr(g:popterm_buf)
        if existing_win != -1
            " popterm-containing window already exists, so select it and
            " adjust the height according to whether fullscreen mode was
            " requested
            exec existing_win.'wincmd w'
            if a:full == 1
                wincmd J
                1000wincmd +
            else
                wincmd J
            endif
        else
            " popterm-containing window doesn't exist, so open up a new window
            " with requested size
            if a:full == 1
                botright 1000split
            else
                botright split
            endif
            exec 'buffer '.g:popterm_buf
        endif

        " enter insert mode
        call feedkeys("i")
    endif
endfunction

" toggle popterm presence
noremap <silent> <C-\> :call TogglePopTerm(0)<CR>
tnoremap <silent> <C-\> <C-K>N:call TogglePopTerm(0)<CR>

" toggle popterm presence, but in full screen
noremap <silent> <C-Enter> :call TogglePopTerm(1)<CR>
tnoremap <silent> <C-Enter> <C-K>N:call TogglePopTerm(1)<CR>

" map <C-K><C-K> as an escape sequence
tnoremap <C-K><C-K> <C-K>N
