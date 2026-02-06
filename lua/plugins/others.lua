-- TODO categorize these
return {

    { 'vim-scripts/a.vim' },

    { 'duane9/nvim-rg' },

    { 'chrisbra/matchit' },

    { 'chrisbra/Recover.vim' },

    { 'skywind3000/asyncrun.vim' },

    { 'tpope/vim-surround' },

    { 'tpope/vim-fugitive' },

    { 'tmhedberg/SimpylFold' },

    {
        'lewis6991/gitsigns.nvim',
        lazy = false,
        opts = {
            signcolumn = false,
            numhl = true,
            --sign_priority = 15, -- higher than diagnostic,todo signs. lower than dapui breakpoint sign
            on_attach = function(buffer)
                local gs = package.loaded.gitsigns
                vim.keymap.set({ 'n', 'v' },
                    '<leader>gl', gs.toggle_linehl,
                    { buffer = buffer, silent = true, desc = "Toggle Gitsigns line highlight" })
                end
        },
    }

}
