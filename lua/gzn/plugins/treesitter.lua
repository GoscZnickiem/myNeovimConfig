local configs = require("nvim-treesitter.configs")

configs.setup {
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "bash", "cpp", "c_sharp", "ocaml", "java", "ruby", "asm", "glsl" },
	sync_install = false,
	ignore_install = { "" }, -- List of parsers to ignore installing
	autopairs = {
		enable = true;
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
		use_languagetree = false,
		disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
	},
	indent = { enable = true, disable = { "yaml" } },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
}
