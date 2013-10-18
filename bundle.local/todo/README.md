todo syntax
===========

JWC :: jwcxz.com


This is the third time I've written a syntax file for handling todo lists.

Format is:

    {{{ section
        [ ] undone thing
        [/] partially done thing
        [x] done thing
        [>] moved thing

        [ ] 01/01: dated thing
        [ ] 01/01/13: also a dated thing
        [/] 01/01 1200: dated and timed thing
        [x] 01/01 1200 (place): dated, timed, and located thing
    }}}


Keybindings are:

    <Leader>d   mark done
    <Leader>h   mark partially done
    <Leader>/   mark partially done
    <Leader>n   mark not done
    <Leader>m   mark moved
