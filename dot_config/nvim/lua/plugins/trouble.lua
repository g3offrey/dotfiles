return {
    {
        "folke/trouble.nvim",
        config = function()
            local trouble = require("trouble")

            trouble.setup {}
            vim.keymap.set(
                "n",
                "<leader>xe",
                "<cmd>Trouble workspace_diagnostics<CR>",
                {desc = "Toggle workspace diagnostics"}
            )
            vim.keymap.set("n", "<leader>xr", "<cmd>Trouble lsp_references<CR>", {desc = "Toggle references"})
            vim.keymap.set("n", "<leader>xd", "<cmd>Trouble lsp_definitions<CR>", {desc = "Toggle definitions"})
            vim.keymap.set(
                "n",
                "<leader>xt",
                "<cmd>Trouble lsp_type_definitions<CR>",
                {desc = "Toggle type definitions"}
            )
            vim.keymap.set("n", "<leader>xi", "<cmd>Trouble lsp_implementations<CR>", {desc = "Toggle implementations"})
            vim.keymap.set("n", "<leader>xq", "<cmd>Trouble quickfix<CR>", {desc = "Toggle quickfix"})
            vim.keymap.set("n", "<leader>xx", "<cmd>TroubleClose<CR>", {desc = "Close trouble"})
        end
    }
}
