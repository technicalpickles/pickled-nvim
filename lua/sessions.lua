vim.g.lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit,nvimtree,toggleterm"

require("auto-session").setup({
	log_level = "warning",
	-- don't restore by default, so you can use select it from home screen
	auto_restore_enabled = false,
})

vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
