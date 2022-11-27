-- filetype
local lsp = require("lsp-zero")
local lspkind = require("lspkind")
local cmp = require("cmp")
local luasnip = require("luasnip")
require("luasnip.loaders.from_snipmate").lazy_load()

lsp.preset("recommended")
lsp.nvim_workspace()

local cmp_sources = lsp.defaults.cmp_sources()

table.insert(cmp_sources, { name = "nvim_lsp_signature_help" })
table.insert(cmp_sources, { name = "fish" })

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),

	-- super tab like behavior w/ luasnip
	-- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
	["<Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_next_item()
		elseif luasnip.expand_or_jumpable() then
			luasnip.expand_or_jump()
		elseif has_words_before() then
			cmp.complete()
		else
			fallback()
		end
	end, { "i", "s" }),

	-- super shift-tab like behavior w/ luasnip
	["<S-Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_prev_item()
		elseif luasnip.jumpable(-1) then
			luasnip.jump(-1)
		else
			fallback()
		end
	end, { "i", "s" }),
})


lsp.setup_nvim_cmp({
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text",
			menu = {
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[Snippet]",
				nvim_lua = "[Lua]",
				latex_symbols = "[Latex]",
			},
		}),
	},
	mapping = cmp_mappings,
	sources = cmp_sources,
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
	highlight = { enable = true },
	context_commentstring = { enable = true },

	-- https://github.com/andymass/vim-matchup
	matchup = {
		enable = true,
	},

	-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
	textobjects = {
		enable = true,
		select = {
			enable = true,

			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,

			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
				["ab"] = "@block.outer",
				["ib"] = "@block.inner",
				["ap"] = "@parameter.inner",
				["ip"] = "@parameter.outer",
			},
			-- You can choose the select mode (default is charwise 'v')
			selection_modes = {
				["@parameter.outer"] = "v", -- charwise
				["@function.outer"] = "V", -- linewise
				["@class.outer"] = "<c-v>", -- blockwise
			},
			-- If you set this to `true` (default is `false`) then any textobject is
			-- extended to include preceding xor succeeding whitespace. Succeeding
			-- whitespace has priority in order to act similarly to eg the built-in
			-- `ap`.
			include_surrounding_whitespace = true,
		},
		-- TODO: figure out if this actually works? or what it actually will work on in practice
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
		-- TODO: figure out if this actually works? or what it actually will work on in practice
		swap = {
			enable = true,
			swap_next = {
				["<leader>a"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>A"] = "@parameter.inner",
			},
		},
	},

	textsubjects = {
		enable = true,
		prev_selection = ",", -- (Optional) keymap to select the previous selection
		keymaps = {
			["."] = "textsubjects-smart",
			[";"] = "textsubjects-container-outer",
			["i;"] = "textsubjects-container-inner",
		},
	},

	-- https://github.com/p00f/nvim-ts-rainbow
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

	-- https://github.com/RRethy/nvim-treesitter-endwise
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
