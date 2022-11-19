require("telescope").setup({
	extensions = {
		frecency = {
			default_workspace = "CWD",
			show_filter_column = false,
		},
	},
	pickers = {
		find_files = {
			theme = "dropdown",
			-- find_command = { "fd", "--type", "f", "--hidden", "--strip-cwd-prefix" },
		},
		git_files = {
			theme = "dropdown",
		},
	},
})
-- require("telescope").load_extension("fzf")
-- require('telescope').load_extension('fzy_native')
require("telescope").load_extension("zf-native")


require("telescope").load_extension("command_center")
require("telescope").load_extension("projects")

require("telescope").load_extension("frecency")

require("nvim-tree").setup({
	renderer = {
		-- display only the folder name
		-- see See `:help filename-modifiers` for available options.
		root_folder_modifier = ":t",
	},
	-- projects integration
	respect_buf_cwd = true,
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
})

require("marks").setup({
	sign_priority = 40
})
