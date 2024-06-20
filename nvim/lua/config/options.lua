local opt = vim.opt
local cmd = vim.cmd

opt.winbar = "%=%m %f"

opt.list = true
opt.listchars:append("space:⋅")
opt.listchars:append("eol:↴")

-- line numbers
opt.number = true

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smarttab = true
opt.smartindent = true

opt.swapfile = false
opt.backup = false
opt.undofile = true
-- opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

opt.hlsearch = true
opt.incsearch = true

opt.termguicolors = true
vim.o.background = ""
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50

-- auto write when focus changes
opt.autowriteall = true

-- ignore case when searching
opt.ignorecase = true
-- auto switch to case sensitive if there is a capital letter
opt.smartcase = true

-- exp
cmd("set spell")
cmd("set spelllang=en_us")

vim.o.autoread = true

-- suppress checkhealth warning for shit i dont care about
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_julia_provider = 0
vim.g.loaded_php_provider = 0

vim.cmd([[let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"]])
vim.cmd([[let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"]])
vim.cmd([[set termguicolors]])
