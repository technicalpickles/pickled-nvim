vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0
vim.g.neovide_input_use_logo = true -- Ensure we can pass the command key
vim.g.neovide_confirm_quit = true -- Prevent exit on unsaved buffer on window close
vim.g.neovide_cursor_vfx_mode = "railgun"

require('basics')


vim.cmd([[colorscheme ayu]])

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

require("surround").setup {
  mappings_style = "surround"
}

require("toggleterm").setup {
 open_mapping = [[<C-`>]]
}

require('nvim-tree').setup {}

require('bufferline').setup {
  icon_close_tab = '✕'
}

-- nvim-tree barbar.nvim integration
local nvim_tree_events = require('nvim-tree.events')
local bufferline_state = require('bufferline.state')

nvim_tree_events.on_tree_open(function ()
  bufferline_state.set_offset(31, "File Tree")
end)

nvim_tree_events.on_tree_close(function ()
  bufferline_state.set_offset(0)
end)

return require('packer').startup(function()
  -- package manager
  use 'wbthomason/packer.nvim'

  use {
    'neoclide/coc.nvim',
    branch = 'release',
  }

  use {
    'nvim-treesitter/nvim-treesitter',
  }

  use 'tpope/vim-commentary'

  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- customizable statusline with nice defaults
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- Find, Filter, Preview, Pick. All lua, all the time.
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
  }

  use "ur4ltz/surround.nvim"

  -- terminal manager
  use {
    "akinsho/toggleterm.nvim",
    tag = 'v1.*'
  }

  -- tree explorer
 use {
   'kyazdani42/nvim-tree.lua',
   requires = {
     'kyazdani42/nvim-web-devicons'
   }
 }

  -- nicer tabs
  -- use {
  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  -- colorschemes
  use "ayu-theme/ayu-vim"
end)
