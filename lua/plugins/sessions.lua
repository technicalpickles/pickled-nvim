return {

	{
		"farmergreg/vim-lastplace",
		enabled = require("pickled-nvim").enabled("farmergreg/vim-lastplace"),
		config = function()
			-- FIXME use filetype_config
			vim.g.lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit,toggleterm,Trouble"
		end,
		event = "BufEnter",
	},

	{
		"rmagatti/auto-session",
		enabled = require("pickled-nvim").enabled("rmagatti/auto-session"),
		lazy = false,
		opts = {
			-- use sesssion manager
			auto_save_enabled = true,
			auto_restore_enabled = false,

			-- log_level = "info",
			log_level = "warning",

			-- list of files that don't shouldn't be considered part of a session if the are the last thing open
			bypass_session_save_file_types = require("pickled-nvim").filetype_config.autosession.bypass_autosave,

			pre_save_cmds = {
				'lua require("superesc").close_panels()',
			},

			-- only keep sessions for this directory
			auto_session_allowed_dirs = { "~/workspace/*" },

			-- key by branch
			auto_session_use_git_branch = true,
		},
		cmd = {
			"Autosession",
			"SessionDelete",
			"SessionRestore",
			"SessionRestoreFromFile",
			"SessionSave",
		},
		config = function(_, opts)
			require("auto-session").setup(opts)
			vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
		end,

		commander = {
			{ desc = "Session: Save Current", cmd = "<CMD>SaveSession<CR>" },
			{ desc = "Session: Restore", cmd = "<CMD>RestoreSession<CR>" },
			{ desc = "Session: Delete Current", cmd = "<CMD>DeleteSession<CR>" },
			{ desc = "Session: Choose which to Restore", cmd = "<CMD>Autosession search<CR>" },
			{ desc = "Session: Choose which to Delete", cmd = "<CMD>Autosession delete<CR>" },
		},
	},
}
