let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1

map ,        <Plug>(easymotion-prefix)
map <Space>  <Plug>(easymotion-prefix)

map <Space>f <Plug>(easymotion-f2)
map <Space>s <Plug>(easymotion-s2)
map <Space>t <Plug>(easymotion-t2)

nmap <Space>; <Plug>(easymotion-next)
nmap <Space>, <Plug>(easymotion-prev)

nmap <Tab>    <Plug>(easymotion-next)
nmap <S-Tab>  <Plug>(easymotion-prev)


function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))


function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzy#converter()],
  \   'modules': [incsearch#config#easymotion#module()],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())
