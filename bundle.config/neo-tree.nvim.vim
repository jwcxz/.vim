lua << EOF
local ok, _ = pcall(require, 'neo-tree')
if ok then
    require("neo-tree").setup({
        renderers = {
            directory = {
                { "indent" },
                --{ "icon" },
                { "current_filter" },
                {
                    "container",
                    content = {
                        { "name", zindex = 10 },
                        -- {
                            --   "symlink_target",
                            --   zindex = 10,
                            --   highlight = "NeoTreeSymbolicLinkTarget",
                            -- },
                        { "clipboard", zindex = 10 },
                        --{ "diagnostics", errors_only = true, zindex = 20, align = "right", hide_when_expanded = true },
                        --{ "git_status", zindex = 20, align = "right", hide_when_expanded = true },
                    },
                },
            },
            file = {
                { "indent" },
                --{ "icon" },
                {
                    "container",
                    content = {
                        {
                            "name",
                            zindex = 10
                        },
                        -- {
                            --   "symlink_target",
                            --   zindex = 10,
                            --   highlight = "NeoTreeSymbolicLinkTarget",
                            -- },
                        { "clipboard", zindex = 10 },
                        { "bufnr", zindex = 10 },
                        { "modified", zindex = 20, align = "right" },
                        --{ "diagnostics",  zindex = 20, align = "right" },
                        --{ "git_status", zindex = 20, align = "right" },
                    },
                },
            },
            message = {
                { "indent", with_markers = false },
                { "name", highlight = "NeoTreeMessage" },
            },
            terminal = {
                { "indent" },
                --{ "icon" },
                { "name" },
                { "bufnr" }
            }
        },
    })
end
EOF

nnoremap <F10> :Neotree toggle show<CR>
