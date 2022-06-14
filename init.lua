vim.g.do_filetype_lua = 1
vim.g.neovide_input_use_logo = true -- Ensure we can pass the command key
vim.g.neovide_confirm_quit = true -- Prevent exit on unsaved buffer on window close
vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.do_filetype_lua = 1 -- use filetype.lua
vim.g.did_load_filetypes = 0 -- don't use filetype.vim

require('plugins')
require('basics')

vim.cmd([[colorscheme neon]])

require('coc-config')

require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  ignore_install = { "phpdoc" },
  context_commentstring = {
    enable = true
  },
  highlight = {
    enable = true,
    disable = { "lua" }
  },
  indent = {
    enable = true
  }
}

require('telescope').setup {
  pickers = {
    find_files = {
      theme = "ivy",
    }
  }
}
require('telescope').load_extension('fzf')

require("surround").setup {
  mappings_style = "surround"
}

require("toggleterm").setup {
 open_mapping = [[<C-`>]],
 hide_numbers = false,
}

require('nvim-tree').setup {}

require('bufferline').setup {
  icon_close_tab = '✕'
}

require('lualine').setup {
  extensions = {'quickfix', 'nvim-tree', 'toggleterm', 'quickfix'},
  theme = 'neon',
}

require('vgit').setup()

-- nvim-tree/barbar.nvim integration
local nvim_tree_events = require('nvim-tree.events')
local bufferline_state = require('bufferline.state')

nvim_tree_events.on_tree_open(function ()
  bufferline_state.set_offset(31, "File Tree")
end)

nvim_tree_events.on_tree_close(function ()
  bufferline_state.set_offset(0)
end)

