local lsp = require("lsp-zero").preset({})
local cmp = require("cmp")

lsp.on_attach(
    function(client, bufnr)
        lsp.default_keymaps({buffer = bufnr})
    end
)

lsp.setup_servers({"tsserver", "eslint", "gopls", "rust_analyzer", "lua_ls"})

lsp.setup_servers({"dartls", force = true})

lsp.setup()

--Fix Undefined global 'vim'
lsp.configure(
    "lua_ls",
    {
        settings = {
            Lua = {
                diagnostics = {
                    globals = {"vim"}
                }
            }
        }
    }
)

cmp.setup(
    {
        formatting = {
            fields = {"abbr", "kind", "menu"},
            format = require("lspkind").cmp_format(
                {
                    mode = "symbol", -- show only symbol annotations
                    maxwidth = 50, -- prevent the popup from showing more than provided characters
                    ellipsis_char = "..." -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
                }
            )
        },
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
            end
        },
        window = {},
        sources = {
            {name = "luasnip", option = {use_show_condition = false}},
            {name = "nvim_lsp"},
            {name = "orgmode"}
        }
    }
)
