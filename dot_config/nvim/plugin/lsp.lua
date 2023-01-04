local fidget = require("fidget")
fidget.setup {}

local neodev = require("neodev")
neodev.setup {}

local servers = {
    "html",
    "cssls",
    "dockerls",
    "eslint",
    "emmet_ls",
    "gopls",
    "rust_analyzer",
    "tsserver",
    "astro",
    "svelte",
    "prismals",
    "sumneko_lua",
    "tailwindcss",
    "denols"
}

local mason = require("mason")
local mason_lsp = require("mason-lspconfig")
mason.setup {}
mason_lsp.setup {
    ensure_installed = servers
}

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local function on_attach()
    vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help)
    vim.keymap.set("n", "K", vim.lsp.buf.hover)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
    vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action)
    vim.keymap.set("n", "<leader>c", vim.lsp.buf.rename)
    vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float)
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
    root_dir = lspconfig.util.root_pattern("deno.json")
}

lspconfig.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern("package.json")
}

-- customize lsp handlers
vim.lsp.handlers["textDocument/hover"] =
    vim.lsp.with(
    vim.lsp.handlers.hover,
    {
        border = "rounded"
    }
)

vim.lsp.handlers["textDocument/signatureHelp"] =
    vim.lsp.with(
    vim.lsp.handlers.signature_help,
    {
        border = "rounded"
    }
)
