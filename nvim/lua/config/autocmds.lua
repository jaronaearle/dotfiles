local api = vim.api
local cmd = vim.cmd

local createAutoCmd = function(event, opts)
  api.nvim_create_autocmd(event, opts)
end

local createAuGroup = function(group, opts)
  api.nvim_create_augroup(group, opts)
end

-- enable/disable cursorline on buf enter/leave
createAutoCmd("WinEnter", {
  pattern = "*",
  callback = function()
    cmd("setlocal cursorline")
  end,
})

createAutoCmd("WinLeave", {
  pattern = "*",
  callback = function()
    cmd("setlocal nocursorline")
  end,
})

-- show dashboard after closing last open buffer
createAutoCmd("BufDelete", {
  callback = function()
    local bufnr = api.nvim_get_current_buf()
    local name = api.nvim_buf_get_name(bufnr)
    if name == "" then
      cmd("Dashboard")
    end
  end,
})
