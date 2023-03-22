-- DO NOT change the paths and don't remove the colorscheme
local root = vim.fn.fnamemodify("./.repro", ":p")

-- set stdpaths to use .repro
for _, name in ipairs({ "config", "data", "state", "cache" }) do
	vim.env[("XDG_%s_HOME"):format(name:upper())] = root .. "/" .. name
end

-- bootstrap lazy
local lazypath = root .. "/plugins/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath })
end
vim.opt.runtimepath:prepend(lazypath)

local silent_noremap = { noremap = true, silent = true }

-- set mapleader to space
vim.g.mapleader = " "

-- install plugins
local plugins = {
	"folke/tokyonight.nvim",
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		cmd = { "TroubleToggle", "Trouble" },
		keys = {
			{ "<leader>xx", "<CMD>TroubleToggle<CR>", silent_noremap },
			{ "<leader>xw", "<CMD>Trouble workspace_diagnostics<CR>", silent_noremap },
			{ "<leader>xd", "<CMD>Trouble document_diagnostics<CR>", silent_noremap },
			{ "<leader>xl", "<CMD>Trouble loclist<CR>", silent_noremap },
			{ "<leader>xq", "<CMD>Trouble quickfix<CR>", silent_noremap },
			{ "gR", "<CMD>Trouble lsp_references<CR>", silent_noremap },

			-- ⌘-shift-m - toggle quickfix (aka problems)
			{ "<S-D-M>", "<cmd>TroubleToggle<CR>", silent_noremap },
			{ "<leader>M", "<cmd>TroubleToggle<CR>", silent_noremap },
		},
	},
	-- add any other plugins here
}
require("lazy").setup(plugins, {
	root = root .. "/plugins",
})

vim.cmd.colorscheme("tokyonight")
-- add anything else here
