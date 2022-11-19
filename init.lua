require("basics")
require("filetypes")
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

	{ desc = "Packer: Install", cmd = "<CMD>so ~/.config/nvim/lua/plugins.lua<CR><CMD>PackerInstall<CR>" },
	{ desc = "Packer: Update", cmd = "<CMD>so ~/.config/nvim/lua/plugins.lua<CR><CMD>PackerUpdate<CR>" },

	{ desc = "Comment: Toggle", cmd = "gcc"},

	{ desc = "Treesitter: Toggle Playground", cmd = "<CMD>TSPlaygroundToggle<CR>"},

	{ desc = "View: Toggle vertical guide lines", cmd = "<CMD>IndentBlanklineToggle<CR>" },

	{ desc = "File: Toggle tree view", cmd = "<CMD>NvimTreeToggle<CR>"},
	{ desc = "File: Reveal current file in tree view", cmd = "<CMD>NvimTreeFindFile<CR>"},

	{ desc = "Telescope: Files", cmd = "<CMD>Telescope find_files<CR>"},
	{ desc = "Telescope: Buffers", cmd = "<CMD>Telescope buffers<CR>"},

	{ desc = "Telescope: Live Grep", cmd = "<CMD>Telescope live_grep<CR>"},
	{ desc = "Telescope: Search History", cmd = "<CMD>Telescope search_history<CR>" },
	{ desc = "Telescope: Highlights", cmd = "<CMD>Telescope highlights<CR>"},


	{ desc = "Telescope: Commands", cmd = "<CMD>Telescope commands<CR>"},
	{ desc = "Telescope: Command History", cmd = "<CMD>Telescope command_history<CR>"},

	{ desc = "Telescope: Tags", cmd = "<CMD>Telescope tags<CR>"},

	{ desc = "Telescope: Help Tags", cmd = "<CMD>Telescope help_tags<CR>"},
	{ desc = "Telescope: Man Pages", cmd = "<CMD>Telescope man_pages<CR>"},
	{ desc = "Telescope: VIM Options", cmd = "<CMD>Telescope: vim_options" },

	{ desc = "Telescope: Autocommands", cmd = "<CMD>Telescope: autocommands" },
	{ desc = "Telescope: Keymaps", cmd = "<CMD>Telescope: keymaps" },
	{ desc = "Telescope: Filetypes", cmd = "<CMD>Telescope: filetypes" },


	{ desc = "Telescope: Registers", cmd = "<CMD>Telescope registers<CR>"},
	{ desc = "Telescope: Quickfix", cmd = "<CMD>Telescope quickfix<CR>"},
	{ desc = "Telescope: Location List", cmd = "<CMD>Telescope loclist<CR>"},

	{ desc = "Telescope: Spell Suggestion", cmd = "<CMD>Telescope spell_suggest<CR>"},

	{ desc = "BufferLine: Toggle Pin", cmd = "<CMD>BufferLineTogglePin<CR>"},
	{ desc = "BufferLine: Sort By Extension", cmd = "<CMD>BufferLineSortByExtension<CR>"},
	{ desc = "BufferLine: Sort By Directory", cmd = "<CMD>BufferLineSortByDirectory<CR>"},
	{ desc = "BufferLine: Sort By Tabs", cmd = "<CMD>BufferLineSortByTabs<CR>"},

	{ desc = "BufferLine: Pick", cmd = "<CMD>BufferLinePick<CR>", keys = {"n", "gb", silent_noremap}},
	{ desc = "BufferLine: Pick to Close", cmd = "<CMD>BufferLinePickClose<CR>"},

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
