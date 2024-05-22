local g = vim.g
local enabled = require("pickled-nvim").enabled
return {
	{
		"preservim/vim-markdown",
		ft = "markdown",
		dependencies = { "godlygeek/tabular" },
		config = function()
			if vim.g.vscode then
				vim.g.vim_markdown_conceal = 0
			end

			--{ markdown  }--
			g.vim_markdown_edit_url_in = "current"
			g.vim_markdown_strikethrough = 1
			g.vim_markdown_frontmatter = 1
			g.vim_markdown_fenced_languages = {
				"c++=cpp",
				"viml=vim",
				"bash=sh",
				"ini=dosini",
			}
			g.vim_markdown_new_list_item_indent = 0

			-- ufo / lsp folding is more accurate than vim-markdown
			g.vim_markdown_folding_disabled = 1
		end,
	},

	{
		"dhruvasagar/vim-table-mode",
		ft = "markdown",
	},

	{
		"lukas-reineke/headlines.nvim",
		enabled = enabled("lukas-reineke/headlines.nvim"),
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = true, -- or `opts = {}`
	},
}
