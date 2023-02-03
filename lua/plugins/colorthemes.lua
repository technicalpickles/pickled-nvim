local g = vim.g

return {
	{
		"folke/tokyonight.nvim",
		-- make sure it's first to avoid flicker
		lazy = false,
		priority = 1000,
		config = function ()
			-- theme
			g.tokyodark_transparent_background = false
			g.tokyodark_enable_italic_comment = true
			g.tokyodark_enable_italic = true
			g.tokyodark_color_gamma = "1.0"
			g.tokyonight_style = "storm"
			-- g.tokyonight_style = "night"
			-- g.tokyonight_style = "day"
			vim.cmd([[colorscheme tokyonight]])
		end
	},
	{ "ayu-theme/ayu-vim", lazy = true },
	{ "averak/laserwave.vim", lazy = true },
	{ "rafamadriz/neon", lazy = true },
}
