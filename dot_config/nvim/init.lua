require("base")
require("keymaps")
require("autocmd")

return require("packer").startup(
    function(use)
        use "wbthomason/packer.nvim"

        -- Telescope
        use {
            "nvim-telescope/telescope.nvim",
            tag = "0.1.0",
            requires = {{"nvim-lua/plenary.nvim"}}
        }
        use {
            "nvim-telescope/telescope-frecency.nvim",
            requires = {"kkharji/sqlite.lua"},
            after = "telescope.nvim"
        }
        use {"nvim-telescope/telescope-file-browser.nvim"}
        use {"nvim-telescope/telescope-ui-select.nvim"}

        -- Status bar
        use {"akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons"}
        use {
            "nvim-lualine/lualine.nvim",
            requires = {"nvim-tree/nvim-web-devicons"}
        }

        -- Nvim tree
        use {
            "nvim-tree/nvim-tree.lua",
            requires = {
                "nvim-tree/nvim-web-devicons"
            }
        }

        -- Syntax Highlight
        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate"
        }
        use {
            "nvim-treesitter/nvim-treesitter-textobjects",
            after = "nvim-treesitter"
        }

        -- Autoformat
        use "jose-elias-alvarez/null-ls.nvim"

        -- Git integration
        use "lewis6991/gitsigns.nvim"
        use {"sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim"}
        use "tpope/vim-fugitive"

        -- LSP
        use "neovim/nvim-lspconfig"
        use "williamboman/mason.nvim"
        use "williamboman/mason-lspconfig.nvim"
        use "folke/neodev.nvim"
        use "hrsh7th/nvim-cmp"
        use "hrsh7th/cmp-nvim-lsp"
        use "hrsh7th/cmp-buffer"
        use "hrsh7th/cmp-path"
        use "hrsh7th/cmp-cmdline"
        use "hrsh7th/cmp-vsnip"
        use "hrsh7th/vim-vsnip"
        use "onsails/lspkind.nvim"
        use "github/copilot.vim"
        use "j-hui/fidget.nvim"

        -- Utils
        use "windwp/nvim-autopairs"
        use "Asheq/close-buffers.vim"
        use "tpope/vim-sleuth"
        use "tpope/vim-surround"
        use "numToStr/Comment.nvim"
        use "ggandor/leap.nvim"
        use "theprimeagen/harpoon"

        -- Colorschemes
        use "folke/tokyonight.nvim"
        use "rebelot/kanagawa.nvim"
        use "navarasu/onedark.nvim"
        use "EdenEast/nightfox.nvim"
        use "sainnhe/gruvbox-material"
        use "rose-pine/neovim"
    end
)
