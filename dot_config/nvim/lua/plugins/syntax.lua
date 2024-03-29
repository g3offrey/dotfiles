return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "nvim-treesitter/nvim-treesitter-context"
        },
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup(
                {
                    ensure_installed = "all",
                    highlight = {
                        enable = true
                    },
                    indent = {
                        enable = true
                    },
                    incremental_selection = {
                        enable = true,
                        keymaps = {
                            init_selection = "<S-Right>",
                            node_incremental = "<S-Right>",
                            scope_incremental = "<S-Up>",
                            node_decremental = "<S-Left>"
                        }
                    },
                    textobjects = {
                        select = {
                            enable = true,
                            lookahead = true,
                            keymaps = {
                                ["aa"] = "@parameter.outer",
                                ["ia"] = "@parameter.inner",
                                ["af"] = "@function.outer",
                                ["if"] = "@function.inner",
                                ["ac"] = "@class.outer",
                                ["ic"] = "@class.inner"
                            }
                        },
                        move = {
                            enable = true,
                            set_jumps = true,
                            goto_next_start = {
                                [")m"] = "@function.outer",
                                ["))"] = "@class.outer"
                            },
                            goto_next_end = {
                                [")M"] = "@function.outer",
                                [")("] = "@class.outer"
                            },
                            goto_previous_start = {
                                ["(m"] = "@function.outer",
                                ["(("] = "@class.outer"
                            },
                            goto_previous_end = {
                                ["(M"] = "@function.outer",
                                ["()"] = "@class.outer"
                            }
                        }
                    }
                }
            )
        end
    },
    {"windwp/nvim-autopairs", dependencies = "nvim-treesitter/nvim-treesitter", opts = {}},
    {"windwp/nvim-ts-autotag", dependencies = "nvim-treesitter/nvim-treesitter", opts = {}}
}
