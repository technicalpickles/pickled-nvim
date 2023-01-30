local o = vim.o
local g = vim.g

-- Disable some in built plugins completely
g.loaded_netrwPlugin = 1
g.loaded_2html_plugin = 1
g.loaded_getscriptPlugin = 1
g.loaded_logipat = 1
g.loaded_rrhelper = 1
g.loaded_vimballPlugin = 1

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
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

g.mapleader = " "

o.signcolumn = "yes:1"
-- o.signcolumn = "auto:2"

-- for nvim-ufo
vim.o.foldcolumn = '1'
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
