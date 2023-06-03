local file_picker = "Telescope frecency"
-- local file_picker = "lua file_picker()"
local silent_noremap = { noremap = true, silent = true }
local silent_noremap_both_modes = vim.tbl_deep_extend("keep", silent_noremap, { mode = { "n", "i" } })
return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "plenary.nvim" },
		keys = {
			{ "<D-S-p>", "<cmd>Telescope command_center<CR>", silent_noremap_both_modes },
			{ "<leader>c", "<CMD>Telescope command_center<CR>", silent_noremap_both_modes },
			{ "<D-f>", "<cmd>Telescope live_grep_args<CR>", silent_noremap_both_modes },
			{ "<D-S-f>", "<cmd>Telescope live_grep_args<CR>", silent_noremap_both_modes },
			{ "<leader>b", "<cmd>Telescope buffers<CR>", silent_noremap_both_modes },
			{ "<leader>m", "<cmd>Telescope marks<CR>", silent_noremap_both_modes },

			{ "<D-p>", "<cmd>" .. file_picker .. "<CR>", silent_noremap_both_modes },
			{ "<C-p>", "<cmd>" .. file_picker .. "<CR>", silent_noremap_both_modes },

			{ "<D-g>", "<cmd>Telescope git_files<CR>", silent_noremap_both_modes },
		},
		opts = {
			defaults = {
				theme = "dropdown",
				prompt_prefix = "  ",
				layout_strategy = "horizontal",
				layout_config = {},
				mappings = {
					n = {
						["<C-a>"] = { "<HOME>", type = "command" },
						["<C-e>"] = { "<END>", type = "command" },
					},
					i = {
						["<C-a>"] = { "<HOME>", type = "command" },
						["<C-e>"] = { "<END>", type = "command" },
					},
				},
			},
			extensions = {
				frecency = {
					default_workspace = "CWD",
					show_filter_column = false,
					show_unindexed = false,
					ignore_patterns = { "*.git/*", "*/tmp/*", "node_modules/*" },
				},
				rooter = {
					enable = true,
					patterns = { ".git" },
					debug = false,
				},
				-- live_grep_args also has mappings `config`
				live_grep_args = {},
			},
			pickers = {
				buffers = {
					sort_lastused = true,
					sort_mru = true,
					ignore_current_buffer = true,
				},
				command_center = {},
				find_files = {
					-- customize by adding --hidden, so we can get files that start with . which turns out to be a lot
					find_command = { "fd", "--type", "f", "--hidden", "--strip-cwd-prefix" },
				},
				git_files = {},
				frecency = {},

				notify = {
					theme = "ivy",
				},
				live_grep_args = {},
				live_grep = {
					-- layout_config = {
					-- 	-- (almost) full screen
					-- 	height = 0.99,
					-- 	width = 0.99,
					-- },
				},
			},
		},
		cmd = "Telescope",
		config = function(_, opts)
			local lga_actions = require("telescope-live-grep-args.actions")

			opts.extensions.live_grep_args.mappings = {
				i = {
					["<C-k>"] = lga_actions.quote_prompt(),
					["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
					["<C-g>"] = lga_actions.quote_prompt({ postfix = " --glob " }),
					["<C-t>"] = lga_actions.quote_prompt({ postfix = " --type " }),
				},
			}

			local telescope = require("telescope")
			telescope.setup(opts)

			--
			-- faster native picker & sorter implementations. zf seems the fastest
			-- telescope.load_extension("fzf")
			-- telescope.load_extension('fzy_native')
			telescope.load_extension("zf-native")

			telescope.load_extension("rooter")

			-- add other extensions here to be available when autocompleting
			telescope.load_extension("frecency")
			telescope.load_extension("toggleterm")
			telescope.load_extension("command_center")
			telescope.load_extension("notify")
			telescope.load_extension("live_grep_args")
			telescope.load_extension("session-lens")
		end,
	},

	-- faster native picker & sorter implementations. zf seems the fastest
	-- {"romgrk/fzy-lua-native", build = "make", event = "CmdlineEnter" },
	-- { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
	-- {
	-- 	"nvim-telescope/telescope-fzy-native.nvim",
	-- 	build = "make",
	-- 	dependencies = {"nvim-telescope/telescope-fzf-native.nvim"},
	-- 	lazy = true,
	-- },
	{ "natecraddock/telescope-zf-native.nvim", lazy = true },

	-- keep telescope from changing directory when picking files
	{
		"desdic/telescope-rooter.nvim",
		lazy = true,
	},

	{
		"nvim-telescope/telescope-frecency.nvim",
		dependencies = { "sqlite.lua" },
		lazy = true,
	},

	{
		"nvim-telescope/telescope-live-grep-args.nvim",
		dependencies = { "plenary.nvim" },
		lazy = true,
	},

	{
		"gfeiyou/command-center.nvim",
		lazy = true,
		config = function()
			local command_center = require("command_center")
			command_center.add({
				{ desc = "Toggle Word Wrap", cmd = "<CMD>set wrap!<CR>" },
				-- @+ is the system clipboard
				-- @" is the default register
				-- so assign default register to system clipboard
				{ desc = "Buffer: Close All", cmd = "<CMD>:bufdo bdelete<CR>" },
				{ desc = "Buffer: Close Other", cmd = "<CMD>%bd|e#|bd#<CR>" },
				{ desc = "Buffer: Toggle Pin", cmd = "<CMD>Hbac toggle_pin<CR>" },
				{ desc = "Buffer: Close Unpinned", cmd = "<CMD>Hbac close_unpinned<CR>" },
				{ desc = "Buffer: Toggle Autoclose", cmd = "<CMD>Hbac toggle_autoclose<CR>" },

				{ desc = "Copy Default Register to System Clipboard", cmd = "<CMD>let @+=@" },
				{ desc = "Copy Relative Filename", cmd = '<CMD>let @" = expand("%")"<CR>' },
				{ desc = "Copy Absolute Filename", cmd = '<CMD>let @" = expand("%:p")"<CR>' },
				{
					desc = "Format Document",
					cmd = function()
						vim.lsp.buf.formatting_sync()
					end,
					keys = { "n", "<leader>f", silent_noremap },
				},

				{ desc = "Fold", cmd = "zf" },
				{ desc = "Fold All", cmd = "zM" },
				{ desc = "Unfold", cmd = "zo" },
				{ desc = "Unfold All", cmd = "zM" },

				{ desc = "Packer: Install", cmd = "<CMD>so ~/.config/nvim/lua/plugins.lua<CR><CMD>PackerInstall<CR>" },
				{ desc = "Packer: Update", cmd = "<CMD>so ~/.config/nvim/lua/plugins.lua<CR><CMD>PackerUpdate<CR>" },

				{ desc = "Comment: Toggle", cmd = "gcc" },

				{ desc = "Tree: Toggle", cmd = "<CMD>NvimTreeToggle<CR>" },
				{ desc = "Tree: Focus on current file", cmd = "<CMD>NvimTreeFindFile<CR>" },
				{ desc = "Tree: Toggle focusing on current file", cmd = "<CMD>NvimTreeFindFileToggle<CR>" },

				{ desc = "Treesitter: Toggle Playground", cmd = "<CMD>TSPlaygroundToggle<CR>" },

				{ desc = "View: Toggle vertical guide lines", cmd = "<CMD>IndentBlanklineToggle<CR>" },

				{ desc = "File: Toggle tree view", cmd = "<CMD>NvimTreeToggle<CR>" },
				{ desc = "File: Reveal current file in tree view", cmd = "<CMD>NvimTreeFindFile<CR>" },

				{ desc = "Telescope: Files", cmd = "<CMD>Telescope find_files<CR>" },
				{ desc = "Telescope: Buffers", cmd = "<CMD>Telescope buffers<CR>" },

				{ desc = "Telescope: Live Grep", cmd = "<CMD>Telescope live_grep<CR>" },
				{ desc = "Telescope: Search History", cmd = "<CMD>Telescope search_history<CR>" },
				{ desc = "Telescope: Highlights", cmd = "<CMD>Telescope highlights<CR>" },

				{ desc = "Telescope: Commands", cmd = "<CMD>Telescope commands<CR>" },
				{ desc = "Telescope: Command History", cmd = "<CMD>Telescope command_history<CR>" },

				{ desc = "Telescope: Tags", cmd = "<CMD>Telescope tags<CR>" },

				{ desc = "Telescope: Help Tags", cmd = "<CMD>Telescope help_tags<CR>" },
				{ desc = "Telescope: Man Pages", cmd = "<CMD>Telescope man_pages<CR>" },
				{ desc = "Telescope: VIM Options", cmd = "<CMD>Telescope vim_options<CR>" },
				{ desc = "Telescope: Colorschemes", cmd = "<CMD>Telescope colorschemes<CR>" },

				{ desc = "Telescope: Autocommands", cmd = "<CMD>Telescope: autocommands" },
				{ desc = "Telescope: Keymaps", cmd = "<CMD>Telescope: keymaps" },
				{ desc = "Telescope: Filetypes", cmd = "<CMD>Telescope: filetypes" },

				{ desc = "Telescope: Registers", cmd = "<CMD>Telescope registers<CR>" },
				{ desc = "Telescope: Quickfix", cmd = "<CMD>Telescope quickfix<CR>" },
				{ desc = "Telescope: Location List", cmd = "<CMD>Telescope loclist<CR>" },

				{ desc = "Telescope: Spell Suggestion", cmd = "<CMD>Telescope spell_suggest<CR>" },

				{ desc = "Telescope: Projects", cmd = "<CMD>Telescope projects<CR>" },

				{ desc = "Telescope (LSP): References", cmd = "<CMD>Telescope lsp_references<CR>" },
				{ desc = "Telescope (LSP): Incoming Calls", cmd = "<CMD>Telescope lsp_incoming_calls<CR>" },
				{ desc = "Telescope (LSP): Outgoing Calls", cmd = "<CMD>Telescope lsp_outgoing_calls<CR>" },
				{ desc = "Telescope (LSP): Document Symbols", cmd = "<CMD>Telescope lsp_document_symbols<CR>" },
				{ desc = "Telescope (LSP): Workspace Symbols", cmd = "<CMD>Telescope lsp_workspace_symbols<CR>" },
				{ desc = "Telescope (LSP): Diagnostics", cmd = "<CMD>Telescope diagnostics<CR>" },
				{ desc = "Telescope (LSP): Implementations", cmd = "<CMD>Telescope lsp_implementations<CR>" },
				{ desc = "Telescope (LSP): Definitions", cmd = "<CMD>Telescope lsp_definitions<CR>" },
				{ desc = "Telescope (LSP): Type Definitions", cmd = "<CMD>Telescope lsp_type_definitions<CR>" },

				{ desc = "Telescope: Terminals", cmd = "<CMD>Telescope toggleterm<CR>" },

				{ desc = "BufferLine: Toggle Pin", cmd = "<CMD>BufferLineTogglePin<CR>" },
				{ desc = "BufferLine: Sort By Extension", cmd = "<CMD>BufferLineSortByExtension<CR>" },
				{ desc = "BufferLine: Sort By Directory", cmd = "<CMD>BufferLineSortByDirectory<CR>" },
				{ desc = "BufferLine: Sort By Tabs", cmd = "<CMD>BufferLineSortByTabs<CR>" },

				{ desc = "BufferLine: Pick", cmd = "<CMD>BufferLinePick<CR>", keys = { "n", "gb", silent_noremap } },
				{ desc = "BufferLine: Pick to Close", cmd = "<CMD>BufferLinePickClose<CR>" },

				{ desc = "Git: Toggle Diff Preference", cmd = "<CMD>VGit toggle_diff_preference<CR>" },
				{ desc = "Git: Toggle Gutter", cmd = "<CMD>VGit toggle_live_gutter<CR>" },
				{ desc = "Git: Toggle Blame", cmd = "<CMD>VGit toggle_live_blame<CR>" },
				{ desc = "Git: Toggle Authorship Code Lens", cmd = "<CMD>VGit toggle_authorship_code_lens<CR>" },

				-- { desc = "GitHub: Copy Permalink", cmd = "<leader>gy" },
				{ desc = "GitHub: Open in Browser", cmd = "<CMD>GBrowse<CR>" },

				{ desc = "Direnv: Edit .envrc", cmd = "<CMD>EditEnvrc<CR>" },
				{ desc = "Direnv: Edit global settings", cmd = "<CMD>EditDirenvrc<CR>" },

				{ desc = "Trouble: Toggle", cmd = "<CMD>Trouble<CR>" },
				{ desc = "Trouble: Document Diagnostics", cmd = "<CMD>Trouble document_diagnostics<CR>" },
				{ desc = "Trouble: Workspace Diagnostics", cmd = "<CMD>Trouble workspace_diagnostics<CR>" },

				{ desc = "Trouble: LSP References", cmd = "<CMD>Trouble lsp_references<CR>" },
				{ desc = "Trouble: LSP Definitions", cmd = "<CMD>Trouble lsp_definitions<CR>" },
				{ desc = "Trouble: LSP Type Definitions", cmd = "<CMD>Trouble lsp_type_definitions<CR>" },

				{ desc = "Trouble: Quickfix", cmd = "<CMD>Trouble quickfix<CR>" },
				{ desc = "Trouble: Location List", cmd = "<CMD>Trouble loclist<CR>" },

				{ desc = "SplitJoin: Split", cmd = "<CMD>SplitjoinSplit<CR>" },
				{ desc = "SplitJoin: Join", cmd = "<CMD>SplitjoinJoin<CR>" },

				{ desc = "Characterize: Show unicode of character under cursor", cmd = "ga" },

				{ desc = "Copilot: Setup", cmd = "<CMD>Copilot setup<CR>" },
				{ desc = "Copilot: Signout", cmd = "<CMD>Copilot signout<CR>" },
				{ desc = "Copilot: Disable", cmd = "<CMD>Copilot disable<CR>" },
				{ desc = "Copilot: Enable", cmd = "<CMD>Copilot enable<CR>" },
				{ desc = "Copilot: Status", cmd = "<CMD>Copilot status<CR>" },
				{ desc = "Copilot: Panel", cmd = "<CMD>Copilot panel<CR>" },
				{ desc = "Copilot: Version", cmd = "<CMD>Copilot version<CR>" },
				{ desc = "Copilot: Feedback", cmd = "<CMD>Copilot feedback<CR>" },

				{ desc = "Session: Save Current", cmd = "<CMD>SaveSession<CR>" },
				{ desc = "Session: Restore", cmd = "<CMD>RestoreSession<CR>" },
				{ desc = "Session: Delete Current", cmd = "<CMD>DeleteSession<CR>" },
				{ desc = "Session: Choose which to Restore", cmd = "<CMD>Autosession search<CR>" },
				{ desc = "Session: Choose which to Delete", cmd = "<CMD>Autosession delete<CR>" },

				{ desc = "GUI Font Size: Increase", cmd = "<CMD>GUIFontSizeUp<CR>" },
				{ desc = "GUI Font Size: Decrease", cmd = "<CMD>GUIFontSizeDown<CR>" },
				{ desc = "GUI Font Size: Reset", cmd = "<CMD>GUIFontSizeSet<CR>" },

				{ desc = "Marks: List in Current Buffer", cmd = "<CMD>MarksListBuf<CR>" },
				{ desc = "Marks: List Globally", cmd = "<CMD>MarksListGlobal<CR>" },

				{ desc = "Marks: Toggle", cmd = "m;" },
				{ desc = "Marks: Delete All on Current Line", cmd = "dm-" },
				{ desc = "Marks: Delete All in Current Buffer", cmd = "dm " },

				{ desc = "Copilot: Status", cmd = "<CMD>Copilot<CR>" },
				{ desc = "Copilot: Show Solutions", cmd = "<CMD>Copilot<CR>" },

				{
					desc = "Line Number: Toggle Relative",
					cmd = "<CMD>lua require('pickled-nvim').toggle_relative_numbers()<CR>",
				},
			})
		end,
	},
}
