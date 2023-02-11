local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system(
        {
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath
        }
    )
end
vim.opt.rtp:prepend(lazypath)

require("base")
require("keymaps")
require("autocmd")

return require("lazy").setup(
    {
        -- Telescope
        {
            "nvim-telescope/telescope.nvim",
            version = "0.1.x",
            dependencies = {{"nvim-lua/plenary.nvim"}}
        },
        {
            "nvim-telescope/telescope-frecency.nvim",
            dependencies = {"kkharji/sqlite.lua"}
        },
        "nvim-telescope/telescope-file-browser.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
        {"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
        -- Status bar
        {
            "nvim-lualine/lualine.nvim",
            dependencies = {"nvim-tree/nvim-web-devicons"}
        },
        -- Nvim tree
        {
            "nvim-tree/nvim-tree.lua",
            dependencies = {
                "nvim-tree/nvim-web-devicons"
            }
        },
        -- Syntax Highlight
        {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate"
        },
        "nvim-treesitter/nvim-treesitter-textobjects",
        -- Autoformat
        "jose-elias-alvarez/null-ls.nvim",
        -- Git integration
        "lewis6991/gitsigns.nvim",
        {"sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim"},
        "tpope/vim-fugitive",
        -- LSP
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "folke/neodev.nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-vsnip",
        "hrsh7th/vim-vsnip",
        "onsails/lspkind.nvim",
        "github/copilot.vim",
        "j-hui/fidget.nvim",
        -- Utils
        "windwp/nvim-autopairs",
        "windwp/nvim-ts-autotag",
        "mattn/emmet-vim",
        "Asheq/close-buffers.vim",
        "tpope/vim-sleuth",
        "tpope/vim-surround",
        "numToStr/Comment.nvim",
        "ggandor/leap.nvim",
        "theprimeagen/harpoon",
        "goolord/alpha-nvim",
        "gbprod/yanky.nvim",
        -- Colorschemes
        "folke/tokyonight.nvim",
        "rebelot/kanagawa.nvim",
        "navarasu/onedark.nvim",
        "EdenEast/nightfox.nvim",
        "sainnhe/gruvbox-material",
        "catppuccin/nvim",
        "nyoom-engineering/oxocarbon.nvim"
    }
)
