vim.g.grepper = {
	tools = { "rg", "ag", "pt", "git", "sift" },
	highlight = 1,
	prompt = 1,
	next_tool_mapping = "<tab>",
}

-- from https://github.com/kevinhwang91/nvim-bqf#integrate-with-other-plugins
vim.cmd(([[
    aug Grepper
        au!
        au User Grepper ++nested %s
    aug END
]]):format([[call setqflist([], 'r', {'context': {'bqf': {'pattern_hl': '\%#' . getreg('/')}}})]]))
