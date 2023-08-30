local function getPath()
    return "%<%F%m %#__accent_red#%#__restore__#"
end

return {
    options = {
        theme = "kanagawa"
        --theme = "modus-vivendi"
    },
    icons_enabled = true,
    sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch"},
        lualine_c = {
            function()
                return "%<%F%m %#__accent_red#%#__restore__#"
            end
        },
        lualine_x = {"searchcount", "fileformat", "filetype"},
        --lualine_y = {"progress"},
        lualine_y = {"location"},
        --lualine_z = {"location"}
        lualine_z = {(require("auto-session.lib").current_session_name)}
    },
    tabline = {},
    globalst = false
}
