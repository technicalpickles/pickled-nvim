require('basics')
require('plugins')
require('keybindings')
require('navigation')
require('ui')
require('language-support')


local silent_noremap = {noremap = true, silent = true}

local command_center = require('command_center')
command_center.add({
  {
    description = 'Copy GitHub Permalink',
    cmd = '<leader>gy'
  },
  {
    description = 'Format Document',
    cmd = "lua vim.lsp.buf.formatting_sync()",
    keybindings = {'n', '<leader>f', silent_noremap}
  }
})

require("surround").setup {
  mappings_style = "surround"
}

require("toggleterm").setup {
  open_mapping = [[<C-`>]],
  hide_numbers = true,
}

require("project_nvim").setup {
}

require('vgit').setup()
