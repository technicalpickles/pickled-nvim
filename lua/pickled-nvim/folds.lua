-- from nvim-ufo
vim.o.foldcolumn = '1'
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- performance and stability are better than `foldmethod=nvim_treesitter#foldexpr()`
require('ufo').setup({
    provider_selector = function()
        return {'treesitter', 'indent'}
    end
})

function PeekOrHover()
	local current_window = 0
	local current_line, _ = unpack(vim.api.nvim_win_get_cursor(current_window))

	if require('ufo.utils').foldClosed(current_window, current_line) > 0 then
		require('ufo').peekFoldedLinesUnderCursor()
	else
		vim.lsp.buf.hover()
	end
end

local silent_noremap = {noremap = true, silent = true }
vim.keymap.set("n", "K", PeekOrHover, { buffer = 0, noremap = false, silent = true })

vim.keymap.set('n', 'zR', require('ufo').openAllFolds, silent_noremap)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, silent_noremap)

-- VS Code-like
vim.keymap.set("n", "<D-M-[>", "zf", silent_noremap)
vim.keymap.set("n", "<D-M-]>", "zo", silent_noremap)
