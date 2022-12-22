local augroup = vim.api.nvim_create_augroup("autocd", {clear = true})
vim.api.nvim_create_autocmd("VimEnter", {group = augroup, command = "silent! cd %:p:h"})
