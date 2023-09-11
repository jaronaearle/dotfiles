local lsp = require("lsp-zero").preset({})
local cmp = require("cmp")

lsp.on_attach(
    function(client, bufnr)
        lsp.default_keymaps({buffer = bufnr})
    end
)

lsp.setup_servers({"tsserver", "eslint", "gopls", "rust_analyzer", "lua-language-server"})

lsp.setup_servers({"dartls", force = true})

lsp.setup()

--Fix Undefined global 'vim'
lsp.configure(
    "lua-language-server",
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
        sources = {
            {name = "nvim_lsp"},
            {name = "orgmode"}
        }
    }
)
