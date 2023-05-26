local yanky = require("yanky")

yanky.setup {}

vim.keymap.set({"n", "x"}, "p", "<Plug>(YankyPutAfter)", {desc = "Paste after"})
vim.keymap.set({"n", "x"}, "P", "<Plug>(YankyPutBefore)", {desc = "Paste before"})

vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)", {desc = "Cycle yank history forward"})
vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)", {desc = "Cycle yank history backward"})
