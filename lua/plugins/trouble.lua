local silent_noremap = { noremap = true, silent = true }
return {
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		-- FIXME explicitly setting up in pickled-nvim.diagnostics's setup
		cmd = { "TroubleToggle", "Trouble" },
		opts = {
			mode = "document_diagnostics",

			action_keys = {
				close = "<esc>",
				cancel = nil,
			},

			-- FIXME opening toggleterm kinda messes with this a lot
			-- auto_open = true,
			auto_close = true,
		},
		keys = {
			{"<leader>xx", "<CMD>TroubleToggle<CR>", silent = true, desc = "Toggle Trouble"},
			{"<leader>xw", "<CMD>Trouble workspace_diagnostics<CR>", silent = true, desc = "Trouble workspace diagnostics mode"},
			{"<leader>xd", "<CMD>Trouble document_diagnostics<CR>", silent = true, desc = "Trouble document diagnostics mode"},
			{"<leader>xl", "<CMD>Trouble loclist<CR>", silent = true, desc = "Trouble loclist mode"},
			{"<leader>xq", "<CMD>Trouble quickfix<CR>", silent = true, desc = "Trouble quickfix mode"},
			{"gR", "<CMD>Trouble lsp_references<CR>", silent = true, desc = "Trouble LSP References mode"},

			-- ⌘-shift-m - toggle quickfix (aka problems)
			{"<S-D-M>", "<cmd>TroubleToggle<CR>", silent = true},
			{"<leader>M", "<cmd>TroubleToggle<CR>", silent = true},
		}
	}
}
