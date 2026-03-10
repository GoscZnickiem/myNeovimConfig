return {
	cmd = {
		"ssh",
		"helinc1-docker",
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--log=verbose",
	},
	init_options = {
		fallbackFlags = { "-std=c++23" },
	},
}
