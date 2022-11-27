-- make it easier for changes to local docs to be updated
vim.cmd([[
  augroup custom_help
	autocmd!
	autocmd BufWritePost doc/pickled-vim.txt helptags ~/.config/nvim/doc
  augroup end
]])
