return {
    "cbochs/grapple.nvim",
    dependencies = {
        { "nvim-tree/nvim-web-devicons", lazy = true }
    },
	opts = {
        scope = "git_branch", -- also try out "git_branch"
		win_opts = {
			-- Can be fractional
			width = 80,
			height = 12,
			row = 0.5,
			col = 0.5,

			relative = "editor",
			border = "rounded",
			focusable = false,
			style = "minimal",

			title = "Grapple", -- fallback title for Grapple windows
			title_pos = "center",
			title_padding = " ", -- custom: adds padding around window title

			footer = "", -- disable footer
			footer_pos = "center",
		},
    },
	event = { "BufReadPost", "BufNewFile" },
    cmd = "Grapple",
    keys = {
        { "<leader>a", "<cmd>Grapple toggle<cr>" },
        { "<C-e>", "<cmd>Grapple toggle_tags<cr>" },
        { "<C-]>", "<cmd>Grapple cycle_tags next<cr>" },
        { "<C-[>", "<cmd>Grapple cycle_tags prev<cr>" },

		{ "<C-1>", "<cmd>Grapple select index=1<cr>" },
		{ "<C-2>", "<cmd>Grapple select index=2<cr>" },
		{ "<C-3>", "<cmd>Grapple select index=3<cr>" },
		{ "<C-4>", "<cmd>Grapple select index=4<cr>" },
		{ "<C-5>", "<cmd>Grapple select index=5<cr>" },
		{ "<C-6>", "<cmd>Grapple select index=6<cr>" },
		{ "<C-7>", "<cmd>Grapple select index=7<cr>" },
		{ "<C-8>", "<cmd>Grapple select index=8<cr>" },
		{ "<C-9>", "<cmd>Grapple select index=9<cr>" },
    },
}
