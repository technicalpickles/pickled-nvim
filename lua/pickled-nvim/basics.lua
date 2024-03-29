local o = vim.o
local g = vim.g

-- Disable some in built plugins completely
g.loaded_netrwPlugin = 1 -- nvim-tree
g.loaded_2html_plugin = 1
g.loaded_getscriptPlugin = 1
g.loaded_logipat = 1
g.loaded_rrhelper = 1
g.loaded_vimballPlugin = 1

g.loaded_matchit = 1 -- vim-matchup

CONFIG_PATH = vim.fn.stdpath("config")
DATA_PATH = vim.fn.stdpath("data")
CACHE_PATH = vim.fn.stdpath("cache")

o.errorbells = false

o.swapfile = false

o.autoread = true -- reload changes from disk

o.number = true
o.relativenumber = true

o.showmode = false

-- where do split windows open?
o.splitbelow = true
o.splitright = true

-- Minumum lines to keep above and below cursor
o.scrolloff = 5
-- show title
o.title = true

function custom_title()
	local home = vim.fn.expand("$HOME")
	local cwd = vim.fn.getcwd()
	return string.gsub(cwd, home, "~")
end

o.titlestring = "%{v:lua.custom_title()}"

-- FIXME something is overriding this
o.showtabline = 1

-- nerd fronts for fold open/close
-- don't show anything for eob (default ~)
o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

g.mapleader = " "

-- don't use o.signcolumn, as we'll use statuscol to manage it

-- for nvim-ufo
o.foldcolumn = "1"
o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
o.foldlevelstart = 99
o.foldenable = true

-- formatting
o.ignorecase = true -- Case insensitive search
o.smartcase = true -- ... but case sensitive when uc present

-- indentation
o.expandtab = true
o.tabstop = 2
o.shiftwidth = 2
o.numberwidth = 4

-- Undo
o.undofile = true -- Persistent undo
o.undodir = CACHE_PATH .. "/undo" -- set an undo directory
o.undolevels = 1000 -- Maximum number of changes that can be undone
o.undoreload = 10000 -- Maximum number lines to save for undo on a buffer reload

-- word wrap
o.wrap = false

-- search
o.incsearch = true
o.hlsearch = true
o.grepprg = "rg --vimgrep"

-- for UI frontends
o.termguicolors = true
g.neovide_input_use_logo = true -- Ensure we can pass the command key
g.neovide_confirm_quit = true -- Prevent exit on unsaved buffer on window close
g.neovide_cursor_vfx_mode = "railgun"
g.neovide_remember_window_size = true

g.neovide_padding_top = 0
g.neovide_padding_bottom = 0
g.neovide_padding_right = 0
g.neovide_padding_left = 0
-- without this, winbar scrolls up when scrolling https://github.com/neovide/neovide/issues/1550
g.neovide_scroll_animation_length = 0

-- for some reason, windows end up tiny?
g.neovide_remember_window_size = false

-- font
vim.o.guifont = "DankMono Nerd Font:h16"

-- mouse
vim.o.mouse = "a"

-- reload current file with focus for frontends that support it
-- https://github.com/neovim/neovim/issues/1936
vim.cmd([[
set autoread
au FocusGained * :checktime
]])
