local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		print("Installing Packer")
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init{
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
}

return require('packer').startup(function(use)

	use 'wbthomason/packer.nvim'
	-- My plugins here

	-- My colorschemes
	use "folke/tokyonight.nvim"
	use "rose-pine/neovim"

	-- An implementation of the Popup API from vim in Neovim
	use "nvim-lua/popup.nvim"

	-- Useful lua functions used by lots of plugins
	use "nvim-lua/plenary.nvim"

	-- A plugin for neovim newbies
	use {
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup {
				-- your configuration comes here
			}
		end
	}

	-- Autocompletion plugins
	use "hrsh7th/nvim-cmp" -- The completion plugin
	use "hrsh7th/cmp-buffer" -- buffer completions
	use "hrsh7th/cmp-path" -- path completions
	use "hrsh7th/cmp-cmdline" -- cmdline completions
	use "saadparwaiz1/cmp_luasnip" -- snippet completions
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-nvim-lua"

	-- snippets
	use "L3MON4D3/LuaSnip" --snippet engine
	use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

	-- LSP 
	use "williamboman/mason.nvim" -- simple to use language server installer
	use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer
	use "neovim/nvim-lspconfig" -- enable LSP
	use 'jose-elias-alvarez/null-ls.nvim' -- LSP diagnostics and code actions

	-- telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	}
	use "p00f/nvim-ts-rainbow"
	use "nvim-treesitter/playground"

	-- Autopairs, integrates with both cmp and treesitter
	use "windwp/nvim-autopairs"

	-- Comments
	use "numToStr/Comment.nvim"

	-- Lualine
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}

	-- git
	use "lewis6991/gitsigns.nvim"

	-- Harpoon
	use "ThePrimeagen/harpoon"

	-- Undo tree
	use "mbbill/undotree"

	-- cool startup
	use {
		"startup-nvim/startup.nvim",
		requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
	}

	-- Keymaps help
	use {'jokajak/keyseer.nvim', config = function() require('keyseer').setup() end }

	-- nvim plugins dev 
	use "folke/neodev.nvim"

	-- vim trainer
	use "ThePrimeagen/vim-be-good"

	-- java lsp 
	use "mfussenegger/nvim-jdtls"

	if packer_bootstrap then
		require('packer').sync()
	end
end)
