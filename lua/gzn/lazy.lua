-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({

	-- My colorschemes
	"folke/tokyonight.nvim",
	"rose-pine/neovim",

	-- Better netrw
	"stevearc/oil.nvim",


	-- An implementation of the Popup API from vim in Neovim
	"nvim-lua/popup.nvim",

	-- Useful lua functions used by lots of plugins
	"nvim-lua/plenary.nvim",

	-- A plugin for neovim newbies
	-- {
	--	"folke/which-key.nvim",
	--	config = function()
	--		vim.o.timeout = true
	--		vim.o.timeoutlen = 300
	--		require("which-key").setup {
	--			-- your configuration comes here
	--		}
	--	end
	--},

	-- Autocompletion plugins
	"hrsh7th/nvim-cmp", -- The completion plugin
	"hrsh7th/cmp-buffer", -- buffer completions
	"hrsh7th/cmp-path", -- path completions
	"hrsh7th/cmp-cmdline", -- cmdline completions
	"saadparwaiz1/cmp_luasnip", -- snippet completions
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",

	-- snippets
	"L3MON4D3/LuaSnip", --snippet engine
	"rafamadriz/friendly-snippets", -- a bunch of snippets to use

	-- LSP 
	"williamboman/mason.nvim", -- simple to use language server installer
	"williamboman/mason-lspconfig.nvim", -- simple to use language server installer
	"neovim/nvim-lspconfig", -- enable LSP
	"jose-elias-alvarez/null-ls.nvim", -- LSP diagnostics and code actions

	-- telescope
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},

	-- Treesitter
	"nvim-treesitter/nvim-treesitter",

	"p00f/nvim-ts-rainbow",
	"nvim-treesitter/playground",

	-- Autopairs, integrates with both cmp and treesitter
	"windwp/nvim-autopairs",

	-- Comments
	"numToStr/Comment.nvim",

	-- Lualine
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},

	-- git
	"lewis6991/gitsigns.nvim",

	-- Harpoon
	"ThePrimeagen/harpoon",

	-- Undo tree
	"mbbill/undotree",

	-- cool startup
	{
		"startup-nvim/startup.nvim",
		dependencies = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"}
	},

	-- Keymaps help
	{'jokajak/keyseer.nvim', config = function() require('keyseer').setup() end },

	-- nvim plugins dev 
	"folke/neodev.nvim",

	-- vim trainer
	"ThePrimeagen/vim-be-good",

	-- java lsp 
	"mfussenegger/nvim-jdtls"
})
