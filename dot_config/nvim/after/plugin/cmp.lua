local cmp = require("cmp")
local lspkind = require("lspkind")

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup(
    {
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end
        },
        window = {
            completion = cmp.config.window.bordered({border = "rounded"}),
            documentation = cmp.config.window.bordered({border = "rounded"})
        },
        mapping = cmp.mapping.preset.insert(
            {
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({select = false, behavior = cmp.ConfirmBehavior.Replace}),
                ["<Tab>"] = cmp.mapping(
                    function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif vim.fn["vsnip#available"](1) == 1 then
                            feedkey("<Plug>(vsnip-expand-or-jump)", "")
                        else
                            fallback()
                        end
                    end,
                    {"i", "s"}
                ),
                ["<S-Tab>"] = cmp.mapping(
                    function()
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                            feedkey("<Plug>(vsnip-jump-prev)", "")
                        end
                    end,
                    {"i", "s"}
                )
            }
        ),
        sources = cmp.config.sources(
            {
                {name = "nvim_lsp"}
            },
            {
                {name = "vsnip"}
            },
            {
                {name = "buffer"}
            }
        ),
        formatting = {
            fields = {"kind", "abbr", "menu"},
            format = function(entry, vim_item)
                local kind = lspkind.cmp_format({mode = "symbol_text"})(entry, vim_item)
                local strings = vim.split(kind.kind, "%s", {trimempty = true})
                kind.kind = " " .. (strings[1] or "") .. " "
                kind.menu = "    (" .. (strings[2] or "") .. ")"

                return kind
            end
        }
    }
)

cmp.setup.cmdline(
    {"/", "?"},
    {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            {name = "buffer"}
        }
    }
)

cmp.setup.cmdline(
    ":",
    {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources(
            {
                {name = "path"}
            },
            {
                {name = "cmdline"}
            }
        )
    }
)
