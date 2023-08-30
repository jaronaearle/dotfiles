-- set leader to space
vim.g.mapleader = " "

local map = vim.keymap.set

local opts = {noremap = true, silent = true}

local optsFunc = function(des)
    return {noremap = true, desc = des, silent = true}
end

local leaderMap = function(seq)
    return "<leader>" .. seq
end

local cmdFunc = function(cmd)
    return "<cmd>" .. cmd .. "<CR>"
end

-- keep cursor centered while jumping half pages
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- delete line without yanking
map({"n", "v"}, leaderMap("d"), '"_d')

-- "+yy "+p copy/paste sys board
map({"n", "v"}, "<leader>yy", '"+y', optsFunc("Copy to system clipboard - Normal | Visual"))
map({"n", "v"}, "<leader>pp", '"+p', optsFunc("Paste from system clipboard - Normal | Visual"))

-- set esc to jk
map({"i", "v", "n"}, "jk", "<ESC>", optsFunc("Set jk to escape"))

-- set esc to kj
map({"i", "v", "n"}, "kj", "<ESC>", optsFunc("Set kj to escape"))

-- quick commands
map("n", "<leader>sp", "<cmd> lua PackerSync<CR>", optsFunc("Sync packer"))

map(
    "n",
    "<leader><leader>",
    function()
        vim.cmd("so ~/.config/nvim/init.lua")
        print("successfully sourced the fucker")
    end,
    optsFunc("Source the fucker")
)
map(
    "n",
    leaderMap("so"),
    function()
        vim.cmd("so %")
        print("successfully sourced current buffer...")
    end,
    optsFunc("Source the file")
)

-- Move to previous/next
map("n", leaderMap("th"), cmdFunc("BufferPrevious"), optsFunc("Go to the next fuckin buffer tab"))
map("n", leaderMap("tl"), cmdFunc("BufferNext"), optsFunc("Go to the previous fuckin buffer tab"))

-- Go to buffer in position <num>
for bufNum = 1, 9 do
    map(
        "n",
        leaderMap("b" .. bufNum),
        cmdFunc("BufferGoto " .. bufNum),
        optsFunc("Go to the buffer tab in position " .. bufNum)
    )
end

map("n", leaderMap("b0"), cmdFunc("BufferLast"), opts)
map("n", leaderMap("bx"), cmdFunc("BufferClose"), opts)

-- trigger code action
-- Better mapping -- typing '<x> catato...' triggers comp prompt
map("n", leaderMap("ca"), cmdFunc("lua vim.lsp.buf.code_action()"), opts)

-- Show file diff
map("n", leaderMap("w"), cmdFunc("w !diff % -"), optsFunc("Display file diff"))

-- write maps for multi window editing
map("n", leaderMap("hs"), cmdFunc("sp"), optsFunc("Split horizontal"))
map("n", leaderMap("vs"), cmdFunc("vs"), optsFunc("Split vertical"))

-- tmux navigation
map("n", "<C-h>", cmdFunc("TmuxNavigateLeft"), optsFunc("Go to left window"))
map("n", "<C-j>", cmdFunc("TmuxNavigateDown"), optsFunc("Go to bottom window"))
map("n", "<C-k>", cmdFunc("TmuxNavigateUp"), optsFunc("Go to top window"))
map("n", "<C-l>", cmdFunc("TmuxNavigateRight"), optsFunc("Go to right window"))

-- lsp diagnostic shit
map(
    "n",
    leaderMap("er"),
    cmdFunc("lua vim.diagnostic.open_float()"),
    optsFunc("Open floating diagnostic window for warnings/errors")
)

-- copies file path of current buffer to clipboard
map("n", leaderMap("cfp"), cmdFunc("redir @* | echo @%"), optsFunc("Copy path of current file to system clipboard"))

-- Fumpt
map("n", "<leader>f", "<cmd>Format<CR>", {noremap = true, silent = true})
