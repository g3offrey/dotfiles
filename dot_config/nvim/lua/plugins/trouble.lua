return {
    {
        "folke/trouble.nvim",
        keys = {
            {
                "<leader>xe",
                "<cmd>Trouble workspace_diagnostics<CR>",
                desc = "Toggle workspace diagnostics"
            },
            {"<leader>xr", "<cmd>Trouble lsp_references<CR>", desc = "Toggle references"},
            {"<leader>xd", "<cmd>Trouble lsp_definitions<CR>", desc = "Toggle definitions"},
            {
                "<leader>xt",
                "<cmd>Trouble lsp_type_definitions<CR>",
                desc = "Toggle type definitions"
            },
            {"<leader>xi", "<cmd>Trouble lsp_implementations<CR>", desc = "Toggle implementations"},
            {"<leader>xq", "<cmd>Trouble quickfix<CR>", desc = "Toggle quickfix"},
            {"<leader>xx", "<cmd>TroubleClose<CR>", desc = "Close trouble"}
        },
        opts = {}
    }
}
