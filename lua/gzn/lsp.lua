vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf, noremap = true, silent = true }

		local function map(mode, lhs, rhs)
			vim.keymap.set(mode, lhs, rhs, opts)
		end

		local tele = require("telescope.builtin")
		local acti = require("actions-preview")

		-- Definitions and references
		map("n", "gr", tele.lsp_references)
		map("n", "gD", vim.lsp.buf.declaration)
		map("n", "gd", tele.lsp_definitions)
		map("n", "gi", tele.lsp_implementations)
		map("n", "gt", tele.lsp_type_definitions)

		-- Code actions
		map({ "n", "v" }, "<leader><Tab>", acti.code_actions)

		-- Rename and diagnostics
		map("n", "<leader>n", vim.lsp.buf.rename)
		map("n", "<leader>d", function() tele.diagnostics({ bufnr = 0 }) end)
		map("n", "<leader>D", tele.diagnostics)
		map("n", "<leader>e", vim.diagnostic.open_float)
		map("n", ",", function() vim.diagnostic.jump({ count = -1, float = true }) end)
		map("n", ".", function() vim.diagnostic.jump({ count = 1, float = true }) end)

		-- show documentation for what is under cursor
		map("n", "<leader>k", vim.lsp.buf.hover)
	end,
});

local severity = vim.diagnostic.severity

vim.diagnostic.config({
	signs = {
		text = {
			[severity.ERROR] = " ",
			[severity.WARN] = " ",
			[severity.HINT] = "󰠠 ",
			[severity.INFO] = " ",
		},
	},
})
