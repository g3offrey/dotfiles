-- escape
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("t", "jj", "<C-\\><C-n>")

-- yanking
vim.keymap.set({"n", "v"}, "<S-y>", '"+y')
vim.keymap.set({"n", "v"}, "<S-p>", '"+p')

-- handle buffers
local buffers = require("g3offrey.buffers")
vim.keymap.set("n", "ta", "<cmd>Bdelete all<CR>")
vim.keymap.set("n", "to", "<cmd>Bdelete hidden<CR>")
vim.keymap.set("n", "tt", buffers.delete_buffer_and_go_to_previous_if_exists)
vim.keymap.set("n", "tk", "<cmd>bprevious<CR>")
vim.keymap.set("n", "tj", "<cmd>bnext<CR>")

-- scroll
vim.keymap.set("n", "ff", "<C-f>")
vim.keymap.set("n", "fj", "<C-d>zz")
vim.keymap.set("n", "fk", "<C-u>zz")

-- windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-q>", "<C-w>q")
vim.keymap.set("n", "<C-p>", "<C-w>p")
vim.keymap.set("n", "<C-a>", "<C-w>o")
vim.keymap.set("n", "<leader>@", "<C-w>w")

-- search word undercursor
vim.keymap.set("v", "/", "y/<C-R>0<CR>")

-- delmarks
vim.keymap.set(
    "n",
    "<leader>M",
    function()
        vim.cmd("delmarks A-Z0-9")
        vim.cmd("wshada!")
    end
)

-- yank_path
local yank_p = require("g3offrey.yank_path")
vim.keymap.set("n", "<leader>y", yank_p.copy_file_path)

-- copilot
vim.keymap.set("i", "<C-j>", 'copilot#Accept("")', {replace_keycodes = false, expr = true})
