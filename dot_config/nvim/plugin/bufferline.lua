local bufferline = require("bufferline")

local nvim_tree_separator_color = vim.api.nvim_get_hl_by_name("WinSeparator", true)
local separator_color = nvim_tree_separator_color.background or "none"

bufferline.setup {
    options = {
        show_tab_indicators = false,
        show_close_icon = false,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "center",
                separator = true
            }
        },
        separator_style = "slant"
    },
    highlights = {
        offset_separator = {bg = separator_color, fg = nvim_tree_separator_color.foreground}
    }
}
