return {
  "stevearc/oil.nvim",
  opts = function(_, opts)
    opts.view_options = {
      show_hidden = true,
      is_always_hidden = function(name, bufnr)
        return vim.startswith(name, ".DS")
      end,
    }
    opts.float = {
      max_width = 95,
      max_height = 50,
      padding = 2,
      override = function(conf)
        return conf
      end,
    }
  end,
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
