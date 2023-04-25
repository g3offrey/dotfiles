local trouble = require('trouble')

trouble.setup {}
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle workspace_diagnostics<CR>")
vim.keymap.set("n", "<leader>xr", "<cmd>TroubleToggle lsp_references<CR>")
vim.keymap.set("n", "<leader>xg", "<cmd>TroubleToggle lsp_definitions<CR>")
vim.keymap.set("n", "<leader>xt", "<cmd>TroubleToggle lsp_type_definitions<CR>")
vim.keymap.set("n", "<leader>xi", "<cmd>TroubleToggle lsp_implementations<CR>")
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<CR>")
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleClose<CR>")
