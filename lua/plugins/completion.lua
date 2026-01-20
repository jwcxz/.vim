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
    -- vsnip    = "𝓢",
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


return {
    {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        dependencies = {
            { 'hrsh7th/cmp-buffer' },

            { 'hrsh7th/cmp-path' },

            { 'hrsh7th/cmp-cmdline' },

            -- {
            --     'hrsh7th/cmp-vsnip',
            --     dependencies = { 'hrsh7th/vim-vsnip' }
            -- },

            { 'quangnguyen30192/cmp-nvim-tags' }
        },
        config = function()
            local cmp = require('cmp')

            cmp.setup({
                -- snippet = {
                --     expand = function(args)
                --         vim.fn["vsnip#anonymous"](args.body)
                --     end,
                -- },

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
                        -- elseif vim.fn["vsnip#available"](1) == 1 then
                        --     feedkey("<Plug>(vsnip-expand-or-jump)", "")
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
                        end
                    end, { "i", "s" }),

                    ["<S-Tab>"] = cmp.mapping(function()
                        if cmp.visible() then
                            cmp.select_prev_item()
                        -- elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                        --     feedkey("<Plug>(vsnip-jump-prev)", "")
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
                        -- { name = 'render-markdown' },
                        -- { name = 'vsnip' },
                        { name = 'tags' },
                        { name = 'path' },
                    },
                    {
                        { name = 'buffer' },
                    })
            })
        end
    },
}
