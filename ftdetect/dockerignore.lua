-- dockerignore is close enough to gitignore
vim.filetype.add({
	filename = {
		[".dockerignore"] = "gitignore",
	},
})

