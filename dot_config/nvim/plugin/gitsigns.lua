local gitsigns = require("gitsigns")
local gitsigns_actions = require("gitsigns.actions")

gitsigns.setup {}

vim.keymap.set("n", "gk", gitsigns_actions.prev_hunk)
vim.keymap.set("n", "gj", gitsigns_actions.next_hunk)
