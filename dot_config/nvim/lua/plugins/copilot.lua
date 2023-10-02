return {
    {
        "github/copilot.vim",
        config = function()
            vim.g.copilot_no_tab_map = true

            vim.keymap.set(
                "i",
                "<C-j>",
                'copilot#Accept("")',
                {expr = true, replace_keycodes = false, desc = "Accept copilot suggestion"}
            )
            vim.keymap.set("i", "<C-l>", "<Plug>(copilot-next)")
            vim.keymap.set("i", "<C-h>", "<Plug>(copilot-previous)")
            vim.keymap.set("i", "<C-d>", "<Plug>(copilot-dismiss)")
            vim.keymap.set("i", "<C-k>", "<Plug>(copilot-suggest)")
        end
    }
}
