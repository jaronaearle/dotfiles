local highlight = {
  "IblIndent1",
  "IblIndent2",
  "IblIndent3",
}

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
