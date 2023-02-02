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
	},
	lualine = {
		disabled = {
			statusline = {"dashboard", "lazy", "alpha" },
			winbar = {}
		}
	}
}

M.find_obsidian_vault = function()
	if vim.fn.isdirectory(vim.fn.expand("~/workspace/pickled-knowledge/")) == 1 then
		return vim.fn.expand("~/workspace/pickled-knowledge")
	elseif vim.fn.directory(vim.fn.expand("~/workspace/obsidian/")) == 1 then
		return vim.fn.isdirectory("~/Documents/pickled-knowledge")
	end
	return false
end

M.in_obsidian_vault = function()
	local vault = M.find_obsidian_vault()
	return vault and vim.fn.getcwd() == vault
end

return M
