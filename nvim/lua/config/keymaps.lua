local discipline = require("jaro.discipline")
local harpoon = require("harpoon")

discipline.cowboy()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

local leaderMap = function(seq)
  return "<leader>" .. seq
end

local cmdFunc = function(cmd)
  return "<cmd>" .. cmd .. "<CR>"
end

local optsFunc = function(des)
  return { noremap = true, desc = des, silent = true }
end

keymap.set("n", "x", '"_x')

-- delete line without yanking
keymap.set({ "n", "v" }, "dl", '"_dd')

-- copy/paste from system clipboard
keymap.set({ "n", "v" }, "sy", '"+y', optsFunc("Copy to system clipboard - Normal | Visual"))
keymap.set({ "n", "v" }, "sp", '"+p', optsFunc("Paste from system clipboard - Normal | Visual"))

-- jk and kj = ESC
keymap.set({ "i", "v", "n" }, "jk", "<ESC>", { noremap = true, silent = true, desc = "jk escapes" })
keymap.set({ "i", "v", "n" }, "kj", "<ESC>", { noremap = true, silent = true, desc = "kj escapes" })

-- redo with U
keymap.set("n", "<S-u>", "<C-r>", { noremap = true, silent = true, desc = "Shift U to redo" })

-- codeium
-- keymap.set("i", "<leader><C-k>", function()
--   return vim.fn["codeium#Accept"]()
-- end, { expr = true })
--
-- keymap.set("i", "<leader><C-l>", function()
--   return vim.fn["codeium#CycleCompletions"](1)
-- end, { expr = true })
--
-- keymap.set("i", "<leader><C-h>", function()
--   return vim.fn["codeium#CycleCompletions"](-1)
-- end, { expr = true })
--
-- keymap.set("i", "<leader><C-j>", function()
--   return vim.fn["codeium#Clear"]()
-- end, { expr = true })
--
-- vim.g.codeium_no_map_tab = 1

-- Split window
keymap.set("n", "hs", ":split<Return>", opts)
keymap.set("n", "vs", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- tmux navigation
keymap.set("n", "<C-h>", cmdFunc("TmuxNavigateLeft"), optsFunc("Go to left window"))
keymap.set("n", "<C-j>", cmdFunc("TmuxNavigateDown"), optsFunc("Go to bottom window"))
keymap.set("n", "<C-k>", cmdFunc("TmuxNavigateUp"), optsFunc("Go to top window"))
keymap.set("n", "<C-l>", cmdFunc("TmuxNavigateRight"), optsFunc("Go to right window"))

-- delete range marks y - z
keymap.set("n", leaderMap("yz"), cmdFunc("'y,'zd<CR>"), optsFunc("Delete text between marks y and z"))

-- quickly open/close diffview
keymap.set("n", leaderMap("df"), cmdFunc("DiffviewOpen"), optsFunc("Open Diffview"))
keymap.set("n", leaderMap("dF"), cmdFunc("DiffviewClose"), optsFunc("Close Diffview"))

-- open oil in floating window
keymap.set("n", "-", cmdFunc("Oil --float"), optsFunc("Open Oil in floating window"))

-- local newlineReg = function(cap)
--   vim.cmd("call setreg('o', string.char(10))")
--
--   local paste = "p"
--   if cap then
--     paste = "P"
--   end
--
--   print("fuck")
--   return '"o' .. paste
-- end
--
-- keymap.set("n", leaderMap("n"), function()
--   newlineReg(false)
-- end, optsFunc("Inserts newline beneath cursor"))
--
-- keymap.set("n", leaderMap("N"), newlineReg(true), optsFunc("Inserts newline above cursor"))

harpoon:setup({})

vim.keymap.set("n", "<leader>A", function()
  harpoon:list():append()
end)
vim.keymap.set("n", "<leader>L", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<C-1>", function()
  harpoon:list():select(1)
end)
vim.keymap.set("n", "<C-2>", function()
  harpoon:list():select(2)
end)
vim.keymap.set("n", "<C-3>", function()
  harpoon:list():select(3)
end)
vim.keymap.set("n", "<C-4>", function()
  harpoon:list():select(4)
end)
