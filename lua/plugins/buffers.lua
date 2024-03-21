local silent_noremap = { noremap = true, silent = true }
local silent_noremap_both_modes = vim.tbl_deep_extend("keep", silent_noremap, { mode = { "n", "i" } })
local enabled = require("pickled-nvim").enabled

return {
	{
		"axkirillov/hbac.nvim",
		enabled = enabled("axkirillov/hbac.nvim"),
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
					require("telescope").extensions.hbac.buffers(default_opts)
				end,
				desc = "Telescope: Buffers (via HBAC)",
				silent_noremap_both_modes,
			},
		},
		commander = {
			{ desc = "Buffer: Toggle Pin", cmd = "<CMD>Hbac toggle_pin<CR>" },
			{ desc = "Buffer: Close Unpinned", cmd = "<CMD>Hbac close_unpinned<CR>" },
			{ desc = "Buffer: Toggle Autoclose", cmd = "<CMD>Hbac toggle_autoclose<CR>" },
		},
	},
}
