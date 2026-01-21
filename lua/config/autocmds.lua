-- go to previous window on closing the current one
vim.api.nvim_create_autocmd("WinClosed", {
    callback = function(event)
        -- Check if the closed window was the current window
        if vim.api.nvim_get_current_win() == event.amatch then
            vim.cmd("wincmd p")
        end
    end
})
