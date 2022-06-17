-- for gui 
vim.o.termguicolors = true
vim.o.guifont = 'DankMono Nerd Font Mono:h14'
vim.g.neovide_input_use_logo = true -- Ensure we can pass the command key
vim.g.neovide_confirm_quit = true -- Prevent exit on unsaved buffer on window close
vim.g.neovide_cursor_vfx_mode = "railgun"

-- theme
vim.cmd([[colorscheme neon]])

-- statusline
require('lualine').setup {
  extensions = {'quickfix', 'nvim-tree', 'toggleterm', 'quickfix'},
  theme = 'neon',
}

-- tabs
-- see barbar in plugin.lua
require('bufferline').setup {
  icon_close_tab = '✕'
}
vim.o.showtabline = 2

-- hints for available commands
require("which-key").setup {
}


-- identlines
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

-- TODO: can we make the current context bold in the same color?
require("indent_blankline").setup {
   space_char_blankline = " ",
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
   space_char_highlight_list = {
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

vim.o.colorcolumn = '80'
vim.o.cursorline = true
vim.o.showmode = false

-- startup screen
local alpha = require 'alpha'
local startify = require'alpha.themes.startify'
startify.section.mru.val = { { type = "padding", val = 0 } }
alpha.setup(startify.config)

-- mouse
vim.o.mouse = 'a'


vim.o.scrolloff = 3

vim.o.errorbells = false

vim.o.wrap = false
vim.o.splitbelow = true
vim.o.splitright = true

