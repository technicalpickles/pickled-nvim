local silent_noremap = { noremap = true, silent = true }
local symbols_outline = "<CMD>SymbolsOutline<CR>"
local enabled = require("pickled-nvim").enabled
return {
	{
		"VonHeikemen/lsp-zero.nvim",
		enabled = enabled("VonHeikemen/lsp-zero.nvim"),
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "mihyaeru21/nvim-lspconfig-bundler" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help" },
			{ "mtoohey31/cmp-fish" },
			{ "zbirenbaum/copilot-cmp" },

			-- nice icons
			{ "onsails/lspkind.nvim" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			-- { "rafamadriz/friendly-snippets" },
			-- use snipmate/ultisnip style snippets instead
			-- this has a lot more stars, and a little less problematic in ruby
			-- https://github.com/VonHeikemen/lsp-zero.nvim/issues/61
			{ "honza/vim-snippets" },

			-- use `command` output as LSP for places that don't have one yet
			-- { "jose-elias-alvarez/null-ls.nvim" },
			-- { "jayp0521/mason-null-ls.nvim" },
		},
		config = function()
			local lsp_zero = require("lsp-zero")
			local lspconfig = require("lspconfig")
			local lspkind = require("lspkind")
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			require("lspconfig.ui.windows").default_options.border = require("pickled-nvim").preferred_border

			require("luasnip.loaders.from_snipmate").lazy_load()

			-- https://github.com/zbirenbaum/copilot-cmp#tab-completion-configuration-highly-recommended
			local has_words_before = function()
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			-- require("lspconfig-bundler").setup()

			-- disable except for actual latex
			lspconfig.ltex.setup({
				filetypes = {
					"bib",
					"plaintex",
					"tex",
				},
			})

			local cmp_select = { behavior = cmp.SelectBehavior.Select }
			cmp.setup({
				sources = {
					-- This one provides the data from copilot.
					{ name = "copilot" },

					{ name = "nvim_lsp_signature_help" },
					{ name = "fish", keyword_length = 2 },

					--- These are the default sources for lsp-zero
					{ name = "path" },
					{ name = "nvim_lsp", keyword_length = 3 },
					{ name = "buffer", keyword_length = 3 },
					{ name = "luasnip", keyword_length = 2 },
				},
				mapping = lsp_zero.defaults.cmp_mappings({
					["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
					["<C-n>"] = cmp.mapping.select_next_item(cmp_select),

					-- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#safely-select-entries-with-cr
					["<CR>"] = cmp.mapping({
						i = function(fallback)
							if cmp.visible() and cmp.get_active_entry() then
								cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
							else
								fallback()
							end
						end,
						s = cmp.mapping.confirm({ select = true }),
						c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
					}),

					-- super tab like behavior w/ luasnip
					-- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
					-- https://github.com/zbirenbaum/copilot-cmp#tab-completion-configuration-highly-recommended
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
				}),
				sorting = {
					priority_weight = 2,
					comparators = {
						require("copilot_cmp.comparators").prioritize,

						-- Below is the default comparitor list and order for nvim-cmp
						cmp.config.compare.offset,
						-- cmp.config.compare.scopes, --this is commented in nvim-cmp too
						cmp.config.compare.exact,
						cmp.config.compare.score,
						cmp.config.compare.recently_used,
						cmp.config.compare.locality,
						cmp.config.compare.kind,
						cmp.config.compare.sort_text,
						cmp.config.compare.length,
						cmp.config.compare.order,
					},
				},
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol_text", -- show only symbol annotations
						-- maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
						ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
						symbol_map = {
							Copilot = "󱜙",
						},
						-- The function below will be called before any actual modifications from lspkind
						-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
						before = function(_, vim_item) -- entry, vim_item
							-- ...
							return vim_item
						end,
					}),
				},
			})

			-- disabled lspzero's keymaps, so make them ourselves
			lsp_zero.on_attach(function(client, bufnr)
				-- copied from lsp-zero with modifications
				vim.keymap.set("n", "K", "<CMD>lua require('pickled-nvim.folds').peekOrHover()<CR>", { buffer = bufnr })
				vim.keymap.set("n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>", { buffer = bufnr })
				vim.keymap.set("n", "gD", "<CMD>lua vim.lsp.buf.declaration()<CR>", { buffer = bufnr })
				vim.keymap.set("n", "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>", { buffer = bufnr })
				vim.keymap.set("n", "go", "<CMD>lua vim.lsp.buf.type_definition()<CR>", { buffer = bufnr })
				vim.keymap.set("n", "gr", "<CMD>lua vim.lsp.buf.references()<CR>", { buffer = bufnr })
				vim.keymap.set("n", "<C-k>", "<CMD>lua vim.lsp.buf.signature_help()<CR>", { buffer = bufnr })
				vim.keymap.set("n", "<F2>", "<CMD>lua vim.lsp.buf.rename()<CR>", { buffer = bufnr })
				vim.keymap.set("n", "<F4>", "<CMD>lua vim.lsp.buf.code_action()<CR>", { buffer = bufnr })
				vim.keymap.set("x", "<F4>", "<CMD>lua vim.lsp.buf.range_code_action()<CR>", { buffer = bufnr })
				vim.keymap.set("n", "<C-k>", "<CMD>lua vim.lsp.buf.signature_help()<CR>", { buffer = bufnr })
				vim.keymap.set("n", "gl", "<CMD>lua vim.diagnostic.open_float()<CR>", { buffer = bufnr })
				vim.keymap.set("n", "[d", "<CMD>lua vim.diagnostic.goto_prev()<CR>", { buffer = bufnr })
				vim.keymap.set("n", "]d", "<CMD>lua vim.diagnostic.goto_next()<CR>", { buffer = bufnr })
			end)

			local ensure_installed = {
				"eslint",
				"lua_ls",
				"marksman",
				"dockerls",
				"jsonls",
			}

			local handlers = {
				lsp_zero.default_setup,
				rubocop = lsp_zero.noop, -- we'll detect which to use, but ruby_ls is better than rubocop directly
			}

			if vim.fn.filereadable(".solargraph.yml") == 1 then
				table.insert(ensure_installed, "solargraph")
			else
				handlers["solargraph"] = lsp_zero.noop
			end

			-- FIXME not quite working, doesn't show up as configured
			if vim.fn.filereadable(".standard.yml") == 1 then
				table.insert(ensure_installed, "standardrb")
			else
				handlers["standardrb"] = lsp_zero.noop
			end

			-- TODO; smarter enabling of ruby_ls, and only disable features when rubocop isn't detected
			if vim.fn.filereadable(".rubocop.yml") == 1 then
				lspconfig.ruby_ls.setup({
					on_attach = function(client, bufnr)
						local callback = function()
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
						end

						callback() -- call on attach

						vim.api.nvim_create_autocmd(
							{ "BufEnter", "BufWritePre", "BufReadPost", "InsertLeave", "TextChanged" },
							{
								buffer = bufnr,
								callback = callback,
							}
						)
					end,
				})

				table.insert(ensure_installed, "ruby_ls")
			else
				handlers["ruby_ls"] = lsp_zero.noop
			end

			require("mason").setup({})
			require("mason-lspconfig").setup({
				ensure_installed = ensure_installed,
				handlers = handlers,
			})

			lsp_zero.setup()

			-- for cmp + autopairs: https://github.com/windwp/nvim-autopairs#mapping-cr
			-- and it needs to come after lsp-zero is configured: https://github.com/VonHeikemen/lsp-zero.nvim/discussions/119
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

			-- debug lsp
			vim.lsp.set_log_level("info")
			-- vim.lsp.set_log_level("trace")
			if vim.fn.has("nvim-0.5.1") == 1 then
				require("vim.lsp.log").set_format_func(vim.inspect)
			end
		end,
	},

	-- {
	-- 	"jose-elias-alvarez/null-ls.nvim",
	-- 	event = { "BufReadPre", "BufNewFile" },
	-- 	config = function()
	-- 		local null_ls = require("null-ls")
	-- 		local sources = {}
	--
	-- 		-- erb
	-- 		if vim.fn.filereadable(".erb-lint.yml") == 1 then
	-- 			table.insert(sources, null_ls.builtins.diagnostics.erb_lint)
	-- 			table.insert(sources, null_ls.builtins.formatting.erb_lint)
	-- 		end
	--
	-- 		null_ls.setup({ sources = sources })
	-- 	end,
	-- },

	{
		"simrat39/symbols-outline.nvim",
		cmd = "SymbolsOutline",
		opts = {
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
		},
		keys = {
			{ "<leader>s", symbols_outline, silent_noremap },
			{ "<D-.>", symbols_outline, silent_noremap },
		},
	},
}
