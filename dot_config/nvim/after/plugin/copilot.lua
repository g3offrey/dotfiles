vim.keymap.set("i", "<leader><tab>", 'copilot#Accept("")', {expr = true, replace_keycodes = false})
vim.keymap.set("i", "<C-j>", "<Plug>(copilot-next)")
vim.keymap.set("i", "<C-k>", "<Plug>(copilot-previous)")
vim.keymap.set("i", "<C-d>", "<Plug>(copilot-dismiss)")
vim.keymap.set("i", "<C-s>", "<Plug>(copilot-suggest)")

vim.g.copilot_no_tab_map = true