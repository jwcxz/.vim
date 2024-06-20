" For the sake of readability and simplicity (and for the time being), this
" configuration file breaks the general abstraction model by configuring
" plugins:
"   nvim-lspconfig, cmp-nvim (and its related plugins), vim-vsnip
"
" Required external dependencies:
"   npm install -g vim-language-server pyright vscode-langservers-extracted typescript typescript-language-server
"   clangd
"   cargo install texlab

lua << EOF
-- assumes require('cmp') and require('cmp_nvim_lsp') also succeed
local ok, _ = pcall(require, 'lspconfig')
if ok then
    -- --------------
    -- nvim-cmp setup
    -- --------------

    -- replacements for completion kind
    local kind_icons = {
        Text          = "TXT",
        Method        = "MTD",
        Function      =  "FN",
        Constructor   = "CON",
        Field         = "FLD",
        Variable      = "VAR",
        Class         = "CLS",
        Interface     = "IFC",
        Module        = "MOD",
        Property      = "PRP",
        Unit          = "UNT",
        Value         = "VAL",
        Enum          = "ENM",
        Keyword       = "KEY",
        Snippet       = "SNP",
        Color         = "COL",
        File          = "FLE",
        Reference     = "REF",
        Folder        = "FOL",
        EnumMember    = "MEM",
        Constant      = "CNS",
        Struct        = "STR",
        Event         = "EVT",
        Operator      =  "OP",
        TypeParameter = "TYP",
    }

    -- replacement for completion source
    local source_icons = {
        buffer   = "𝓑",
        nvim_lsp = "𝓛",
        vsnip    = "𝓢",
        path     = "𝓟",
        tags     = "𝓣",
        cmdline  = "𝓒",
    }

    -- tab helper functions: https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#super-tab-like-mapping
    local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    local feedkey = function(key, mode)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
    end

    local cmp = require('cmp')

    cmp.setup({
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end,
        },

        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },

        mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-l>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = false }),

            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif vim.fn["vsnip#available"](1) == 1 then
                    feedkey("<Plug>(vsnip-expand-or-jump)", "")
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
                end
            end, { "i", "s" }),

            ["<S-Tab>"] = cmp.mapping(function()
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                    feedkey("<Plug>(vsnip-jump-prev)", "")
                end
            end, { "i", "s" }),
        }),

        formatting = {
            format = function(entry, vim_item)
                -- set the result kind to an abbreviated representation if
                -- available, or the full name if not available
                local new_kind = ''

                if kind_icons[vim_item.kind] then
                    new_kind = kind_icons[vim_item.kind]
                else
                    new_kind = vim_item.kind
                end

                -- this only works for single-byte characters
                --  TODO: include spaces in mapping and then extract & count them here
                spacer = string.rep(' ', math.max(0, 3-string.len(new_kind)))
                vim_item.kind = string.format('%s⸦%s⸧', spacer, new_kind)

                -- include the result source (either as an abbreviated letter
                -- or the full name if not available)
                local new_source = ''
                if source_icons[entry.source.name] then
                    new_source = source_icons[entry.source.name]
                else
                    new_source = entry.source.name
                end

                vim_item.menu = new_source

                return vim_item
            end
        },

        sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'vsnip' },
                { name = 'tags' },
                { name = 'buffer' },
                { name = 'path' },
            })
    })

    -- TODO: disabled because it interferes with incsearch
    --cmp.setup.cmdline({ '/', '?' }, {
    --    mapping = cmp.mapping.preset.cmdline(),
    --    sources = {
    --    { name = 'buffer' }
    --    }
    --})

    -- TODO: disabled because it interferes with incsearch
    --cmp.setup.cmdline(':', {
    --    mapping = cmp.mapping.preset.cmdline(),
    --    sources = cmp.config.sources({
    --        { name = 'path' }
    --    }, {
    --        { name = 'cmdline' }
    --    })
    --})


    -- --------------------
    -- nvim-lspconfig setup
    -- --------------------

    local on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local bufopts = { noremap=true, silent=true, buffer=bufnr }
        --vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'gd', "<cmd>Trouble lsp_definitions<cr>", bufopts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        --vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
        vim.keymap.set('n', 'gi', "<cmd>Trouble lsp_implementations<cr>", bufopts)
        --vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set('n', 'gy', "<cmd>Trouble lsp_type_definitions<cr>", bufopts)
        --vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
        vim.keymap.set('n', 'gr', "<cmd>Trouble lsp_references<cr>", bufopts)
        vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, bufopts)
        --vim.keymap.set('n', '<M-k>', vim.lsp.buf.signature_help, bufopts)
        --vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
        --vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
        --vim.keymap.set('n', '<space>wl', function()
            --print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        --end, bufopts)
        --vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
        --vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
        --vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
    end

    local lspc = require('lspconfig')

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- configuration for requested LSP servers
    local lspcfg = {
        vimls = {},
        pyright = {},
        jsonls = {},
        clangd = {
            cmd = {
                "clangd", '--header-insertion=never'
            }
        },
        texlab = {},
        tsserver = {}
    }

    for srv, cfg in pairs(lspcfg) do
        local new_cfg = {}

        -- copy local overriding config if present
        --  (server must also be in lspcfg above)
        if vim.g.lspcfg_local and vim.g.lspcfg_local[srv] then
            for cfg_key, cfg_val in pairs(vim.g.lspcfg_local[srv]) do
                new_cfg[cfg_key] = vim.g.lspcfg_local[srv][cfg_key]
            end
        end

        -- copy keys from global config that wouldn't override local config
        for cfg_key, cfg_val in pairs(cfg) do
            if not new_cfg[cfg_key] then
                new_cfg[cfg_key] = cfg_val
            end
        end

        -- copy required parameters if not already configured
        if not new_cfg['capabilities'] then
            new_cfg['capabilities'] = capabilities
        end

        if not new_cfg['on_attach'] then
            new_cfg['on_attach'] = on_attach
        end

        -- set up language server
        lspc[srv].setup(new_cfg)
    end

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
    })
end
EOF

" vsnip configuration
imap <expr> <C-j> vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-j>'
smap <expr> <C-j> vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-j>'
imap <expr> <C-k> vsnip#available(1)  ? '<Plug>(vsnip-jump-prev)' : '<C-k>'
smap <expr> <C-k> vsnip#available(1)  ? '<Plug>(vsnip-jump-prev)' : '<C-k>'
