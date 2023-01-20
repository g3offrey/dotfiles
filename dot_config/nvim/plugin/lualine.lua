local lualine = require("lualine")

lualine.setup {
    options = {
        -- component_separators = {left = "╲", right = "╱"},
        -- component_separators = "|",
        -- section_separators = {left = " ", right = " "},
        -- separator = {left = "", right = ""},
        section_separators = {left = "", right = ""},
        component_separators = "",
        globalstatus = true
    },
    sections = {
        lualine_a = {{"filename", path = 1}},
        lualine_b = {"diagnostics"},
        lualine_c = {},
        lualine_x = {"branch", "diff"},
        lualine_y = {"encoding", "fileformat", "filetype"},
        lualine_z = {"mode"}
    }
}
