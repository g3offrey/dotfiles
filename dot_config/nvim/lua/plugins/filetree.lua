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
                mode = {"n"},
                desc = "Toggle file tree"
            }
        }
    }
    -- {
    --     "nvim-tree/nvim-tree.lua",
    --     dependencies = {"nvim-tree/nvim-web-devicons"},
    --     config = function()
    --         local nvim_tree = require("nvim-tree")
    --         local nvim_tree_api = require("nvim-tree.api")
    --
    --         nvim_tree.setup {
    --             update_focused_file = {
    --                 enable = true
    --             },
    --             hijack_directories = {
    --                 enable = true,
    --                 auto_open = false
    --             }
    --         }
    --
    --         vim.keymap.set("n", "<leader>n", nvim_tree_api.tree.toggle, {desc = "Toggle file tree"})
    --     end
    -- }
}
