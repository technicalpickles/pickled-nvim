
-- Disable some in built plugins completely
vim.g.loaded_netrwPlugin      = 1
vim.g.loaded_2html_plugin     = 1
vim.g.loaded_getscriptPlugin  = 1
vim.g.loaded_logipat          = 1
vim.g.loaded_rrhelper         = 1
vim.g.loaded_vimballPlugin    = 1


CONFIG_PATH = vim.fn.stdpath('config')
DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')

local opt = vim.o

opt.swapfile = false

opt.autoread      = true -- reload changes from disk
opt.scrolloff     = 5 -- Minumum lines to keep above and below cursor
opt.title         = true -- show title

-- formatting
opt.ignorecase = true -- Case insensitive search
opt.smartcase  = true -- ... but case sensitive when uc present

-- indentation
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.numberwidth = 4

-- Undo
opt.undofile   = true -- Persistent undo
opt.undodir    = CACHE_PATH .. '/undo' -- set an undo directory
opt.undolevels = 1000 -- Maximum number of changes that can be undone
opt.undoreload = 10000 -- Maximum number lines to save for undo on a buffer reload

-- search
opt.incsearch = true
opt.hlsearch = true
opt.grepprg = 'rg --vimgrep'
