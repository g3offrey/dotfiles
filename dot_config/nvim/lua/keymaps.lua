-- escape
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("t", "jj", "<C-\\><C-n>")

-- handle buffers
local buffers = require("g3offrey.buffers")
vim.keymap.set("n", "ta", "<cmd>Bdelete all<CR>", {desc = "Delete all buffers"})
vim.keymap.set("n", "to", "<cmd>Bdelete hidden<CR>", {desc = "Delete others buffers"})
vim.keymap.set("n", "tt", buffers.delete_buffer_and_go_to_previous_if_exists, {desc = "Delete current buffer"})
vim.keymap.set("n", "tk", "<cmd>bprevious<CR>", {desc = "Go to previous buffer"})
vim.keymap.set("n", "tj", "<cmd>bnext<CR>", {desc = "Go to next buffer"})

-- scroll
vim.keymap.set("n", "ff", "<C-f>", {desc = "Scroll down 1"})
vim.keymap.set("n", "fj", "<C-d>zz", {desc = "Scroll down 1/2"})
vim.keymap.set("n", "fk", "<C-u>zz", {desc = "Scroll up 1/2"})

-- windows
vim.keymap.set("n", "<C-h>", "<C-w>h", {desc = "Go to left split"})
vim.keymap.set("n", "<C-l>", "<C-w>l", {desc = "Go to right split"})
vim.keymap.set("n", "<C-j>", "<C-w>j", {desc = "Go to bottom split"})
vim.keymap.set("n", "<C-k>", "<C-w>k", {desc = "Go to top split"})
vim.keymap.set("n", "<C-q>", "<C-w>q", {desc = "Close current split"})
vim.keymap.set("n", "<C-a>", "<C-w>o", {desc = "Close other splits"})
vim.keymap.set("n", "<M-Right>", "<cmd>vertical resize +2<CR>", {desc = "Increase split width"})
vim.keymap.set("n", "<M-Left>", "<cmd>vertical resize -2<CR>", {desc = "Decrease split width"})
vim.keymap.set("n", "<M-Up>", "<cmd>resize -2<CR>", {desc = "Decrease split height"})
vim.keymap.set("n", "<M-Down>", "<cmd>resize +2<CR>", {desc = "Increase split height"})
vim.keymap.set("n", "<C-w>+", "<C-w>_<C-w>|", {desc = "Maximize current split"})
vim.keymap.set("n", "<leader>@", "<C-w>p", {desc = "Go to previous split"})

-- save file
vim.keymap.set("n", "<leader>w", "<cmd>w ++p<CR>", {desc = "Save file (with path)"})

-- search word undercursor
vim.keymap.set("v", "/", "y/<C-R>0<CR>")

-- delmarks
vim.keymap.set(
    "n",
    "<leader>M",
    function()
        vim.cmd("delmarks A-Z0-9")
        vim.cmd("wshada!")
    end,
    {desc = "Delete all marks"}
)

-- diff
vim.keymap.set("n", "ggh", "<cmd>diffget //2<CR>", {desc = "Get from left"})
vim.keymap.set("n", "ggl", "<cmd>diffget //3<CR>", {desc = "Get from right"})
vim.keymap.set("n", "ggj", "]c", {desc = "Next diff"})
vim.keymap.set("n", "ggk", "[c", {desc = "Previous diff"})

-- yank_path
local yank_p = require("g3offrey.yank_path")
vim.keymap.set("n", "<leader>y", yank_p.copy_file_path, {desc = "Copy file path"})
