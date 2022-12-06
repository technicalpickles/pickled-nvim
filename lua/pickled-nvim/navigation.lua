require("symbols-outline").setup({
	-- https://github.com/simrat39/symbols-outline.nvim/issues/185
	symbols = {
		File = {hl = "@text.uri" },
		Module = {hl = "@namespace" },
		Namespace = {hl = "@namespace" },
		Package = {hl = "@namespace" },
		Class = {hl = "@type" },
		Method = {hl = "@method" },
		Property = {hl = "@method" },
		Field = {hl = "@field" },
		Constructor = {hl = "@constructor" },
		Enum = {hl = "@type" },
		Interface = {hl = "@type" },
		Function = {hl = "@function" },
		Variable = {hl = "@constant" },
		Constant = {hl = "@constant" },
		String = {hl = "@string" },
		Number = {hl = "@number" },
		Boolean = {hl = "@boolean" },
		Array = {hl = "@constant" },
		Object = {hl = "@type" },
		Key = {hl = "@type" },
		Null = {hl = "@type" },
		EnumMember = {hl = "@field" },
		Struct = {hl = "@type" },
		Event = {hl = "@type" },
		Operator = {hl = "@operator" },
		TypeParameter = {hl = "@parameter" },
	},

	keymaps = {
		show_help = '?'
	}
})
local colors = require("tokyonight.colors").setup()

-- tokyonight support for 
vim.api.nvim_set_hl(1, 'FocusedSymbol', {fg = colors.blue, bold = true})
-- Pmenu (already exists)
-- SymbolsOutlineConnector (default seems fine)
-- Comment (default seems fine)

require("marks").setup({
	sign_priority = 40
})
