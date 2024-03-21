local silent_noremap = { noremap = true, silent = true }
return {
	{
		"folke/trouble.nvim",
		enabled = require("pickled-nvim").enabled("folke/trouble.nvim"),
		dependencies = "nvim-tree/nvim-web-devicons",
		-- FIXME explicitly setting up in pickled-nvim.diagnostics's setup
		cmd = { "TroubleToggle", "Trouble" },
		opts = {
			use_diagnostic_signs = true,
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
			{ "<leader>xx", "<CMD>TroubleToggle<CR>", silent = true, desc = "Toggle Trouble" },
			{
				"<leader>xw",
				"<CMD>Trouble workspace_diagnostics<CR>",
				silent = true,
				desc = "Trouble workspace diagnostics mode",
			},
			{
				"<leader>xd",
				"<CMD>Trouble document_diagnostics<CR>",
				silent = true,
				desc = "Trouble document diagnostics mode",
			},
			{ "<leader>xl", "<CMD>Trouble loclist<CR>", silent = true, desc = "Trouble loclist mode" },
			{ "<leader>xq", "<CMD>Trouble quickfix<CR>", silent = true, desc = "Trouble quickfix mode" },
			{ "gR", "<CMD>Trouble lsp_references<CR>", silent = true, desc = "Trouble LSP References mode" },

			-- ⌘-shift-m - toggle quickfix (aka problems)
			{ "<S-D-M>", "<cmd>TroubleToggle<CR>", silent = true },
			{ "<leader>M", "<cmd>TroubleToggle<CR>", silent = true },
			{
				"[,",
				function()
					if require("trouble").is_open() then
						require("trouble").previous({ skip_groups = true, jump = true })
					else
						vim.diagnostic.goto_prev()
					end
				end,
				desc = "Previous trouble",
			},
			{
				"],",
				function()
					if require("trouble").is_open() then
						require("trouble").next({ skip_groups = true, jump = true })
					else
						vim.diagnostic.goto_next()
					end
				end,
				desc = "Next trouble",
			},
		},

		commander = {
			{ desc = "Trouble: Toggle", cmd = "<CMD>Trouble<CR>" },
			{ desc = "Trouble: Document Diagnostics", cmd = "<CMD>Trouble document_diagnostics<CR>" },
			{ desc = "Trouble: Workspace Diagnostics", cmd = "<CMD>Trouble workspace_diagnostics<CR>" },

			{ desc = "Trouble: LSP References", cmd = "<CMD>Trouble lsp_references<CR>" },
			{ desc = "Trouble: LSP Definitions", cmd = "<CMD>Trouble lsp_definitions<CR>" },
			{ desc = "Trouble: LSP Type Definitions", cmd = "<CMD>Trouble lsp_type_definitions<CR>" },

			{ desc = "Trouble: Quickfix", cmd = "<CMD>Trouble quickfix<CR>" },
			{ desc = "Trouble: Location List", cmd = "<CMD>Trouble loclist<CR>" },
		},
	},
}
