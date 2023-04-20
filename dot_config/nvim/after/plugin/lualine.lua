local lualine = require("lualine")
local theme = require("lualine.themes.kanagawa")
theme.normal.b.bg = "none"
theme.normal.c.bg = "none"

lualine.setup {
    options = {
        theme = theme,
        section_separators = {left = " ", right = " "},
        component_separators = "",
        globalstatus = true
    },
    sections = {
        lualine_a = {{"mode", separator = {left = "", right = ""}}},
        lualine_b = {"diagnostics"},
        lualine_c = {{"filename", path = 1}},
        lualine_x = {"branch", "diff"},
        lualine_y = {"encoding", "fileformat", "filetype"},
        lualine_z = {{"progress", separator = {left = "", right = ""}}}
    }
}
