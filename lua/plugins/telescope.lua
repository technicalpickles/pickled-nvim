local file_picker = "Telescope frecency"
-- local file_picker = "lua file_picker()"
local silent_noremap = { noremap = true, silent = true }
local silent_noremap_both_modes = vim.tbl_deep_extend("keep", silent_noremap, {mode = {"n", "i"}})
return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "plenary.nvim" },
		keys = {
			{"<D-S-p>", "<cmd>Telescope command_center<CR>", silent_noremap_both_modes},
			{"<leader>c", "<CMD>Telescope command_center<CR>", silent_noremap_both_modes},
			{"<D-f>", "<cmd>lua require('telescope.builtin').live_grep()<CR>", silent_noremap_both_modes},
			{"<leader>b", "<cmd>Telescope buffers<CR>", silent_noremap_both_modes},
			{"<leader>m", "<cmd>Telescope marks<CR>", silent_noremap_both_modes},

			{"<D-k>", "<cmd>Telescope buffers<CR>", silent_noremap_both_modes},

			{"<D-p>", "<cmd>" .. file_picker .. "<CR>", silent_noremap_both_modes},
			{"<C-p>", "<cmd>" .. file_picker .. "<CR>", silent_noremap_both_modes},

			{"<D-g>", "<cmd>Telescope git_files<CR>", silent_noremap_both_modes},
		},
		opts = {
			defaults = {
				prompt_prefix = '  ',
				layout_strategy = 'horizontal',
				layout_config = {
					horizontal = {
						preview_width = 0.5,
					},
				},
				mappings = {
					n = {},
					i = {},
				},
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
				command_center = {
				},
				find_files = {
					-- theme = "dropdown",
					-- customize by adding --hidden, so we can get files that start with . which turns out to be a lot
					find_command = { "fd", "--type", "f", "--hidden", "--strip-cwd-prefix" },
				},
				git_files = {
					-- theme = "dropdown",
				},
				frecency = {
				},
			},
		},
		command = "Telescope",
		config = function (_, opts)
			local  telescope = require("telescope")
			telescope.setup(opts)
			--
			-- faster native picker & sorter implementations. zf seems the fastest
			-- telescope.load_extension("fzf")
			-- telescope.load_extension('fzy_native')
			telescope.load_extension("zf-native")

			telescope.load_extension("rooter")

			-- add other extensions here to be available when autocompleting
			telescope.load_extension("frecency")
			telescope.load_extension("toggleterm")
		end
	},

	-- faster native picker & sorter implementations. zf seems the fastest
	-- {"romgrk/fzy-lua-native", build = "make", event = "CmdlineEnter" },
	-- { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
	-- {
	-- 	"nvim-telescope/telescope-fzy-native.nvim",
	-- 	build = "make",
	-- 	dependencies = {"nvim-telescope/telescope-fzf-native.nvim"},
	-- 	lazy = true,
	-- },
	{ "natecraddock/telescope-zf-native.nvim", lazy = true},

	-- keep telescope from changing directory when picking files
	{
		"desdic/telescope-rooter.nvim",
		lazy = true,
	},

	{
		"nvim-telescope/telescope-frecency.nvim",
		dependencies = { "sqlite.lua" },
		lazy = true,
	},

	{
		"gfeiyou/command-center.nvim",
		lazy = true,
		dependencies = { "telescope.nvim" },
	},


}