local lualine = require("lualine")
local lualine_theme = require("lualine_theme")

lualine.setup {
    options = {
        -- theme = lualine_theme.theme(),
        -- component_separators = {left = "╲", right = "╱"},
        -- section_separators = {left = " ", right = " "},
        component_separators = "|",
        section_separators = "",
        disabled_filetypes = {"NvimTree"}
    },
    sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch", "diff", "diagnostics"},
        lualine_c = {{"filename", path = 1}},
        lualine_x = {"encoding", "fileformat"},
        lualine_y = {"filetype"},
        lualine_z = {
            "location"
        }
    },
    inactive_sections = {
        lualine_a = {"filename"},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {
        lualine_a = {
            {
                "buffers",
                max_length = vim.o.columns,
                symbols = {alternate_file = ""}
            }
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    extensions = {}
}
