return {
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            local gitsigns = require("gitsigns")
            local gitsigns_actions = require("gitsigns.actions")

            gitsigns.setup {}

            vim.keymap.set("n", "gk", gitsigns_actions.prev_hunk, {desc = "Previous hunk"})
            vim.keymap.set("n", "gj", gitsigns_actions.next_hunk, {desc = "Next hunk"})
        end
    },
    {"sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim"},
    "tpope/vim-fugitive"
}
