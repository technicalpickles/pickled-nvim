require("telescope").load_extension("command_center")

local silent_noremap = { noremap = true, silent = true }

local command_center = require("command_center")
command_center.add({
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
	{ desc = "Telescope: VIM Options", cmd = "<CMD>Telescope vim_options<CR>" },
	{ desc = "Telescope: Colorschemes", cmd = "<CMD>Telescope colorschemes<CR>" },

	{ desc = "Telescope: Autocommands", cmd = "<CMD>Telescope: autocommands" },
	{ desc = "Telescope: Keymaps", cmd = "<CMD>Telescope: keymaps" },
	{ desc = "Telescope: Filetypes", cmd = "<CMD>Telescope: filetypes" },

	{ desc = "Telescope: Registers", cmd = "<CMD>Telescope registers<CR>"},
	{ desc = "Telescope: Quickfix", cmd = "<CMD>Telescope quickfix<CR>"},
	{ desc = "Telescope: Location List", cmd = "<CMD>Telescope loclist<CR>"},

	{ desc = "Telescope: Spell Suggestion", cmd = "<CMD>Telescope spell_suggest<CR>"},

	{ desc = "Telescope: Projects", cmd = "<CMD>Telescope projects<CR>"},

	{ desc = "BufferLine: Toggle Pin", cmd = "<CMD>BufferLineTogglePin<CR>"},
	{ desc = "BufferLine: Sort By Extension", cmd = "<CMD>BufferLineSortByExtension<CR>"},
	{ desc = "BufferLine: Sort By Directory", cmd = "<CMD>BufferLineSortByDirectory<CR>"},
	{ desc = "BufferLine: Sort By Tabs", cmd = "<CMD>BufferLineSortByTabs<CR>"},

	{ desc = "BufferLine: Pick", cmd = "<CMD>BufferLinePick<CR>", keys = {"n", "gb", silent_noremap}},
	{ desc = "BufferLine: Pick to Close", cmd = "<CMD>BufferLinePickClose<CR>"},

	{ desc = "Git: Toggle Diff Preference", cmd = "<CMD>VGit toggle_diff_preference<CR>"},
	{ desc = "Git: Toggle Gutter", cmd = "<CMD>VGit toggle_live_gutter<CR>"},
	{ desc = "Git: Toggle Blame", cmd = "<CMD>VGit toggle_live_blame<CR>"},
	{ desc = "Git: Toggle Authorship Code Lens", cmd = "<CMD>VGit toggle_authorship_code_lens<CR>"},

	-- { desc = "GitHub: Copy Permalink", cmd = "<leader>gy" },
	{ desc = "GitHub: Open in Browser", cmd = "<CMD>GBrowse<CR>" },

	{ desc = "Direnv: Edit .envrc", cmd = "<CMD>EditEnvrc<CR>"},
	{ desc = "Direnv: Edit global settings", cmd = "<CMD>EditDirenvrc<CR>"},

	{ desc = "Trouble: Toggle", cmd = "<CMD>Trouble<CR>"},
	{ desc = "Trouble: Document Diagnostics", cmd = "<CMD>Trouble document_diagnostics<CR>"},
	{ desc = "Trouble: Workspace Diagnostics", cmd = "<CMD>Trouble workspace_diagnostics<CR>"},
	{ desc = "Trouble: LSP References", cmd = "<CMD>Trouble lsp_references<CR>"},
	{ desc = "Trouble: LSP Definitions", cmd = "<CMD>Trouble lsp_definitions<CR>"},
	{ desc = "Trouble: LSP Type Definitions", cmd = "<CMD>Trouble lsp_type_definitions<CR>"},
	{ desc = "Trouble: Quickfix", cmd = "<CMD>Trouble quickfix<CR>"},
	{ desc = "Trouble: Location List", cmd = "<CMD>Trouble loclist<CR>"},


	{ desc = "SplitJoin: Split", cmd = "<CMD>SplitjoinSplit<CR>"},
	{ desc = "SplitJoin: Join", cmd = "<CMD>SplitjoinJoin<CR>"},

	{ desc = "Characterize: Show unicode of character under cursor", cmd = "ga" },

	{ desc = "Copilot: Setup", cmd = "<CMD>Copilot setup<CR>"},
	{ desc = "Copilot: Signout", cmd = "<CMD>Copilot signout<CR>"},
	{ desc = "Copilot: Disable", cmd = "<CMD>Copilot disable<CR>"},
	{ desc = "Copilot: Enable", cmd = "<CMD>Copilot enable<CR>"},
	{ desc = "Copilot: Status", cmd = "<CMD>Copilot status<CR>"},
	{ desc = "Copilot: Panel", cmd = "<CMD>Copilot panel<CR>"},
	{ desc = "Copilot: Version", cmd = "<CMD>Copilot version<CR>"},
	{ desc = "Copilot: Feedback", cmd = "<CMD>Copilot feedback<CR>"},

	{ desc = "Session: Save Current", cmd = "<CMD>SaveSession<CR>"},
	{ desc = "Session: Restore", cmd = "<CMD>RestoreSession<CR>"},
	{ desc = "Session: Delete Current", cmd = "<CMD>DeleteSession<CR>"},
	{ desc = "Session: Choose which to Restore", cmd = "<CMD>Autosession search<CR>"},
	{ desc = "Session: Choose which to Delete", cmd = "<CMD>Autosession delete<CR>"},

	{ desc = "GUI Font Size: Increase", cmd = "<CMD>GUIFontSizeUp<CR>"},
	{ desc = "GUI Font Size: Decrease", cmd = "<CMD>GUIFontSizeDown<CR>"},
	{ desc = "GUI Font Size: Reset", cmd = "<CMD>GUIFontSizeSet<CR>"},

	{ desc = "Marks: List in Current Buffer", cmd = "<CMD>MarksListBuf<CR>"},
	{ desc = "Marks: List Globally", cmd = "<CMD>MarksListGlobal<CR>"},

	{ desc = "Marks: Toggle", cmd = "m;"},
	{ desc = "Marks: Delete All on Current Line", cmd = "dm-"},
	{ desc = "Marks: Delete All in Current Buffer", cmd = "dm "},
})
