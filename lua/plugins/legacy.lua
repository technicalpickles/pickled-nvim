local g = vim.g
local enabled = require("pickled-nvim").enabled

return {
	-- per project alternate setup
	{
		"tpope/vim-projectionist",
		event = "VeryLazy",
	},

	-- lots of handy shortcuts
	{
		"tpope/vim-unimpaired",
		event = "VeryLazy",
	},

	{
		"junegunn/fzf",
		-- TODO confirm this isn't needed, or make lazy
		enabled = false,
		build = function()
			vim.fn["fzf#install"]()
		end,
	},

	{
		"tpope/vim-characterize",
		keys = {
			{
				"ga",
				"<Plug>(characterize)",
				"Print the unicode value of character in decimal, hex, and octal, HTML entity, Emoji, etc",
			},
		},
		command_center = {
			{ desc = "Characterize: Show unicode of character under cursor", cmd = "ga" },
		},
	},

	-- directory specific path, etc
	{
		"direnv/direnv.vim",
		enabled = enabled("direnv/direnv.vim"),
		command_center = {
			{ desc = "Direnv: Edit .envrc", cmd = "<CMD>EditEnvrc<CR>" },
			{ desc = "Direnv: Edit global settings", cmd = "<CMD>EditDirenvrc<CR>" },
		},
	},

	-- replace gx for URLs when netrw is disabled
	{
		"tyru/open-browser.vim",
		keys = {
			-- open browser, since we disabled netrw
			{ "gx", "<Plug>(openbrowser-smart-search)", { mode = { "v", "n" } } },
		},
		cmd = {
			"OpenBrowser",
			"OpenBrowserSearch",
		},
	},

	{
		"mattboehm/vim-unstack",
		enabled = false,
		cmd = {
			"UnstackFromText",
			"UnstackFromClipboard",
			"UnstackFromTmux",
			"UnstackFromSelection",
		},
		config = function()
			g.unstack_mapkey = ""
			g.unstack_populate_quickfix = 1
		end,
	},

	{
		"famiu/bufdelete.nvim",
		enabled = enabled("famiu/bufdelete.nvim"),
		cmd = "Bdelete",
	},
}
