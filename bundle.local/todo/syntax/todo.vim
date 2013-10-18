" Vim syntax file
" Language:     TODO [ for the third time ]
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


syn match   todoNotDone "\[ \].*$"      contains=todoDTP
syn match   todoHlfDone "\[\/\].*$"     contains=todoDTP
syn match   todoTotDone "\[x\].*$"      contains=todoDTP
syn match   todoMoved   "\[>\].*$"      contains=todoDTP

syn match   todoNote    "->.*$"

syn match   todoSection ".*{{{.*"
syn match   todoSection ".*}}}.*"


syn match   todoDTP     "\(\d\{1,2\}\/\d\{1,2\}\(\/\d\{2}\)\?\)\( \d\{4\}\)\?\( (\([^()]\+\))\)\?:"  contains=todoTime,todoPlace
syn match   todoTime    "\d\{4\}"
syn match   todoPlace   "(\([^()]\+\))"



hi def link todoNotDone Error
hi def link todoHlfDone Todo
hi def link todoTotDone Identifier
hi def link todoMoved   Comment

hi def link todoNote    Statement

hi def link todoSection Keyword

hi def link todoDTP     Statement
hi def link todoTime    Preproc
hi def link todoPlace   Constant


noremap <Leader>n  :s/\[.\]/\[ \]/<CR>:nohl<CR>
noremap <Leader>h  :s/\[.\]/\[\/\]/<CR>:nohl<CR>
noremap <Leader>/  :s/\[.\]/\[\/\]/<CR>:nohl<CR>
noremap <Leader>d  :s/\[.\]/\[x\]/<CR>:nohl<CR>
noremap <Leader>m  :s/\[.\]/\[>\]/<CR>:nohl<CR>


set fdm=marker


let b:current_syntax = "todo"
" vim: ts=4 sw=4 :
