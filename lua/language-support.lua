-- filetype
vim.g.do_filetype_lua = 1    -- use filetype.lua
vim.g.did_load_filetypes = 0 -- don't use filetype.vim

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

null_ls.setup({ sources = sources })

