local api = vim.api
local g = vim.g

local M = {}

M.opts = {
	chafa = {
		min_padding = 0,
		show_label = false,
	}
}

M.setup = function()
	--{ docker  }--
	api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
		pattern = { ".dockerignore" },
		command = "set filetype=gitignore",
	})

	--{ markdown  }--
	g.vim_markdown_edit_url_in = 'current'
	g.vim_markdown_strikethrough = 1
	g.vim_markdown_frontmatter = 1
	g.vim_markdown_fenced_languages = {
		'c++=cpp',
		'viml=vim',
		'bash=sh',
		'ini=dosini'
	}
	g.vim_markdown_new_list_item_indent = 0

	-- ufo / lsp folding is more accurate than vim-markdown
	g.vim_markdown_folding_disabled = 1


	-- pasta, which helps correctly indent
	g.pasta_disabled_filetypes = require("pickled-nvim").filetype_config.pasta.disable
end

return M
