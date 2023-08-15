require("jaron.utils")

-- set leader to space
vim.g.mapleader = " "

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
NMap("<C-d>", "<C-d>zz")
NMap("<C-u>", "<C-u>zz")

-- delete line without yanking
NMap(leaderMap("d"), '"_d')
VMap(leaderMap("d"), '"_d')

-- "+yy "+p copy/paste sys board
VMap(leaderMap("yy"), '"+y', optsFunc("Copy to system clipboard"))
NMap(leaderMap("pp"), '"+p', optsFunc("Paste from system clipboard"))
VMap(leaderMap("pp"), '"+p', optsFunc("Paste from system clipboard"))

-- set esc to jk
AllMap("jk", "<ESC>", optsFunc("Set jk to escape"))

-- quick commands
NMap(leaderMap("sp"), cmdFunc("PackerSync"))

NMap(
    "<leader><leader>",
    function()
        vim.cmd("so ~/.config/nvim/init.lua")
        print("successfully sourced the fucker")
    end,
    optsFunc("Source the fucker")
)
NMap(
    leaderMap("so"),
    function()
        vim.cmd("so %")
        print("successfully sourced current buffer...")
    end,
    optsFunc("Source the file")
)

-- Move to previous/next
NMap(leaderMap("th"), cmdFunc("BufferPrevious"), optsFunc("Go to the next fuckin buffer tab"))
NMap(leaderMap("tl"), cmdFunc("BufferNext"), optsFunc("Go to the previous fuckin buffer tab"))

-- Go to buffer in position <num>
for bufNum = 1, 9 do
    NMap(
        leaderMap("b" .. bufNum),
        cmdFunc("BufferGoto " .. bufNum),
        optsFunc("Go to the buffer tab in position " .. bufNum)
    )
end

NMap(leaderMap("b0"), cmdFunc("BufferLast"), opts)
NMap(leaderMap("bx"), cmdFunc("BufferClose"), opts)

-- trigger code action
-- Better mapping -- typing '<x> catato...' triggers comp prompt
NMap(leaderMap("ca"), cmdFunc("lua vim.lsp.buf.code_action()"), opts)

-- Show file diff
NMap(leaderMap("w"), cmdFunc("w !diff % -"), optsFunc("Display file diff"))

-- write maps for multi window editing
NMap(leaderMap("hs"), cmdFunc("sp"), optsFunc("Split horizontal"))
NMap(leaderMap("vs"), cmdFunc("vs"), optsFunc("Split vertical"))

-- tmux navigation
NMap("<C-h>", cmdFunc("TmuxNavigateLeft"), optsFunc("Go to left window"))
NMap("<C-j>", cmdFunc("TmuxNavigateDown"), optsFunc("Go to bottom window"))
NMap("<C-k>", cmdFunc("TmuxNavigateUp"), optsFunc("Go to top window"))
NMap("<C-l>", cmdFunc("TmuxNavigateRight"), optsFunc("Go to right window"))

-- lsp diagnostic shit
NMap(
    leaderMap("er"),
    cmdFunc("lua vim.diagnostic.open_float()"),
    optsFunc("Open floating diagnostic window for warnings/errors")
)

-- copies file path of current buffer to clipboard
NMap(leaderMap("cfp"), cmdFunc("redir @* | echo @%"), optsFunc("Copy path of current file to system clipboard"))

-- changes theme
NMap(
    leaderMap("kd"),
    function()
        vim.cmd("colorscheme kanagawa-dragon")
    end,
    optsFunc("Dragon mode for eyeball soothing darkness")
)
NMap(
    leaderMap("kw"),
    function()
        vim.cmd("colorscheme kanagawa")
    end,
    optsFunc("Og kanagawa goodness")
)
