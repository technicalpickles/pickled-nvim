require("basics")
require("filetypes")
require("plugins")
require("keybindings")
require("navigation")
require("ui")
require("language-support")
require("search")
require("quickfix")
require("sessions")
require("command_palette")


require("surround").setup({ mappings_style = "surround" })
-- paired with vim-repeat to repeat surrounding texts

-- require("toggleterm").setup({ open_mapping = [[<C-`>]], hide_numbers = true })

require("project_nvim").setup({})

-- FIXME default node neovide sees is /opt/homebrew/bin/node, which is the latest 18.x ... but there are issues on Apple Silicon
-- see various issues on community ie https://github.com/community/community/discussions/16298
vim.g.copilot_node_command = "/opt/homebrew/opt/node@16/bin/node"  

