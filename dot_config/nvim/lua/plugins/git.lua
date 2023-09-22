return {
    {
        "lewis6991/gitsigns.nvim",
        keys = {
            {
                "gk",
                function()
                    require("gitsigns.actions").prev_hunk()
                end,
                desc = "Previous hunk"
            },
            {
                "gj",
                function()
                    require("gitsigns.actions").next_hunk()
                end,
                desc = "Next hunk"
            }
        }
    },
    {"sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim"},
    "tpope/vim-fugitive"
}
