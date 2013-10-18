" Vim syntax file
" Language:     VDB (simple text database)
" Maintainer:   Joe Colosimo (jwcxz.com)
" Last Change:  
" Vim URL:  http://www.vim.org/lang.html

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

setlocal iskeyword=a-z,A-Z,48-57,.,_
setlocal isident=a-z,A-Z,48-57,.,_
syn case ignore

syn match   vdbH1       "^\([^: ]\)\([^:]*\)$"
syn match   vdbH2       "^\(\s\{4\}\)\([^: ]\)\([^:]*\)$"
syn match   vdbH3       "^\(\s\{8,\}\)\([^: ]\)\([^:]*\)$"

syn match   vdbKey1     "^\([^:#]\+\):\s\?" nextgroup=vdbVal1
syn region  vdbVal1     start="."  end="$"  contained

syn match   vdbKey2     "^\([^:#]\+\)#\s\?" nextgroup=vdbVal2
syn region  vdbVal2     start="."  end="$"  contained


hi def link vdbH1       Special
hi def link vdbH2       PreProc
hi def link vdbH3       Type

hi def link vdbKey1     Function
hi def link vdbVal1     String

hi def link vdbKey2     Comment
hi def link vdbVal2     Comment


let b:current_syntax = "vdb"
" vim: ts=4 sw=4 :

