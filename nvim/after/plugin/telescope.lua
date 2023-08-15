local telescope = require("telescope")
local builtin = require("telescope.builtin")

-- local function code_action()
--     builtin.lsp_code_actions {
--         layout_strategy = "vertical",
--         layout_config = {
--             anchor = "center",
--             width = 0.5,
--             height = 0.8,
--             prompt_position = "top"
--         }
--     }

local function find_files()
    builtin.find_files {
        prompt_title = "< Find Files >",
        hidden = true
    }
end

local function find_git_files()
    builtin.git_files {previewer = false}
end

local function list_buffers()
    builtin.buffers {
        sort_lastused = true,
        previewer = false,
        initial_mode = "normal"
    }
end

local function find_string()
    builtin.grep_string({search = vim.fn.input("Grep > ")})
end

local function live_grep()
    builtin.live_grep(
        {
            prompt_title = "< Grep Files >",
            hidden = true
        }
    )
end

local function search_notes()
    builtin.find_files {
        prompt_title = "< Find Notes >",
        cwd = "~/Sync/Org/",
        hidden = true
    }
end

local function grep_notes()
    builtin.live_grep {
        prompt_title = "< Grep Notes >",
        cwd = "~/Sync/Org/",
        hidden = true
    }
end

local function mark()
    builtin.marks()
end

local function registers()
    builtin.registers()
end

local function quicklist()
    builtin.quickfix()
end

local function jumplist()
    builtin.jumplist()
end

local function tags()
    builtin.tags()
end

local function keymaps()
    builtin.keymaps()
end

vim.keymap.set("n", "<C-p>", find_git_files, {})
vim.keymap.set("n", "<C-Tab>", list_buffers, {})

vim.keymap.set("n", "<leader>ff", find_files, {})
vim.keymap.set("n", "<leader>fg", live_grep, {})
vim.keymap.set("n", "<leader>nf", search_notes, {})
vim.keymap.set("n", "<leader>ng", grep_notes, {})
--vim.keymap.set("n", "<leader>ca", code_action, {})

vim.keymap.set("n", "<leader>fm", mark, {})
vim.keymap.set("n", "<leader>fr", registers, {})
vim.keymap.set("n", "<leader>fq", quicklist, {})
vim.keymap.set("n", "<leader>fj", jumplist, {})
vim.keymap.set("n", "<leader>ft", tags, {})
vim.keymap.set("n", "<leader>fk", keymaps, {})

-- fuzzy file finding
vim.keymap.set("n", "<leader>fs", find_string)

-- recent projects (integration from project explorer plugin)
--require("telescope").load_extension("projects")

--local function show_recent_projects()
--    require "telescope".extensions.projects.projects {}
--end

--vim.keymap.set("n", "<leader><C-r>", show_recent_projects)

-- set up modes for find | grep
-- find intial mode = insert
-- grep intial mode = normal

telescope.setup(
    {
        defaults = {
            show_line = true,
            results_title = false,
            preview_title = false,
            layout_config = {
                anchor = "NW",
                prompt_position = "top",
                preview_cutoff = 90,
                --preview_width = 0.7,
                -- width = 0.99,
                -- height = .99,
                center = {
                    width = 0.99,
                    height = 0.4
                },
                horizontal = {
                    width = 0.99,
                    height = 0.99,
                    preview_width = 0.7
                }
            },
            file_ignore_patterns = {
                "node_modules",
                "dist",
                "build",
                "target",
                "vendor",
                "yarn.lock",
                "package-lock.json",
                ".git",
                ".DS_Store",
                "ios",
                "android"
            }
        },
        extensions = {
            file_browser = {
                hidden = true,
                display_stat = false,
                show_hidden = true,
                prompt_title = "< Browse Files >",
                initial_mode = "normal"
            },
            ["ui-select"] = {
                require("telescope.themes").get_dropdown {
                    initial_mode = "normal",
                    prompt_title = "< Code Actions >",
                    layout_config = {
                        anchor = "N",
                        width = 0.99,
                        height = 0.13
                    }
                },
                --theme = "cursor",
                codeactions = true
            }
        }
    }
)

telescope.load_extension("file_browser")
telescope.load_extension("ui-select")

-- from root of project?
vim.keymap.set("n", "<leader>fbc", ":Telescope file_browser<CR>", {noremap = true, silent = true})
vim.keymap.set(
    "n",
    "<leader>fb",
    ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
    {noremap = true, silent = true}
)
