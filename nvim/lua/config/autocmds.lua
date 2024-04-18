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

-- show start up when all buffers are closed

local startup_on_empty = createAuGroup("startup_on_empty", { clear = true })

createAutoCmd("User", {
  -- pattern = "BDeletePost*",
  pattern = "*",
  group = startup_on_empty,
  callback = function(event)
    local fallback_name = vim.api.nvim_buf_get_name(event.buf)
    local fallback_ft = vim.api.nvim_buf_get_option(event.buf, "filetype")
    local fallback_on_empty = fallback_name == "" and fallback_ft == ""
    -- print("FAAAAALLLL BAACKKKKK   ")
    -- print(fallback_on_empty)
    -- print(event)

    if fallback_on_empty then
      vim.cmd("Dashboard")
      vim.cmd(event.buf .. "bwipeout")
    end
  end,
})
