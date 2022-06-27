-- filetype
vim.g.do_filetype_lua = 1 -- use filetype.lua
vim.g.did_load_filetypes = 0 -- don't use filetype.vim

local lsp = require("lsp-zero")
local lspkind = require('lspkind')

lsp.preset("recommended")
lsp.nvim_workspace()

lsp.setup_nvim_cmp({
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_text",
      menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[Latex]",
      })
    }),
  },
})

lsp.setup()

require("nvim-treesitter.configs").setup({
	ensure_installed = "all",
	ignore_install = { "phpdoc" },
	context_commentstring = { enable = true },
	highlight = { enable = true, disable = { "lua" } },
	indent = { enable = true },
	rainbow = {
		enable = true,
		-- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		extended_mode = true,
		colors = {
			-- Line up with indent_blankline colors in ui.lua
			"#E06C75",
			"#E5C07B",
			"#98C379",
			"#56B6C2",
			"#61AFEF",
			"#C678DD",
		},
	},
})

-- adding endings for ruby/shell/lua like do/end
require("nvim-treesitter.configs").setup({ endwise = { enable = true } })

-- linters, formaters, etc
local null_ls = require("null-ls")

local sources = {}

-- fish
if vim.fn.executable("fish") then
	table.insert(sources, null_ls.builtins.diagnostics.fish)
end

-- shell
-- see coc-sh

-- lua
if vim.fn.executable("lua-format") and vim.fn.filereadable(".lua-check") then
	table.insert(sources, null_ls.builtins.formatting.lua_format)
end
-- use coc-lua for diagnostics

-- ruby
local rubocop_options = { prefer_local = "bin" }
if vim.fn.filereadable(".rubocop_yml") then
  table.insert(sources, null_ls.builtins.diagnostics.rubocop.with(rubocop_options))
  table.insert(sources, null_ls.builtins.formatting.rubocop.with(rubocop_options))
end

-- erb
if vim.fn.filereadable(".erb-lint.yml") then
	table.insert(sources, null_ls.builtins.diagnostics.erb_lint)
	table.insert(sources, null_ls.builtins.formatting.erb_lint)
end

-- javascript
local node_options = { prefer_local = "node_modules/.bin" }
if vim.fn.filereadable(".eslinteslint_config") then
	table.insert(sources, null_ls.builtins.diagnostics.eslint.with(node_options))
	table.insert(sources, null_ls.builtins.formatting.eslint.with(node_options))
end

null_ls.setup({ sources = sources })

require("nvim-autopairs").setup({})

local Rule = require("nvim-autopairs.rule")
local npairs = require("nvim-autopairs")
local cond = require("nvim-autopairs.conds")
local ts_conds = require("nvim-autopairs.ts-conds")

local not_string_or_comment = ts_conds.is_not_ts_node({ "string", "comment" })
local not_inside_code_block = ts_conds.is_not_ts_node({ "fenced_code_block", "indented_code_block", "code_span" })
npairs.add_rules({
	-- commonly closed types
	-- - avoid triggering when inside a string or comment
	Rule("(", ")"):with_pair(not_string_or_comment), -- parens
	Rule("'", "'"):with_pair(not_string_or_comment), -- single quotes
	Rule("[", "]"):with_pair(not_string_or_comment), -- bracket

	-- markdown stuff
	-- italics
	Rule("_", "_", "markdown"):with_pair(not_inside_code_block),
	Rule("*", "*", "markdown"):with_pair(not_inside_code_block),
	-- bold --
	Rule("__", "__", "markdown"):with_pair(not_inside_code_block),
	Rule("**", "**", "markdown"):with_pair(not_inside_code_block),
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
-- FIXME this seems to throw an error when starting [] inside a .editorconfig
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
