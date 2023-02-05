local M = {}

M.peekOrHover = function()
	local current_window = 0
	local current_line, _ = unpack(vim.api.nvim_win_get_cursor(current_window))

	if require('ufo.utils').foldClosed(current_window, current_line) > 0 then
		require('ufo').peekFoldedLinesUnderCursor()
	else
		vim.lsp.buf.hover()
	end
end

return M
