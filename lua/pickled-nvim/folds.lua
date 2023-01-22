local M = {}

M.opts = {
	ufo = {
		-- performance and stability are better than `foldmethod=nvim_treesitter#foldexpr()`
		provider_selector = function()
			return {'treesitter', 'indent'}
		end
	}
}

local silent_noremap = {noremap = true, silent = true }
M.keys = {
	ufo = {
		-- FIXME: error loading lua string, '=' expected near '<eof>', but works fine when used directly
		{"K", "<CMD>lua require('pickled-nvim.folds').peekOrHover()<CR>", { buffer = 0, noremap = false, silent = true }},

		{"zR", "<CMD>lua require('ufo').openAllFolds()<CR>", silent_noremap},
		{"zM", "<CMD>lua require('ufo').closeAllFolds()<CR>", silent_noremap},

		{"<D-M-[>", "zf", silent_noremap},
		{"<D-M-]>", "zo", silent_noremap},
	}
}

M.peekOrHover = function()
	local current_window = 0
	local current_line, _ = unpack(vim.api.nvim_win_get_cursor(current_window))

	if require('ufo.utils').foldClosed(current_window, current_line) > 0 then
		require('ufo').peekFoldedLinesUnderCursor()
	else
		vim.lsp.buf.hover()
	end
end

M.setup = function()
	-- from nvim-ufo
	vim.o.foldcolumn = '1'
	vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
	vim.o.foldlevelstart = 99
	vim.o.foldenable = true
end

return M
