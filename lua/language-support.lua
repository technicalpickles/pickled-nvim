-- filetype
local lsp = require("lsp-zero")
local lspkind = require("lspkind")

lsp.preset("recommended")
lsp.nvim_workspace()

lsp.setup_nvim_cmp({
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text",
			menu = {
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				nvim_lua = "[Lua]",
				latex_symbols = "[Latex]",
			},
		}),
	},
	sources = {
		{ name = "nvim_lsp_signature_help" },
		{ name = "path" },
		{ name = "fish" },
		{ name = "nvim_lsp", keyword_length = 3 },
		{ name = "buffer", keyword_length = 3 },
		{ name = "luasnip", keyword_length = 2 },
	},
})

lsp.configure("sumneko_lua", {
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

lsp.setup()

require("nvim-treesitter.configs").setup({
	ensure_installed = "all",
	ignore_install = { "phpdoc" },
	context_commentstring = { enable = true },
	highlight = { enable = true, disable = { "lua" } },
	rainbow = {
		enable = true,
		disable = { "help", "log" },
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
	-- https://github.com/nvim-treesitter/nvim-treesitter-refactor
	refactor = {
		highlight_current_scope = { enable = true },
		smart_rename = {
			enable = true,
			keymaps = {
				smart_rename = "grr",
			},
		},
		navigation = {
			enable = true,
			keymaps = {
				goto_definition = "gnd",
				list_definitions = "gnD",
				list_definitions_toc = "gO",
				goto_next_usage = "<a-*>",
				goto_previous_usage = "<a-#>",
			},
		},
	},
	{ endwise = { enable = true } },
})

-- linters, formaters, etc
local null_ls = require("null-ls")

local sources = {}

-- fish
if vim.fn.executable("fish") == 1 then
	table.insert(sources, null_ls.builtins.diagnostics.fish)
end

-- lua
if vim.fn.executable("lua-format") == 1 and vim.fn.filereadable(".lua-check") == 1 then
	table.insert(sources, null_ls.builtins.formatting.lua_format)
end

-- if vim.fn.executable("stylua") and vim.fn.filereadable(".styluaignore") then
-- 	table.insert(sources, null_ls.builtins.formatting.stylelua)
-- end

-- ruby
local rubocop_options = { prefer_local = "bin" }
if vim.fn.filereadable(".rubocop_yml") == 1 then
	table.insert(sources, null_ls.builtins.diagnostics.rubocop.with(rubocop_options))
	table.insert(sources, null_ls.builtins.formatting.rubocop.with(rubocop_options))
end

-- erb
if vim.fn.filereadable(".erb-lint.yml") == 1 then
	table.insert(sources, null_ls.builtins.diagnostics.erb_lint)
	table.insert(sources, null_ls.builtins.formatting.erb_lint)
end

-- javascript
local node_options = { prefer_local = "node_modules/.bin" }
if vim.fn.filereadable(".eslinteslint_config") == 1 then
	table.insert(sources, null_ls.builtins.diagnostics.eslint.with(node_options))
	table.insert(sources, null_ls.builtins.formatting.eslint.with(node_options))
end

null_ls.setup({ sources = sources })

require("nvim-autopairs").setup({})

local Rule = require("nvim-autopairs.rule")
local npairs = require("nvim-autopairs")
local ts_conds = require("nvim-autopairs.ts-conds")

-- local not_string_or_comment = ts_conds.is_not_ts_node({ "string", "comment" })
local not_inside_code_block = ts_conds.is_not_ts_node({ "fenced_code_block", "indented_code_block", "code_span" })

npairs.add_rules({
	-- markdown stuff
	-- italics
	Rule("_", "_", "markdown"):with_pair(not_inside_code_block),
	Rule("*", "*", "markdown"):with_pair(not_inside_code_block),
	-- bold --
	Rule("__", "__", "markdown"):with_pair(not_inside_code_block),
	Rule("**", "**", "markdown"):with_pair(not_inside_code_block),
})

npairs.setup({
	check_ts = true,
	disable_filetype = { "TelescopePrompt", "guihua", "guihua_rust", "clap_input" },
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
-- FIXME this seems to throw an error when starting [] inside a .editorconfig
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
