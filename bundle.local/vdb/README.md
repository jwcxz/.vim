vdb syntax
==========

JWC :: jwcxz.com


This is a simple set of highlighting rules for files consisting of `key:value`
pairs, plus some highlighting for indentation.

Format looks like this:

    first level
        second level
            third level
                keytype1: value
                keytype2# value

Note that two different symbols are defined: `:` and `#`.  It's easy enough to
add some more.  I use this to define information that I care about and don't
care about.  This usually goes nicely with `fdm=indent`.


![screenshot](https://raw.github.com/jwcxz/.vim/master/bundle.local/vdb/vdb.png)
