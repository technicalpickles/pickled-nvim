local silent_noremap = { noremap = true, silent = true }
local silent_noremap_both_modes = vim.tbl_deep_extend("keep", silent_noremap, { mode = { "n", "i" } })
return {
	{
		"al-ce/hbac.nvim",
		branch = "picker_opts",
		opts = {
			-- threshold = 40,
			telescope = {
				pin_icons = {
					unpinned = { "" },
					pinned = { "󰐃", hl = "DiagnosticError" },
				},
			},
		},
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
}
