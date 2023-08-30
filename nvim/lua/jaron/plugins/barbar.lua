vim.g.barbar_auto_setup = false

require("barbar").setup(
    {
        animation = true,
        auto_hide = false,
        tabpages = true,
        clickable = true,
        focus_on_close = "left",
        highlight_current_tab = true,
        highlight_visible = true,
        icons = {
            buffer_index = true,
            diagnostics = {
                [vim.diagnostic.severity.ERROR] = {enabled = true, icon = "ﬀ"},
                [vim.diagnostic.severity.WARN] = {enabled = true},
                [vim.diagnostic.severity.INFO] = {enabled = true},
                [vim.diagnostic.severity.HINT] = {enabled = true}
            },
            gitsigns = {
                added = {enabled = true, icon = "+"},
                changed = {enabled = true, icon = "~"},
                deleted = {enabled = true, icon = "-"}
            }
        }
    }
)
