local M = {}

local exclude_list = { "oil", "noice", "telescope" }

local function e_ft()
  for _, v in ipairs(exclude_list) do
    if vim.bo.filetype == v then
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
      local fuck = e_ft()
      if count >= 10 and not fuck then
        ok, id = pcall(vim.notify, "Whoa there, Cowboy!\nbtype: " .. vim.bo.filetype, vim.log.levels.WARN, {
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
