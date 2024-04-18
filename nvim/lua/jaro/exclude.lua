local M = {}

---@param exclude_list table
---@return boolean
function M.exclude_ft(exclude_list)
  local exclude = false

  for _, v in ipairs(exclude_list) do
    if vim.bo.filetype == v then
      vim.notify("true", vim.log.levels.INFO)
      exclude = true
      break
    end
  end
  return exclude
end

return M
