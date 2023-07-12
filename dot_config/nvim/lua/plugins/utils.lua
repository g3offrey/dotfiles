return {
    "mattn/emmet-vim",
    "Asheq/close-buffers.vim",
    "tpope/vim-sleuth",
    "tpope/vim-surround",
    {"numToStr/Comment.nvim", config = true},
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            {
                "s",
                mode = {"n", "x", "o"},
                function()
                    require("flash").jump()
                end,
                {
                    desc = "Flash jump"
                }
            },
            {
                "S",
                mode = {"n", "o", "x"},
                function()
                    require("flash").treesitter()
                end,
                {
                    desc = "Flash treesitter"
                }
            }
        }
    },
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
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    },
    {
        "szw/vim-maximizer",
        config = function()
            vim.keymap.set("n", "<C-w>m", "<cmd>MaximizerToggle<CR>", {desc = "Maximize current window"})
        end
    }
}
