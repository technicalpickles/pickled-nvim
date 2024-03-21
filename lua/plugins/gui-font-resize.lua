local silent_noremap = { noremap = true, silent = true }
local enabled = vim.g.neovide and vim.fn.has("macunix")
return {
	{
		"ktunprasert/gui-font-resize.nvim",
		enabled = enabled,
		keys = {
			-- ⌘ -/+ to increase/decrease font. ⌘ 0 to reset font
			{ "<D-=>", "<cmd>:GUIFontSizeUp<CR>", silent_noremap },
			{ "<D-->", "<cmd>:GUIFontSizeDown<CR>", silent_noremap },
			{ "<D-0>", "<cmd>:GUIFontSizeSet<CR>", silent_noremap },
		},
		cmd = {
			"GUISetFontSizeUp",
			"GUISetFontSizeDown",
			"GUISetFontSizeSet",
		},
		opts = {
			default_size = 16,
		},
		commander = {
			{ desc = "GUI Font Size: Increase", cmd = "<CMD>GUIFontSizeUp<CR>" },
			{ desc = "GUI Font Size: Decrease", cmd = "<CMD>GUIFontSizeDown<CR>" },
			{ desc = "GUI Font Size: Reset", cmd = "<CMD>GUIFontSizeSet<CR>" },
		},
	},
}
