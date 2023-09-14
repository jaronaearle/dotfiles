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
        snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
                -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            end
        },
        window = {},
        sources = {
            {name = "nvim_lsp"},
            {name = "orgmode"}
        }
    }
)
