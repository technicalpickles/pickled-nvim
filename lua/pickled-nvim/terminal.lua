require("toggleterm").setup({
	open_mapping = [[<c-`>]],
	insert_mapping = true,
	terminal_mappings = true,
})


local silent_noremap = {noremap = true, silent = true}
vim.keymap.set("n", "<D-S-1>", "<Cmd>1ToggleTerm<CR>", silent_noremap)
vim.keymap.set("n", "<D-S-2>", "<Cmd>2ToggleTerm<CR>", silent_noremap)
vim.keymap.set("n", "<D-S-3>", "<Cmd>3ToggleTerm<CR>", silent_noremap)
vim.keymap.set("n", "<D-S-4>", "<Cmd>4ToggleTerm<CR>", silent_noremap)
vim.keymap.set("n", "<D-S-5>", "<Cmd>5ToggleTerm<CR>", silent_noremap)
vim.keymap.set("n", "<D-S-6>", "<Cmd>6ToggleTerm<CR>", silent_noremap)
vim.keymap.set("n", "<D-S-7>", "<Cmd>7ToggleTerm<CR>", silent_noremap)
vim.keymap.set("n", "<D-S-8>", "<Cmd>8ToggleTerm<CR>", silent_noremap)
vim.keymap.set("n", "<D-S-9>", "<Cmd>9ToggleTerm<CR>", silent_noremap)
