require("plugins")

require("pickled-nvim.basics")
require("pickled-nvim.signs")
require("pickled-nvim.filetypes").setup()
require("pickled-nvim.ui").setup()

require("pickled-nvim.git")

require("pickled-nvim.keybindings")

require("pickled-nvim.tabs")
require("pickled-nvim.quickfix")
require("pickled-nvim.sessions")

require("pickled-nvim.search")
require("pickled-nvim.editor")
require("pickled-nvim.tree")
require("pickled-nvim.navigation")

require("pickled-nvim.treesitter")
require("pickled-nvim.pairs")
require("pickled-nvim.folds").setup() -- requires treesitter first
require("pickled-nvim.language-support").setup() -- requires folds
require("pickled-nvim.diagnostics")

require("pickled-nvim.ide")
require("pickled-nvim.second-brain")
require("pickled-nvim.chatgpt")

require("pickled-nvim.custom-help")
require("pickled-nvim.legendary-which-key-palette")

-- require("project_nvim").setup({})

-- FIXME default node neovide sees is /opt/homebrew/bin/node, which is the latest 18.x ... but there are issues on Apple Silicon
-- see various issues on community ie https://github.com/community/community/discussions/16298
vim.g.copilot_node_command = "/opt/homebrew/opt/node@16/bin/node"
