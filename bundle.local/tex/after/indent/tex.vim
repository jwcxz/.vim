" These overrides insert a few tweaks to alter the behavior of the runtime's
" handling of itemize and enumerate environments.  The end result looks like
" this:
"
"   \begin{itemize}
"
"       \item   Line 1
"               Line 2
"
"       \item   Line 1
"               \begin{itemize}
"
"                   \item   Line 1
"                           Line 2
"
"               \end{itemize}
"
"   \end{itemize}


" TODO: replace with a proper formatexpr that correctly formats item
" blocks fully
setlocal fo+=2
abbreviate <buffer> \item \item<Space><Space>

setlocal indentexpr=GetTeXIndent2()


" the rest is a copy of the runtime's tex.vim, with HACKs inserted as
" commented

" create new GetTeXIndent function with something that implements itemize and
" enumerate environments with a cleaner format
function! GetTeXIndent2() " {{{
    " Find a non-blank line above the current line.
    let lnum = prevnonblank(v:lnum - 1)
    let cnum = v:lnum

    " Comment line is not what we need.
    while lnum != 0 && getline(lnum) =~ '^\s*%'
        let lnum = prevnonblank(lnum - 1)
    endwhile

    " At the start of the file use zero indent.
    if lnum == 0
        return 0
    endif

    let line = substitute(getline(lnum), '\s*%.*', '','g')     " last line
    let cline = substitute(getline(v:lnum), '\s*%.*', '', 'g') " current line

    let ccol = 1
    while cline[ccol] =~ '\s'
        let ccol += 1
    endwhile

    "  We are in verbatim, so do what our user what.
    if synIDattr(synID(v:lnum, ccol, 1), "name") == "texZone"
        if empty(cline)
            return indent(lnum)
        else
            return indent(v:lnum)
        endif
    endif

    if lnum == 0
        return 0
    endif

    let ind = indent(lnum)
    let stay = 1

    " New code for comment: retain the indent of current line
    if cline =~ '^\s*%'
        return indent(v:lnum)
    endif

    " Add a 'shiftwidth' after beginning of environments.
    " Don't add it for \begin{document} and \begin{verbatim}
    " if line =~ '^\s*\\begin{\(.*\)}'  && line !~ 'verbatim'
    " LH modification : \begin does not always start a line
    " ZYC modification : \end after \begin won't cause wrong indent anymore
    if line =~ '\\begin{.*}' 
        if line !~ g:tex_noindent_env
            let ind = ind + shiftwidth()
            let stay = 0
        endif

        if g:tex_indent_items
            " Add another sw for item-environments
            if line =~ g:tex_itemize_env
                " HACK: 2*shiftwidth()
                let ind = ind + 2*shiftwidth()
                let stay = 0
            endif
        endif
    endif

    if cline =~ '\\end{.*}'
        let retn = s:GetEndIndentation(v:lnum)
        if retn != -1
            return retn
        endif
    end
    " Subtract a 'shiftwidth' when an environment ends
    if cline =~ '\\end{.*}'
                \ && cline !~ g:tex_noindent_env
                \ && cline !~ '\\begin{.*}.*\\end{.*}'
        if g:tex_indent_items
            " Remove another sw for item-environments
            if cline =~ g:tex_itemize_env
                " HACK: 2*shiftwidth()
                let ind = ind - 2*shiftwidth()
                let stay = 0
            endif
        endif

        let ind = ind - shiftwidth()
        let stay = 0
    endif

    if g:tex_indent_brace
        if line =~ '[[{]$'
            let ind += shiftwidth()
            let stay = 0
        endif

        if cline =~ '^\s*\\\?[\]}]' && s:CheckPairedIsLastCharacter(v:lnum, ccol)
            let ind -= shiftwidth()
            let stay = 0
        endif

        if line !~ '^\s*\\\?[\]}]'
            for i in range(1, strlen(line)-1)
                let char = line[i]
                if char == ']' || char == '}'
                    if s:CheckPairedIsLastCharacter(lnum, i)
                        let ind -= shiftwidth()
                        let stay = 0
                    endif
                endif
            endfor
        endif
    endif

    " Special treatment for 'item'
    " ----------------------------

    if g:tex_indent_items
        " '\item' or '\bibitem' itself:
        if cline =~ g:tex_items
            " HACK: 2*shiftwidth()
            let ind = ind - 2*shiftwidth()
            let stay = 0
        endif
        " lines following to '\item' are indented once again:
        if line =~ g:tex_items
            " HACK: 2*shiftwidth()
            let ind = ind + 2*shiftwidth()
            let stay = 0
        endif
    endif

    if stay && mode() == 'i'
        " If there is no obvious indentation hint, and indentation is triggered
        " in insert mode, we trust our user.
        if empty(cline)
            return ind
        else
            return max([indent(v:lnum), s:GetLastBeginIndentation(v:lnum)])
        endif
    else
        return ind
    endif
endfunction "}}}

function! s:GetLastBeginIndentation(lnum) " {{{
    let matchend = 1
    for lnum in range(a:lnum-1, max([a:lnum - g:tex_max_scan_line, 1]), -1)
        let line = getline(lnum)
        if line =~ '\\end{.*}'
            let matchend += 1
        endif
        if line =~ '\\begin{.*}'
            let matchend -= 1
        endif
        if matchend == 0
            if line =~ g:tex_noindent_env
                return indent(lnum)
            endif
            if line =~ g:tex_itemize_env
                return indent(lnum) + 2 * shiftwidth()
            endif
            return indent(lnum) + shiftwidth()
        endif
    endfor
    return -1
endfunction

function! s:GetEndIndentation(lnum) " {{{
    if getline(a:lnum) =~ '\\begin{.*}.*\\end{.*}'
        return -1
    endif

    let min_indent = 100
    let matchend = 1
    for lnum in range(a:lnum-1, max([a:lnum-g:tex_max_scan_line, 1]), -1)
        let line = getline(lnum)
        if line =~ '\\end{.*}'
            let matchend += 1
        endif
        if line =~ '\\begin{.*}'
            let matchend -= 1
        endif
        if matchend == 0
            return indent(lnum)
        endif
        if !empty(line)
            let min_indent = min([min_indent, indent(lnum)])
        endif
    endfor
    return min_indent - shiftwidth()
endfunction

" Most of the code is from matchparen.vim
function! s:CheckPairedIsLastCharacter(lnum, col) "{{{
    let c_lnum = a:lnum
    let c_col = a:col+1

    let line = getline(c_lnum)
    if line[c_col-1] == '\'
        let c_col = c_col + 1
    endif
    let c = line[c_col-1]

    let plist = split(&matchpairs, '.\zs[:,]')
    let i = index(plist, c)
    if i < 0
        return 0
    endif

    " Figure out the arguments for searchpairpos().
    if i % 2 == 0
        let s_flags = 'nW'
        let c2 = plist[i + 1]
    else
        let s_flags = 'nbW'
        let c2 = c
        let c = plist[i - 1]
    endif
    if c == '['
        let c = '\['
        let c2 = '\]'
    endif

    " Find the match.  When it was just before the cursor move it there for a
    " moment.
    let save_cursor = winsaveview()
    call cursor(c_lnum, c_col)

    " When not in a string or comment ignore matches inside them.
    " We match "escape" for special items, such as lispEscapeSpecial.
    let s_skip ='synIDattr(synID(line("."), col("."), 0), "name") ' .
                \ '=~?  "string\\|character\\|singlequote\\|escape\\|comment"'
    execute 'if' s_skip '| let s_skip = 0 | endif'

    let stopline = max([0, c_lnum - g:tex_max_scan_line])

    " Limit the search time to 300 msec to avoid a hang on very long lines.
    " This fails when a timeout is not supported.
    try
        let [m_lnum, m_col] = searchpairpos(c, '', c2, s_flags, s_skip, stopline, 100)
    catch /E118/
    endtry

    call winrestview(save_cursor)

    if m_lnum > 0
        let line = getline(m_lnum)
        return strlen(line) == m_col
    endif

    return 0
endfunction "}}}
