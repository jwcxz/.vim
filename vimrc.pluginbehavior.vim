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
let g:cfg_bundle_config_local_dir = g:cfg_vimcfg_local_dir.'/bundle.config'

for bundle in keys(g:plugs)
    if has_key(g:plugs[bundle], 'on') && (len(g:plugs[bundle]['on']) == 0)
        continue
    endif

    let bcfg_local = g:cfg_bundle_config_local_dir.'/'.bundle.'.vim'
    let bcfg = g:cfg_bundle_config_dir.'/'.bundle.'.vim'

    if filereadable(bcfg_local)
        exec 'source ' . bcfg_local
    elseif filereadable(bcfg)
        exec 'source ' . bcfg
    endif
endfor
