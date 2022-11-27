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

local lspconfig = require("lspconfig")

lspconfig.ruby_ls.setup({
	cmd = { "bundle", "exec", "ruby-lsp" },
	on_attach = function(client, bufnr)
		vim.api.nvim_create_autocmd({ 'BufReadPre', 'BufEnter', 'BufWritePre', 'CursorHold' }, {
			buffer = bufnr,

			callback = function()
				local params = vim.lsp.util.make_text_document_params(bufnr)

				client.request(
				'textDocument/diagnostic',
				{ textDocument = params },
				function(err, result)
					if err then return end

					vim.lsp.diagnostic.on_publish_diagnostics(
					nil,
					vim.tbl_extend('keep', params, { diagnostics = result.items }),
					{ client_id = client.id }
					)
				end
				)
			end,
		})
	end
})

lsp.ensure_installed({'gopls'})

lsp.setup()

-- debug lsp
-- vim.lsp.set_log_level 'trace'
-- if vim.fn.has 'nvim-0.5.1' == 1 then
--   require('vim.lsp.log').set_format_func(vim.inspect)
-- end

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
-- local rubocop_options = { prefer_local = "bin" }
-- if vim.fn.filereadable(".rubocop_yml") == 1 then
-- 	table.insert(sources, null_ls.builtins.diagnostics.rubocop.with(rubocop_options))
-- 	table.insert(sources, null_ls.builtins.formatting.rubocop.with(rubocop_options))
-- end

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

