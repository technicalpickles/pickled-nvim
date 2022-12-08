vim.g.mapleader = ","

local noremap = { noremap = true }
local silent_noremap = { noremap = true, silent = true }
local silent = { silent = true }

-- open browser, since we disabled netrw
vim.keymap.set({ "v", "n" }, "gx", "<Plug>(openbrowser-smart-search)", silent_noremap)

-- quickfix
vim.keymap.set("n", "<leader>qq", "<Plug>(qf_qf_toggle)", noremap)
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
local symbols_outline = "<CMD>SymbolsOutline<CR>"
-- local symbols_outline = "<CMD>Workspace RightPanelToggle<CR>"
vim.keymap.set("n", "<leader>s", symbols_outline, silent_noremap)
vim.keymap.set("n", "<D-.>", symbols_outline, silent_noremap)

-- toggle search highlight
vim.keymap.set({ "n", "v" }, "<leader>nh", "<cmd>nohls<cr>", silent_noremap)

-- { macOS convenience keybinds }--
-- Cut/Copy/Paste to/from system clipboard
vim.keymap.set("v", "<D-c>", '"+y')
vim.keymap.set("v", "<D-x>", '"+c')
vim.keymap.set("", "<D-v>", '"+p')
vim.keymap.set("c", "<D-v>", "<C-r><C-o>+")
vim.keymap.set("i", "<D-v>", "<C-r><C-o>+")

-- save
vim.api.nvim_set_keymap("n", "<C-S>", ":%s/", silent_noremap)

-- Delete a buffer when asking for a "window close"
vim.keymap.set("", "<D-w>", "<cmd>confirm bd<cr>", silent)
vim.keymap.set("i", "<D-w>", "<cmd>confirm bd<cr>", silent)

-- Create new tab with Command-T
vim.keymap.set("", "<D-t>", "<cmd>tabnew<cr>", silent_noremap)
vim.keymap.set("i", "<D-t>", "<cmd>tabnew<cr>", silent_noremap)

-- telescope
vim.keymap.set("n", "<D-f>", "<cmd>lua require('telescope.builtin').live_grep()<CR>", silent_noremap)
-- FIXME: not working
vim.keymap.set("n", "<leader>b", "Telescope buffers<CR>", silent_noremap)
vim.keymap.set("n", "<leader>m", "<cmd>Telescope marks<CR>", silent_noremap)

-- { VS Code and other IDE like behavior }} --

-- ⌘ P - Command Palette
vim.api.nvim_set_keymap("n", "<D-S-p>", "<cmd>Telescope command_center<CR>", silent_noremap)
vim.keymap.set("n", "<leader>c", "<CMD>Telescope command_center<CR>", silent_noremap)

-- ⌘ p - fuzzy find files
local file_picker = "Telescope frecency"
-- local file_picker = "lua file_picker()"
vim.api.nvim_set_keymap("n", "<D-p>", "<cmd>".. file_picker .."<CR>", silent_noremap)
vim.api.nvim_set_keymap("n", "<C-p>", "<cmd>" .. file_picker .. "<CR>", silent_noremap)

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
vim.keymap.set("n", "<S-D-M>", ":TroubleToggle<CR>", silent)
vim.keymap.set("n", "<leader>M", ":TroubleToggle<CR>", silent)

-- ⌘ b - toggle left hand tree
local tree = "<CMD>NvimTreeToggle<CR>"
-- local tree = "<CMD>Workspace ToggleLeftPanel<CR>"
vim.api.nvim_set_keymap("n", "<D-b>", tree, silent_noremap)
vim.api.nvim_set_keymap("n", "<D-/>", tree, silent_noremap)
-- my legacy binding
vim.api.nvim_set_keymap("n", "<leader>d", tree, silent_noremap)

-- ctrl-` toggle terminal
-- see toggleterm's setup

-- ⌘ a - select all
vim.keymap.set("n", "<D-a>", "ggVG", silent)
