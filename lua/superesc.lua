local M = {}

M.close_for_type = {
	NvimTree = 'NvimTreeClose',
	Outline = 'SymbolsOutlineClose',
	Trouble = 'TroubleClose',
	qf = 'cclose',
}

M.close_panel = function()
	local command = M.close_for_type[vim.bo.filetype]
	if command then
		vim.cmd(command)
		return true
	end
	return false
end

M.close_split = function()
	local split_wins = {}
	for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
		local bufnr = vim.api.nvim_win_get_buf(winid)
		local ft = vim.api.nvim_buf_get_option(bufnr, 'filetype')

		if not M.close_for_type[ft] then
			table.insert(split_wins, winid)
		end
	end

	if  #split_wins > 1 then
		vim.cmd("close")
	else
		vim.cmd("Bdelete")
	end
end

M.close = function()
	-- try to close panel first
	if M.close_panel() then
		return
	end

	M.close_split()
	-- special window, ie bottom or side pane
end

return M
