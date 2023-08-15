require("copilot").setup(
    {
        suggestion = {
            enabled = true,
            auto_trigger = true,
            keymap = {
                accept = "<leader>ck",
                next = "<leader>cn",
                prev = "<leader>cp",
                dismiss = "<leader>cl"
            }
        }
    }
)
