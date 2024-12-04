local discipline = require("jaro.discipline")
discipline.cowboy()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

local leaderMap = function(seq)
  return "<leader>" .. seq
end

local cmdFunc = function(cmd)
  return "<cmd>" .. cmd .. "<CR>"
end

local cbFunc = function(cb, args)
  return function()
    cb(args)
  end
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

-- work with registers more easily
-- register f
keymap.set({ "n", "v" }, leaderMap("fy"), '"fy', optsFunc("Copy to register f - Normal | Visual"))
keymap.set({ "n", "v" }, leaderMap("Fy"), '"Fy', optsFunc("Append to register f - Normal | Visual"))
keymap.set({ "n", "v" }, leaderMap("fp"), '"fp', optsFunc("Paste from register f - Normal | Visual"))
-- register g
keymap.set({ "n", "v" }, leaderMap("gy"), '"gy', optsFunc("Copy to register g - Normal | Visual"))
keymap.set({ "n", "v" }, leaderMap("Gy"), '"Gy', optsFunc("Append to register g - Normal | Visual"))
keymap.set({ "n", "v" }, leaderMap("gp"), '"gp', optsFunc("Paste from register g - Normal | Visual"))

-- delete range marks y - z
keymap.set("n", leaderMap("yz"), cmdFunc("'y,'zd<CR>delm yz<CR>"), optsFunc("Delete everything between marks y and z"))

-- insert newline above/below without leaving normal mode
keymap.set("n", leaderMap("o"), "o<ESC>k", optsFunc("Inserts newline below cursor"))
keymap.set("n", leaderMap("O"), "O<ESC>j", optsFunc("Inserts newline above cursor"))

-- jk and kj = ESC
keymap.set({ "i", "v", "n" }, "jk", "<ESC>", { noremap = true, silent = true, desc = "jk escapes" })
keymap.set({ "i", "v", "n" }, "kj", "<ESC>", { noremap = true, silent = true, desc = "kj escapes" })

-- redo with U
keymap.set("n", "<S-u>", "<C-r>", { noremap = true, silent = true, desc = "Shift U to redo" })

-- replace word under cursor with content from 0th register
keymap.set("n", "sw", 'diw"0P', optsFunc("Replace word under cursor with content from 0th register"))

-- Split window
keymap.set("n", "hs", ":split<Return>", opts)
keymap.set("n", "vs", ":vsplit<Return>", opts)

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Toggle word wrap
local wrap_enabled = false
keymap.set("n", "ww", function()
  if wrap_enabled then
    vim.opt.wrap = false
    vim.opt.linebreak = false
    vim.opt.list = true

    -- Unmap keys in normal mode
    vim.keymap.del("n", "j")
    vim.keymap.del("n", "k")
    vim.keymap.del("n", "0")
    vim.keymap.del("n", "^")
    vim.keymap.del("n", "$")

    -- Unmap keys in visual mode
    vim.keymap.del("v", "j")
    vim.keymap.del("v", "k")
    vim.keymap.del("v", "0")
    vim.keymap.del("v", "^")
    vim.keymap.del("v", "$")

    wrap_enabled = false
  else
    vim.opt.wrap = true
    vim.opt.linebreak = true
    vim.opt.list = false

    -- Remap keys in normal mode
    vim.keymap.set("n", "j", "gj")
    vim.keymap.set("n", "k", "gk")
    vim.keymap.set("n", "0", "g0")
    vim.keymap.set("n", "^", "g^")
    vim.keymap.set("n", "$", "g$")

    -- Remap keys in visual mode
    vim.keymap.set("v", "j", "gj")
    vim.keymap.set("v", "k", "gk")
    vim.keymap.set("v", "0", "g0")
    vim.keymap.set("v", "^", "g^")
    vim.keymap.set("v", "$", "g$")

    wrap_enabled = true
  end
end, optsFunc("Toggle word wrap"))

-- tmux navigation
keymap.set("n", "<C-h>", cmdFunc("TmuxNavigateLeft"), optsFunc("Go to left window"))
keymap.set("n", "<C-j>", cmdFunc("TmuxNavigateDown"), optsFunc("Go to bottom window"))
keymap.set("n", "<C-k>", cmdFunc("TmuxNavigateUp"), optsFunc("Go to top window"))
keymap.set("n", "<C-l>", cmdFunc("TmuxNavigateRight"), optsFunc("Go to right window"))

-- open oil in floating window
keymap.set("n", "-", cmdFunc("Oil --float"), optsFunc("Open Oil in floating window"))
keymap.set("n", "wo", cbFunc(require("oil").toggle_float), optsFunc("Toggle Oil in floating window"))

-- neotest
local runner = require("neotest").run
keymap.set("n", leaderMap("tn"), cbFunc(runner.run), optsFunc("Run nearest test"))
keymap.set("n", leaderMap("tf"), cbFunc(runner.run, vim.fn.expand("%")), optsFunc("Run all tests in file"))
keymap.set("n", leaderMap("tl"), cbFunc(runner.run_last), optsFunc("Run last test"))
keymap.set("n", leaderMap("tL"), cbFunc(runner.run_last, { strategy = "dap" }), optsFunc("Run last with debugger"))

-- undotree
keymap.set("n", leaderMap("u"), cmdFunc("lua require('undotree').toggle()"), optsFunc("Toggle undotree"))

-- yeet
keymap.set("n", "Yy", cmdFunc("Yeet"), optsFunc("Yeet that command"))
