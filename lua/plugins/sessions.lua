return {

	{
		"farmergreg/vim-lastplace",
		config = function()
			-- FIXME use filetype_config
			vim.g.lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit,toggleterm,Trouble"
		end,
		event = "BufEnter",
	},

	{
		"rmagatti/auto-session",
		lazy = false,
		opts = {
			-- use sesssion manager
			auto_restore_enabled = false,

			-- log_level = "info",
			log_level = "warning",

			-- list of files that don't shouldn't be considered part of a session if the are the last thing open
			bypass_session_save_file_types = require("pickled-nvim").filetype_config.autosession.bypass_autosave,

			pre_save_cmds = {
				'lua require("superesc").close_panels()'
			},

			-- only keep sessions for this directory
			auto_session_allowed_dirs = { "~/workspace/*" },

			-- key by branch
			auto_session_use_git_branch = true,
		},
		config = function(_, opts)
			require("auto-session").setup(opts)
			vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
		end

	},

	{
		'rmagatti/session-lens',
		dependencies = {
			'auto-session',
			'telescope.nvim',
		},
		cmd = "SearchSession",
		opts = {
			path_display = {'shorten'},
			previewer = true,
			-- no transparency
			theme_conf = { winblend = nil }
		}
	},

}
