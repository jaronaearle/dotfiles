return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_by_name = {
            -- '.git',
            -- '.DS_Store',
            -- 'thumbs.db',
          },
          never_show = {},
        },
      },
    },
  },
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   opts = function(_, opts)
  --     local highlight = { 'CursorColumn", "WhiteSpace' }
  --     opts.indent = { highlight = highlight, char = "" }
  --     opts.whitespace = { highlight = highlight, remove_blankline_trail = false }
  --   end,
  -- },
}
