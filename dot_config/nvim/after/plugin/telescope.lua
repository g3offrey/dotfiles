local telescope = require("telescope")
local telescope_builtin = require("telescope.builtin")
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
telescope.load_extension("harpoon")
telescope.load_extension("yank_history")

vim.keymap.set(
    "n",
    "<leader><leader>",
    function()
        telescope_builtin.git_files {
            hidden = true
        }
    end,
    {
        desc = "Find in versioned files"
    }
)
vim.keymap.set(
    "n",
    "<leader>T",
    "<cmd>Telescope file_browser path=%:p:h<CR>",
    {desc = "Browse files in current directory"}
)
vim.keymap.set("n", "<leader>t", "<cmd>Telescope file_browser<CR>", {desc = "Browse files in workplace"})
vim.keymap.set("n", "<leader>f", telescope_builtin.find_files, {desc = "Find files"})
vim.keymap.set(
    "n",
    "<leader>q",
    function()
        telescope_builtin.oldfiles(
            {
                cwd_only = true
            }
        )
    end,
    {
        desc = "Find recently opened files"
    }
)
vim.keymap.set("n", "<leader>v", telescope_builtin.git_status, {desc = "Find versioned files"})
vim.keymap.set("n", "<leader>g", telescope_builtin.live_grep, {desc = "Find in files"})
vim.keymap.set("n", "<leader>b", telescope_builtin.buffers, {desc = "Find buffers"})
vim.keymap.set("n", "<leader>dl", telescope_builtin.diagnostics, {desc = "Find diagnostics"})
vim.keymap.set("n", "<leader>p", telescope_builtin.command_history, {desc = "Command history"})
vim.keymap.set("n", "<leader>e", telescope_builtin.jumplist, {desc = "Jumplist"})
vim.keymap.set("n", "<leader>m", telescope_builtin.marks, {desc = "Marks"})
vim.keymap.set("n", "<leader>s", telescope_builtin.lsp_document_symbols, {desc = "Find document symbols"})
vim.keymap.set("n", "<leader>S", telescope_builtin.lsp_dynamic_workspace_symbols, {desc = "Find workspace symbols"})
vim.keymap.set("n", "<leader><space>", telescope_builtin.current_buffer_fuzzy_find, {desc = "Fuzzy find"})
vim.keymap.set("n", "<leader>ht", telescope.extensions.harpoon.marks, {desc = "List marks"})
vim.keymap.set("n", "<leader>y", telescope.extensions.yank_history.yank_history, {desc = "Yank history"})

vim.api.nvim_set_hl(0, "TelescopeBorder", {bg = "none"})
