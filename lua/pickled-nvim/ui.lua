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
	filetypes = {'toggleterm'},
}

require("lualine").setup({
	extensions = {
		"fugitive",
		"man",
		"nvim-tree",
		"quickfix",
		"quickfix",
		"symbols-outline",
		my_toggleterm,
	},
	theme = "auto",
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

-- font
vim.o.guifont = "DankMono Nerd Font:h16"
require("gui-font-resize").setup({
	default_size = 16,
})

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
-- 	filetype_exclude = g.filetype_plugin_config.indent_blankline.exclude,
-- })

-- cursorline
require("nvim-cursorline").setup({
	cursorline = { enable = true, timeout = 1000, number = false },
	cursorword = { enable = true, min_length = 3, hl = { underline = true } },
})

-- startup screen
local dashboard = require("alpha.themes.dashboard")
dashboard.section.buttons.val = {
	dashboard.button("r", "  Restore session", "<Cmd>RestoreSession<CR>"),
	dashboard.button("e", "  New file", ":ene<CR>"),
	dashboard.button("p", "  Open Project", "<Cmd>Telescope projects<CR>"),
	dashboard.button("q", "  Quit NVIM", ":qa<CR>"),
}
require("alpha").setup(dashboard.config)

-- reload current file with focus for frontends that support it
-- https://github.com/neovim/neovim/issues/1936
vim.cmd([[
set autoread
au FocusGained * :checktime
]])

-- mouse
vim.o.mouse = "a"

require('dressing').setup({
	input = {
		default_prompt = '❯ '
	},
	select = {
        get_config = function(opts)
          opts = opts or {}
          local cfg = {
            telescope = {
              layout_config = {
                width = 120,
                height = 25,
              },
            },
          }
          if opts.kind == 'legendary.nvim' then
            cfg.telescope.sorter = require('telescope.sorters').fuzzy_with_index_bias({})
          end
          return cfg
        end,
	}
})

