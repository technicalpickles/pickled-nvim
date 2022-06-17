-- for UI frontends
vim.o.termguicolors = true
vim.o.guifont = 'DankMono Nerd Font Mono:h14'
vim.g.neovide_input_use_logo = true -- Ensure we can pass the command key
vim.g.neovide_confirm_quit = true -- Prevent exit on unsaved buffer on window close
vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.neovide_remember_window_size = true

-- theme
vim.g.tokyodark_transparent_background = false
vim.g.tokyodark_enable_italic_comment = true
vim.g.tokyodark_enable_italic = true
vim.g.tokyodark_color_gamma = "1.0"
vim.cmd([[colorscheme tokyodark]])

-- statusline
require('lualine').setup {
  extensions = {'quickfix', 'nvim-tree', 'toggleterm', 'quickfix'},
}

-- tabs
-- see barbar in plugin.lua
require('bufferline').setup {
  icon_close_tab = '✕'
}
-- always show tab line, even if there is only 1 item
vim.o.showtabline = 2

-- hints for available commands
require("which-key").setup {
}

-- identlines
-- match these up with rainbow config for treesitter in language-support.lua
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

-- TODO: can we make the current context bold in the same color?
require("indent_blankline").setup {
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
}

-- gutter
vim.o.signcolumn = 'yes'
vim.o.number  = true
vim.o.relativenumber = true

-- cursorline
require('nvim-cursorline').setup {
  cursorline = {
    enable = true,
    timeout = 1000,
    number = false,
  },
  cursorword = {
    enable = true,
    min_length = 3,
    hl = { underline = true },
  }
}


-- vim.o.colorcolumn = '80'
vim.o.showmode = false

-- startup screen
local alpha = require 'alpha'
local startify = require'alpha.themes.startify'
startify.section.mru.val = { { type = "padding", val = 0 } }
alpha.setup(startify.config)

-- mouse
vim.o.mouse = 'a'

-- how many lines to keep below the current cursor
vim.o.scrolloff = 3

vim.o.errorbells = false

vim.o.wrap = false

-- where do split windows open?
vim.o.splitbelow = true
vim.o.splitright = true
