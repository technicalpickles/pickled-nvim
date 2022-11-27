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
			-- customize by adding --hidden, so we can get files that start with . which turns out to be a lot
			find_command = { "fd", "--type", "f", "--hidden", "--strip-cwd-prefix" },
		},
		git_files = {
			theme = "dropdown",
		},
	},
})
-- faster native picker & sorter implementations
-- zf seems the fastest, and has 
-- require("telescope").load_extension("fzf")
-- require('telescope').load_extension('fzy_native')
require("telescope").load_extension("zf-native")

require("telescope").load_extension("projects")

-- combine frequency and recency to give better results by default
require("telescope").load_extension("frecency")

-- replace vim.ui with telescope
require("telescope").load_extension("ui-select")


-- use git picker for git based directories
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

require('sibling-swap').setup({})

-- close nvim tree when quitting... to avoid keeping it open by itself
vim.api.nvim_create_autocmd({ "QuitPre" }, {
	pattern = "*",
	callback = function()
		if vim.bo.filetype == "NvimTree" or vim.bo.filetype == "Outline" then
			return
		end

		-- FIXME: figure out if there's any nvim-tree or symbols-outline buffers in current window
		local win_amount = #vim.api.nvim_tabpage_list_wins(0)
		-- more than 2, and probably have nvim tree open
		if win_amount > 2 then
			return
		end

		require("nvim-tree.api").tree.close()
	end,
})

require("nvim-tree").setup({
	update_focused_file = {
		enable = true,
	},
	renderer = {
		-- display only the folder name
		-- see See `:help filename-modifiers` for available options.
		root_folder_modifier = ":t",
		-- ie if you have lua/pickled-nvim, and lua is otherwise empty, only show lua/pickled-nvim instead of lua with one child
		group_empty = true,

		highlight_opened_files = 'icon',
	},

	view = {
		mappings = {
			list = {
				{ key = {"?"}, action = "toggle_help" }
			}
		}
	}
})

-- close nvim-tree when it's the last thing in a window, ie the other buffer is closed
vim.g.nvim_tree_auto_close = 1


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
