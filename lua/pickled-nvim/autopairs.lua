local cmp = require("cmp")
local Rule = require("nvim-autopairs.rule")
local npairs = require("nvim-autopairs")
local ts_conds = require("nvim-autopairs.ts-conds")

require("nvim-autopairs").setup({})

-- local not_string_or_comment = ts_conds.is_not_ts_node({ "string", "comment" })
local not_inside_code_block = ts_conds.is_not_ts_node({ "fenced_code_block", "indented_code_block", "code_span" })


npairs.add_rules({
	-- markdown stuff
	-- italics
	Rule("_", "_", "markdown"):with_pair(not_inside_code_block),
	Rule("*", "*", "markdown"):with_pair(not_inside_code_block),
	-- bold --
	Rule("__", "__", "markdown"):with_pair(not_inside_code_block),
	Rule("**", "**", "markdown"):with_pair(not_inside_code_block),
})

npairs.setup({
	check_ts = true,
	disable_filetype = { "TelescopePrompt", "guihua", "guihua_rust", "clap_input" },
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
-- FIXME this seems to throw an error when starting [] inside a .editorconfig
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
