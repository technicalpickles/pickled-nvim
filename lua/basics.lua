vim.g.mapleader = ","
vim.o.number  = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.expandtab = true
vim.o.incsearch = true
vim.o.tabstop = 2
vim.o.cursorline = true
vim.o.ignorecase = true
vim.o.hlsearch = false
vim.o.swapfile = false
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.scrolloff = 3
vim.o.errorbells = false
vim.o.shiftwidth = 2
vim.o.numberwidth = 4
vim.o.termguicolors = true
vim.o.colorcolumn = '80'
vim.o.showmode = false
vim.o.showtabline = 2
vim.o.signcolumn = 'yes'
vim.o.mouse = 'a'


vim.o.guifont = 'DankMono Nerd Font Mono:h14'
vim.o.grepprg = 'rg --vimgrep'

vim.api.nvim_set_keymap('n', 'vs', ':vs<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'sp', ':sp<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-L>', '<C-W><C-L>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-H>', '<C-W><C-H>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-K>', '<C-W><C-K>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-J>', '<C-W><C-J>', { noremap = true })
vim.api.nvim_set_keymap('n', 'tn', ':tabnew<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'tk', ':tabnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'tj', ':tabprev<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'to', ':tabo<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-S>', ':%s/', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-N>', ":Lexplore<CR> :vertical resize 30<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>t", ":sp<CR> :term<CR> :resize 20N<CR> i", {noremap = true, silent = true})
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {noremap = true, silent = true})

--{ macOS convenience keybinds }--
-- Cut/Copy/Paste to/from system clipboard
vim.keymap.set('v', '<D-c>', '"+y')
vim.keymap.set('v', '<D-x>', '"+c')
vim.keymap.set('', '<D-v>', '"+p')
vim.keymap.set('c', '<D-v>', '<C-r><C-o>+')
vim.keymap.set('i', '<D-v>', '<C-r><C-o>+')
-- Delete a buffer when asking for a "window close"
vim.keymap.set('', '<D-w>', '<cmd>confirm bd<cr>')
vim.keymap.set('i', '<D-w>', '<cmd>confirm bd<cr>')
-- Create new tab with Command-T
vim.keymap.set('', '<D-t>', '<cmd>tabnew<cr>')
vim.keymap.set('i', '<D-t>', '<cmd>tabnew<cr>')


-- telescope
vim.api.nvim_set_keymap('n', '<C-P>', "<cmd>lua require('telescope.builtin').find_files()<CR>", { noremap = true })
--vim.api.nvim_set_keymap('n', '<C-F>', "<cmd>lua require('telescope.builtin').live_grep()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<C-B>', "<cmd>lua require('telescope.builtin').buffers()<CR>", { noremap = true })

-- nvim-tree
vim.api.nvim_set_keymap('n', '<leader>d', ':NvimTreeToggle<CR>', {noremap = true, silent = true })

-- { VS Code and other IDE like behavior }} --
-- ⌘ / - toggle comment with commentary.vim --
vim.keymap.set('n', '<D-/>', 'gcc', {})
-- ⌘ ]  - shift identation righ
vim.keymap.set('n', '<D-]>', '>>')
vim.keymap.set('v', '<D-]>', '>')
vim.keymap.set('i', '<D-]>', '<C-O>>')

-- ⌘ ] - shift identation righ
vim.keymap.set('n', '<D-[>', '<<')
vim.keymap.set('v', '<D-[>', '<')
vim.keymap.set('i', '<D-[>', '<C-O<<')

-- ⌘ b - toggle left hand tree
vim.api.nvim_set_keymap('n', '<D-b>', ':NvimTreeToggle<CR>', {noremap = true, silent = true })

vim.g["netrw_banner"] = 0
vim.g["netrw_liststyle"] = 3
vim.g["netrw_winsize"] = 25
