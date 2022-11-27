require("telescope").setup({
	extensions = {
		frecency = {
			default_workspace = "CWD",
			show_filter_column = false,
			show_unindexed = false,
			ignore_patterns = {"*.git/*", "*/tmp/*", "node_modules/*"},
		},
		["ui-select"] = {
			require("telescope.themes").get_dropdown({
			})
		},
	},
	pickers = {
		find_files = {
			theme = "dropdown",
			find_command = { "fd", "--type", "f", "--hidden", "--strip-cwd-prefix" },
		},
		git_files = {
			theme = "dropdown",
		},
	},
})
-- require("telescope").load_extension("fzf")
-- require('telescope').load_extension('fzy_native')
require("telescope").load_extension("zf-native")

require("telescope").load_extension("projects")
require("telescope").load_extension("frecency")
require("telescope").load_extension("ui-select")


function _G.file_picker()
	local file_picker_name

	-- prefer git ls-files when available because it's a ton faster
	if vim.fn.empty(vim.fn.FugitiveGitDir()) == 0 then
		file_picker_name = 'git_files'
	else
		file_picker_name = 'find_files'
	end

	local file_picker = loadstring("require('telescope.builtin')." .. file_picker_name .. "()")

	file_picker()
end

require("nvim-tree").setup({
	renderer = {
		-- display only the folder name
		-- see See `:help filename-modifiers` for available options.
		root_folder_modifier = ":t",
	},
	-- projects integration
	respect_buf_cwd = true,
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	view = {
		mappings = {
			list = {
				{ key = {"?"}, action = "toggle_help" }
			}
		}
	}
})


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

-- copy NvimTreeRootFolder
vim.api.nvim_set_hl(1, 'FocusedSymbol', {fg = colors.blue, bold = true})

-- FocusedSymbol
-- Pmenu
-- SymbolsOutlineConnector
-- Comment


require("marks").setup({
	sign_priority = 40
})
