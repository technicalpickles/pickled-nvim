return require('packer').startup(function(use)

  -- package manager
  use 'wbthomason/packer.nvim'

  use {
    'neoclide/coc.nvim',
    branch = 'release',
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use 'tpope/vim-commentary'

  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- customizable statusline with nice defaults
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
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
  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  use {
    'mhinz/vim-grepper',
  }

  -- colorschemes
  use "ayu-theme/ayu-vim"

  use "drmingdrmer/vim-toggle-quickfix"

end)
