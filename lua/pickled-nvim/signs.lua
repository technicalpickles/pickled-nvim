vim.o.signcolumn = "yes:2"

vim.g.sign_priorities = {
	-- TODO can we also change fold?
	git = 5,
	mark = 40,
	diagnostic = 70,
}
