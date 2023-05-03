return {
	{
		"luukvbaal/statuscol.nvim",
		config = function()
			local builtin = require("statuscol.builtin")

			require("statuscol").setup({
				setopt = true,
				relculright = true,
				segments = {
					{ text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
					{ text = { "%s" }, click = "v:lua.ScSa" },
					{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
				},
				ft_ignore = require("pickled-nvim").filetype_config.statuscol.ignore,
			})
		end,
	},
}
