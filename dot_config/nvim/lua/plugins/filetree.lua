return {
    {
        "stevearc/oil.nvim",
        opts = {
            float = {
                border = "single"
            }
        },
        dependencies = {"nvim-tree/nvim-web-devicons"},
        keys = {
            {
                "<leader>n",
                function()
                    require("oil").toggle_float()
                end,
                desc = "Toggle file tree"
            }
        }
    }
}
