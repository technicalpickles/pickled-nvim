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

			on_attach = function(bufnr)
				local api = require("nvim-tree.api")
				local function opts(desc)
					return {
						desc = "nvim-tree: " .. desc,
						buffer = bufnr,
						noremap = true,
						silent = true,
						nowait = true,
					}
				end
				api.config.mappings.default_on_attach(bufnr)

				vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
			end,
		},

		cmd = "NvimTreeToggle",

		keys = {
			{ "<D-b>", tree_cmd, silent_noremap },
			{ "<D-/>", tree_cmd, silent_noremap },
			{ "<leader>d", tree_cmd, silent_noremap },
		},

		command_center = {
			{ desc = "Tree: Toggle", cmd = "<CMD>NvimTreeToggle<CR>" },
			{ desc = "Tree: Focus on current file", cmd = "<CMD>NvimTreeFindFile<CR>" },
			{ desc = "Tree: Toggle focusing on current file", cmd = "<CMD>NvimTreeFindFileToggle<CR>" },

			{ desc = "File: Toggle tree view", cmd = "<CMD>NvimTreeToggle<CR>" },
			{ desc = "File: Reveal current file in tree view", cmd = "<CMD>NvimTreeFindFile<CR>" },
		},
	},
}
