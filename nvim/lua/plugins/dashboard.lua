return {
  --   "nvimdev/dashboard-nvim",
  --   event = "VimEnter",
  --   opts = function(_, opts)
  --     local logo = [[
  --  (
  --  )\ )                               (       (
  -- (()/(                )         (    )\ )    )\              )
  --  /(_))   (    (     (      __  )\  (()/(   ((_) (    (     (
  -- (_))_    )\   )\    )\  ' / _|((_)  /(_))_  _   )\   )\    )\  '
  --  |   \  ((_) ((_) _((_))  > _|_ _| (_)) __|| | ((_) ((_) _((_))
  --  | |) |/ _ \/ _ \| '  \() \_____|    | (_ || |/ _ \/ _ \| '  \()
  --  |___/ \___/\___/|_|_|_|              \___||_|\___/\___/|_|_|_|
  --       ]]
  --     local day = "Its Fucking " .. os.date("%A")
  --     logo = string.rep("\n", 8) .. logo .. "\n\n" .. day .. "\n\n"
  --     opts.config.header = vim.split(logo, "\n")
  --   end,
}
