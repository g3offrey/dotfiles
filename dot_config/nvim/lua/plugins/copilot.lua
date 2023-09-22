return {
    {
        lazy = false,
        "github/copilot.vim",
        keys = {
            {
                "<leader><tab>",
                mode = {"i"},
                'copilot#Accept("")',
                {expr = true, replace_keycodes = false, desc = "Accept copilot suggestion"}
            },
            {
                "<C-j>",
                mode = {"i"},
                "<Plug>(copilot-next)"
            },
            {
                "<C-k>",
                mode = {"i"},
                "<Plug>(copilot-previous)"
            },
            {
                "<C-d>",
                mode = {"i"},
                "<Plug>(copilot-dismiss)"
            },
            {
                "<C-s>",
                mode = {"i"},
                "<Plug>(copilot-suggest)"
            }
        },
        config = function()
            vim.g.copilot_no_tab_map = true
        end
    }
}
