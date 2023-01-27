local g = vim.g

-- for https://github.com/yioneko/vim-tmindent + nvim-yati integration
local tm_fts = {"ruby"} 

require("nvim-treesitter.configs").setup({
	ensure_installed = "all",
	ignore_install = { "phpdoc" },

	-- -- FIXME: seems to break alignment of some ruby
	highlight = {
		enable = true,
		-- work around bad treesitter indentation, esp for ruby
		-- https://github.com/nvim-treesitter/nvim-treesitter/issues/1019
		additional_vim_regex_highlighting = true,
	},

	 -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
	 context_commentstring = {
		 enable = true,
	 },

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
	 -- rainbow = {
	 -- 	enable = true,
	 -- 	disable = g.filetype_plugin_config.rainbow.disable,
	 -- 	-- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
	 -- 	extended_mode = true,
	 -- 	colors = {
	 -- 		-- Line up with indent_blankline colors in ui.lua
	 -- 		"#E06C75",
	 -- 		"#E5C07B",
	 -- 		"#98C379",
	 -- 		"#56B6C2",
	 -- 		"#61AFEF",
	 -- 		"#C678DD",
	 -- 	},
	 -- },
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
	 -- { endwise = { enable = true } },
})

require("treesitter-context").setup({
	patterns = {
		ruby = {
			'block'
		}
	}
})
