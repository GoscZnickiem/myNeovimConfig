local opts = { noremap = true, silent = true }

local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, opts)
end

-- map("", "<Space>", "<Nop>")

map("n", "<leader>px", ":Ex<CR>")

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

map("x", "<leader>p", [["_dP]])
map({"n", "v"}, "<leader>d", [["_d]])

map({"n", "v"}, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set('n', 'i', function () return string.match(vim.api.nvim_get_current_line(), '%g') == nil and 'cc' or 'i' end, {expr=true, noremap=true, silent=true})

-- telescope
local telescope = require('telescope.builtin')

map("n", "<leader>pf", telescope.find_files)
map("n", "<leader>pg", telescope.live_grep)
map("n", "<leader>pb", telescope.buffers)
map("n", "<leader>th", telescope.help_tags)
