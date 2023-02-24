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
        lualine_a = {{"filename", path = 1, separator = {left = "", right = ""}}},
        lualine_b = {"diagnostics"},
        lualine_c = {},
        lualine_x = {"branch", "diff"},
        lualine_y = {"encoding", "fileformat", "filetype"},
        lualine_z = {{"mode", separator = {left = "", right = ""}}}
    }
}
