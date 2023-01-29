local M = {}

M.opts = {
	vgit = {
		settings = {
			signs = {
				priority = require("pickled-nvim").sign_priorities.git,
			},
		},
	},

	diffview = true,
}

M.cmds = {
	diffview = {
		'DiffviewOpen',
		'DiffviewClose',
		'DiffviewToggleFiles',
		'DiffviewFocusFiles',
		'DiffviewRefresh',
		'DiffviewFileHistory',
	}
}

return M
