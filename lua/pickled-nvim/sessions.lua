vim.g.lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit,nvimtree,toggleterm"

require("auto-session").setup({
	log_level = "info",

	-- only keep sessions for this directory
	auto_session_allowed_dirs = {"~/workspace/*"},

	-- NOTE: be careful changing this, as a few other plugins interact with directory changes:
	-- * nvim-tree
	-- * telescope
	--
	-- cwd_change_handling = {
	-- },
})

vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
