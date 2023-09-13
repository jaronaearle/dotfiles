local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
    "",
    " (                                                               ",
    " )\\ )                               (       (                    ",
    "(()/(                )         (    )\\ )    )\\              )    ",
    " /(_))   (    (     (      __  )\\  (()/(   ((_) (    (     (     ",
    "(_))_    )\\   )\\    )\\  ' / _|((_)  /(_))_  _   )\\   )\\    )\\  ' ",
    " |   \\  ((_) ((_) _((_))  > _|_ _| (_)) __|| | ((_) ((_) _((_))  ",
    " | |) |/ _ \\/ _ \\| '  \\() \\_____|    | (_ || |/ _ \\/ _ \\| '  \\() ",
    " |___/ \\___/\\___/|_|_|_|              \\___||_|\\___/\\___/|_|_|_|  "
}

alpha.setup(dashboard.opts)

vim.cmd([[
  autocmd FileType alpha setlocal nofoldenable
]])
