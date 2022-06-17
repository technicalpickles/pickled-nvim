-- for gui 
vim.o.termguicolors = true
vim.o.guifont = 'DankMono Nerd Font Mono:h14'

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

-- gutter
vim.o.signcolumn = 'yes'
vim.o.number  = true
vim.o.relativenumber = true

vim.o.colorcolumn = '80'
vim.o.cursorline = true
vim.o.showmode = false

vim.o.scrolloff = 3

vim.o.errorbells = false

vim.o.wrap = false
vim.o.splitbelow = true
vim.o.splitright = true

vim.o.mouse = 'a'

vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.neovide_input_use_logo = true -- Ensure we can pass the command key
vim.g.neovide_confirm_quit = true -- Prevent exit on unsaved buffer on window close
