require("telescope").setup({
	defaults = {
        prompt_prefix = '  ',
		layout_strategy = 'horizontal',
		layout_config = {
			horizontal = {
				preview_width = 0.5,
			},
		}
	},
	extensions = {
		frecency = {
			default_workspace = "CWD",
			show_filter_column = false,
			show_unindexed = false,
			ignore_patterns = { "*.git/*", "*/tmp/*", "node_modules/*" },
		},
		rooter = {
			enable = true,
			patterns = { ".git" },
			debug = false,
		},
	},
	pickers = {
		find_files = {
			theme = "dropdown",
			-- customize by adding --hidden, so we can get files that start with . which turns out to be a lot
			find_command = { "fd", "--type", "f", "--hidden", "--strip-cwd-prefix" },
		},
		git_files = {
			theme = "dropdown",
		},
	},
})

-- faster native picker & sorter implementations
-- zf seems the fastest, and has
-- require("telescope").load_extension("fzf")
-- require('telescope').load_extension('fzy_native')
require("telescope").load_extension("zf-native")

-- combine frequency and recency to give better results by default
require("telescope").load_extension("frecency")

-- prevent file pickers from changing the directory out from under you
require("telescope").load_extension("rooter")

-- use git picker for git based directories
function _G.file_picker()
	local file_picker_name

	-- prefer git ls-files when available because it's a ton faster
	if vim.fn.empty(vim.fn.FugitiveGitDir()) == 0 then
		file_picker_name = "git_files"
	else
		file_picker_name = "find_files"
	end

	local file_picker = loadstring("require('telescope.builtin')." .. file_picker_name .. "()")

	file_picker()
end
