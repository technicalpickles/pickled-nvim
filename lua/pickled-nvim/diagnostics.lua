local M = {}

local silent_noremap = { noremap = true, silent = true }

M.setup = function()
	require("trouble").setup({
		mode = "document_diagnostics",

		action_keys = {
			close = "<esc>",
			cancel = nil,
		},

		-- FIXME opening toggleterm kinda messes with this a lot
		-- auto_open = true,
		auto_close = true,
	})

	vim.diagnostic.config({
		signs = {
			priority = vim.g.sign_priorities.diagnostic,
		}
	})
end

M.opts = {
	trouble = {
		mode = "document_diagnostics",

		action_keys = {
			close = "<esc>",
			cancel = nil,
		},

		-- FIXME opening toggleterm kinda messes with this a lot
		-- auto_open = true,
		auto_close = true,
	}
}

M.cmd = {
	trouble = { "TroubleToggle", "Trouble" },
}

M.keys = {
	trouble = {
		{"<leader>xx", "<CMD>TroubleToggle<CR>", silent_noremap},
		{"<leader>xw", "<CMD>Trouble workspace_diagnostics<CR>", silent_noremap},
		{"<leader>xd", "<CMD>Trouble document_diagnostics<CR>", silent_noremap},
		{"<leader>xl", "<CMD>Trouble loclist<CR>", silent_noremap},
		{"<leader>xq", "<CMD>Trouble quickfix<CR>", silent_noremap},
		{"gR", "<CMD>Trouble lsp_references<CR>", silent_noremap},

		-- ⌘-shift-m - toggle quickfix (aka problems)
		{"<S-D-M>", "<cmd>TroubleToggle<CR>", silent_noremap},
		{"<leader>M", "<cmd>TroubleToggle<CR>", silent_noremap},
	}
}

return M
