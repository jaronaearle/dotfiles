require("auto-session").setup {
    auto_session_suppress_dirs = {"~/", "~/Projects", "~/Downloads", "/"},
    auto_session_use_git_branch = true,
    session_lens = {
        -- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
        load_on_setup = true,
        theme_conf = {border = true},
        previewer = true
    }
}

vim.keymap.set(
    "n",
    "<C-s>",
    require("auto-session.session-lens").search_session,
    {
        noremap = true
    }
)
