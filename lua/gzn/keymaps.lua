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

vim.keymap.set("n", "<leader><Tab>", [[:lua vim.lsp.buf.code_action()<CR>]])

-- telescope
local telescope = require('telescope.builtin')

map("n", "<leader>pf", telescope.find_files)
map("n", "<leader>pg", telescope.live_grep)
map("n", "<leader>pb", telescope.buffers)
map("n", "<leader>th", telescope.help_tags)

-- harpoon
local harpoonMark = require("harpoon.mark")
local harpoonUI = require("harpoon.ui")
vim.keymap.set("n", "<leader>a", harpoonMark.add_file)
vim.keymap.set("n", "<leader>ca", harpoonMark.clear_all)

vim.keymap.set("n", "<C-e>", harpoonUI.toggle_quick_menu)

vim.keymap.set("n", "<C-i>", function() harpoonUI.nav_file(1) end)
vim.keymap.set("n", "<C-o>", function() harpoonUI.nav_file(2) end)
vim.keymap.set("n", "<C-j>", function() harpoonUI.nav_file(3) end)
vim.keymap.set("n", "<C-k>", function() harpoonUI.nav_file(4) end)
vim.keymap.set("n", "<C-n>", function() harpoonUI.nav_file(5) end)
vim.keymap.set("n", "<C-m>", function() harpoonUI.nav_file(6) end)

vim.keymap.set("n", "<C-]>", harpoonUI.nav_next)
vim.keymap.set("n", "<C-[>", harpoonUI.nav_prev)
