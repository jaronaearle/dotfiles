local M = {}

local function ignore_excluded_filetype()
  local exclude_list = { "oil", "noice", "telescope" }
  for _, excluded_file_type in ipairs(exclude_list) do
    if vim.bo.filetype == excluded_file_type then
      return true
    end
  end
  return false
end

function M.cowboy()
  ---@type table?
  local id
  local ok = true
  for _, key in ipairs({ "h", "j", "k", "l", "+", "-" }) do
    local count = 0
    local timer = assert(vim.loop.new_timer())
    local map = key
    vim.keymap.set("n", key, function()
      if vim.v.count > 0 then
        count = 0
      end
      local fuck = ignore_excluded_filetype()
      if count >= 10 and not fuck then
        ok, id =
          pcall(vim.notify, "Whoa there, Cowboy!" .. " (filetype: " .. vim.bo.filetype .. ")", vim.log.levels.WARN, {
            icon = "🤠",
            replace = id,
            keep = function()
              return count >= 10
            end,
          })
        if not ok then
          id = nil
          return map
        end
      else
        count = count + 1
        timer:start(1500, 0, function()
          count = 0
        end)
        return map
      end
    end, { expr = true, silent = true })
  end
end

return M
