
vim.cmd([[
  augroup custom_help
	autocmd!
	autocmd BufWritePost doc/pickled-vim.txt helptags ~/.config/nvim/doc
  augroup end
]])
