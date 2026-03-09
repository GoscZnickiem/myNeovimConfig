local ok = pcall(require, "nvim-treesitter")
if not ok then
	return {
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	}
end

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	config = function ()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"c", "cpp", "asm", "bash", "cmake", "make", "ninja", "python", "lua", "vim", "vimdoc", "llvm", "rust",
			},
			sync_install = false,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
				use_languagetree = false,
			},
			indent = { enable = true },
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
		})
	end
}
