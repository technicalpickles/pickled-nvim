-- for UI frontends
vim.o.termguicolors = true
vim.g.neovide_input_use_logo = true -- Ensure we can pass the command key
vim.g.neovide_confirm_quit = true -- Prevent exit on unsaved buffer on window close
vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.neovide_remember_window_size = true

-- theme
vim.g.tokyodark_transparent_background = false
vim.g.tokyodark_enable_italic_comment = true
vim.g.tokyodark_enable_italic = true
vim.g.tokyodark_color_gamma = "1.0"
vim.g.tokyonight_style = "storm"
-- vim.g.tokyonight_style = "night"
-- vim.g.tokyonight_style = "day"
vim.cmd([[colorscheme tokyonight]])

-- statusline
require("lualine").setup({
	extensions = { "quickfix", "nvim-tree", "toggleterm", "quickfix" },
	theme = "tokyonight",
})

-- terminal
require("toggleterm").setup({
	open_mapping = [[<c-`>]],
	insert_mapping = true,
	terminal_mappings = true,
})

-- vim-pasta
vim.g.pasta_disabled_filetypes = { "toggleterm" }

-- font
vim.o.guifont = "DankMono Nerd Font:h16"
require("gui-font-resize").setup({
	default_size = 16,
})

-- tabs
-- see barbar in plugin.lua
require("bufferline").setup({
	options = {
		close_icon = "✕",
		buffer_close_icon = "✕",
		offsets = {
			{
				filetype = "NvimTree",
				text = "",
				highlight = "Directory",
				text_align = "left",
			},
		},
	},
})
-- always show tab line, even if there is only 1 item
vim.o.showtabline = 2

-- hints for available commands
require("which-key").setup({})

-- identlines
-- match these up with rainbow config for treesitter in language-support.lua
vim.cmd([[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]])

-- TODO: can we make the current context bold in the same color?
require("indent_blankline").setup({
	show_current_context = true,
	show_current_context_start = true,
	char_highlight_list = {
		"IndentBlanklineIndent1",
		"IndentBlanklineIndent2",
		"IndentBlanklineIndent3",
		"IndentBlanklineIndent4",
		"IndentBlanklineIndent5",
		"IndentBlanklineIndent6",
	},
	filetype_exclude = { "markdown", "help", "log", "txt" },
})

-- gutter
-- always show to avoid it jumping around
-- set to 2 to be able to show these plugins:
-- - vgit
-- - marks.nvim
-- NOTE: make sure to adjust priority for consistency
vim.o.signcolumn = "yes:2"
vim.o.number = true
vim.o.relativenumber = true

-- cursorline
require("nvim-cursorline").setup({
	cursorline = { enable = true, timeout = 1000, number = false },
	cursorword = { enable = true, min_length = 3, hl = { underline = true } },
})

vim.o.showmode = false

-- startup screen
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
dashboard.section.buttons.val = {
	dashboard.button("r", "  Restore session", "<Cmd>RestoreSession<CR>"),
	dashboard.button("e", "  New file", ":ene<CR>"),
	dashboard.button("p", "  Open Project", "<Cmd>Telescope projects<CR>"),
	dashboard.button("q", "  Quit NVIM", ":qa<CR>"),
}
alpha.setup(dashboard.config)

-- FIXME: not working on second machine due to python failing to initialize
-- enhance wildmenu
-- local wilder = require("wilder")
-- wilder.setup({ modes = { ":" } })

-- local pipeline = {
-- 	wilder.branch(
-- 		wilder.python_file_finder_pipeline({
-- 			file_command = function(ctx, arg)
-- 				if string.find(arg, ".") ~= nil then
-- 					return { "rg", "--files", "--hidden" }
-- 				else
-- 					return { "rg", "--files" }
-- 				end
-- 			end,
-- 			dir_command = { "fd", "-td" },
-- 			filters = { "fruzzy_filter" },
-- 		}),
-- 		wilder.substitute_pipeline({
-- 			pipeline = wilder.python_search_pipeline({
-- 				skip_cmdtype_check = 1,
-- 				pattern = wilder.python_fuzzy_pattern({
-- 					start_at_boundary = 0,
-- 				}),
-- 			}),
-- 		}),
-- 		wilder.cmdline_pipeline({
-- 			fuzzy = 2,
-- 			fuzzy_filter = wilder.lua_fzy_filter(),
-- 		}),
-- 		{
-- 			wilder.check(function(_, x)
-- 				return x == ""
-- 			end),
-- 			wilder.history(),
-- 		},
-- 		wilder.python_search_pipeline({
-- 			pattern = wilder.python_fuzzy_pattern({
-- 				start_at_boundary = 0,
-- 			}),
-- 		})
-- 	),
-- }
-- wilder.set_option("pipeline", pipeline)

-- local popupmenu_renderer = wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
-- 	border = "rounded",
-- 	highlighter = {
-- 		wilder.lua_fzy_highlighter(),
-- 		wilder.basic_highlighter(),
-- 	},
-- 	highlights = {
-- 		accent = wilder.make_hl("WilderAccent", "Pmenu", { { a = 1 }, { a = 1 }, { foreground = "#f4468f" } }),
-- 	},
-- 	left = {
-- 		" ",
-- 		wilder.popupmenu_devicons(),
-- 		wilder.popupmenu_buffer_flags({
-- 			flags = " a + ",
-- 			icons = { ["+"] = "", a = "", h = "" },
-- 		}),
-- 	},
-- 	right = {
-- 		" ",
-- 		wilder.popupmenu_scrollbar(),
-- 	},
-- }))

-- wilder.set_option("renderer", popupmenu_renderer)

-- reload current file with focus for frontends that support it
-- https://github.com/neovim/neovim/issues/1936
vim.cmd([[
set autoread
au FocusGained * :checktime
]])

-- mouse
vim.o.mouse = "a"

-- how many lines to keep below the current cursor
vim.o.scrolloff = 3

vim.o.errorbells = false

vim.o.wrap = false

-- where do split windows open?
vim.o.splitbelow = true
vim.o.splitright = true
