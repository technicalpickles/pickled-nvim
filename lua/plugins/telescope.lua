local silent_noremap = { noremap = true, silent = true }
local silent_noremap_both_modes = vim.tbl_deep_extend("keep", silent_noremap, { mode = { "n", "i" } })
local enabled = require("pickled-nvim").enabled
return {
	{
		"nvim-lua/plenary.nvim"
	},

	{
		"nvim-telescope/telescope.nvim",
		enabled = enabled("nvim-telescope/telescope.nvim"),
		dependencies = {
			"plenary.nvim",
		},
		keys = {
			{ "<D-P>", "<cmd>Telescope commander<CR>", silent_noremap_both_modes },
			{ "<C-S-p>", "<cmd>Telescope commander<CR>", silent_noremap_both_modes },
			{ "<C-S-P>", "<cmd>Telescope commander<CR>", silent_noremap_both_modes },
			{ "<leader>c", "<CMD>Telescope commander<CR>", silent_noremap_both_modes },
			{ "<D-f>", "<cmd>Telescope live_grep_args<CR>", silent_noremap_both_modes },
			{ "<D-F>", "<cmd>Telescope live_grep_args<CR>", silent_noremap_both_modes },
			{ "<leader>b", "<cmd>Telescope buffers<CR>", silent_noremap_both_modes },
			{ "<leader>m", "<cmd>Telescope marks<CR>", silent_noremap_both_modes },

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
				commander = {},
				find_files = {
					-- customize by adding --hidden, so we can get files that start with . which turns out to be a lot
					find_command = { "fd", "--type", "f", "--hidden", "--strip-cwd-prefix" },
				},
				git_files = {},

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
			-- local lga_actions = require("telescope-live-grep-args.actions")
			--
			-- opts.extensions.live_grep_args.mappings = {
			-- 	i = {
			-- 		["<C-k>"] = lga_actions.quote_prompt(),
			-- 		["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
			-- 		["<C-g>"] = lga_actions.quote_prompt({ postfix = " --glob " }),
			-- 		["<C-t>"] = lga_actions.quote_prompt({ postfix = " --type " }),
			-- 	},
			-- }

			local telescope = require("telescope")
			telescope.setup(opts)

			enabled("axkirillov/hbac.nvim")
			telescope.load_extension('hbac')

			--
			-- faster native picker & sorter implementations. zf seems the fastest
			-- telescope.load_extension("fzf")
			-- telescope.load_extension('fzy_native')
			-- telescope.load_extension("zf-native")

			-- telescope.load_extension("rooter")

			-- add other extensions here to be available when autocompleting
			-- telescope.load_extension("toggleterm")
			-- telescope.load_extension("notify")
			-- telescope.load_extension("live_grep_args")
			-- telescope.load_extension("session-lens")
		end,

		commander = {
			{ desc = "Telescope: Files", cmd = "<CMD>Telescope find_files<CR>" },
			{ desc = "Telescope: Buffers", cmd = "<CMD>Telescope buffers<CR>" },

			{ desc = "Telescope: Live Grep", cmd = "<CMD>Telescope live_grep<CR>" },
			{ desc = "Telescope: Live Grep with Args", cmd = "<CMD>Telescope live_grep_args<CR>" },
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
		},
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

	-- keep telescope from changing directory when picking files
	{
		"desdic/telescope-rooter.nvim",
		lazy = true,
	},

	{
		"nvim-telescope/telescope-live-grep-args.nvim",
		enabled = false,
		dependencies = { "plenary.nvim" },
		lazy = true,
		commands = {},
	},

	{
		"FeiyouG/commander.nvim",
		enabled = enabled("FeiyouG/commander.nvim"),
		dependencies = { "nvim-telescope/telescope.nvim" },
		-- commands that don't map to an obvious, specific plugin
		commander = {
			{ desc = "Toggle Word Wrap", cmd = "<CMD>set wrap!<CR>" },
			-- @+ is the system clipboard
			-- @" is the default register
			-- so assign default register to system clipboard
			{ desc = "Buffer: Close All", cmd = "<CMD>:bufdo bdelete<CR>" },
			{ desc = "Buffer: Close Other", cmd = "<CMD>%bd|e#|bd#<CR>" },

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

			{ desc = "Marks: Toggle", cmd = "m;" },
			{ desc = "Marks: Delete All on Current Line", cmd = "dm-" },
			{ desc = "Marks: Delete All in Current Buffer", cmd = "dm " },

			{
				desc = "Line Number: Toggle Relative",
				cmd = "<CMD>lua require('pickled-nvim').toggle_relative_numbers()<CR>",
			},
		},
	},

	-- not techncally telescope, but close
	{
		"jake-stewart/jfind.nvim",
		enabled = enabled("jake-stewart/jfind.nvim"),
		branch = "1.0",
		config = true,
		keys = {
			{
				"<D-p>",
				function()
					local jfind = require("jfind")
					local key = require("jfind.key")

					jfind.findFile({
						preview = true,
						callback = {
							[key.DEFAULT] = vim.cmd.edit,
							[key.CTRL_S] = vim.cmd.split,
							[key.CTRL_X] = vim.cmd.split,
							[key.CTRL_V] = vim.cmd.vsplit,
						},
					})
				end,
			},
			{
				"<C-p>",
				function()
					local jfind = require("jfind")
					local key = require("jfind.key")

					jfind.findFile({
						preview = true,
						callback = {
							[key.DEFAULT] = vim.cmd.edit,
							[key.CTRL_S] = vim.cmd.split,
							[key.CTRL_X] = vim.cmd.split,
							[key.CTRL_V] = vim.cmd.vsplit,
						},
					})
				end,
			},
		},
	},
}
