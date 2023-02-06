" for all loaded plugins, look for a correspondingly-named
" `bundle.config/PLUGIN.vim` and source it if it exists.  Lua code still needs
" to be protect with a `pcall()` test, as discussed in
" https://github.com/nanotee/nvim-lua-guide#modules

" TODO: eliminate the need to include manual checks in Lua code-blocks,
" potentially by sourcing Lua scripts directly

" if the noplugin profile is being used, stop sourcing now
if CfgProfileIs('noplugin')
    finish
endif

let g:cfg_bundle_config_dir = g:cfg_vimcfg_dir.'/bundle.config'

for bundle in keys(g:plugs)
    let bcfg = g:cfg_bundle_config_dir.'/'.bundle.'.vim'

    if !filereadable(bcfg)
        continue
    endif

    if has_key(g:plugs[bundle], 'on') && (len(g:plugs[bundle]['on']) == 0)
        continue
    endif

    exec 'source ' . bcfg
endfor
