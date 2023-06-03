local silent_noremap = { noremap = true, silent = true }
return {
	{
		url = "https://gitlab.com/yorickpeterse/nvim-pqf.git",
		opts = true,
		-- FIXME find a place to hook this so it's ready by the time something pops open quickfix
		ft = "qf",
		event = "VeryLazy",
	},

	{
		"romainl/vim-qf",
		-- not really a dependency, but want it to be available by the time we toggle things
		dependencies = { "nvim-pqf" },
		keys = {
			{ "<D-j>", "<Plug>(qf_qf_toggle)", silent_noremap },
			{ "<leader>qq", "<Plug>(qf_qf_toggle)", silent_noremap },
			{ "<leader>qn", "<Plug>(qf_qf_next)", silent_noremap },
			{ "<leader>qp", "<Plug>(qf_qf_previous)", silent_noremap },
			{ "<leader>ql", "<Plug>(qf_loc_toggle)", silent_noremap },

			{ "<leader>qN", "<Plug>(qf_next_file)", silent_noremap },
			{ "<leader>qP", "<Plug>(qf_previous_file)", silent_noremap },
		},
	},
}
