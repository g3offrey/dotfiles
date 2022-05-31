local augroup = vim.api.nvim_create_augroup("autocd", {clear = true})
vim.api.nvim_create_autocmd("VimEnter", {group = augroup, command = "silent! cd %:p:h"})

local augroup_diagnostics = vim.api.nvim_create_augroup("diagnostics", {clear = true})
vim.api.nvim_create_autocmd(
    "CursorHold",
    {
        group = augroup_diagnostics,
        callback = function()
            vim.diagnostic.open_float({focusable = false})
        end
    }
)
