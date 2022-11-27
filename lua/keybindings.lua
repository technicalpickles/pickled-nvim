vim.g.mapleader = ","

local noremap = { noremap = true }
local silent_noremap = { noremap = true, silent = true }
local silent = { silent = true }

-- split management
vim.api.nvim_set_keymap("n", "vs", ":vs<CR>", noremap)
vim.api.nvim_set_keymap("n", "sp", ":sp<CR>", noremap)
-- vim.api.nvim_set_keymap("n", "<C-L>", "<C-W><C-L>", noremap)
-- vim.api.nvim_set_keymap("n", "<C-H>", "<C-W><C-H>", noremap)
-- vim.api.nvim_set_keymap("n", "<C-K>", "<C-W><C-K>", noremap)
-- vim.api.nvim_set_keymap("n", "<C-J>", "<C-W><C-J>", noremap)
-- tab convenience
vim.api.nvim_set_keymap("n", "tn", ":tabnew<CR>", noremap)
vim.api.nvim_set_keymap("n", "tk", ":tabnext<CR>", noremap)
vim.api.nvim_set_keymap("n", "tj", ":tabprev<CR>", noremap)
vim.api.nvim_set_keymap("n", "to", ":tabo<CR>", noremap)

vim.api.nvim_set_keymap("n", "<C-S>", ":%s/", noremap)

-- quickfix
--vim.api.vim_buf_set_keymap("n", "<leader>qq", "<Plug>qf_qf_toggle<CR>", noremap)
vim.api.nvim_set_keymap("n", "<leader>qq", "<Plug>(qf_qf_toggle)", noremap)
vim.keymap.set("n", "<leader>qn", "<Plug>(qf_qf_next)", noremap)
vim.keymap.set("n", "<leader>qp", "<Plug>(qf_qf_previous)", noremap)

vim.api.nvim_set_keymap("n", "<leader>ql", "<Plug>(qf_loc_toggle)", noremap)

vim.keymap.set("n", "<leader>qN", "<Plug>(qf_next_file)", noremap)
vim.keymap.set("n", "<leader>qP", "<Plug>(qf_previous_file)", noremap)

vim.keymap.set("n", "<leader>qb", "<Cmd>BqfToggle<CR>", noremap)

-- trouble
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", silent_noremap)
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", silent_noremap)
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", silent_noremap)
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", silent_noremap)
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", silent_noremap)
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", silent_noremap)

-- terminal mapping
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", silent_noremap)

vim.keymap.set({ "n", "v" }, "K", vim.lsp.buf.hover, { buffer = 0 })

-- symbols outline
vim.api.nvim_set_keymap("n", "<leader>s", "<CMD>SymbolsOutline<CR>", silent_noremap)
vim.api.nvim_set_keymap("n", "<D-.>", "<CMD>SymbolsOutline<CR>", silent_noremap)

-- toggle search highlight
vim.keymap.set({ "n", "v" }, "<leader>nh", "<cmd>nohls<cr>", silent_noremap)

-- { macOS convenience keybinds }--
-- Cut/Copy/Paste to/from system clipboard
vim.keymap.set("v", "<D-c>", '"+y')
vim.keymap.set("v", "<D-x>", '"+c')
vim.keymap.set("", "<D-v>", '"+p')
vim.keymap.set("c", "<D-v>", "<C-r><C-o>+")
vim.keymap.set("i", "<D-v>", "<C-r><C-o>+")
-- Delete a buffer when asking for a "window close"
vim.keymap.set("", "<D-w>", "<cmd>confirm bd<cr>")
vim.keymap.set("i", "<D-w>", "<cmd>confirm bd<cr>")
-- Create new tab with Command-T
vim.keymap.set("", "<D-t>", "<cmd>tabnew<cr>")
vim.keymap.set("i", "<D-t>", "<cmd>tabnew<cr>")

-- telescope
vim.api.nvim_set_keymap("n", "<D-F>", "<cmd>lua require('telescope.builtin').live_grep()<CR>", noremap)
vim.api.nvim_set_keymap("n", "<leader>b", "Telescope buffers<CR>", noremap)
vim.api.nvim_set_keymap("n", "<leader>m", "<cmd>Telescope marks<CR>", noremap)

-- { VS Code and other IDE like behavior }} --

-- ⌘ P - Command Palette
vim.api.nvim_set_keymap('n', '<D-S-p>', "<cmd>Telescope command_center<CR>", { noremap = true })

vim.keymap.set("n", "<leader>c", "<cmd>Telescope command_center<CR>", silent)

-- ⌘ p - fuzzy find files
-- FIXME: frecency really falls over in large repositories
-- vim.api.nvim_set_keymap("n", "<D-p>", "<cmd>Telescope frecency<CR>", noremap)
-- vim.api.nvim_set_keymap("n", "<C-p>", "<cmd>Telescope frecency<CR>", noremap)
vim.api.nvim_set_keymap("n", "<D-p>", "<cmd>lua file_picker()<CR>", noremap)
vim.api.nvim_set_keymap("n", "<C-p>", "<cmd>lua file_picker()<CR>", noremap)

-- ⌘ s - save
vim.keymap.set("n", "<D-s>", ":w<CR>", silent)
vim.keymap.set("n", "<leader>s", ":w<CR>")

-- ⌘ / - toggle comment with commentary.vim --
vim.keymap.set("n", "<D-/>", "gcc", silent)
vim.keymap.set("v", "<D-/>", "gc", silent)
-- ⌘ ]  - shift identation right
vim.keymap.set("n", "<D-]>", ">>", silent)
vim.keymap.set("v", "<D-]>", ">", silent)
vim.keymap.set("i", "<D-]>", "<C-O>>>", silent)

-- ⌘ ] - shift identation left vim.keymap.set("n", "<D-[>", "<<", silent)
vim.keymap.set("n", "<D-[>", "<<", silent)
vim.keymap.set("v", "<D-[>", "<", silent)
vim.keymap.set("i", "<D-[>", "<C-O><<", silent)

-- ⌘ 1 through ⌘ 0 to go to tab - shift identation righ
vim.keymap.set("n", "<D-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", silent_noremap)
vim.keymap.set("n", "<D-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", silent_noremap)
vim.keymap.set("n", "<D-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", silent_noremap)
vim.keymap.set("n", "<D-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", silent_noremap)
vim.keymap.set("n", "<D-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", silent_noremap)
vim.keymap.set("n", "<D-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", silent_noremap)
vim.keymap.set("n", "<D-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", silent_noremap)
vim.keymap.set("n", "<D-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", silent_noremap)
vim.keymap.set("n", "<D-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", silent_noremap)

-- ⌘ -/+ to increase/decrease font. ⌘ 0 to reset font
vim.keymap.set("n", "<D-=>", "<cmd>:GUIFontSizeUp<CR>", silent_noremap)
vim.keymap.set("n", "<D-->", "<cmd>:GUIFontSizeDown<CR>", silent_noremap)
vim.keymap.set("n", "<D-0>", "<cmd>:GUIFontSizeSet<CR>", silent_noremap)

-- ⌘ f - search current
-- ⌘ shift f - search across project
vim.keymap.set("n", "<leader>F", ":Grepper<CR>", silent)
vim.keymap.set("n", "<D-F>", ":Grepper<CR> ", silent)

-- ⌘ shift m - toggle quickfix (aka problems)
-- FIXME neovide can't distinguish between shift and non-shift
-- vim.keymap.set('n', '<S-D-M>', ':TroubleToggle<CR>', silent)
vim.keymap.set("n", "<leader>M", ":TroubleToggle<CR>", silent)

-- ⌘ b - toggle left hand tree
vim.api.nvim_set_keymap("n", "<D-b>", ":NvimTreeToggle<CR>", silent_noremap)
vim.api.nvim_set_keymap("n", "<D-/>", ":NvimTreeToggle<CR>", silent_noremap)
-- vim.api.nvim_set_keymap("n", "<leader>b", ":NvimTreeToggle<CR>", silent_noremap)
-- my legacy binding
vim.api.nvim_set_keymap("n", "<leader>d", ":NvimTreeToggle<CR>", silent_noremap)

-- ctrl-` toggle terminal
-- see toggleterm's setup

-- ⌘ a - select all
vim.keymap.set("n", "<D-a>", "ggVG", silent)
