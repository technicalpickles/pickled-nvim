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

-- FIXME something is overriding this
o.showtabline = 1

-- nerd fronts for fold open/close
-- don't show anything for eob (default ~)
o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

g.mapleader = " "

o.signcolumn = "yes:1"
-- o.signcolumn = "auto:2"

-- for nvim-ufo
o.foldcolumn = '1'
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
