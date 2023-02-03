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
			"",
			"Trouble",
			"alpha",
			"checkhealth",
			"dashboard",
			"help",
			"lazy",
			"log",
			"lspinfo",
			"man",
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

function M.file_picker()
	local file_picker_name

	-- prefer git ls-files when available because it's a ton faster
	if vim.fn.empty(vim.fn.FugitiveGitDir()) == 0 then
		file_picker_name = "git_files"
	else
		file_picker_name = "find_files"
	end

	local picker_function = loadstring("require('telescope.builtin')." .. file_picker_name .. "()")
	assert(picker_function, "file picker not found: " .. file_picker_name)

	picker_function()
end

function M.setup()
	-- make it easier for changes to local docs to be updated
	vim.cmd([[
	  augroup custom_help
		autocmd!
		autocmd BufWritePost doc/pickled-vim.txt helptags ~/.config/nvim/doc
	  augroup end
	]])
end

return M
