local api = vim.api
local g = vim.g

-- images
require("chafa").setup({
	min_padding = 0,
	show_label = false,
})

--{ ruby }--
api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = {
		"Dangerfile",
		"Brewfile",
		"*.Brewfile",
		"Capfile",
		"Thorfile",
		"*.god",
		"*.ru",
		".caprc",
		"*.rbi",
	},
	command = "set filetype=ruby",
})

--{ docker  }--
api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { ".dockerignore" },
	command = "set filetype=gitignore",
})

--{ markdown  }--
api.nvim_create_autocmd("FileType", {
	pattern = { "markdown" },
	callback = function ()
		-- conceal italics, bold, links, etc via vim-markdown
		vim.cmd("set conceallevel=2")
		-- word wrap
		vim.cmd("set wrap")
		-- map editing file to gf to work like other plugins
		vim.keymap.set("n", "gf", "<Plug>Markdown_EditUrlUnderCursor", {noremap = true, silent = true})

		vim.keymap.set("n", "<leader>mt", "<CMD>Toch<CR>", {noremap = true, silent = true, desc = "Show Markdown Table of Contents"})
		vim.keymap.set("n", "<leader>m-", "<CMD>HeaderDecrease<CR>", {noremap = true, silent = true, desc = "Decrease Markdown header"})
		vim.keymap.set("n", "<leader>m+", "<CMD>HeaderIncrease<CR>", {noremap = true, silent = true, desc = "Increase Markdown header"})
		vim.keymap.set("n", "<leader>mi", "<CMD>InsertToc<CR>", {noremap = true, silent = true, desc = "Insert Markdown Table of Contents at current line"})
	end
})

api.nvim_create_autocmd("FileType", {
	pattern = {"markdown"},
	command = "set conceallevel=2"
})

g.vim_markdown_edit_url_in = 'current'

-- ufo / lsp folding is more accurate than vim-markdown
g.vim_markdown_folding_disabled = 1

g.filetype_plugin_config = {
	rainbow = {
		disable = {
			"help",
			"log",
			"text",
		}
	},
	indent_blankline = {
		exclude = {
			"help",
			"log",
			"markdown",
			"text",
		}
	},
	autopairs = {
		disable = {
			"TelescopePrompt",
			"clap_input",
			"guihua",
			"guihua_rust",
		}
	},
	pasta = {
		disable = {
			"coffeescript",
			"markdown",
			"python",
			"toggleterm",
			"yaml",
		}
	},
}

-- pasta, which helps correctly indent
g.pasta_disabled_filetypes = g.filetype_plugin_config.pasta.disable

