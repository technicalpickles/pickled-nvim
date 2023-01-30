require("pickled-nvim.basics")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
	"git",
	"clone",
	"--filter=blob:none",
	"https://github.com/folke/lazy.nvim.git",
	"--branch=stable", -- latest stable release
	lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")


require("pickled-nvim.filetypes").setup()
require("pickled-nvim.ui").setup()

require("pickled-nvim.keybindings")

require("pickled-nvim.tabs")
require("pickled-nvim.quickfix")

require("pickled-nvim.search")
require("pickled-nvim.editor").setup()
require("pickled-nvim.tree")
require("pickled-nvim.navigation")

require("pickled-nvim.pairs")
require("pickled-nvim.language-support").setup() -- requires folds

require("pickled-nvim.ide")
require("pickled-nvim.second-brain")
require("pickled-nvim.chatgpt")

require("pickled-nvim.custom-help")
require("pickled-nvim.legendary-which-key-palette")

-- require("project_nvim").setup({})

-- FIXME default node neovide sees is /opt/homebrew/bin/node, which is the latest 18.x ... but there are issues on Apple Silicon
-- see various issues on community ie https://github.com/community/community/discussions/16298
vim.g.copilot_node_command = "/opt/homebrew/opt/node@16/bin/node"
