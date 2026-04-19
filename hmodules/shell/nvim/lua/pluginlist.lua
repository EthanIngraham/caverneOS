return {

    {
        'nvim-tree/nvim-tree.lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('nvim-tree').setup()
        end,
    },

    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files)
            vim.keymap.set('n', '<leader>fg', builtin.git_status)
            vim.keymap.set('n', '<leader>fr', builtin.oldfiles)
        end,
    },

    { 'numToStr/Comment.nvim', opts = {} },

    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    },

    --
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",

    'folke/neodev.nvim', -- new

    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets',
            'hrsh7th/cmp-nvim-lsp',
        },
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter').setup {
                ensure_installed = { 'vim', 'vimdoc', 'lua', 'cpp' },
                auto_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            }
        end,
    },

	{
	  "catppuccin/nvim",
	  name = "catppuccin",
	  priority = 1000,
	  config = function()
		require("catppuccin").setup({
		  flavour = "mocha", -- latte, frappe, macchiato, mocha
		  transparent_background = false,
		})
		vim.cmd.colorscheme("catppuccin")
	  end,
	},
	{
        'nvim-lualine/lualine.nvim',
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("lualine").setup({
                icons_enabled = true,
                theme = 'onedark',
            })
        end,
    },
  {
    "ThePrimeagen/vim-be-good",
    name = "vim-be-good"
  }
}
