return {
	-- Better `vim.notify()`
	{
		"rcarriga/nvim-notify",
		keys = {
			{
				"<leader>un",
				function()
					require("notify").dismiss({ silent = true, pending = true })
				end,
				desc = "Delete all Notifications",
			},
		},
		opts = {
			timeout = 3000,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
		},
		config = function (_, opts)
			local notify = require("notify")
			notify.setup(opts)
			vim.notify = notify
		end
	},

	{
		'stevearc/dressing.nvim',
		event = "VeryLazy",
		opts = {
			input = {
				default_prompt = '❯ '
			},
			select = {
				get_config = function(opts)
					opts = opts or {}
					local cfg = {
						telescope = {
							layout_config = {
								width = 120,
								height = 25,
							},
						},
					}
					if opts.kind == 'legendary.nvim' then
						cfg.telescope.sorter = require('telescope.sorters').fuzzy_with_index_bias({})
					end
					return cfg
				end,
			}
		},
		lazy = true,
		init = function()
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.input = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.input(...)
			end
		end,
	},

	-- styling cursor, ident lines, etc
	{
		"yamatsum/nvim-cursorline",
		event = "VeryLazy",
		opts = {
			cursorline = { enable = true, timeout = 1000, number = false },
			cursorword = { enable = true, min_length = 3, hl = { underline = true } },
		}
	},

	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		-- taken largely from lazyvim
		opts = function()
			local dashboard = require("alpha.themes.dashboard")
			dashboard.section.buttons.val = {
				dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
				dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
				dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
				dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
				dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
				dashboard.button("s", "勒" .. " Restore Session", ":RestoreSession <CR>"),
				dashboard.button("l", "鈴" .. " Lazy", ":Lazy<CR>"),
				dashboard.button("q", " " .. " Quit", ":qa<CR>"),
			}

			for _, button in ipairs(dashboard.section.buttons.val) do
				button.opts.hl = "AlphaButtons"
				button.opts.hl_shortcut = "AlphaShortcut"
			end
			dashboard.section.footer.opts.hl = "Type"
			dashboard.section.header.opts.hl = "AlphaHeader"
			dashboard.section.buttons.opts.hl = "AlphaButtons"
			dashboard.opts.layout[1].val = 8
			return dashboard
		end,
		config = function(_, dashboard)
			-- close Lazy and re-open when the dashboard is ready
			if vim.o.filetype == "lazy" then
				vim.cmd.close()
				vim.api.nvim_create_autocmd("User", {
					pattern = "AlphaReady",
					callback = function()
						require("lazy").show()
					end,
				})
			end

			require("alpha").setup(dashboard.opts)

			vim.api.nvim_create_autocmd("User", {
				pattern = "LazyVimStarted",
				callback = function()
					local stats = require("lazy").stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
					dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
					pcall(vim.cmd.AlphaRedraw)
				end,
			})
		end
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		opts = {
			char = "│",

			-- highlight the current guide
			show_current_context = true,
			-- underscore the first line too
			-- show_current_context_start = true,

			-- Don't show a trailing indentation guide on blank lines, to match the indentation of surrounding code.
			show_trailing_blankline_indent = false,

			filetype_exclude = require("pickled-nvim").filetype_config.indent_blankline.exclude,
		},
	},


	-- popups for suggestions when starting shortcuts
	{
		"folke/which-key.nvim",
		opts = true,
		event = "VeryLazy"
	},


	-- Find, Filter, Preview, Pick. All lua, all the time.
	{
		'mrjones2014/legendary.nvim',
		-- sqlite is only needed if you want to use frecency sorting
		dependencies = {
			'kkharji/sqlite.lua',
			"folke/which-key.nvim",
		},
		event = "VeryLazy",
		opts ={
			which_key = { auto_register = true },
		},
	},

}
