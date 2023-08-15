local function getPath()
    return "%<%F%m %#__accent_red#%#__restore__#"
end

require("lualine").setup(
    {
        options = {
            theme = "kanagawa"
            --theme = "modus-vivendi"
        },
        icons_enabled = true,
        sections = {
            lualine_a = {"mode"},
            lualine_b = {"branch"},
            lualine_c = {getPath},
            lualine_x = {"searchcount", "fileformat", "filetype"},
            --lualine_y = {"progress"},
            lualine_y = {"location"},
            --lualine_z = {"location"}
            lualine_z = {(require("auto-session.lib").current_session_name)}
        },
        tabline = {},
        globalst = false
    }
)
