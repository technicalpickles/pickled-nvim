require("trouble").setup({})

vim.diagnostic.config({
	signs = {
		priority = vim.g.sign_priorities.diagnostic,
	}
})

