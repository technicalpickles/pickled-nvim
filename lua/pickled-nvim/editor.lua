local opt = vim.o

-- formatting
opt.ignorecase = true -- Case insensitive search
opt.smartcase = true -- ... but case sensitive when uc present

-- indentation
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.numberwidth = 4

-- Undo
opt.undofile = true -- Persistent undo
opt.undodir = CACHE_PATH .. "/undo" -- set an undo directory
opt.undolevels = 1000 -- Maximum number of changes that can be undone
opt.undoreload = 10000 -- Maximum number lines to save for undo on a buffer reload

-- pasta, which helps correctly indent
vim.g.pasta_disabled_filetypes = { "toggleterm" }


-- word wrap
vim.o.wrap = false

require('sibling-swap').setup({})
