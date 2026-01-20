" Vim syntax file
" Language:     PSM (Picoblaze Assembly)
" Maintainer:   Joe Colosimo (jwcxz.com)
" Last Change:  
" Vim URL:  http://www.vim.org/lang.html
" based on the MCS51A assembly syntax file

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

setlocal iskeyword=a-z,A-Z,48-57,.,_
setlocal isident=a-z,A-Z,48-57,.,_
syn case ignore

syn keyword psmFxTdo    contained TODO FIXME
syn keyword psmRegst    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 sA sB sC sD sE sF

syn keyword psmInstr    LOAD AND OR XOR TEST TESTCY ADD ADDCY SUB SUBCY COMPARE COMPARECY
syn keyword psmInstr    SL0 SL1 SLX SLA RL SR0 SR1 SRX SRA RR
syn match   psmInstr    "JUMP@\?\( N\?\(C\|Z\)\)\?"
syn match   psmInstr    "CALL@\?\( N\?\(C\|Z\)\)\?"
syn match   psmInstr    "RETURN\( N\?\(C\|Z\)\)\?"
syn keyword psmInstr    STORE FETCH
syn keyword psmInstr    OUTPUT INPUT
syn keyword psmInstr    REGBANK STAR
syn match   psmInstr    "\(ENABLE\|DISABLE\) INTERRUPT"
syn match   psmInstr    "RETURNI \(ENABLE\|DISABLE\)"
syn keyword psmInstr    OUTPUTK LOAD&RETURN

syn keyword psmDirec    CONSTANT INCLUDE STRING ADDRESS INST TABLE

syn match   psmNumbr    "[01]\{0,12\}\'b"
syn match   psmNumbr    "\W\x\{1,5\}\('d\|\W\|$\)"

syn region  psmCommt    start=";"   end="$"     contains=psmFxTdo
syn region  psmStrng    start="\""  end="\"\|$"
syn match   psmStrng    "\w\+\$"
syn region  psmTable    start="\["   end="\]"
syn match   psmTable    "\w\+\#"
syn match   psmLabel    "^[^$]\s*[^; \t]\+:"

syn match	psmOprtr    "\~"
syn match	psmOprtr    "'\(upper\|lower\)"

hi def link psmOprtr    operator
hi def link psmFxTdo    todo
hi def link psmRegst    type
hi def link psmInstr    keyword
hi def link psmDirec    preproc
hi def link psmNumbr    number
hi def link psmCommt    comment
hi def link psmStrng    string
hi def link psmTable    special
hi def link psmLabel    identifier

let b:current_syntax = "psm"
" vim: ts=4 sw=4 :
