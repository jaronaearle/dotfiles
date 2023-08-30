Map = vim.api.nvim_set_keymap
Opts = {noremap = true, silent = true}

require("toggleterm").setup {
    size = 15,
    open_mapping = [[<c-\>]],
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 1,
    start_in_insert = true,
    persist_size = true,
    direction = "horizontal"
}

local Terminal = require("toggleterm.terminal").Terminal

Toggle_float = function()
    local float = Terminal:new({direction = "float"})
    float:toggle()
end

Toggle_lazygit = function()
    local lazygit = Terminal:new({cmd = "lazygit", direction = "float"})
    lazygit:toggle()
end

Map("n", "<leader>tt", "<cmd>:ToggleTerm<CR>", Opts)

Map("n", "<leader>tf", "<cmd>lua Toggle_float()<CR>", Opts)

Map("n", "<leader>tg", "<cmd>lua Toggle_lazygit()<CR>", Opts)
