require("nvim-tree").setup({
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
		highlight_opened_files = 'icon',
	},

	view = {
		mappings = {
			list = {
				{ key = {"?"}, action = "toggle_help" }
			}
		}
	},
})

-- close nvim-tree when it's the last thing in a window, ie the other buffer is closed
-- vim.g.nvim_tree_auto_close = 1

