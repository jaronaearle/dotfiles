-- disable netrw to avoid conflicts
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- <CR> - expand dir / open file
-- W - collapse
-- E - expand recursively
--
-- <C-v> - split
-- <C-x> - vsplit

require("nvim-tree").setup {
    sort_by = "case_sensitive",
    view = {
        width = 50
    },
    filters = {
        dotfiles = false,
        custom = {".git", ".DS_Store"}
    },
    git = {ignore = false},
    actions = {
        open_file = {
            quit_on_open = true
        }
    }
}

vim.keymap.set("n", "<leader><C-e>", ":NvimTreeFindFileToggle<CR>", {noremap = true, silent = true})
