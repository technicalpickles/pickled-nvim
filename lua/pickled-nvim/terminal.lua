require("toggleterm").setup({
	open_mapping = [[<c-`>]],
	insert_mapping = true,
	terminal_mappings = true,
})

-- function _focus_or_toggle()
-- 	if vim.bo.filetype == "toggleterm" then
-- 		vim.cmd [[ToggleTerm]]
-- 	else
-- 	end
-- end
