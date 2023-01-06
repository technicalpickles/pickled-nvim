-- { lsp + cmp }--
local lsp = require("lsp-zero")
local lspkind = require("lspkind")
local cmp = require("cmp")
local luasnip = require("luasnip")
require("luasnip.loaders.from_snipmate").lazy_load()

lsp.preset("recommended")
lsp.nvim_workspace({
	library = vim.api.nvim_get_runtime_file("", true),
})

-- local cmp_sources = lsp.defaults.cmp_sources()
local cmp_sources = {
    -- This one provides the data from copilot.
    {name = 'copilot'},

	{name = "nvim_lsp_signature_help"},
	{name = "fish", keyword_length = 2},

    --- These are the default sources for lsp-zero
    {name = 'path'},
    {name = 'nvim_lsp', keyword_length = 3},
    {name = 'buffer', keyword_length = 3},
    {name = 'luasnip', keyword_length = 2},
}

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),

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

local lspconfig = require("lspconfig")
lspconfig.ruby_ls.setup({
	cmd = { "bundle", "exec", "ruby-lsp" },
	on_attach = function(client, bufnr)
		vim.api.nvim_create_autocmd({ "BufReadPre", "BufEnter", "BufWritePre", "CursorHold" }, {
			buffer = bufnr,

			callback = function()
				local params = vim.lsp.util.make_text_document_params(bufnr)

				client.request("textDocument/diagnostic", { textDocument = params }, function(err, result)
					if err then
						return
					end

					vim.lsp.diagnostic.on_publish_diagnostics(
						nil,
						vim.tbl_extend("keep", params, { diagnostics = result.items }),
						{ client_id = client.id }
					)
				end)
			end,
		})
	end,
})

-- disable except for actual latex
lspconfig.ltex.setup({
	filetypes = {
		"bib",
		"plaintex",
		"tex",
	}
})

lsp.setup()

-- debug lsp
vim.lsp.set_log_level("trace")
if vim.fn.has("nvim-0.5.1") == 1 then
	require("vim.lsp.log").set_format_func(vim.inspect)
end

--{ null-ls }--
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

--{ symbols-outline }--
require("symbols-outline").setup({
	-- https://github.com/simrat39/symbols-outline.nvim/issues/185
	symbols = {
		File = { hl = "@text.uri" },
		Module = { hl = "@namespace" },
		Namespace = { hl = "@namespace" },
		Package = { hl = "@namespace" },
		Class = { hl = "@type" },
		Method = { hl = "@method" },
		Property = { hl = "@method" },
		Field = { hl = "@field" },
		Constructor = { hl = "@constructor" },
		Enum = { hl = "@type" },
		Interface = { hl = "@type" },
		Function = { hl = "@function" },
		Variable = { hl = "@constant" },
		Constant = { hl = "@constant" },
		String = { hl = "@string" },
		Number = { hl = "@number" },
		Boolean = { hl = "@boolean" },
		Array = { hl = "@constant" },
		Object = { hl = "@type" },
		Key = { hl = "@type" },
		Null = { hl = "@type" },
		EnumMember = { hl = "@field" },
		Struct = { hl = "@type" },
		Event = { hl = "@type" },
		Operator = { hl = "@operator" },
		TypeParameter = { hl = "@parameter" },
	},

	keymaps = {
		show_help = "?",
	},
})
local colors = require("tokyonight.colors").setup()

-- tokyonight support for
vim.api.nvim_set_hl(1, "FocusedSymbol", { fg = colors.blue, bold = true })
-- Pmenu (already exists)
-- SymbolsOutlineConnector (default seems fine)
-- Comment (default seems fine)


-- { keymaps }--
local silent_noremap = { noremap = true, silent = true }
-- TODO: lsp-zero should have set this up :thinking_face:
vim.keymap.set({ "n", "v" }, "K", vim.lsp.buf.hover, { buffer = 0, noremap = true, silent = true })

-- symbols outline
local symbols_outline = "<CMD>SymbolsOutline<CR>"
-- local symbols_outline = "<CMD>Workspace RightPanelToggle<CR>"
vim.keymap.set("n", "<leader>s", symbols_outline, silent_noremap)
vim.keymap.set("n", "<D-.>", symbols_outline, silent_noremap)
