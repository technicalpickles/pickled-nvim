vim.g.lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit,nvimtree,toggleterm"

require("auto-session").setup({
	log_level = "warning",
	auto_restore_enabled = false,
	auto_save_enabled = false,
	auto_session_enable_last_session = false,

	-- only keep sessions for this directory
	auto_session_allowed_dirs = {"~/workspace/*"},

	cwd_change_handling = {
		post_cwd_changed_hook = function()
			require("lualine").refresh()
		end,
	},
})

vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
