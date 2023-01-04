local M = {}

M.close_types = {
	'NvimTree',
	'Outline',
	'Trouble',
	'qf',
}

M.superesc = function ()
	print("hi?")
	if M.buffer_is_close_type(vim.bo.filetype) then
		M.close(vim.bo.filetype)
	end
end

M.close = function(ft)
	print(ft)
	if ft == 'qf' then
		vim.cmd('cclose')
	elseif ft == 'Outline' then
		vim.cmd('SymbolsOutlineClose')
	elseif ft == 'Trouble' then
		vim.cmd('TroubleClose')
	elseif ft == 'NvimTree' then
		vim.cmd('NvimTreeClose')
	end
end

M.buffer_is_close_type = function(filetype)
  for _, value in ipairs(M.close_types) do
	  print("value: "..value)
	  if value == filetype then
	  	return true
	  end
  end
  return false
end

return M
