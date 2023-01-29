local silent_noremap = { noremap = true, silent = true }
local tree_cmd = "<CMD>NvimTreeToggle<CR>"
return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-web-devicons",
		},
		opts = {
			-- Changes the tree root directory on `DirChanged` and refreshes the tree.
			sync_root_with_cwd = true,

			-- Will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
			respect_buf_cwd = true,

			renderer = {
				-- display only the folder name
				-- see See `:help filename-modifiers` for available options.
				root_folder_modifier = ":t",
				-- ie if you have lua/pickled-nvim, and lua is otherwise empty, only show lua/pickled-nvim instead of lua with one child
				group_empty = true,
				highlight_opened_files = "icon",
			},

			view = {
				mappings = {
					list = {
						{ key = { "?" }, action = "toggle_help" },
					},
				},
			},
		},

		cmd = "NvimTreeToggle",

		keys = {
			{"<D-b>", tree_cmd, silent_noremap},
			{"<D-/>", tree_cmd, silent_noremap},
			{"<leader>d", tree_cmd, silent_noremap},

		}
	}
}
