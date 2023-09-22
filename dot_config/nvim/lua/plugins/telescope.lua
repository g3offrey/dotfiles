return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            {"nvim-telescope/telescope-fzf-native.nvim", build = "make"}
        },
        keys = {
            {
                "<leader><leader>",
                function()
                    require("telescope.builtin").git_files {
                        hidden = true
                    }
                end,
                desc = "Find in versioned files"
            },
            {
                "<leader>T",
                "<cmd>Telescope file_browser path=%:p:h<CR>",
                desc = "Browse files in current directory"
            },
            {
                "<leader>t",
                "<cmd>Telescope file_browser<CR>",
                desc = "Browse files in workplace"
            },
            {
                "<leader>f",
                function()
                    require("telescope.builtin").find_files()
                end,
                desc = "Find files"
            },
            {
                "<leader>q",
                function()
                    require("telescope.builtin").oldfiles(
                        {
                            cwd_only = true
                        }
                    )
                end,
                desc = "Find recently opened files"
            },
            {
                "<leader>v",
                function()
                    require("telescope.builtin").git_status()
                end,
                desc = "Find versioned files"
            },
            {
                "<leader>g",
                function()
                    require("telescope.builtin").live_grep()
                end,
                desc = "Find in files"
            },
            {
                "<leader>b",
                function()
                    require("telescope.builtin").buffers()
                end,
                desc = "Find buffers"
            },
            {
                "<leader>dl",
                function()
                    require("telescope.builtin").diagnostics()
                end,
                desc = "Find diagnostics"
            },
            {
                "<leader>r",
                function()
                    require("telescope.builtin").lsp_references({show_line = false})
                end,
                desc = "Find references"
            },
            {
                "<leader>p",
                function()
                    require("telescope.builtin").command_history()
                end,
                desc = "Command history"
            },
            {
                "<leader>e",
                function()
                    require("telescope.builtin").jumplist()
                end,
                desc = "Jumplist"
            },
            {
                "<leader>m",
                function()
                    require("telescope.builtin").marks()
                end,
                desc = "Marks"
            },
            {
                "<leader>s",
                function()
                    require("telescope.builtin").lsp_document_symbols({show_line = false})
                end,
                desc = "Find document symbols"
            },
            {
                "<leader>S",
                function()
                    require("telescope.builtin").lsp_dynamic_workspace_symbols({show_line = false})
                end,
                desc = "Find workspace symbols"
            },
            {
                "<leader><space>",
                function()
                    require("telescope.builtin").current_buffer_fuzzy_find()
                end,
                desc = "Fuzzy find"
            },
            {
                "<leader>ht",
                function()
                    require("telescope").extensions.harpoon.marks()
                end,
                desc = "List marks"
            },
            {
                "<leader>y",
                function()
                    require("telescope").extensions.yank_history.yank_history()
                end,
                desc = "Yank history"
            }
        },
        config = function()
            local telescope = require("telescope")
            local telescope_actions = require("telescope.actions")

            telescope.setup(
                {
                    defaults = {
                        results_title = false,
                        preview_title = false,
                        sorting_strategy = "ascending",
                        layout_config = {
                            horizontal = {
                                prompt_position = "top"
                            }
                        },
                        mappings = {
                            i = {
                                ["<C-j>"] = "move_selection_next",
                                ["<C-k>"] = "move_selection_previous",
                                ["<C-q>"] = "smart_send_to_qflist",
                                ["<C-t>"] = telescope_actions.delete_buffer
                            }
                        }
                    }
                }
            )

            telescope.load_extension("file_browser")
            telescope.load_extension("fzf")
            telescope.load_extension("ui-select")
        end
    },
    {
        "theprimeagen/harpoon",
        dependencies = "nvim-telescope/telescope.nvim",
        keys = {
            {
                "<leader>hd",
                function()
                    require("harpoon.mark").clear_all()
                end,
                desc = "Clear all marks"
            },
            {
                "<leader>hh",
                function()
                    require("harpoon.mark").toggle_file()
                end,
                desc = "Toggle mark"
            },
            {
                "<leader>hl",
                function()
                    require("harpoon.ui").toggle_quick_menu()
                end,
                desc = "Toggle quick menu"
            },
            {
                "<leader>hj",
                function()
                    require("harpoon.ui").nav_next()
                end,
                desc = "Next mark"
            },
            {
                "<leader>hk",
                function()
                    require("harpoon.ui").nav_prev()
                end,
                desc = "Previous mark"
            }
        },
        config = function()
            local telescope = require("telescope")

            telescope.load_extension("harpoon")
        end
    }
}
