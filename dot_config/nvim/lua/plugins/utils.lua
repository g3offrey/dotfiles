return {
    "mattn/emmet-vim",
    "Asheq/close-buffers.vim",
    "tpope/vim-sleuth",
    "tpope/vim-surround",
    {"numToStr/Comment.nvim", config = true},
    {
        "ggandor/leap.nvim",
        config = function()
            local leap = require("leap")

            leap.add_default_mappings {}
        end
    },
    {
        "theprimeagen/harpoon",
        dependencies = "nvim-telescope/telescope.nvim",
        config = function()
            local harpoon_mark = require("harpoon.mark")
            local harpoon_ui = require("harpoon.ui")
            local telescope = require("telescope")

            telescope.load_extension("harpoon")

            vim.keymap.set("n", "<leader>hd", harpoon_mark.clear_all, {desc = "Clear all marks"})
            vim.keymap.set("n", "<leader>hh", harpoon_mark.toggle_file, {desc = "Toggle mark"})
            vim.keymap.set("n", "<leader>hl", harpoon_ui.toggle_quick_menu, {desc = "Toggle quick menu"})
            vim.keymap.set("n", "<leader>hj", harpoon_ui.nav_next, {desc = "Next mark"})
            vim.keymap.set("n", "<leader>hk", harpoon_ui.nav_prev, {desc = "Previous mark"})
        end
    },
    "goolord/alpha-nvim",
    {
        "gbprod/yanky.nvim",
        dependencies = "nvim-telescope/telescope.nvim",
        config = function()
            local yanky = require("yanky")
            local telescope = require("telescope")

            yanky.setup {}
            telescope.load_extension("yank_history")

            vim.keymap.set({"n", "x"}, "p", "<Plug>(YankyPutAfter)", {desc = "Paste after"})
            vim.keymap.set({"n", "x"}, "P", "<Plug>(YankyPutBefore)", {desc = "Paste before"})

            vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)", {desc = "Cycle yank history forward"})
            vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)", {desc = "Cycle yank history backward"})
        end
    },
    "christoomey/vim-tmux-navigator",
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300

            local wk = require("which-key")

            wk.register()
        end
    }
}
