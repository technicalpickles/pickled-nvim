local M = {}

M.sign_priorities = {
	-- TODO: can we also change fold?
	git = 5,
	mark = 40,
	diagnostic = 70,
}

M.filetype_config = {
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

return M
