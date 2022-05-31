-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function("has", {"nvim-0.5"}) ~= 1 then
    vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
    return
end

vim.api.nvim_command("packadd packer.nvim")

local no_errors, error_msg =
    pcall(
    function()
        _G._packer = _G._packer or {}
        _G._packer.inside_compile = true

        local time
        local profile_info
        local should_profile = false
        if should_profile then
            local hrtime = vim.loop.hrtime
            profile_info = {}
            time = function(chunk, start)
                if start then
                    profile_info[chunk] = hrtime()
                else
                    profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
                end
            end
        else
            time = function(chunk, start)
            end
        end

        local function save_profiles(threshold)
            local sorted_times = {}
            for chunk_name, time_taken in pairs(profile_info) do
                sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
            end
            table.sort(
                sorted_times,
                function(a, b)
                    return a[2] > b[2]
                end
            )
            local results = {}
            for i, elem in ipairs(sorted_times) do
                if not threshold or threshold and elem[2] > threshold then
                    results[i] = elem[1] .. " took " .. elem[2] .. "ms"
                end
            end
            if threshold then
                table.insert(
                    results,
                    "(Only showing plugins that took longer than " .. threshold .. " ms " .. "to load)"
                )
            end

            _G._packer.profile_output = results
        end

        time([[Luarocks path setup]], true)
        local package_path_str =
            "/Users/geoffrey/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/geoffrey/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/geoffrey/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/geoffrey/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
        local install_cpath_pattern = "/Users/geoffrey/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
        if not string.find(package.path, package_path_str, 1, true) then
            package.path = package.path .. ";" .. package_path_str
        end

        if not string.find(package.cpath, install_cpath_pattern, 1, true) then
            package.cpath = package.cpath .. ";" .. install_cpath_pattern
        end

        time([[Luarocks path setup]], false)
        time([[try_loadstring definition]], true)
        local function try_loadstring(s, component, name)
            local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
            if not success then
                vim.schedule(
                    function()
                        vim.api.nvim_notify(
                            "packer.nvim: Error running " .. component .. " for " .. name .. ": " .. result,
                            vim.log.levels.ERROR,
                            {}
                        )
                    end
                )
            end
            return result
        end

        time([[try_loadstring definition]], false)
        time([[Defining packer_plugins]], true)
        _G.packer_plugins = {
            ["Comment.nvim"] = {
                loaded = true,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/start/Comment.nvim",
                url = "https://github.com/numToStr/Comment.nvim"
            },
            ["close-buffers.vim"] = {
                loaded = true,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/start/close-buffers.vim",
                url = "https://github.com/Asheq/close-buffers.vim"
            },
            ["cmp-buffer"] = {
                loaded = true,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/start/cmp-buffer",
                url = "https://github.com/hrsh7th/cmp-buffer"
            },
            ["cmp-cmdline"] = {
                loaded = true,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
                url = "https://github.com/hrsh7th/cmp-cmdline"
            },
            ["cmp-nvim-lsp"] = {
                loaded = true,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
                url = "https://github.com/hrsh7th/cmp-nvim-lsp"
            },
            ["cmp-path"] = {
                loaded = true,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/start/cmp-path",
                url = "https://github.com/hrsh7th/cmp-path"
            },
            ["cmp-vsnip"] = {
                loaded = true,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
                url = "https://github.com/hrsh7th/cmp-vsnip"
            },
            ["copilot.vim"] = {
                loaded = true,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/start/copilot.vim",
                url = "https://github.com/github/copilot.vim"
            },
            ["diffview.nvim"] = {
                loaded = true,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/start/diffview.nvim",
                url = "https://github.com/sindrets/diffview.nvim"
            },
            everforest = {
                loaded = true,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/start/everforest",
                url = "https://github.com/sainnhe/everforest"
            },
            ["fidget.nvim"] = {
                loaded = true,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/start/fidget.nvim",
                url = "https://github.com/j-hui/fidget.nvim"
            },
            ["gitsigns.nvim"] = {
                loaded = true,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
                url = "https://github.com/lewis6991/gitsigns.nvim"
            },
            ["gruvbox-material"] = {
                loaded = true,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/start/gruvbox-material",
                url = "https://github.com/sainnhe/gruvbox-material"
            },
            ["gruvbox.nvim"] = {
                loaded = true,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/start/gruvbox.nvim",
                url = "https://github.com/ellisonleao/gruvbox.nvim"
            },
            ["kanagawa.nvim"] = {
                loaded = true,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/start/kanagawa.nvim",
                url = "https://github.com/rebelot/kanagawa.nvim"
            },
            ["leap.nvim"] = {
                loaded = true,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/start/leap.nvim",
                url = "https://github.com/ggandor/leap.nvim"
            },
            ["lspkind.nvim"] = {
                loaded = true,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/start/lspkind.nvim",
                url = "https://github.com/onsails/lspkind.nvim"
            },
            ["lualine.nvim"] = {
                loaded = true,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/start/lualine.nvim",
                url = "https://github.com/nvim-lualine/lualine.nvim"
            },
            ["mason-lspconfig.nvim"] = {
                loaded = true,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
                url = "https://github.com/williamboman/mason-lspconfig.nvim"
            },
            ["mason.nvim"] = {
                loaded = true,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/start/mason.nvim",
                url = "https://github.com/williamboman/mason.nvim"
            },
            ["neodev.nvim"] = {
                loaded = true,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/start/neodev.nvim",
                url = "https://github.com/folke/neodev.nvim"
            },
            neovim = {
                loaded = true,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/start/neovim",
                url = "https://github.com/rose-pine/neovim"
            },
            ["neovim-ayu"] = {
                loaded = true,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/start/neovim-ayu",
                url = "https://github.com/Shatur/neovim-ayu"
            },
            ["nightfox.nvim"] = {
                loaded = true,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/start/nightfox.nvim",
                url = "https://github.com/EdenEast/nightfox.nvim"
            },
            ["null-ls.nvim"] = {
                loaded = true,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
                url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
            },
            nvim = {
                loaded = true,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/start/nvim",
                url = "https://github.com/catppuccin/nvim"
            },
            ["nvim-autopairs"] = {
                loaded = true,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
                url = "https://github.com/windwp/nvim-autopairs"
            },
            ["nvim-cmp"] = {
                loaded = true,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/start/nvim-cmp",
                url = "https://github.com/hrsh7th/nvim-cmp"
            },
            ["nvim-lspconfig"] = {
                loaded = true,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
                url = "https://github.com/neovim/nvim-lspconfig"
            },
            ["nvim-tree.lua"] = {
                loaded = true,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
                url = "https://github.com/nvim-tree/nvim-tree.lua"
            },
            ["nvim-treesitter"] = {
                loaded = true,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
                url = "https://github.com/nvim-treesitter/nvim-treesitter"
            },
            ["nvim-treesitter-textobjects"] = {
                load_after = {},
                loaded = true,
                needs_bufread = false,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
                url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
            },
            ["nvim-web-devicons"] = {
                loaded = true,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
                url = "https://github.com/nvim-tree/nvim-web-devicons"
            },
            ["onedark.nvim"] = {
                loaded = true,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/start/onedark.nvim",
                url = "https://github.com/navarasu/onedark.nvim"
            },
            ["packer.nvim"] = {
                loaded = true,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/start/packer.nvim",
                url = "https://github.com/wbthomason/packer.nvim"
            },
            ["plenary.nvim"] = {
                loaded = true,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/start/plenary.nvim",
                url = "https://github.com/nvim-lua/plenary.nvim"
            },
            ["sqlite.lua"] = {
                loaded = true,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/start/sqlite.lua",
                url = "https://github.com/kkharji/sqlite.lua"
            },
            ["telescope-file-browser.nvim"] = {
                load_after = {},
                loaded = true,
                needs_bufread = false,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/opt/telescope-file-browser.nvim",
                url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
            },
            ["telescope-frecency.nvim"] = {
                load_after = {},
                loaded = true,
                needs_bufread = false,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/opt/telescope-frecency.nvim",
                url = "https://github.com/nvim-telescope/telescope-frecency.nvim"
            },
            ["telescope-ui-select.nvim"] = {
                load_after = {},
                loaded = true,
                needs_bufread = false,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/opt/telescope-ui-select.nvim",
                url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
            },
            ["telescope.nvim"] = {
                loaded = true,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/start/telescope.nvim",
                url = "https://github.com/nvim-telescope/telescope.nvim"
            },
            ["tokyonight.nvim"] = {
                loaded = true,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
                url = "https://github.com/folke/tokyonight.nvim"
            },
            ["vim-fugitive"] = {
                loaded = true,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/start/vim-fugitive",
                url = "https://github.com/tpope/vim-fugitive"
            },
            ["vim-sleuth"] = {
                loaded = true,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/start/vim-sleuth",
                url = "https://github.com/tpope/vim-sleuth"
            },
            ["vim-surround"] = {
                loaded = true,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/start/vim-surround",
                url = "https://github.com/tpope/vim-surround"
            },
            ["vim-vsnip"] = {
                loaded = true,
                path = "/Users/geoffrey/.local/share/nvim/site/pack/packer/start/vim-vsnip",
                url = "https://github.com/hrsh7th/vim-vsnip"
            }
        }

        time([[Defining packer_plugins]], false)
        -- Load plugins in order defined by `after`
        time([[Sequenced loading]], true)
        vim.cmd [[ packadd nvim-treesitter ]]
        vim.cmd [[ packadd nvim-treesitter-textobjects ]]
        vim.cmd [[ packadd telescope.nvim ]]
        vim.cmd [[ packadd telescope-ui-select.nvim ]]
        vim.cmd [[ packadd telescope-file-browser.nvim ]]
        vim.cmd [[ packadd telescope-frecency.nvim ]]
        time([[Sequenced loading]], false)

        _G._packer.inside_compile = false
        if _G._packer.needs_bufread == true then
            vim.cmd("doautocmd BufRead")
        end
        _G._packer.needs_bufread = false

        if should_profile then
            save_profiles()
        end
    end
)

if not no_errors then
    error_msg = error_msg:gsub('"', '\\"')
    vim.api.nvim_command(
        'echohl ErrorMsg | echom "Error in packer_compiled: ' ..
            error_msg .. '" | echom "Please check your config for correctness" | echohl None'
    )
end
