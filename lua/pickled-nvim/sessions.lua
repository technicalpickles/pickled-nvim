vim.g.lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit,nvimtree,toggleterm"

require("auto-session").setup({
	log_level = "warning",
	-- only keep sessions for this directory
	auto_session_allowed_dirs = {"~/workspace/*"},
})

vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
