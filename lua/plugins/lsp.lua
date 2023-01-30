local language_support = require("pickled-nvim.language-support")
return {
-- lsp, linters, formatters, etc
	{
		"VonHeikemen/lsp-zero.nvim",
		event = "VimEnter",
		config = language_support.config.lsp_zero,
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help" },
			{ "mtoohey31/cmp-fish" },
			{'zbirenbaum/copilot-cmp'},

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
			{ "jose-elias-alvarez/null-ls.nvim" },
			{ "jayp0521/mason-null-ls.nvim"},
		},
	},

	{
		"jose-elias-alvarez/null-ls.nvim",
		config = language_support.config.null_ls,
	},

	{
		"simrat39/symbols-outline.nvim",
		cmd = "SymbolsOutline",
		opts = language_support.opts.symbols_outline,
		keys = language_support.keys.symbols_outline,
	},
}
