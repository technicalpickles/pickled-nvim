local g = vim.g
local enabled = require("pickled-nvim").enabled

local kopts = { noremap = true, silent = true }
return {
	-- Pasting in Vim with indentation adjusted to destination context
	{
		"sickill/vim-pasta",
		event = "VeryLazy",
		config = function()
			g.pasta_disabled_filetypes = require("pickled-nvim").filetype_config.pasta.disable
		end,
	},

	-- split/join blocks of code
	{
		"Wansmer/treesj",
		enabled = enabled("Wansmer/treesj"),
		opts = {
			use_default_keymaps = false,
		},
		keys = {
			{ "gS", "<CMD>TSJSplit<CR>" },
			{ "gJ", "<CMD>TSJJoin<CR>" },
		},
		commander = {
			{ desc = "SplitJoin: Split", cmd = "<CMD>TSJSplit<CR>" },
			{ desc = "SplitJoin: Join", cmd = "<CMD>TSJJoin<CR>" },
		},
	},

	{
		"windwp/nvim-autopairs",
		enabled = enabled("windwp/nvim-autopairs"),
		event = "InsertEnter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"hrsh7th/nvim-cmp",
		},
		opts = {
			check_ts = true,
			disable_filetype = require("pickled-nvim").filetype_config.autopairs.disable,
		},

		config = function(_, opts)
			local npairs = require("nvim-autopairs")
			npairs.setup(opts)

			local cmp = require("cmp")
			local Rule = require("nvim-autopairs.rule")
			local ts_conds = require("nvim-autopairs.ts-conds")

			-- local not_string_or_comment = ts_conds.is_not_ts_node({ "string", "comment" })
			local not_inside_code_block =
				ts_conds.is_not_ts_node({ "fenced_code_block", "indented_code_block", "code_span" })

			npairs.add_rules({
				-- markdown stuff
				-- italics
				Rule("_", "_", "markdown"):with_pair(not_inside_code_block),
				Rule("*", "*", "markdown"):with_pair(not_inside_code_block),
				-- bold --
				Rule("__", "__", "markdown"):with_pair(not_inside_code_block),
				Rule("**", "**", "markdown"):with_pair(not_inside_code_block),
			})
			npairs.add_rules(require("nvim-autopairs.rules.endwise-elixir"))
			npairs.add_rules(require("nvim-autopairs.rules.endwise-lua"))
			npairs.add_rules(require("nvim-autopairs.rules.endwise-ruby"))

			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			-- FIXME this seems to throw an error when starting [] inside a .editorconfig
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},

	{
		"ur4ltz/surround.nvim",
		enabled = enabled("ur4ltz/surround.nvim"),
		event = "VeryLazy",
		opts = {
			mappings_style = "surround",
		},
	},

	-- toggling comments
	{
		"numToStr/Comment.nvim",
		enabled = enabled("numToStr/Comment.nvim"),
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
		event = "BufRead",
	},

	-- make . work in more places
	{
		"tpope/vim-repeat",
		enabled = enabled("tpope/vim-repeat"),
		event = "BufRead",
	},

	-- better highlighting for search results
	{
		"kevinhwang91/nvim-hlslens",
		enabled = false,
		-- enabled = enabled("kevinhwang91/nvim-hlslens"),
		event = { "BufReadPre", "BufNewFile" },
		keys = {
			{
				"n",
				[[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
				kopts,
			},
			{
				"N",
				[[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
				kopts,
			},
			{ "*", [[*<Cmd>lua require('hlslens').start()<CR>]], kopts },
			{ "#", [[#<Cmd>lua require('hlslens').start()<CR>]], kopts },
			{ "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts },
			{ "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts },
			{ "<Leader>l", "<Cmd>noh<CR>", kopts },
		},

		config = function()
			-- require('hlslens').setup() is not required
			require("scrollbar.handlers.search").setup({
				calm_down = true,
				-- TODO customize override_lens to be a little more subtle
				override_lens = function(render, plist, nearest, idx, r_idx)
					local indicator = require("pickled-nvim.hlslens").indicator("", "", r_idx)

					local lnum, col = unpack(plist[idx])
					local text, chunks =
						require("pickled-nvim.hlslens").text(plist, nearest, idx, indicator, "Identifier")
					render.set_virt(0, lnum - 1, col - 1, chunks, nearest)
				end,
			})
		end,
	},
}
