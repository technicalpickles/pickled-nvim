local M = {}

M.setup = function ()
	local opt = vim.o
	local g = vim.g

	-- formatting
	opt.ignorecase = true -- Case insensitive search
	opt.smartcase = true -- ... but case sensitive when uc present

	-- indentation
	opt.expandtab = true
	opt.tabstop = 2
	opt.shiftwidth = 2
	opt.numberwidth = 4

	-- Undo
	opt.undofile = true -- Persistent undo
	opt.undodir = CACHE_PATH .. "/undo" -- set an undo directory
	opt.undolevels = 1000 -- Maximum number of changes that can be undone
	opt.undoreload = 10000 -- Maximum number lines to save for undo on a buffer reload

	-- word wrap
	vim.o.wrap = false
end

M.opts = {
	sibling_swap = {
		use_default_keymaps = false,
	}
}

M.keys = {
	sibling_swap = {
		{"<C-.>", "<cmd>lua require('sibling-swap').swap_with_right()<CR>", {noremap = true, silent = true, desc = "Swap Sibling with Right"}},
		{"<C-,>", "<cmd>lua require('sibling-swap').swap_with_left()<CR>", {noremap = true, silent = true}, desc = "Swap Sibling with Left"},
		-- FIXME figure out how this is supposed to work
		-- {"<leader>.>", "<cmd>lua require('sibling-swap').swap_with_right_with_opp()<CR>", {noremap = true, silent = true, desc = "Swap Sibling Right Separator for Opposite Value"}},
		-- {"<leader>,", "<cmd>lua require('sibling-swap').swap_with_left_with_opp()<CR>", {noremap = true, silent = true}, desc = "Swap Sibling Left Separator for Opposite Value"},
	},
}

return M
