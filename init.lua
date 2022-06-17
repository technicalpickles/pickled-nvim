require('basics')
require('plugins')
require('keybindings')
require('ui')
require('language-support')


local command_center = require("command_center")
command_center.add({
  {
    {
      description = "Copy GitHub Permalink",
      cmd = "<leader>gy"
    }
  }
})

require("surround").setup {
  mappings_style = "surround"
}

require("toggleterm").setup {
  open_mapping = [[<C-`>]],
  hide_numbers = true,
}

require('vgit').setup()
