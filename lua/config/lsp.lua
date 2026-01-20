enabled_lsp_servers = {
    'vimls',        -- npm install -g vim-language-server
    'basedpyright', -- uv tool install basedpyright or brew install basedpyright
    'jsonls',       -- npm install -g vscode-langservers-extracted
    'clangd',
    'texlab',       -- brew install texlab
    'ts_ls',        -- npm install -g typescript-language-server typescript
}

for _, srv in ipairs(enabled_lsp_servers) do
    vim.lsp.enable(srv)
end


-- styled after https://github.com/josean-dev/dev-environment-files/blob/main/.config/nvim/lua/josean/lsp.lua
-- https://www.youtube.com/watch?v=oBiBEx7L000 is an incredibly helpful video

local lspattach_cfg = vim.api.nvim_create_augroup("LspAttachConfig", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
    group = lspattach_cfg,
    callback = function(event)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(event.buf, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings
        local opts = { noremap = true, buffer = event.buf, silent = true }

        opts.desc = "Show definition"
        --vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gd', "<cmd>Telescope lsp_definitions<cr>", opts)

        opts.desc = "Show declaration"
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)

        opts.desc = "Show implementations"
        --vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'gi', "<cmd>Telescope lsp_implementations<cr>", opts)

        opts.desc = "Show type definitions"
        --vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', 'gy', "<cmd>Telescope lsp_type_definitions<cr>", opts)

        opts.desc = "Show references"
        --vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'gr', "<cmd>Telescope lsp_references<cr>", opts)

        opts.desc = "Show hover info"
        vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, opts)

        opts.desc = "Show signature"
        vim.keymap.set({'n','i','v'}, '<C-k>', vim.lsp.buf.signature_help, opts)

        opts.desc = "Show line diagnostics"
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

        opts.desc = "Go to previous diagnostic"
        vim.keymap.set("n", "[d", function()
            vim.diagnostic.jump({ count = -1, float = true })
        end, opts)

        opts.desc = "Go to next diagnostic"
        vim.keymap.set("n", "]d", function()
            vim.diagnostic.jump({ count = 1, float = true })
        end, opts)


        --lsp_signature.on_attach(lsp_signature_config, event.buf)
    end
})


local severity = vim.diagnostic.severity

vim.diagnostic.config({
  signs = {
    text = {
      [severity.ERROR] = "",
      [severity.WARN]  = "",
      [severity.HINT]  = "󰠠",
      [severity.INFO]  = "",
    },
  },
})
