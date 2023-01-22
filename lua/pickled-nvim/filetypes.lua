local api = vim.api
local g = vim.g

--{ images }--
require("chafa").setup()

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

	--{ global filetype-related settings in one place for re-use }--
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
				"Trouble", -- prevents preview keybinding from working
			}
		},

		autosession = {
			bypass_autosave = {
				'qf',
				'NvimTree',
				'Trouble',
				'Outline',
			}
		},

		copilot = {
			disable = {
				'Nvim',
				'Outline',
				'Trouble',
				'qf',
				'toggleterm',
				"help",
				"log",
				"markdown",
				"text",
			}
		}

	}

	-- pasta, which helps correctly indent
	g.pasta_disabled_filetypes = g.filetype_plugin_config.pasta.disable
end

return M
