local enabled = require("pickled-nvim").enabled

return {
	{
		"rcarriga/nvim-notify",
		enabled = false,
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
	},

	{
		"stevearc/dressing.nvim",
		-- enabled = enabled("stevearc/dressing.nvim"),
		enabled = false,
		event = "VeryLazy",
		opts = {
			input = {
				-- disabled because it seems to mess with COMMAND mode, where the wrong thing is selected when using tab completion
				enabled = false,
				-- default_prompt = "❯ ",
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
					if opts.kind == "legendary.nvim" then
						cfg.telescope.sorter = require("telescope.sorters").fuzzy_with_index_bias({})
					end
					return cfg
				end,
			},
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
		enabled = require("pickled-nvim").enabled("yamatsum/nvim-cursorline"),
		event = "VeryLazy",
		opts = {
			cursorline = { enable = true, timeout = 1000, number = false },
			cursorword = { enable = true, min_length = 3, hl = { underline = true } },
		},
	},

	{
		"goolord/alpha-nvim",
		enabled = enabled("goolord/alpha-nvim"),
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
				dashboard.button("s", "勒" .. " Restore Session", ":SessionRestore <CR>"),
				dashboard.button("l", "鈴" .. " Lazy", ":Lazy<CR>"),
				dashboard.button("q", " " .. " Quit", ":qa<CR>"),
			}

			for _, button in ipairs(dashboard.section.buttons.val) do
				button.opts.hl = "AlphaButtons"
				button.opts.hl_shortcut = "AlphaShortcut"
			end
			dashboard.section.footer.opts.hl = "Type"

			-- from https://codeberg.org/cruzin/dotfiles/src/branch/main/.config/nvim/lua/plugin/alpha.lua
			dashboard.section.header.val = {
				[[                                        ]],
				[[ ██████████████████████████████████████ ]],
				[[ █▄ ▀█▄ ▄█▄ ▄▄ █ ▄▄ █▄ █ ▄█▄ ▄█▄ ▀█▀ ▄█ ]],
				[[ ██ █▄▀ ███ ▄█▀█ ██ ██▄▀▄███ ███ █▄█ ██ ]],
				[[ ▀▄▄▄▀▀▄▄▀▄▄▄▄▄▀▄▄▄▄▀▀▀▄▀▀▀▄▄▄▀▄▄▄▀▄▄▄▀ ]],
				[[                                        ]],
			}
			dashboard.section.header.opts.hl = "AlphaHeader"

			dashboard.section.buttons.opts.hl = "AlphaButtons"
			dashboard.opts.layout[1].val = 8

			local configPulse = {
				type = "text",
				val = "",
				opts = {
					position = "center",
					hl = "Number",
				},
			}

			dashboard.section.configpulse = configPulse
			table.insert(dashboard.config.layout, configPulse)

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

					local time = require("configpulse").get_time()
					local configPulse
					if time.days > 0 then
						configPulse = string.format(
							"Config last modified %d days, %d hours, %d minutes ago",
							time.days,
							time.hours,
							time.minutes
						)
					elseif time.hours > 0 then
						configPulse =
							string.format("Config last modified %d hours, %d minutes ago", time.hours, time.minutes)
					else
						configPulse = string.format("Config last modified %d minutes ago", time.minutes)
					end
					dashboard.section.configpulse.val = configPulse

					pcall(vim.cmd.AlphaRedraw)
				end,
			})
		end,
	},

	{
		"mrquantumcodes/configpulse",
		cmd = "ConfigPulse",
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		enabled = enabled("lukas-reineke/indent-blankline.nvim"),
		-- TODO update to 3.x
		tag = "v2.20.8",
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
		commander = {
			{ desc = "View: Toggle vertical guide lines", cmd = "<CMD>IndentBlanklineToggle<CR>" },
		},
	},

	-- popups for suggestions when starting shortcuts
	{
		"folke/which-key.nvim",
		enabled = require("pickled-nvim").enabled("folke/which-key.nvim"),
		opts = true,
		event = "VeryLazy",
	},

	-- Find, Filter, Preview, Pick. All lua, all the time.
	{
		"mrjones2014/legendary.nvim",
		enabled = false,
		-- sqlite is only needed if you want to use frecency sorting
		dependencies = {
			"kkharji/sqlite.lua",
			"folke/which-key.nvim",
		},
		event = "VeryLazy",
		opts = {
			which_key = { auto_register = true },
		},
	},

	{
		"folke/noice.nvim",
		enabled = false,
		dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
		opts = {
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},

				signature = {
					-- FIXME track down what else handles textDocument/signatureHelp
					enabled = false,
				},

				hover = {
					-- FIXME track dwon what else handles textDocument/hover
					enabled = false,
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
		},
		event = "VeryLazy",
	},

	-- statuscol
	{
		"luukvbaal/statuscol.nvim",
		enabled = enabled("luukvbaal/statuscol.nvim"),
		config = function()
			local builtin = require("statuscol.builtin")

			require("statuscol").setup({
				setopt = true,
				relculright = true,
				segments = {
					-- line number
					{
						text = { builtin.lnumfunc, " " },
						click = "v:lua.ScLa",
					},
					{
						sign = {
							-- update this with anything that isn't GitSigns
							name = {
								"Dap",
								"neotest",
								"Diagnostic", -- trouble
								"Mark",
							},
							maxwidth = 1,
							colwidth = 2,
							auto = true,
						},
						click = "v:lua.ScSa",
					},
					{
						sign = {
							name = { "GitSigns" },
							maxwidth = 1,
							colwidth = 1,
							auto = false,
						},
						click = "v:lua.ScSa",
					},
					-- fold
					{
						text = { builtin.foldfunc, " " },
						click = "v:lua.ScFa",
					},
				},
				ft_ignore = require("pickled-nvim").filetype_config.statuscol.ignore,
			})
		end,
	},

	-- statusline
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		enabled = enabled("nvim-lualine/lualine.nvim"),
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			-- statusline
			local function toggleterm_statusline_title()
				local number = vim.b.toggle_number

				return "ToggleTerm #" .. number
			end

			local function toggleterm_statusline_directory()
				local number = vim.b.toggle_number
				return require("toggleterm.terminal").get(number).dir
			end

			-- customize toggleterm to have less stuff in it
			local my_toggleterm = {
				sections = {
					lualine_a = { "mode" },
					lualine_b = { toggleterm_statusline_title },
					lualine_c = { toggleterm_statusline_directory },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = { toggleterm_statusline_title },
					lualine_c = { toggleterm_statusline_directory },
					lualine_x = {},
					lualine_y = {},
					lualine_z = {},
				},
				filetypes = {
					"toggleterm",
				},
			}

			local hbac_pinned = {
				function()
					local cur_buf = vim.api.nvim_get_current_buf()
					return require("hbac.state").is_pinned(cur_buf) and "󰐃" or "󰤱"
					-- tip: nerd fonts have pinned/unpinned icons!
				end,
				color = { fg = "#ef5f6b", gui = "bold" },
			}

			local function relative_filename()
				local buffer_path = vim.fn.expand("%:p")
				local cwd = vim.fn.getcwd()

				-- Check if buffer_path starts with cwd
				if string.find(buffer_path, cwd, 1, true) == 1 then
					-- Remove cwd from buffer_path
					local relative_path = string.sub(buffer_path, #cwd + 2) -- +2 to remove trailing slash

					return relative_path
				end

				-- Return the full path if buffer is outside the cwd
				return buffer_path
			end

			require("lualine").setup({
				options = {
					theme = "auto",
					globalstatus = false,
					disabled_filetypes = require("pickled-nvim").filetype_config.disabled,
				},
				extensions = {
					"fugitive",
					"fzf",
					"lazy",
					"man",
					"nvim-tree",
					"quickfix",
					"quickfix",
					"symbols-outline",
					"trouble",
					my_toggleterm,
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch" },
					lualine_c = { "diagnostics" },
					lualine_x = {},
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = {},
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},

				winbar = {
					lualine_a = {
						{ "filetype", icon_only = true },
					},
					lualine_b = {},
					lualine_c = {
						{ relative_filename, align = "center" },
					},
					lualine_x = {},
					lualine_y = {},
					lualine_z = { hbac_pinned },
				},

				inactive_winbar = {
					lualine_a = {
						{ "filetype", icon_only = true },
					},
					lualine_b = {},
					lualine_c = { { relative_filename, align = "center" } },
					lualine_x = {},
					lualine_y = {},
					lualine_z = { hbac_pinned },
				},
			})
		end,
	},

	{
		"0xAdk/full_visual_line.nvim",
		enabled = enabled("0xAdk/full_visual_line.nvim"),
		keys = "V",
		opts = {},
	},

	{
		"petertriho/nvim-scrollbar",
		enabled = enabled("petertriho/nvim-scrollbar"),
		config = function()
			local colors = require("tokyonight.colors").setup()

			require("scrollbar").setup({
				handle = {
					color = colors.bg_highlight,
				},
				marks = {
					Search = { color = colors.orange },
					Error = { color = colors.error },
					Warn = { color = colors.warning },
					Info = { color = colors.info },
					Hint = { color = colors.hint },
					Misc = { color = colors.purple },
				},
			})
		end,
	},
}
