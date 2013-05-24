" Vim syntax file
" Language:     cci (chanem-computer interface)
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

syn keyword cciFixmeTodo contained TODO FIXME
syn region  cciComment   start=";" end="$" contains=cciFxTdo
syn keyword cciDevice    clkt cpld dac0 dac1 adc0 adc1
syn keyword cciAction    fmcw fmcr fmcv out outk in
syn match   cciNumber    "\W\?\x\{1,2\}\('d\|\W\|$\)"

hi def link cciFixmeTodo todo
hi def link cciComment   comment
hi def link cciAction    function
hi def link cciDevice    keyword
hi def link cciNumber    number

let b:current_syntax = "cci"
" vim: ts=4 sw=4 :
