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
		},
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
		},
	},
	autopairs = {
		disable = {
			"TelescopePrompt",
			"clap_input",
			"guihua",
			"guihua_rust",
		},
	},
	pasta = {
		disable = {
			"Trouble", -- prevents preview keybinding from working
			"coffeescript",
			"markdown",
			"python",
			"toggleterm",
			"yaml",
		},
	},

	autosession = {
		bypass_autosave = {
			"NvimTree",
			"Outline",
			"Trouble",
			"alpha",
			"lazy",
			"qf",
		},
	},

	copilot = {
		disable = {
			"alpha",
			"help",
			"lazy",
			"log",
			"markdown",
			"text",
			"Nvim",
			"Outline",
			"Trouble",
			"qf",
			"toggleterm",
		},
	},
	lualine = {
		disabled = {
			statusline = { "dashboard", "lazy", "alpha" },
			winbar = {},
		},
	},
	statuscol = {
		ignore = {
			"help",
			"vim",
			"alpha",
			"dashboard",
			"neo-tree",
			"NvimTree",
			"Trouble",
			"noice",
			"lazy",
			"toggleterm",
			"Outline",
		},
	},
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

	-- require("pickled-nvim.servername").save_servername()
end

-- borrowed from lspconfig-bundler

function M.gemlock_contains(gem)
	local lspconfig = require("lspconfig")
	local path_util = lspconfig.util.path

	if vim.fn.filereadable("Gemfile.lock") ~= 1 then
		return
	end

	-- find Gemfile.lock in project
	local current = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
	if #current == 0 then
		current = vim.fn.getcwd()
	end
	local root_dir = lspconfig.util.root_pattern("Gemfile.lock")(path_util.sanitize(current))
	if not root_dir then
		return
	end

	local path = path_util.sanitize(path_util.join(root_dir, "Gemfile.lock"))
	local gem_line = " " .. gem .. " ("

	for line in io.lines(path) do
		if string.find(line, gem_line, 1, true) then
			return true
		end
	end
	return false
end

function M.title()
	local home = vim.fn.expand("$HOME")
	local cwd = vim.fn.expand("%:p:h")
	local cwd_short = string.gsub(cwd, home, "~")
	return cwd_short .. " " .. vim.fn.expand("%t")
end

function M.toggle_relative_numbers()
	if vim.wo.relativenumber then
		vim.wo.relativenumber = false
	else
		vim.wo.relativenumber = true
	end
end

return M
