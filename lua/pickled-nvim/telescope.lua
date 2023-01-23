local M = { }

M.opts = {
	telescope ={
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
	}
}

M.config = {
	telescope = function ()
		require("telescope").setup(opts.telescope)
		--
		-- faster native picker & sorter implementations
		-- zf seems the fastest, and has
		-- require("telescope").load_extension("fzf")
		-- require('telescope').load_extension('fzy_native')
		require("telescope").load_extension("zf-native")
	end
}


-- ⌘ P - Command Palette

-- ⌘ p - fuzzy find files
local file_picker = "Telescope frecency"
-- local file_picker = "lua file_picker()"
local silent_noremap = { noremap = true, silent = true }
M.keys = {
	telescope = {
		{"<D-S-p>", "<cmd>Telescope command_center<CR>", silent_noremap},
		{"<leader>c", "<CMD>Telescope command_center<CR>", silent_noremap},
		{"<D-f>", "<cmd>lua require('telescope.builtin').live_grep()<CR>", silent_noremap},
		{"<leader>b", "<cmd>Telescope buffers<CR>", silent_noremap},
		{"<leader>m", "<cmd>Telescope marks<CR>", silent_noremap},

		{"<D-k>", "<cmd>Telescope buffers<CR>", silent_noremap},

		{"<D-p>", "<cmd>" .. file_picker .. "<CR>", silent_noremap},
		{"<C-p>", "<cmd>" .. file_picker .. "<CR>", silent_noremap},
	}
}

function M.file_picker()
	local file_picker_name

	-- prefer git ls-files when available because it's a ton faster
	if vim.fn.empty(vim.fn.FugitiveGitDir()) == 0 then
		file_picker_name = "git_files"
	else
		file_picker_name = "find_files"
	end

	local picker_function = loadstring("require('telescope.builtin')." .. file_picker_name .. "()")
	assert(picker_function, "file picker not found: " .. file_picker_name)

	picker_function()
end

M.setup = function ()
	-- -- combine frequency and recency to give better results by default
	-- require("telescope").load_extension("frecency")

	-- -- prevent file pickers from changing the directory out from under you
	-- require("telescope").load_extension("rooter")

	-- require("telescope").load_extension("toggleterm")

	-- use git picker for git based directories

end

return M
