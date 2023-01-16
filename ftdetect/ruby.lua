vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = {
		-- https://github.com/danger/danger
		"Dangerfile",
		-- https://github.com/Homebrew/homebrew-bundle
		"Brewfile",
		"*.Brewfile",
		-- https://github.com/rails/thor
		"Thorfile",
		-- https://github.com/mojombo/god
		"*.god",
		-- https://github.com/rack/rack rackup files
		"*.ru",
		-- https://github.com/capistrano/capistrano
		"Capfile",
		".caprc",
		-- https://sorbet.org/docs/rbi
		"*.rbi",
	},
	command = "set filetype=ruby",
})
