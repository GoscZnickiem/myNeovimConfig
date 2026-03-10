local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local make_entry = require("telescope.make_entry")

local function strip_prefix(path, prefix)
	prefix = prefix:gsub("/?$", "/")
	return path:gsub("^" .. vim.pesc(prefix), "")
end

local M = {}

M.remote_grep = function(opts)
	opts = opts or {}
	local cwd = vim.loop.cwd()

	pickers.new(opts, {
		prompt_title = "Live Grep",
		finder = finders.new_job(
            function(prompt)
                if not prompt or prompt == "" then
                    return nil
                end

                return {
                    "ssh", "-q", "-tt", "helinc1-docker",
                    "rg", "--color=never", "--no-heading",
                    "--with-filename", "--line-number",
                    "--column", "--smart-case", "--trim",
                    prompt, cwd
                }
            end,
            function(line)
                local entry = make_entry.gen_from_vimgrep(opts)(line)
                if not entry or not entry.filename then return nil end

                local rel = strip_prefix(entry.filename, cwd)
                local short = vim.fn.pathshorten(rel, 4)

                entry.display = function()
                    return string.format(
                        "%s:%d  │  %s",
                        short,
                        entry.lnum,
                        entry.text or ""
                    )
                end
                entry.ordinal = entry.text or entry.filename
                return entry
            end
        ),
		previewer = conf.grep_previewer(opts),
        sorter = conf.generic_sorter(opts),
	}):find()
end

return M
