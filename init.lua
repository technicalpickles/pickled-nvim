require("pickled-nvim.basics")

require("pickled-nvim.keybindings")
require("pickled-nvim.plugins")

require("pickled-nvim.ui")
require("pickled-nvim.search")
require("pickled-nvim.editor")
require("pickled-nvim.navigation")
require("pickled-nvim.quickfix")
require("pickled-nvim.sessions")

require("pickled-nvim.treesitter")
require("pickled-nvim.filetypes")
require("pickled-nvim.autopairs")
require("pickled-nvim.language-support")

require("pickled-nvim.command_palette")

require("pickled-nvim.custom-help")


require("surround").setup({ mappings_style = "surround" })
-- paired with vim-repeat to repeat surrounding texts

-- require("toggleterm").setup({ open_mapping = [[<C-`>]], hide_numbers = true })

require("project_nvim").setup({})

-- FIXME default node neovide sees is /opt/homebrew/bin/node, which is the latest 18.x ... but there are issues on Apple Silicon
-- see various issues on community ie https://github.com/community/community/discussions/16298
vim.g.copilot_node_command = "/opt/homebrew/opt/node@16/bin/node"  
