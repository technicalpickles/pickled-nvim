local silent_noremap = { noremap = true, silent = true }

require("trouble").setup({
	mode = "document_diagnostics",
})

vim.diagnostic.config({
	signs = {
		priority = vim.g.sign_priorities.diagnostic,
	}
})

vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", silent_noremap)
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", silent_noremap)
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", silent_noremap)
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", silent_noremap)
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", silent_noremap)
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", silent_noremap)

-- ⌘ shift m - toggle quickfix (aka problems)
vim.keymap.set("n", "<S-D-M>", ":TroubleToggle<CR>", silent_noremap)
vim.keymap.set("n", "<leader>M", ":TroubleToggle<CR>", silent_noremap)

