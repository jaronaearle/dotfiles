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

-- show start up when all buffers are closed
local alpha_on_empty = vim.api.nvim_create_augroup("alpha_on_empty", {clear = true})
vim.api.nvim_create_autocmd(
    "User",
    {
        pattern = "BDeletePost*",
        group = alpha_on_empty,
        callback = function(event)
            local fallback_name = vim.api.nvim_buf_get_name(event.buf)
            local fallback_ft = vim.api.nvim_buf_get_option(event.buf, "filetype")
            local fallback_on_empty = fallback_name == "" and fallback_ft == ""

            if fallback_on_empty then
                vim.cmd("Alpha")
                vim.cmd(event.buf .. "bwipeout")
            end
        end
    }
)
