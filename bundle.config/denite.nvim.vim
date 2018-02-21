nnoremap <silent> ;; :Denite buffer<CR>
nnoremap <silent> ;f :Denite file_rec<CR>
nnoremap <silent> ;R :Denite file_rec<CR>
nnoremap <silent> ;r :Denite file_rec<CR>

call denite#custom#option('_', 'auto_resize', 'true')
call denite#custom#option('_', 'direction', 'botright')
call denite#custom#option('_', 'reversed', 'true')
call denite#custom#option('_', 'highlight_matched_char',  'Underlined')
call denite#custom#option('_', 'highlight_matched_range', 'Normal')
call denite#custom#option('_', 'highlight_mode_normal', 'CursorLine')
call denite#custom#option('_', 'highlight_mode_insert', 'CursorLine')

call denite#custom#map('insert', "<C-n>",  '<denite:move_to_next_line>',     'noremap')
call denite#custom#map('normal', "<C-n>",  '<denite:move_to_next_line>',     'noremap')
call denite#custom#map('insert', "<C-p>",  '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('normal', "<C-p>",  '<denite:move_to_previous_line>', 'noremap')

call denite#custom#map('insert', "<C-n>",  '<denite:move_to_next_line>',     'noremap')
call denite#custom#map('normal', "<C-n>",  '<denite:move_to_next_line>',     'noremap')
call denite#custom#map('insert', "<C-p>",  '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('normal', "<C-p>",  '<denite:move_to_previous_line>', 'noremap')

call denite#custom#map('insert', "<Up>",   '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('normal', "<Up>",   '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', "<Down>", '<denite:move_to_next_line>',     'noremap')
call denite#custom#map('normal', "<Down>", '<denite:move_to_next_line>',     'noremap')


function! s:denite_action_tree(context)
    execute 'NERDTreeFind' . a:context['targets'][0].action__path
endfunction

call denite#custom#action('file,directory', 'tree', function('s:denite_action_tree'))
nnoremap <silent> ;t :Denite -default-action=tree directory_rec<CR>
