vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0
vim.g.neovide_input_use_logo = true -- Ensure we can pass the command key
vim.g.neovide_confirm_quit = true -- Prevent exit on unsaved buffer on window close
vim.g.neovide_cursor_vfx_mode = "railgun"

require('basics')

print("before packer")
return require('packer').startup(function()
  -- package manager
  use 'wbthomason/packer.nvim'

  use {
    'neoclide/coc.nvim',
    branch = 'release',
    config = function()
      require('coc-config')
    end

  }

  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
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
    end
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
    config = function()
      require('telescope').setup {
        pickers = {
          find_files = {
            theme = "ivy",
          }
        }
      }
    end
  }

  use {
    "ur4ltz/surround.nvim",
    config = function()
      require("surround").setup {
        mappings_style = "surround"
      }
    end
  }

  -- terminal manager
  use {"akinsho/toggleterm.nvim", tag = 'v1.*', config = function()
    require("toggleterm").setup {
    }
    print("set up toggleterm")
  end}

  -- tree explorer
--  use {
--    'kyazdani42/nvim-tree.lua',
--    requires = {
--      'kyazdani42/nvim-web-devicons'
--    },
--    cmd = 'NvimTreeToggle',
--    config = function() 
--      require'nvim-tree'.setup {
--      }
--    end
--  }

  print("inside colorscheme config")
  -- colorschemes
  use {
    "ayu-theme/ayu-vim",
    config = function()
    end
  }
end)
