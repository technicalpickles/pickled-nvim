-- barebones config (mostly vim.g and vim.o)
require("pickled-nvim.basics")

-- setup lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

-- post-lazy config
require("pickled-nvim").setup()
require("pickled-nvim.keybindings")
require("superesc").setup({
	last_window_behavior = "scratch",
})
