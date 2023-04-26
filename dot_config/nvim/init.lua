require("base")
require("keymaps")
require("autocmd")

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

require("lazy").setup(
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
        "nvim-treesitter/nvim-treesitter-context",
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
        "hrsh7th/cmp-nvim-lsp-document-symbol",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-vsnip",
        "hrsh7th/vim-vsnip",
        "onsails/lspkind.nvim",
        "github/copilot.vim",
        "j-hui/fidget.nvim",
        "folke/trouble.nvim",
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
        "christoomey/vim-tmux-navigator",
        -- Colorschemes
        {
            "rebelot/kanagawa.nvim",
            priority = 1000,
            config = function()
                local kanagawa = require("kanagawa")

                kanagawa.setup {
                    theme = "dragon",
                    transparent = false,
                    colors = {
                        theme = {
                            all = {
                                ui = {
                                    bg_gutter = "none"
                                }
                            }
                        }
                    },
                    overrides = function(colors)
                        local theme = colors.theme

                        return {
                            NormalFloat = {bg = "none"},
                            FloatBorder = {bg = "none"},
                            FloatTitle = {bg = "none"},
                            -- Save an hlgroup with dark background and dimmed foreground
                            -- so that you can use it where your still want darker windows.
                            -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
                            NormalDark = {fg = theme.ui.fg_dim, bg = theme.ui.bg_m3},
                            -- Popular plugins that open floats will link to NormalFloat by default;
                            -- set their background accordingly if you wish to keep them dark and borderless
                            LazyNormal = {bg = theme.ui.bg_m3, fg = theme.ui.fg_dim},
                            MasonNormal = {bg = theme.ui.bg_m3, fg = theme.ui.fg_dim},
                            TelescopeTitle = {fg = theme.ui.special, bold = true},
                            TelescopePromptNormal = {bg = theme.ui.bg_p1},
                            TelescopePromptBorder = {fg = theme.ui.bg_p1, bg = theme.ui.bg_p1},
                            TelescopeResultsNormal = {fg = theme.ui.fg_dim, bg = theme.ui.bg_m1},
                            TelescopeResultsBorder = {fg = theme.ui.bg_m1, bg = theme.ui.bg_m1},
                            TelescopePreviewNormal = {bg = theme.ui.bg_dim},
                            TelescopePreviewBorder = {bg = theme.ui.bg_dim, fg = theme.ui.bg_dim},
                            Pmenu = {fg = theme.ui.shade0, bg = theme.ui.bg_p1},
                            PmenuSel = {fg = "NONE", bg = theme.ui.bg_p2},
                            PmenuSbar = {bg = theme.ui.bg_m1},
                            PmenuThumb = {bg = theme.ui.bg_p2}
                        }
                    end
                }

                vim.cmd.colorscheme("kanagawa-dragon")
            end
        }
    }
)
