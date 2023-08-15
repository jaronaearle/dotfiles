vim.cmd [[packadd packer.nvim]]

return require("packer").startup(
    function(use)
        -- Packer can manage itself
        use "wbthomason/packer.nvim"
        -- LSP Zero
        use {
            "VonHeikemen/lsp-zero.nvim",
            branch = "v2.x",
            requires = {
                -- LSP Support
                {"neovim/nvim-lspconfig"}, -- Required
                {
                    -- Optional
                    "williamboman/mason.nvim",
                    run = function()
                        pcall(vim.cmd, "MasonUpdate")
                    end
                },
                {"williamboman/mason-lspconfig.nvim"}, -- Optional
                -- Autocompletion
                {"hrsh7th/nvim-cmp"}, -- Required
                {"hrsh7th/cmp-nvim-lsp"}, -- Required
                {"L3MON4D3/LuaSnip"} -- Required
            }
        }
        -- lsp saga
        use(
            {
                "nvimdev/lspsaga.nvim",
                after = "nvim-lspconfig",
                config = function()
                    require("lspsaga").setup({})
                end
            }
        )
        -- session mananager
        use {
            "rmagatti/auto-session",
            config = function()
                require("auto-session").setup {
                    log_level = "error",
                    auto_session_suppress_dirs = {"~/", "~/Projects", "~/Downloads", "/"}
                }
            end
        }
        -- tmux
        use {"christoomey/vim-tmux-navigator"}
        --    -- Debugger -- TODO config debugger
        use {"mfussenegger/nvim-dap"}
        -- Nvim Tree
        -- use {
        --     "nvim-tree/nvim-tree.lua",
        --     requires = {
        --         "nvim-tree/nvim-web-devicons" -- optional
        --     }
        -- }
        -- Treesitter
        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate"
        }
        -- Telescope
        use {
            "nvim-telescope/telescope.nvim",
            tag = "0.1.1"
        }
        -- required for telescope
        use("nvim-lua/plenary.nvim")
        -- Kanagawa Theme
        use "rebelot/kanagawa.nvim"
        use {
            "nvim-lualine/lualine.nvim",
            requires = {"nvim-tree/nvim-web-devicons", opt = true}
        }
        use {"dart-lang/dart-vim-plugin", ft = {"dart"}}
        -- toggle terminal
        use {
            "akinsho/toggleterm.nvim",
            tag = "*"
        }
        -- formatter
        use {"mhartington/formatter.nvim"}
        -- copilot
        use("zbirenbaum/copilot.lua")
        -- toggle comments
        use("numToStr/Comment.nvim")
        -- auto pair
        use {
            "windwp/nvim-autopairs"
        }
        -- auto detect indentation
        use("nmac427/guess-indent.nvim")
        -- show inline git blame
        use("f-person/git-blame.nvim")
        -- indent blankline
        use("lukas-reineke/indent-blankline.nvim")
        -- undo tree
        use("mbbill/undotree")
        -- add the dressing plugin for a nicer looking ui as shown in the demo video
        --use "stevearc/dressing.nvim"
        -- These optional plugins should be loaded directly because of a bug in Packer lazy loading
        use "nvim-tree/nvim-web-devicons" -- OPTIONAL: for file icons
        use "lewis6991/gitsigns.nvim" -- OPTIONAL: for git status
        use "romgrk/barbar.nvim"
        -- whichkey
        use {
            "folke/which-key.nvim",
            config = function()
                vim.o.timeout = true
                vim.o.timeoutlen = 300
            end
        }
        -- diffview
        use {"sindrets/diffview.nvim"}
        -- nvim test runner
        use {
            "klen/nvim-test",
            config = function()
                require("nvim-test").setup()
            end
        }
        use {
            "akinsho/flutter-tools.nvim",
            requires = {
                "nvim-lua/plenary.nvim",
                "stevearc/dressing.nvim" -- optional for vim.ui.select
            }
        }
        -- orgmode to organize yo brain
        -- get autocomplete working
        use {
            "nvim-orgmode/orgmode"
        }
        -- not really needed 99% of the time
        -- use {
        --     "cameron-wags/rainbow_csv.nvim",
        --     config = function()
        --         require "rainbow_csv".setup()
        --     end,
        --     -- optional lazy-loading below
        --     module = {
        --         "rainbow_csv",
        --         "rainbow_csv.fns"
        --     },
        --     ft = {
        --         "csv",
        --         "tsv",
        --         "csv_semicolon",
        --         "csv_whitespace",
        --         "csv_pipe",
        --         "rfc_csv",
        --         "rfc_semicolon"
        --     }
        -- }
        -- Go to preview -- dunno if i need this
        use {
            "rmagatti/goto-preview"
        }
        -- surround because surrounding is cool
        use(
            {
                "kylechui/nvim-surround",
                tag = "*", -- Use for stability; omit to use `main` branch for the latest features
                config = function()
                    require("nvim-surround").setup({})
                end
            }
        )
        use {
            "chentoast/marks.nvim",
            config = function()
                require("marks").setup {}
            end
        }
        -- <| ~~~ PLUGINS  IM EXPERIMENTING WITH ~~~ |>

        -- timer for creating reminders and stuff
        use {"alex-popov-tech/timer.nvim"}
        -- nofitier thing
        use {"rcarriga/nvim-notify"}

        -- dev docs
        -- use {
        --     "luckasRanarison/nvim-devdocs",
        --     requires = {
        --         "nvim-lua/plenary.nvim",
        --         "nvim-telescope/telescope.nvim",
        --         "nvim-treesitter/nvim-treesitter"
        --     },
        --     config = function()
        --         require("nvim-devdocs").setup({})
        --     end
        -- }

        -- tabout TODO make it work
        use {
            "abecodes/tabout.nvim",
            config = function()
                require("tabout").setup {
                    tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
                    backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
                    act_as_tab = true, -- shift content if tab out is not possible
                    act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
                    default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
                    default_shift_tab = "<C-d>", -- reverse shift default action,
                    enable_backwards = true, -- well ...
                    completion = true, -- if the tabkey is used in a completion pum
                    tabouts = {
                        {open = "'", close = "'"},
                        {open = '"', close = '"'},
                        {open = "`", close = "`"},
                        {open = "(", close = ")"},
                        {open = "[", close = "]"},
                        {open = "{", close = "}"}
                    },
                    ignore_beginning = true --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]],
                    exclude = {} -- tabout will ignore these filetypes
                }
            end,
            wants = {"nvim-treesitter"}, -- or require if not used so far
            after = {"nvim-cmp"} -- if a completion plugin is using tabs load it before
        }

        use {
            "nvim-telescope/telescope-file-browser.nvim",
            requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"}
        }

        use {
            "nvim-telescope/telescope-ui-select.nvim"
        }
    end
)
