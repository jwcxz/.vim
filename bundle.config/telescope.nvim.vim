lua << EOF
local ok, _ = pcall(require, 'telescope')
if ok then
    local trouble = require('trouble.sources.telescope')

    require('telescope').setup({
        defaults = {
            winblend = 15,
            wrap_results = true,
            sorting_strategy = "ascending",
            layout_strategy = "vertical",
            layout_config = {
                vertical = {
                    mirror = true,
                    prompt_position = "top",
                    },
                },
            mappings = {
                i = {
                    ["<C-u>"] = false,
                    ["<C-d>"] = false,
                    ["<C-y>"] = "preview_scrolling_up",
                    ["<C-e>"] = "preview_scrolling_down",

                    ["<C-j>"] = "move_selection_next",
                    ["<C-k>"] = "move_selection_previous",

                    ["<C-t>"] = trouble.open,
                },
                n = {
                    ["<C-t>"] = trouble.open,
                }
            }
        }
    })
end

require('telescope').load_extension('fzf')
EOF

nnoremap <space>r <cmd>Telescope find_files<cr>
nnoremap <space>f <cmd>Telescope find_files<cr>
nnoremap <space>g <cmd>Telescope live_grep<cr>
nnoremap <space><space> <cmd>Telescope buffers<cr>
nnoremap <space>t <cmd>Telescope tags<cr>
nnoremap <space>h <cmd>Telescope help_tags<cr>
nnoremap <space>c <cmd>Telescope command_history<cr>
nnoremap <space>p <cmd>Telescope builtin<cr>
nnoremap <space>s <cmd>Telescope treesitter<cr>
nnoremap <space>* <cmd>Telescope grep_string<cr>

" force of habit
nnoremap ;r <cmd>Telescope find_files<cr>
nnoremap ;f <cmd>Telescope find_files<cr>
nnoremap ;; <cmd>Telescope buffers<cr>
