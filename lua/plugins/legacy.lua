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
		-- there is overlap with direnv somewhat, but more interested in filetype
		"tpope/vim-dotenv",
		cmd = {
			"Dotenv",
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
		"famiu/bufdelete.nvim",
		enabled = enabled("famiu/bufdelete.nvim"),
		cmd = "Bdelete",
	},
}
