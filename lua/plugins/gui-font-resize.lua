local silent_noremap = { noremap = true, silent = true }

return {
	{
		"ktunprasert/gui-font-resize.nvim",
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
	},
}
