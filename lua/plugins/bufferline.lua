return {
	{
		'akinsho/bufferline.nvim',
		dependencies = {
			"nvim-web-devicons",
		},
		event = "VeryLazy",
		opts = {
			options = {
				mode = "tabs",

				separator_style = "thick",
				close_icon = "✕",
				close_command = "Bdelete %d",
				buffer_close_icon = "✕",
				offsets = {
					{
						filetype = "NvimTree",
						text = "",
						highlight = "Directory",
						text_align = "left",
					},
					{
						filetype = "filetree",
						text = "",
						highlight = "Explorer",
						text_align = "left",
					},
				},
			},
		},
		config = function(_, opts)
			require("bufferline").setup(opts)

			-- make sure it's only 1... but something else seems to change it after this, sooo
			vim.o.showtabline = 1
		end,
		-- NOTE: only need these when using mode = "buffer"
		-- keys = {
		-- 	{"gb", "<CMD>:BufferLinePick<CR>", silent_noremap},
		-- 	{"gB", "<CMD>:BufferLinePickClose<CR>", silent_noremap},

		-- 	-- Go go to tab 
		-- 	{"<D-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", silent_noremap},
		-- 	{"<D-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", silent_noremap},
		-- 	{"<D-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", silent_noremap},
		-- 	{"<D-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", silent_noremap},
		-- 	{"<D-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", silent_noremap},
		-- 	{"<D-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", silent_noremap},
		-- 	{"<D-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", silent_noremap},
		-- 	{"<D-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", silent_noremap},
		-- 	{"<D-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", silent_noremap},
		-- },
		cmd = {
			'BufferLineGroupClose',
			'BufferLineGroupToggle',
			'BufferLineTogglePin',
			'BufferLineSortByExtension',
			'BufferLineSortByDirectory',
			'BufferLineSortByTabs',
			'BufferLinePick',
			'BufferLinePickClose',
			'BufferLineCycleNext',
			'BufferLineCyclePrev',
			'BufferLineMoveNext',
			'BufferLineMovePrev',
		}
	},

}

