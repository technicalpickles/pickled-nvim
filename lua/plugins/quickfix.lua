local silent_noremap = { noremap = true, silent = true }
return {
	{
		"kevinhwang91/nvim-bqf",
		config = function(_, opts)
			require("bqf").setup(opts)
		end,
		lazy = false, -- FIXME
		opts = {
			filter = {
				fzf = {
					-- Adapt fzf's delimiter in nvim-bqf
					extra_opts = { "--bind", "ctrl-o:toggle-all", "--delimiter", "│" },
				},
			},
			func_map = {
				-- switch these so I can use C-f and C-b for paging in the quickfix
				pscrollup = "<C-u>",
				pscrolldown = "<C-d>",
			},
		},
		cmd = {"BqfToggle", "BqfAutoToggle"},
		dependencies = {"fzf", "nvim-treesitter"},
		keys = {
			{"<leader>qb", "<Cmd>BqfToggle<CR>", silent_noremap}
		}
	},

	{
		"romainl/vim-qf",
		-- has some global features, so enable it VeryLazy instead of on a ft=qf
		lazy = false,
		keys = {
			{"<leader>qq", "<Plug>(qf_qf_toggle)", silent_noremap},
			{"<leader>qn", "<Plug>(qf_qf_next)", silent_noremap},
			{"<leader>qp", "<Plug>(qf_qf_previous)", silent_noremap},

			{"<leader>ql", "<Plug>(qf_loc_toggle)", silent_noremap},

			{"<leader>qN", "<Plug>(qf_next_file)", silent_noremap},
			{"<leader>qP", "<Plug>(qf_previous_file)", silent_noremap},
		}
	},
}
