local cmd = vim.cmd
local hl = vim.api.nvim_set_hl
local hooks = require("ibl.hooks")

local highlight = {
  "IblIndent1",
  "IblIndent2",
  "IblIndent3",
}

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  hl(0, "IblIndent1", { bg = "#2F2736" })
  hl(0, "IblIndent2", { bg = "#352E3F" })
  hl(0, "IblIndent3", { bg = "#42374B" })
end)

return {
  "lukas-reineke/indent-blankline.nvim",
  opts = function(_, opts)
    opts.indent = { highlight = highlight, char = "" }
    opts.whitespace = {
      highlight = highlight,
      remove_blankline_trail = false,
    }
    opts.scope = { enabled = true, show_start = true, show_end = true, show_exact_scope = true }
  end,
}
