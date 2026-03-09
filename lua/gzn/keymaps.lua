local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- don't do anything on escape in normal mode
map("n", "<esc>", "")

-- big versions of hjkl
map({"n", "x", "o"}, "H", "^")
map({"n", "x", "o"}, "J", "}")
map({"n", "x", "o"}, "K", "{")
map({"n", "x", "o"}, "L", "$")

-- move selected lines
map("x", "J", ":m '>+1<CR>gv=gv")
map("x", "K", ":m '<-2<CR>gv=gv")

-- indent selected lines
map("x", "<", "<gv")
map("x", ">", ">gv")

-- keep the cursor centered
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- keep kursor position when joining lines
map("n", "<leader>j", "mzJ`z")

-- don't yank too much
map("x", "p", '"_dP')
map("n", "x", '"_x')

-- run the q macro
map("n", "Q", "@q")

-- begin input with cc on an empty line (auto-indents it)
map("n", "i", function () return string.match(vim.api.nvim_get_current_line(), '%g') == nil and '"_cc' or "i" end, {expr = true})

-- copy to clipboard
map({"n", "v"}, "<leader>y", '"+y')
map("n", "<leader>Y", '"+Y')

-- replace the word under cursor
map("n", "<leader>s", [[:%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>]])
map("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
map("v", "s", [["hy:%s/<C-r>h/<C-r>h/gI<Left><Left><Left>]])
map("v", "S", [["hy:%s/\<<C-r>h/<C-r>h\>/gI<Left><Left><Left>]])
