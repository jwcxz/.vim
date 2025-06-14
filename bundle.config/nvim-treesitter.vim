lua << EOF
local ok, _ = pcall(require, 'nvim-treesitter')
if ok then
    require'nvim-treesitter.configs'.setup {
        ensure_installed = { "c", "cpp", "gitignore", "latex", "lua", "make",
            "markdown", "markdown_inline", "python", "vim", "yaml" },
        sync_install = false,
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = { "markdown" },
        },
        indent = {
            enable = true,
            disable = { "markdown", "yaml", "python" },
        }
    }
end
EOF

set foldmethod=expr
set foldexpr=v:lua.vim.treesitter.foldexpr()
