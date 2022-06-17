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


require('nvim-tree').setup {}

-- nvim-tree/barbar.nvim integration
local nvim_tree_events = require('nvim-tree.events')
local bufferline_state = require('bufferline.state')

nvim_tree_events.on_tree_open(function ()
  bufferline_state.set_offset(31, "File Tree")
end)

nvim_tree_events.on_tree_close(function ()
  bufferline_state.set_offset(0)
end)

