local M = {}

M.setup = function()
	local o = vim.o
	local g = vim.g

	-- for UI frontends
	o.termguicolors = true
	g.neovide_input_use_logo = true -- Ensure we can pass the command key
	g.neovide_confirm_quit = true -- Prevent exit on unsaved buffer on window close
	g.neovide_cursor_vfx_mode = "railgun"
	g.neovide_remember_window_size = true

	-- theme
	g.tokyodark_transparent_background = false
	g.tokyodark_enable_italic_comment = true
	g.tokyodark_enable_italic = true
	g.tokyodark_color_gamma = "1.0"
	g.tokyonight_style = "storm"
	-- g.tokyonight_style = "night"
	-- g.tokyonight_style = "day"
	vim.cmd([[colorscheme tokyonight]])


	-- font
	vim.o.guifont = "DankMono Nerd Font:h16"

	-- identlines
	-- match these up with rainbow config for treesitter in language-support.lua
	vim.cmd([[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]])
	vim.cmd([[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]])
	vim.cmd([[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]])
	vim.cmd([[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]])
	vim.cmd([[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]])
	vim.cmd([[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]])

	-- TODO: can we make the current context bold in the same color?
	-- require("indent_blankline").setup({
	-- 	show_current_context = true,
	-- 	show_current_context_start = true,
	-- 	char_highlight_list = {
	-- 		"IndentBlanklineIndent1",
	-- 		"IndentBlanklineIndent2",
	-- 		"IndentBlanklineIndent3",
	-- 		"IndentBlanklineIndent4",
	-- 		"IndentBlanklineIndent5",
	-- 		"IndentBlanklineIndent6",
	-- 	},
	-- 	filetype_exclude = require("pickled-nvim").filetype_config.indent_blankline.exclude,
	-- })

	-- reload current file with focus for frontends that support it
	-- https://github.com/neovim/neovim/issues/1936
	vim.cmd([[
	set autoread
	au FocusGained * :checktime
	]])

	-- mouse
	vim.o.mouse = "a"
end

return M
