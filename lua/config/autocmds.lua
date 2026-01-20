-- TODO: move this to an after plugin
local ft_python_cfg = vim.api.nvim_create_augroup('ft_python', { clear = true })
vim.api.nvim_create_autocmd('Filetype', {
    pattern = "python",
    group = ft_python_cfg,
    callback = function()
        vim.opt_local.cms = "#%s"
        vim.keymap.set('i', '#', '# X<C-h>#', { desc = 'Fix comments', silent = true, noremap = true } )
    end
})


-- go to previous window on closing the current one
vim.api.nvim_create_autocmd("WinClosed", {
    callback = function(event)
        -- Check if the closed window was the current window
        if vim.api.nvim_get_current_win() == event.amatch then
            vim.cmd("wincmd p")
        end
    end
})
