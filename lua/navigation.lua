require("telescope").setup({
	extensions = {
        frecency = {
            default_workspace = 'CWD',
            show_filter_column = false,
        }
    },
	pickers = {
		find_files = {
			theme = "dropdown",
		},
	},
})
require("telescope").load_extension("fzf")
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
