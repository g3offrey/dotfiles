local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("autoformat", {clear = true})

null_ls.setup {
    sources = {
        null_ls.builtins.formatting.prettier.with {
            condition = function(utils)
                return utils.has_file {"package.json"}
            end
        },
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.formatting.deno_fmt.with {
            condition = function(utils)
                return utils.has_file {"deno.json", "deno.jsonc"}
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
                    callback = function()
                        vim.lsp.buf.format({bufnr = bufnr, timeout_ms = 5000})
                    end
                }
            )
        end
    end
}
