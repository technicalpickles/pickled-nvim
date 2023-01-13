-- see barbar in plugin.lua
require("bufferline").setup({
	options = {
		separator_style = "thick",
		close_icon = "✕",
		close_command = "Bdelete %d",
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



local silent_noremap = {noremap = true, silent = true}
vim.keymap.set("n", "gb", "<CMD>:BufferLinePick<CR>", silent_noremap)
vim.keymap.set("n", "gB", "<CMD>:BufferLinePickClose<CR>", silent_noremap)

-- ⌘ 1 through ⌘ 0 to go to tab 
vim.keymap.set("n", "<D-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", silent_noremap)
vim.keymap.set("n", "<D-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", silent_noremap)
vim.keymap.set("n", "<D-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", silent_noremap)
vim.keymap.set("n", "<D-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", silent_noremap)
vim.keymap.set("n", "<D-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", silent_noremap)
vim.keymap.set("n", "<D-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", silent_noremap)
vim.keymap.set("n", "<D-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", silent_noremap)
vim.keymap.set("n", "<D-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", silent_noremap)
vim.keymap.set("n", "<D-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", silent_noremap)
