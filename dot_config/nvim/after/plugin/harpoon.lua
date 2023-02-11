local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>hd", harpoon_mark.clear_all)
vim.keymap.set("n", "<leader>hh", harpoon_mark.toggle_file)
vim.keymap.set("n", "<leader>hl", harpoon_ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>hj", harpoon_ui.nav_next)
vim.keymap.set("n", "<leader>hk", harpoon_ui.nav_prev)
