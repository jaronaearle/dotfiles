-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "i", "v", "n" }, "jk", "<ESC>", { noremap = true, silent = true, desc = "jk escapes" })
-- jk and kj = ESC
vim.keymap.set({ "i", "v", "n" }, "kj", "<ESC>", { noremap = true, silent = true, desc = "kj escapes" })

-- redo with U
vim.keymap.set("n", "<S-u>", "<C-r>", { noremap = true, silent = true, desc = "Shift U to redo" })

-- codeium
vim.keymap.set("i", "<leader><C-k>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true })

vim.keymap.set("i", "<leader><C-l>", function()
  return vim.fn["codeium#CycleCompletions"](1)
end, { expr = true })

vim.keymap.set("i", "<leader><C-h>", function()
  return vim.fn["codeium#CycleCompletions"](-1)
end, { expr = true })

vim.keymap.set("i", "<leader><C-j>", function()
  return vim.fn["codeium#Clear"]()
end, { expr = true })

vim.g.codeium_no_map_tab = 1
