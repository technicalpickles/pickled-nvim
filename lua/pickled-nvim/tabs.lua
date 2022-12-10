-- see barbar in plugin.lua
require("bufferline").setup({
	options = {
		close_icon = "✕",
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
})
-- always show tab line, even if there is only 1 item
vim.o.showtabline = 2
