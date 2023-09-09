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
                    require("jaron.plugins.lsp-saga")
                end
            }
        )
        use(
            {
                "jose-elias-alvarez/null-ls.nvim",
                config = function()
                    require("jaron.plugins.null-ls")
                end,
                requires = {"nvim-lua/plenary.nvim"}
            }
        )
        -- session mananager
        use {
            "rmagatti/auto-session",
            config = function()
                require("jaron.plugins.auto-session")
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
            run = ":TSUpdate",
            config = function()
                require("jaron.plugins.treesitter")
            end
        }
        -- Telescope
        use {
            "nvim-telescope/telescope.nvim",
            tag = "0.1.1",
            config = function()
                require("jaron.plugins.telescope")
            end
        }
        use {
            "nvim-telescope/telescope-file-browser.nvim",
            requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"}
        }
        use {
            "nvim-telescope/telescope-ui-select.nvim"
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
            tag = "*",
            config = function()
                require("jaron.plugins.toggleterm")
            end
        }
        -- formatter
        use {
            "mhartington/formatter.nvim",
            config = function()
                require("jaron.plugins.formatter")
            end
        }
        -- copilot
        use {
            "zbirenbaum/copilot.lua",
            config = function()
                require("jaron.plugins.copilot")
            end
        }
        -- toggle comments
        use {
            "numToStr/Comment.nvim",
            config = function()
                require("jaron.plugins.comment")
            end
        }
        -- auto pair
        use {
            "windwp/nvim-autopairs",
            config = function()
                require("jaron.plugins.auto-pairs")
            end
        }
        -- auto detect indentation
        use {
            "nmac427/guess-indent.nvim",
            config = function()
                require("jaron.plugins.guess-indent")
            end
        }
        -- show inline git blame
        use("f-person/git-blame.nvim")
        -- indent blankline
        use {
            "lukas-reineke/indent-blankline.nvim",
            config = function()
                require("jaron.plugins.indent-blankline")
            end
        }
        -- undo tree
        use("mbbill/undotree")
        -- add the dressing plugin for a nicer looking ui as shown in the demo video
        --use "stevearc/dressing.nvim"
        -- These optional plugins should be loaded directly because of a bug in Packer lazy loading
        use "nvim-tree/nvim-web-devicons" -- OPTIONAL: for file icons
        use "lewis6991/gitsigns.nvim" -- OPTIONAL: for git status
        use("romgrk/barbar.nvim")
        -- whichkey
        use {
            "folke/which-key.nvim",
            config = function()
                vim.o.timeout = true
                vim.o.timeoutlen = 300
                require("jaron.plugins.which-key")
            end
        }
        -- diffview
        use {
            "sindrets/diffview.nvim",
            config = function()
                require("jaron.plugins.diffview")
            end
        }
        -- nvim test runner
        use {
            "klen/nvim-test",
            config = function()
                require("jaron.plugins.nvim-test")
            end
        }
        use {
            "akinsho/flutter-tools.nvim",
            requires = {
                "nvim-lua/plenary.nvim",
                "stevearc/dressing.nvim" -- optional for vim.ui.select
            },
            config = function()
                require("jaron.plugins.flutter-tools")
            end
        }
        -- orgmode to organize yo brain
        use {
            "nvim-orgmode/orgmode",
            config = function()
                require("jaron.plugins.orgmode")
            end
        }
        -- goto preview to preview your gotos
        use {
            "rmagatti/goto-preview",
            config = function()
                require("jaron.plugins.goto-preview")
            end
        }
        -- surround your shit
        use(
            {
                "kylechui/nvim-surround",
                tag = "*", -- Use for stability; omit to use `main` branch for the latest features
                config = function()
                    require("nvim-surround").setup({})
                end
            }
        )
        -- mark it
        use {
            "chentoast/marks.nvim",
            config = function()
                require("marks").setup {}
            end
        }
        -- timer for creating reminders and stuff
        use {
            "alex-popov-tech/timer.nvim",
            config = function()
                require("jaron.plugins.timer")
            end
        }
        -- nofitier thing
        use {
            "rcarriga/nvim-notify",
            config = function()
                require("jaron.plugins.notify")
            end
        }
        -- dev docs
        use {
            "luckasRanarison/nvim-devdocs",
            requires = {
                "nvim-lua/plenary.nvim",
                "nvim-telescope/telescope.nvim",
                "nvim-treesitter/nvim-treesitter"
            },
            config = function()
                require("nvim-devdocs").setup({})
            end
        }
        use {
            "abecodes/tabout.nvim",
            config = function()
                require("jaron.plugins.tabout")
            end,
            wants = {"nvim-treesitter"}, -- or require if not used so far
            after = {"nvim-cmp"} -- if a completion plugin is using tabs load it before
        }
        use {
            "tzachar/highlight-undo.nvim",
            config = function()
                require("jaron.plugins.highlight-undo")
            end
        }
        use {
            "tzachar/local-highlight.nvim",
            config = function()
                require("jaron.plugins.highlight-local")
            end
        }

        -- <| ~~~ PLUGINS  IM EXPERIMENTING WITH ~~~ |>
        --
        use {
            "m4xshen/hardtime.nvim",
            requires = {"nvim-lua/plenary.nvim"},
            config = function()
                require("hardtime").setup(
                    {
                        disabled_filetypes = {"NvimTree", "mason", "org", "telescope", "qf"}
                    }
                )
            end
        }

        -- -- not really needed 99% of the time
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
    end
)
