local createAutoCmd = function(event, p, cb)
    vim.api.nvim_create_autocmd(event, {pattern = p, callback = cb})
end

createAutoCmd(
    "WinEnter",
    "*",
    function()
        vim.cmd("setlocal cursorline")
    end
)

createAutoCmd(
    "WinLeave",
    "*",
    function()
        vim.cmd("setlocal nocursorline")
    end
)

-- vim.api.nvim_create_autocmd(
--     {"BufEnter", "CursorHold", "CursorHoldI", "FocusGained"},
--     {
--         command = "if mode() != 'c' | checktime | endif",
--         pattern = {"*"}
--     }
-- )
