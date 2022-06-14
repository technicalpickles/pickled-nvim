vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
  -- package manager
  use 'wbthomason/packer.nvim'

  -- Speed up loading Lua modules in Neovim to improve startup time.
  -- Load before ay other lua plugins
  use {
    'lewis6991/impatient.nvim',
    config = function() require('impatient') end,
  }

  use {
    'neoclide/coc.nvim',
    branch = 'release',
  }

  -- drop in replacement for filetype.vim
  use 'nathom/filetype.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use {
    'RRethy/nvim-treesitter-endwise',
    config = function()
      require('nvim-treesitter.configs').setup {
        endwise = {
          enable = true,
        },
      }
    end
  }

  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
      }
    end
  }

  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end
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

  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }


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

  -- visual git integration
  use {
    'tanvirtin/vgit.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  -- colorschemes
  use "ayu-theme/ayu-vim"
  use "averak/laserwave.vim"
  use "rafamadriz/neon"

  -- quicfix and diagnostic type stuff
  use {
  "folke/trouble.nvim",
  requires = "kyazdani42/nvim-web-devicons",
  config = function()
    require("trouble").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}
end)
