local silent_noremap = { noremap = true, silent = true }
local silent_noremap_both_modes = vim.tbl_deep_extend("keep", silent_noremap, { mode = { "n", "i" } })
return {
	{
		"axkirillov/hbac.nvim",
		config = function()
			local actions = require("hbac.telescope.actions")

			require("hbac").setup({
				threshold = 40,
				telescope = {
					sort_mru = true,
					sort_lastused = true,
					selection_strategy = "row",
					pin_icons = {
						unpinned = { "" },
						pinned = { "󰐃", hl = "DiagnosticError" },
					},
					mappings = {
						i = {
							["<C-u>"] = actions.toggle_selections,
							["<C-w>"] = actions.delete_buffer,
						},
					},
				},
			})
		end,
		cmd = "Hbac",
		event = "VeryLazy",
		keys = {
			{
				"<D-k>",
				function()
					local default_opts = {
						show_all_buffers = true,
						sort_mru = true,
						sort_lastused = true,
						ignore_current_buffer = true,
						cwd_only = false,
						cwd = nil,
					}
					require("hbac").telescope(default_opts)
				end,
				silent_noremap_both_modes,
			},
		},
		command_center = {
			{ desc = "Buffer: Toggle Pin", cmd = "<CMD>Hbac toggle_pin<CR>" },
			{ desc = "Buffer: Close Unpinned", cmd = "<CMD>Hbac close_unpinned<CR>" },
			{ desc = "Buffer: Toggle Autoclose", cmd = "<CMD>Hbac toggle_autoclose<CR>" },
		},
	},
	{
		"akinsho/bufferline.nvim",
		enabled = false,
		dependencies = {
			"nvim-web-devicons",
		},
		event = "VeryLazy",
		opts = {
			options = {
				mode = "tabs",

				separator_style = "thick",
				close_icon = "✕",
				close_command = "bdelete %d",
				buffer_close_icon = "✕",
				offsets = {
					{
						filetype = "NvimTree",
						text = "",
						highlight = "Directory",
						text_align = "left",
					},
					{
						filetype = "filetree",
						text = "",
						highlight = "Explorer",
						text_align = "left",
					},
				},
			},
		},
		config = function(_, opts)
			require("bufferline").setup(opts)

			-- make sure it's only 1... but something else seems to change it after this, sooo
			vim.o.showtabline = 1
		end,
		-- NOTE: only need these when using mode = "buffer"
		-- keys = {
		-- 	{"gb", "<CMD>:BufferLinePick<CR>", silent_noremap},
		-- 	{"gB", "<CMD>:BufferLinePickClose<CR>", silent_noremap},

		-- 	-- Go go to tab
		-- 	{"<D-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", silent_noremap},
		-- 	{"<D-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", silent_noremap},
		-- 	{"<D-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", silent_noremap},
		-- 	{"<D-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", silent_noremap},
		-- 	{"<D-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", silent_noremap},
		-- 	{"<D-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", silent_noremap},
		-- 	{"<D-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", silent_noremap},
		-- 	{"<D-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", silent_noremap},
		-- 	{"<D-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", silent_noremap},
		-- },
		cmd = {
			"BufferLineGroupClose",
			"BufferLineGroupToggle",
			"BufferLineTogglePin",
			"BufferLineSortByExtension",
			"BufferLineSortByDirectory",
			"BufferLineSortByTabs",
			"BufferLinePick",
			"BufferLinePickClose",
			"BufferLineCycleNext",
			"BufferLineCyclePrev",
			"BufferLineMoveNext",
			"BufferLineMovePrev",
		},
		command_center = {
			{ desc = "BufferLine: Toggle Pin", cmd = "<CMD>BufferLineTogglePin<CR>" },
			{ desc = "BufferLine: Sort By Extension", cmd = "<CMD>BufferLineSortByExtension<CR>" },
			{ desc = "BufferLine: Sort By Directory", cmd = "<CMD>BufferLineSortByDirectory<CR>" },
			{ desc = "BufferLine: Sort By Tabs", cmd = "<CMD>BufferLineSortByTabs<CR>" },

			{ desc = "BufferLine: Pick", cmd = "<CMD>BufferLinePick<CR>", keys = { "n", "gb", silent_noremap } },
			{ desc = "BufferLine: Pick to Close", cmd = "<CMD>BufferLinePickClose<CR>" },
		},
	}
}
