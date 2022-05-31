local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("autoformat", {clear = true})

null_ls.setup {
    sources = {
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.formatting.deno_fmt.with {
            condition = function(utils)
                return utils.has_file {"deno.json"}
            end
        }
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
            vim.api.nvim_create_autocmd(
                "BufWritePre",
                {
                    group = augroup,
                    buffer = bufnr,
                    -- command = "silent! lua vim.lsp.buf.format({ bufnr = bufnr })"
                    callback = function()
                        vim.lsp.buf.format({bufnr = bufnr})
                    end
                }
            )
        end
    end
}
