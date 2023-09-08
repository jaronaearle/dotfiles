vim.cmd [[highlight IndentBlankLineContextChar guibg=#af87af gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent1 guibg=#2F2736 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#352E3F gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guibg=#42374B gui=nocombine]]

local opt = vim.opt

opt.list = true
opt.listchars:append "space:⋅"
opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
    space_char_blankline = " ",
    char = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3"
    },
    show_trailing_blankline_indent = false,
    show_end_of_line = false
}

show_trailing_blankine_indent = "test;"
