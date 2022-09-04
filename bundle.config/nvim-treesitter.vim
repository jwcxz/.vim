lua << EOF
local ok, _ = pcall(require, 'nvim-treesitter')
if ok then
    require'nvim-treesitter.configs'.setup {
        ensure_installed = { "c", "cpp", "gitignore", "latex", "lua", "make",
            "markdown", "python", "vim", "yaml" },
        sync_install = false,
        auto_install = true,
        highlight = {
            enable = true,
        }
    }
end
EOF
