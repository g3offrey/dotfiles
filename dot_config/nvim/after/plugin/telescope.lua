local telescope = require("telescope")
local telescope_builtin = require("telescope.builtin")
local telescope_actions = require("telescope.actions")

telescope.setup(
    {
        defaults = {
            mappings = {
                i = {
                    ["<C-j>"] = "move_selection_next",
                    ["<C-k>"] = "move_selection_previous",
                    ["<C-q>"] = "smart_send_to_qflist",
                    ["<C-t>"] = telescope_actions.delete_buffer
                }
            }
        },
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case"
            }
        }
    }
)

telescope.load_extension("frecency")
telescope.load_extension("file_browser")
telescope.load_extension("fzf")
telescope.load_extension("ui-select")
telescope.load_extension("harpoon")
telescope.load_extension("yank_history")

vim.keymap.set(
    "n",
    "<leader><leader>",
    function()
        telescope_builtin.git_files {
            hidden = true
        }
    end
)
vim.keymap.set("n", "<leader>T", "<cmd>Telescope file_browser path=%:p:h<CR>")
vim.keymap.set("n", "<leader>t", "<cmd>Telescope file_browser<CR>")
vim.keymap.set("n", "<leader>f", telescope_builtin.find_files)
vim.keymap.set(
    "n",
    "<leader>q",
    function()
        telescope_builtin.oldfiles(
            {
                cwd_only = true
            }
        )
    end
)
vim.keymap.set(
    "n",
    "<leader><S-q>",
    function()
        telescope.extensions.frecency.frecency {
            workspace = "CWD"
        }
    end
)
vim.keymap.set("n", "<leader>v", telescope_builtin.git_status)
vim.keymap.set("n", "<leader>g", telescope_builtin.live_grep)
vim.keymap.set("n", "<leader>b", telescope_builtin.buffers)
vim.keymap.set("n", "<leader>dl", telescope_builtin.diagnostics)
vim.keymap.set("n", "<leader>p", telescope_builtin.commands)
vim.keymap.set("n", "<leader><S-p>", telescope_builtin.command_history)
vim.keymap.set("n", "<leader>e", telescope_builtin.jumplist)
vim.keymap.set("n", "<leader>m", telescope_builtin.marks)
vim.keymap.set("n", "<leader>s", telescope_builtin.lsp_document_symbols)
vim.keymap.set("n", "<leader><S-s>", telescope_builtin.lsp_dynamic_workspace_symbols)
vim.keymap.set("n", "<leader>r", telescope_builtin.lsp_references)
vim.keymap.set("n", "<leader>d", telescope_builtin.lsp_definitions)
vim.keymap.set("n", "<leader>td", telescope_builtin.lsp_type_definitions)
vim.keymap.set("n", "<leader>i", telescope_builtin.lsp_implementations)
vim.keymap.set("n", "<leader><space>", telescope_builtin.current_buffer_fuzzy_find)
vim.keymap.set("n", "<leader>ht", telescope.extensions.harpoon.marks)
vim.keymap.set("n", "<leader>y", telescope.extensions.yank_history.yank_history)

vim.api.nvim_set_hl(0, "TelescopeBorder", {bg = "none"})
