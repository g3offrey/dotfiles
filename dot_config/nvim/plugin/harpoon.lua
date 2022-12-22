local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>hh", harpoon_mark.add_file)
vim.keymap.set("n", "<leader>hl", harpoon_ui.toggle_quick_menu)
