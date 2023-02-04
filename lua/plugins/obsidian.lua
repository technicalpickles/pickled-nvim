local vault = require("pickled-nvim").find_obsidian_vault()
local enabled = require("pickled-nvim").in_obsidian_vault()

return {
	{
		"epwalsh/obsidian.nvim",
		dependencies = {
			'nvim-cmp',
			'telescope.nvim',
		},
		lazy = not enabled,
		event = "VeryLazy",
		opts = {
			dir = vault,
			completion = {
				nvim_cmp = true,
			}
		},
		cmd = {
			'ObsidianBacklinks',
			'ObsidianToday',
			'ObsidianYesterday',
			'ObsidianOpen',
			'ObsidianNew',
			'ObsidianSearch',
			'ObsidianQuickSwitch',
			'ObsidianLink',
			'ObsidianLinkNew',
			'ObsidianFollowLink',
		}
	},
}
