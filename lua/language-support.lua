-- filetype
vim.g.do_filetype_lua = 1 -- use filetype.lua
vim.g.did_load_filetypes = 0 -- don't use filetype.vim

require('coc-config')

vim.g.coc_global_extensions = {'coc-sumneko-lua', 'coc-sh'}

require'nvim-treesitter.configs'.setup {
    ensure_installed = 'all',
    ignore_install = {'phpdoc'},
    context_commentstring = {enable = true},
    highlight = {enable = true, disable = {'lua'}},
    indent = {enable = true},
    rainbow = {
        enable = true,
        -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        extended_mode = true,
        colors = {
            -- Line up with indent_blankline colors in ui.lua
            '#E06C75', '#E5C07B', '#98C379', '#56B6C2', '#61AFEF', '#C678DD'
        }
    }
}

-- adding endings for ruby/shell/lua like do/end
require('nvim-treesitter.configs').setup {endwise = {enable = true}}

-- linters, formaters, etc
local null_ls = require('null-ls')
local rubocop_options = {prefer_local = 'bin'}
local node_options = {prefer_local = 'node_modules/.bin'}

local sources = {}

if vim.fn.executable('fish') then
    table.insert(sources, null_ls.builtins.diagnostics.fish)
end

if vim.fn.executable('lua-format') and vim.fn.filereadable('.lua-check') then
    table.insert(sources, null_ls.builtins.formatting.lua_format)
end

if vim.fn.executable('luacheck') then
    table.insert(sources, null_ls.builtins.diagnostics.luacheck)
end

-- only enable rubocop if there's a configuration
if vim.fn.filereadable('.rubocop_yml') then
    table.insert(sources,
                 null_ls.builtins.diagnostics.rubocop.with(rubocop_options))
    table.insert(sources,
                 null_ls.builtins.formatting.rubocop.with(rubocop_options))
end

if vim.fn.filereadable('.erb-lint.yml') then
    table.insert(sources, null_ls.builtins.diagnostics.erb_lint)
    table.insert(sources, null_ls.builtins.formatting.erb_lint)
end

if vim.fn.filereadable('.eslinteslint_config') then
    table.insert(sources, null_ls.builtins.diagnostics.eslint.with(node_options))
    table.insert(sources, null_ls.builtins.formatting.eslint.with(node_options))
end

null_ls.setup({sources = sources})
