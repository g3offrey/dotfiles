return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function()
            local lualine = require("lualine")
            local theme = require("lualine.themes.kanagawa")
            theme.normal.b.bg = "none"
            theme.normal.c.bg = "none"

            lualine.setup {
                options = {
                    theme = theme,
                    section_separators = {left = " ", right = " "},
                    component_separators = "",
                    globalstatus = true,
                    disabled_filetypes = {
                        statusline = {
                            "NvimTree"
                        },
                        winbar = {
                            "NvimTree"
                        }
                    }
                },
                sections = {
                    lualine_a = {{"mode"}},
                    lualine_b = {"diagnostics"},
                    lualine_c = {{"filename", path = 1}},
                    lualine_x = {"branch", "diff"},
                    lualine_y = {"encoding", "fileformat", "filetype"},
                    lualine_z = {{"progress"}}
                },
                winbar = {
                    lualine_a = {
                        {"buffers", symbols = {alternate_file = ""}}
                    }
                }
            }
        end
    }
}
