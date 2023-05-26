local nvim_tree = require("nvim-tree")
local nvim_tree_api = require("nvim-tree.api")

nvim_tree.setup {
    update_focused_file = {
        enable = true
    }
}

vim.keymap.set("n", "<leader>n", nvim_tree_api.tree.toggle, {desc = "Toggle file tree"})
