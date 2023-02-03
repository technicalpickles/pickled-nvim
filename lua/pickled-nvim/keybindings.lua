local silent_noremap = { noremap = true, silent = true }
local silent = { silent = true }

vim.keymap.set({"v", "n"}, ",", "<leader>", silent_noremap)

-- open browser, since we disabled netrw
vim.keymap.set({ "v", "n" }, "gx", "<Plug>(openbrowser-smart-search)", silent_noremap)

-- terminal mapping
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", silent_noremap)

-- hashrocket, textmate style
-- TODO make it smarter about leading/trailing space
vim.keymap.set("n", "<C-l>", "=>", silent)

-- { macOS convenience keybinds }--
-- Cut/Copy/Paste to/from system clipboard
vim.keymap.set("v", "<D-c>", '"+y')
vim.keymap.set("v", "<D-x>", '"+c')
vim.keymap.set("", "<D-v>", '"+p')
vim.keymap.set("c", "<D-v>", "<C-r><C-o>+")
vim.keymap.set("i", "<D-v>", "<C-r><C-o>+")

-- ⌘ s - save
vim.keymap.set("n", "<D-s>", ":w<CR>", silent)
vim.keymap.set("n", "<leader>s", ":w<CR>", silent)
vim.api.nvim_set_keymap("n", "<C-S>", ":%s/", silent_noremap)
-- ⌘ a - select all
vim.keymap.set("n", "<D-a>", "ggVG", silent)

-- ⌘ / - close current window
-- local close_command = 'Bdelete'
local close_command = "lua require('superesc').close()"
vim.keymap.set("", "<D-w>", "<cmd>"..close_command.."<cr>", silent)
vim.keymap.set("i", "<D-w>", "<cmd>"..close_command.."<cr>", silent)

-- Create new tab with Command-T
vim.keymap.set("", "<D-t>", "<cmd>tabnew<cr>", silent_noremap)
vim.keymap.set("i", "<D-t>", "<cmd>tabnew<cr>", silent_noremap)

-- { VS Code and other IDE like behavior }} --
-- ⌘ / - toggle comment
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


-- toggle search highlight
vim.keymap.set({ "n", "v" }, "<leader>nh", "<cmd>nohls<cr>", silent_noremap)
