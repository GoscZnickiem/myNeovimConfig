local M = {}

local theme_file = vim.fn.stdpath("state") .. "/colorscheme"

function M.get_themes()
	local plugins = require("lazy.core.config").plugins
	local themes = {}

	for _, plugin in pairs(plugins) do
		if plugin.colorschemes then
			for _, theme in ipairs(plugin.colorschemes) do
				table.insert(themes, theme)
			end
		end
	end

	table.sort(themes)
	return themes
end

function M.set(theme)
	vim.cmd.colorscheme(theme)
	vim.fn.writefile({ theme }, theme_file)
end

function M.load()
	local theme
	if vim.fn.filereadable(theme_file) == 1 then
		theme = vim.fn.readfile(theme_file)[1]
	end
	if not theme then
		local themes = M.get_themes()
		for _, t in ipairs(themes) do
			if t == "tokyonight" then
				theme = "tokyonight"
				break
			end
		end
	end
	theme = theme or "sorbet"

	vim.cmd.colorscheme(theme)

	vim.api.nvim_create_user_command("Color", function(opts)
		M.set(opts.args)
	end, {
		nargs = 1,
		complete = function()
			return M.get_themes()
		end,
	})
end

function M.themes()
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")

	local themes = M.get_themes()

	pickers.new({}, {
		prompt_title = "Themes",

		layout_config = {
			width = 0.4,
			height = 0.4,
		},

		finder = finders.new_table({
			results = themes,
		}),

		sorter = conf.generic_sorter({}),

		attach_mappings = function(prompt_bufnr, map)
			local function apply()
				local selection = action_state.get_selected_entry()
				actions.close(prompt_bufnr)
				M.set(selection[1])
			end

			map("i", "<CR>", apply)
			map("n", "<CR>", apply)

			return true
		end,
	}):find()
end

return M
