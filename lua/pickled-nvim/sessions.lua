vim.g.lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit,nvimtree,toggleterm,Trouble"

require("auto-session").setup({
	log_level = "info",
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

	-- NOTE: be careful changing this, as a few other plugins interact with directory changes:
	-- * nvim-tree
	-- * telescope
	--
	-- cwd_change_handling = {
	-- },
})

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
