-- enable conceal to take advantage of vim-markdown support for bold, italics, links, etc
vim.cmd "set conceallevel=2"

-- word wrap
vim.cmd("set wrap")
-- map editing file to gf to work like other plugins
vim.keymap.set("n", "gf", "<Plug>Markdown_EditUrlUnderCursor", {noremap = true, silent = true})

vim.keymap.set("n", "<leader>mt", "<CMD>Toch<CR>", {noremap = true, silent = true, desc = "Show Markdown Table of Contents"})
vim.keymap.set("n", "<leader>m-", "<CMD>HeaderDecrease<CR>", {noremap = true, silent = true, desc = "Decrease Markdown header"})
vim.keymap.set("n", "<leader>m+", "<CMD>HeaderIncrease<CR>", {noremap = true, silent = true, desc = "Increase Markdown header"})
vim.keymap.set("n", "<leader>mi", "<CMD>InsertToc<CR>", {noremap = true, silent = true, desc = "Insert Markdown Table of Contents at current line"})
