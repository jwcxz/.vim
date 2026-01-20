set isk=a-z,A-Z,48-57,_,.,-,>
set fdm=marker
if exists("+omnifunc")
    setlocal omnifunc=syntaxcomplete#Complete
endif
let g:vhdl_indent_genportmap=0
" for taglist
let g:tlist_vhdl_settings   = 'vhdl;d:package declarations;b:package bodies;e:entities;c:components;a:architecture specifications;t:type declarations;p:processes;f:functions;r:procedures;i:instantiations'
" shortcuts
imap <buffer> ,, <= 
imap <buffer> .. => 
" abbreviations
iabbr dt downto
iabbr sig signal
iabbr gen generate
iabbr ot others
iabbr sl std_logic
iabbr slv std_logic_vector
iabbr uns unsigned
iabbr toi to_integer
iabbr tos to_signed
iabbr tou to_unsigned
