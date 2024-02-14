vim.cmd("highlight HarpoonInactive guibg=NONE guifg=#63698c")
vim.cmd("highlight HarpoonActive guibg=NONE guifg=#bbbbbb")
vim.cmd("highlight HarpoonNumberActive guibg=NONE guifg=#7aa2f7")
vim.cmd("highlight HarpoonNumberInactive guibg=NONE guifg=#7aa2f7")
vim.cmd("highlight TabLineFill guibg=NONE guifg=white")

require("harpoon").setup({

	save_on_toggle = false,
	save_on_change = true,

	tabline = true,
    tabline_prefix = "   ",
    tabline_suffix = "   "

})
