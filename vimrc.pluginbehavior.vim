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


" vim: fdm=marker
