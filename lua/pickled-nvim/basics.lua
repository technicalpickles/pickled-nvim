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


o.swapfile = false

o.autoread = true -- reload changes from disk

o.number = true
o.relativenumber = true

