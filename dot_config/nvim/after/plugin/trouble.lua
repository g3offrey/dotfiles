local trouble = require("trouble")

trouble.setup {}
vim.keymap.set(
    "n",
    "<leader>xe",
    "<cmd>TroubleToggle workspace_diagnostics<CR>",
    {desc = "Toggle workspace diagnostics"}
)
vim.keymap.set("n", "<leader>xr", "<cmd>TroubleToggle lsp_references<CR>", {desc = "Toggle references"})
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle lsp_definitions<CR>", {desc = "Toggle definitions"})
vim.keymap.set("n", "<leader>xt", "<cmd>TroubleToggle lsp_type_definitions<CR>", {desc = "Toggle type definitions"})
vim.keymap.set("n", "<leader>xi", "<cmd>TroubleToggle lsp_implementations<CR>", {desc = "Toggle implementations"})
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", {desc = "Toggle quickfix"})
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleClose<CR>", {desc = "Close trouble"})
