local vopt = vim.opt

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
vim.cmd("set spell")
vim.cmd("set spelllang=en_us")

vim.cmd("set noshowmode")
vim.cmd("colorscheme kanagawa-dragon")

vim.o.autoread = true

-- suppress checkhealth warning for shit i dont care about
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_julia_provider = 0
vim.g.loaded_php_provider = 0

local signs = {
    Error = "", -- 
    Warn = "",
    Hint = "",
    Info = ""
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end
