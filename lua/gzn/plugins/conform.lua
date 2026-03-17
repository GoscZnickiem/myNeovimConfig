return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			-- lua = { "stylua" },
			cpp = { "clang-format" },
			c = { "clang-format" },
		},
	},
	keys = {
		{ "<leader>=", function()
			require("conform").format({ async = true })
		end }
	}
}
