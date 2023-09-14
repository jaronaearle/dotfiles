vim.g.barbar_auto_setup = false

require("barbar").setup(
    {
        auto_hide = false,
        tabpages = true,
        focus_on_close = "left",
        highlight_current_tab = true,
        highlight_visible = true,
        hide = {extensions = true},
        minumum_padding = 3,
        maximum_length = 20,
        icons = {
            buffer_index = true,
            diagnostics = {
                [vim.diagnostic.severity.ERROR] = {enabled = true, icon = "!!"},
                [vim.diagnostic.severity.INFO] = {enabled = false},
                [vim.diagnostic.severity.HINT] = {enabled = false}
            },
            gitsigns = {
                added = {enabled = true, icon = "+"},
                changed = {enabled = true, icon = "~"},
                deleted = {enabled = true, icon = "-"}
            },
            filetype = {
                enabled = false
            }
        },
        no_name_title = "Doombuf"
    }
)
