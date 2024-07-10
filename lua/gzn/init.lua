--require("gzn/packer")
require("gzn/lazy")

require("gzn/plugins/colors")

require("gzn/plugins/oil")

require("gzn/plugins/neodev")
require("gzn/plugins/cmp")
require("gzn/plugins/mason")

require("gzn/plugins/telescope")
require("gzn/plugins/treesitter")

require("gzn/plugins/autopairs")

require("gzn/plugins/comments")

require("gzn/plugins/lualine")

require("gzn/plugins/gitsigns")

vim.defer_fn(function()
	require("gzn/plugins/harpoon")

	require("gzn/plugins/undotree")
end, 0)

require("gzn/plugins/keyseer")


require("gzn/plugins/startup")

require("gzn/options")
require("gzn/keymaps")
