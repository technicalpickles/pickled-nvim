return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-web-devicons" },
		config = function()
			-- statusline
			local function toggleterm_statusline_title()
				local number = vim.b.toggle_number

				return 'ToggleTerm #' .. number
			end

			local function toggleterm_statusline_directory()
				local number = vim.b.toggle_number
				return require("toggleterm.terminal").get(number).dir
			end

			-- customize toggleterm to have less stuff in it
			local my_toggleterm = {
				sections = {
					lualine_a = {'mode'},
					lualine_b = { toggleterm_statusline_title },
					lualine_c = { toggleterm_statusline_directory },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {toggleterm_statusline_title},
					lualine_c = {toggleterm_statusline_directory},
					lualine_x = {},
					lualine_y = {},
					lualine_z = {}
				},
				filetypes = {
					'toggleterm',
				},
			}

			require("lualine").setup({
				options = {
					theme = 'auto',
					globalstatus = true,
					disabled_filetypes = require("pickled-nvim").filetype_config.disabled,
				},
				extensions = {
					"fugitive",
					"man",
					"nvim-tree",
					"quickfix",
					"quickfix",
					"symbols-outline",
					my_toggleterm,
				},
				sections = {
					lualine_a = {'mode'},
					lualine_b = {'branch', 'diagnostics'},
					lualine_c = {'filename'},
					lualine_x = {'filetype'},
					lualine_y = {'progress'},
					lualine_z = {'location'}
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = {'filename'},
					lualine_x = {'location'},
					lualine_y = {},
					lualine_z = {}
				},
			})
		end,
	}
}
