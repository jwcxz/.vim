" Vim syntax file
" Language:  jsim
" Webpage:   http://jwcxz.com/projects/vim/jsim
" Author:    Joe Colosimo <jwc aaattattatttattatt jwcxz duh duh duh dot com>
" Version:   20100225
" Copyright: Copyright (c) 2010 Joe Colosimo
" License:   This file and the entire vim-jsim package is distributed under
"            the MIT License

if exists("b:current_syntax")
	finish
endif

syn region jsimsubckt start=/^\s*\.g\?subckt/ end=".ends"	keepend nextgroup=jsimsubcktkw
syn region jsiminstnt start=/^\s*X\S\+/ end="$"				keepend nextgroup=jsiminstntkw

syn match jsimsubcktkw	/^\s*\.g\?subckt/	containedin=jsimsubckt nextgroup=jsimscID
syn match jsiminstntkw	/^\s*X\S\+/			containedin=jsiminstnt nextgroup=jsiminPort

syn match jsimscID		/\(^\s*\.g\?subckt\s\+\)\@<=\S\+/				containedin=jsimsubckt nextgroup=jsimscPort
syn match jsimscPort	/\(^\s*\.g\?subckt\s\+\(\S\+\s\+\)\+\)\@<=\S\+/	containedin=jsimsubckt nextgroup=jsimscPort

syn match jsiminPort	/\(^\s*X\S\+\s\+\(\S\+\s\+\)*\)\@<=\S\+/		containedin=jsiminstnt nextgroup=jsiminPort
" okay, this one is beyond absurd... it matches the last argument (skipping
" any end comments) in an instantiation.
syn match jsiminType	/\(^\s*X\S\+\s\+\(\S\+\s\+\)*\)\@<=\S\+\s*\(\(.*\(\/\/\|\*\).*\)\@<!$\|\(\/\/\|\*\)\)\@=/ containedin=jsiminstnt

syn match jsimconnect	/\.connect.*/
syn match jsiminclud	/\.include.*/
syn match jsimplot		/\.plot\(def\)\?.*/

syn region jsimcmntrgn start=/\/\*/ end=/\*\//
syn match jsimcmnt /\(\/\/\|\*\).*$/


hi def link jsimcmntrgn		Comment
hi def link jsimcmnt		Comment

hi def link jsiminstntkw	Type
hi def link jsimsubcktkw	Type

hi def link jsimscID		Keyword
hi def link jsiminType		Keyword
hi def link jsimscPort		Statement
hi def link jsiminPort		String

hi def link jsimplot		Constant
hi def link jsimconnect		String
hi def link jsiminclude		String

let b:current_syntax = "jsim"
