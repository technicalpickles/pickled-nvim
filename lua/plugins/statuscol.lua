return {
	{
		  "luukvbaal/statuscol.nvim",
		  opts = {
			  -- order of the fold, sign, line number and separator segments
			  -- F - fold
			  -- N - line number
			  -- S - sign
			  -- s - separator
			  order = "NSFs",
			  relculright = true,
			  separator = " ",
			  foldfunc = "builtin",
			  setopt = true,
			  ft_ignore = require("pickled-nvim").filetype_config.statuscol.ignore,
		  },
		  lazy = false,
	},
}
