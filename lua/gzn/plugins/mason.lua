require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
	ensure_installed = {
		"clangd",
		"cmake",
		"ltex",
		"lua_ls",
		"ocamllsp",
		"omnisharp",
		"omnisharp_mono",
		"jdtls",
		"neocmake",
		"quick_lint_js",
		"autotools_ls",
		"pylsp"
	},
})

local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	return
end

local on_attach = function(client, bufnr)
	-- format on save
	-- if client.server_capabilities.documentFormattingProvider then
	-- 	vim.api.nvim_create_autocmd("BufWritePre", {
	-- group = vim.api.nvim_create_augroup("Format", { clear = true }),
	-- 	buffer = bufnr,
	-- 		callback = function()
	-- vim.lsp.buf.formatting_seq_sync()
	-- end,
	-- })
	-- end
	local opts = {buffer = bufnr, remap = false}

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader><Tab>", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

nvim_lsp.clangd.setup ({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.lua_ls.setup ({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.cmake.setup ({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.ocamllsp.setup ({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.omnisharp.setup ({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.omnisharp_mono.setup ({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.jdtls.setup ({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.neocmake.setup ({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.quick_lint_js.setup ({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.autotools_ls.setup ({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.pylsp.setup ({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.solargraph.setup ({
	on_attach = on_attach,
	capabilities = capabilities,
})
