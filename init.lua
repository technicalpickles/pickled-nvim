vim.g.do_filetype_lua = 1
vim.g.neovide_input_use_logo = true -- Ensure we can pass the command key
vim.g.neovide_confirm_quit = true -- Prevent exit on unsaved buffer on window close
vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.do_filetype_lua = 1 -- use filetype.lua
vim.g.did_load_filetypes = 0 -- don't use filetype.vim

local noremap = {noremap = true}
local silent_noremap = {noremap = true, silent = true}

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
  extensions = {
    command_palette = {
      {"GitHub",
        { "Copy Permalink", "<leader>gy" }
      },
    }
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    }
  }
}
require('telescope').load_extension('fzf')
require("telescope").load_extension('command_center')

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

-- linters, formaters, etc
local null_ls = require("null-ls")
local rubocop_options = { prefer_local = 'bin' }
local node_options = { prefer_local = "node_modules/.bin" }

local rubocop_yml = io.open(".rubocop.yml", "r")
local sources = {}
if rubocop_yml~=nil then
  io.close(rubocop_yml)
  print("enabling rubocop")
  table.insert(sources, null_ls.builtins.diagnostics.rubocop.with(rubocop_options))
  table.insert(sources, null_ls.builtins.formatting.rubocop.with(rubocop_options))
end

null_ls.setup({
    sources = sources
})

-- nvim-tree/barbar.nvim integration
local nvim_tree_events = require('nvim-tree.events')
local bufferline_state = require('bufferline.state')

nvim_tree_events.on_tree_open(function ()
  bufferline_state.set_offset(31, "File Tree")
end)

nvim_tree_events.on_tree_close(function ()
  bufferline_state.set_offset(0)
end)

