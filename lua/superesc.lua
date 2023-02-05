local M = {}

M.default_config = {
	close_for_type = {
		NvimTree = 'NvimTreeClose',
		Outline = 'SymbolsOutlineClose',
		Trouble = 'TroubleClose',
		qf = 'cclose',
	}
}

M.config =  vim.tbl_extend('keep', M.default_config, {})

M.close_panel = function()
	local command = M.config.close_for_type[vim.bo.filetype]
	if command then
		vim.cmd(command)
		return true
	end
	return false
end

M.close_panels = function()
	for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
		local command = M.window_close_cmd_for_win(winid)
		if command then
			vim.cmd(command)
		end
	end
end

M.window_close_cmd_for_win = function(winid)
	local bufnr = vim.api.nvim_win_get_buf(winid)
	local ft = vim.api.nvim_buf_get_option(bufnr, 'filetype')

	return M.config.close_for_type[ft]
end

M.close_split = function()
	local split_wins = {}
	for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
		if not M.window_close_cmd_for_win(winid) then
			table.insert(split_wins, winid)
		end
	end

	if #split_wins > 1 then
		vim.cmd("close")
	else
		if M.config.last_window_behavior == 'delete' then
			vim.cmd("Bdelete")
		elseif M.config.last_window_behavior == 'scratch' then
			vim.cmd("enew | setlocal buftype=nofile bufhidden=hide noswapfile nobuflisted nomodifiable")
		end
	end
end

M.close = function()
	-- try to close panel first
	if M.close_panel() then
		-- but stop so we don't mess with any other windows
		return
	end

	M.close_split()
	-- special window, ie bottom or side pane
end

M.setup = function(config)
    M.config = vim.tbl_extend("force", M.config, config or {})

	vim.keymap.set("n", "<Esc>", "<CMD>lua require('superesc').close_panel()<CR>")
end

return M
