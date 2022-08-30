require("basics")
require("plugins")
require("keybindings")
require("navigation")
require("ui")
require("language-support")
require("search")
require("quickfix")

local silent_noremap = { noremap = true, silent = true }

local command_center = require("command_center")
command_center.add({
	{ desc = "Copy GitHub Permalink", cmd = "<leader>gy" },
	{ desc = "Toggle Word Wrap", cmd = "<CMD>set wrap!<CR>" },
	-- @+ is the system clipboard
	-- @" is the default register
	-- so assign default register to system clipboard
	{ desc = "Copy Default Register to System Clipboard", cmd = "<CMD>let @+=@" },
	{ desc = "Close All Buffers", cmd = "<CMD>:bufdo bdelete<CR>" },
	{ desc = "Close Other Buffers", cmd = "<CMD>%bd|e#|bd#<CR>" },
	{ desc = "Copy Relative Filename", cmd = '<CMD>let @" = expand("%")"<CR>' },
	{ desc = "Copy Absolute Filename", cmd = '<CMD>let @" = expand("%:p")"<CR>' },
	{
		desc = "Format Document",
		cmd = function()
			vim.lsp.buf.formatting_sync()
		end,
		keys = { "n", "<leader>f", silent_noremap },
	},
	-- hi
})

require("surround").setup({ mappings_style = "surround" })
-- paired with vim-repeat to repeat surrounding texts

-- require("toggleterm").setup({ open_mapping = [[<C-`>]], hide_numbers = true })

require("project_nvim").setup({})
require("auto-session").setup({
	log_level = "warning",
	-- don't restore by default, so you can use select it from home screen
	auto_restore_enabled = false,
})

require("vgit").setup({
	settings = {
		signs = {
			priority = 30
		}
	}
})
