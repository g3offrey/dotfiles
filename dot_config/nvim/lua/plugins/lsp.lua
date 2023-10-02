local servers = {
    "astro",
    "bashls",
    "cssls",
    "denols",
    "dockerls",
    "docker_compose_language_service",
    "eslint",
    "gopls",
    "html",
    "prismals",
    "graphql",
    "rust_analyzer",
    "lua_ls",
    "svelte",
    "tailwindcss",
    "tsserver",
    "yamlls",
    "ansiblels",
    "volar"
}

local augroup = vim.api.nvim_create_augroup("lsp", {clear = true})

function set_keybinds()
    vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, {desc = "Signature help"})
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {desc = "Hover"})
    vim.keymap.set("n", "gtd", vim.lsp.buf.type_definition, {desc = "Go to type definition"})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {desc = "Go to definition"})
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {desc = "Go to declaration"})
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {desc = "Go to implementation"})
    vim.keymap.set(
        {"n", "v"},
        "<leader>a",
        function()
            vim.lsp.buf.code_action()
        end,
        {desc = "Code action"}
    )
    vim.keymap.set("n", "<leader>c", vim.lsp.buf.rename, {desc = "Rename"})
    vim.keymap.set(
        "n",
        "<leader>dd",
        function()
            vim.diagnostic.open_float({border = "single"})
        end,
        {desc = "Open Diagnostics"}
    )
    vim.keymap.set(
        "n",
        "<leader>dj",
        function()
            vim.diagnostic.goto_next({float = {border = "single"}})
        end,
        {desc = "Next Diagnostic"}
    )
    vim.keymap.set(
        "n",
        "<leader>dk",
        function()
            vim.diagnostic.goto_prev({float = {border = "single"}})
        end,
        {desc = "Previous Diagnostic"}
    )
end

function set_autocmds(client, bufnr)
    if client.supports_method("textDocument/documentHighlight") then
        vim.api.nvim_create_autocmd(
            "CursorHold",
            {
                buffer = bufnr,
                group = augroup,
                callback = function()
                    vim.lsp.buf.document_highlight()
                end
            }
        )
        vim.api.nvim_create_autocmd(
            "CursorMoved",
            {
                buffer = bufnr,
                group = augroup,
                callback = function()
                    vim.lsp.buf.clear_references()
                end
            }
        )
    end
end

return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp"
        },
        config = function()
            local mason = require("mason")
            mason.setup {}
            local mason_lsp = require("mason-lspconfig")
            mason_lsp.setup {
                ensure_installed = servers
            }

            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local function on_attach(client, bufnr)
                set_keybinds()
                set_autocmds(client, bufnr)
            end

            for _, server in ipairs(mason_lsp.get_installed_servers()) do
                lspconfig[server].setup {
                    on_attach = on_attach,
                    capabilities = capabilities
                }
            end

            -- override server config
            lspconfig.denols.setup {
                on_attach = on_attach,
                capabilities = capabilities,
                root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc")
            }

            lspconfig.tsserver.setup {
                on_attach = on_attach,
                capabilities = capabilities,
                root_dir = lspconfig.util.root_pattern("package.json")
            }

            lspconfig.rust_analyzer.setup {
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    ["rust-analyzer"] = {
                        checkOnSave = {
                            command = "clippy"
                        }
                    }
                }
            }

            lspconfig.gopls.setup {
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    gopls = {
                        staticcheck = true
                    }
                }
            }

            lspconfig.yamlls.setup {
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    yaml = {
                        schemas = {
                            ["https://json.schemastore.org/github-workflow"] = ".github/workflows/*.y*ml"
                        }
                    }
                }
            }

            -- customize lsp handlers
            vim.lsp.handlers["textDocument/hover"] =
                vim.lsp.with(
                vim.lsp.handlers.hover,
                {
                    border = "single"
                }
            )

            vim.lsp.handlers["textDocument/signatureHelp"] =
                vim.lsp.with(
                vim.lsp.handlers.signature_help,
                {
                    border = "single"
                }
            )
        end
    },
    {"folke/neodev.nvim", dependencies = "neovim/nvim-lspconfig", opts = {}},
    {"j-hui/fidget.nvim", dependencies = "neovim/nvim-lspconfig", opts = {}, tag = "legacy"},
    {
        "ray-x/go.nvim",
        dependencies = {
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter"
        },
        opts = {},
        event = {"CmdlineEnter"},
        ft = {"go", "gomod"},
        build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    },
    {
        "nvimtools/none-ls.nvim",
        opts = function()
            local null_ls = require("null-ls")

            return {
                sources = {
                    null_ls.builtins.formatting.prettier.with {
                        extra_filetypes = {"svelte", "astro"},
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
                        vim.api.nvim_create_autocmd(
                            "BufWritePre",
                            {
                                group = augroup,
                                buffer = bufnr,
                                callback = function()
                                    vim.lsp.buf.format({async = false})
                                end
                            }
                        )
                    end
                end
            }
        end
    }
}
