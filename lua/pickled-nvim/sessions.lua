
vim.g.lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit,toggleterm,Trouble"

vim.g.auto_session_enabled = false
require("auto-session").setup({
	-- log_level = "info",
	log_level = "warning",

	-- list of files that don't shouldn't be considered part of a session if the are the last thing open
	bypass_session_save_file_types = vim.g.filetype_plugin_config.autosession.bypass_autosave,

	pre_save_cmds = {
		'lua require("superesc").close_panels()'
	},

	-- only keep sessions for this directory
	auto_session_allowed_dirs = { "~/workspace/*" },

	-- key by branch
	auto_session_use_git_branch = true,
})

require('session-lens').setup({
	path_display = {'shorten'},
	previewer = true,
	-- no transparency
	theme_conf = { winblend = nil }
})


vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
