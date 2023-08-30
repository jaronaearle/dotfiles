local vopt = vim.opt

--vopt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr-o:hor20"

-- line numbers
vopt.number = true
vopt.relativenumber = false
vopt.cursorline = true

vopt.tabstop = 2
vopt.softtabstop = 2
vopt.shiftwidth = 2
vopt.expandtab = true
vopt.smarttab = true
vopt.smartindent = true

vopt.swapfile = false
vopt.backup = false
vopt.undofile = true
vopt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vopt.hlsearch = true
vopt.incsearch = true

vopt.termguicolors = true
vim.o.background = ""
vopt.scrolloff = 8
vopt.signcolumn = "yes"
vopt.isfname:append("@-@")

vopt.updatetime = 50
vopt.colorcolumn = "180"

-- auto write when focus changes
vopt.autowriteall = true

-- ignore case when searching
vopt.ignorecase = true
-- auto switch to case sensitive if there is a capital letter
vopt.smartcase = true

-- exp
vopt.spell = true
vopt.spelllang = {"en_us"}

vim.cmd("set noshowmode")
vim.cmd("colorscheme kanagawa-dragon")

vim.o.autoread = true

-- vim.api.nvim_create_autocmd(
--     {"BufEnter", "CursorHold", "CursorHoldI", "FocusGained"},
--     {
--         command = "if mode() != 'c' | checktime | endif",
--         pattern = {"*"}
--     }
