" enable spell checking to work around the fact that indented lists are
" erroneously considered to be code blocks

syn region markdownCodeBlock start="^\n\( \{4,}\|\t\)" end="^\ze \{,3}\S.*$" keepend contains=@Spell
