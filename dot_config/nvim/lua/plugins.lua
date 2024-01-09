return {
    'scrooloose/nerdcommenter',
    'scrooloose/nerdtree',
    'tpope/vim-fugitive',
    'tpope/vim-surround',
    'tpope/vim-sensible',
    'vim-airline/vim-airline',
    -- 'easymotion/vim-easymotion',
    -- 'justinmk/vim-sneak'
    -- use 'valloric/youcompleteme'
    'kristijanhusak/vim-hybrid-material',
    'cespare/vim-toml',
    'arcticicestudio/nord-vim',
    'wellle/targets.vim',
    'LnL7/vim-nix',
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    {
        "nvim-treesitter/nvim-treesitter", 
        build = ":TSUpdate",
        opts = {
            ensure_installed = "all", -- { "c", "lua", "vim", "vimdoc", "query" },
        },
    },

    {
        'LhKipp/nvim-nu', 
        build = ':TSInstall nu',
        init = function()
            require('nu').setup({
                use_lsp_features = false,
            })
        end
    },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
}

