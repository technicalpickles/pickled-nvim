
vim.g.lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit,toggleterm,Trouble"

-- disable to work around https://github.com/windwp/nvim-autopairs/issues/173
vim.g.auto_session_enabled = false
require("auto-session").setup({
	-- log_level = "info",
	log_level = "warning",
	bypass_session_save_file_types = {
		'qf',
		'NvimTree',
		'Trouble',
		'Outline',
	},

	pre_save_cmds = {
		'cclose', -- quickfix
		'NvimTreeClose',
		'SymbolsOutlineClose',
		'TroubleClose',
	},
	-- only keep sessions for this directory
	auto_session_allowed_dirs = { "~/workspace/*" },
})

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
