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
			find_command = { "fd", "--type", "f", "--hidden", "--strip-cwd-prefix" },
		},
		git_files = {
			theme = "dropdown",
		},
	},
})
-- require("telescope").load_extension("fzf")
-- require('telescope').load_extension('fzy_native')
require("telescope").load_extension("zf-native")


require("telescope").load_extension("projects")

require("telescope").load_extension("frecency")

function _G.file_picker()
	local file_picker_name

	-- prefer git ls-files when available because it's a ton faster
	if vim.fn.empty(vim.fn.FugitiveGitDir()) == 0 then
		file_picker_name = 'git_files'
	else
		file_picker_name = 'find_files'
	end

	local file_picker = loadstring("require('telescope.builtin')." .. file_picker_name .. "()")

	file_picker()
end

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
