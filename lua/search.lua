vim.g.tools = { 'rg', 'ag', 'pt', 'git', 'sift'}
vim.g.highlight             = 1
vim.g.prompt                = 1
vim.g.next_tool     = '<leader>g'


-- from https://github.com/kevinhwang91/nvim-bqf#integrate-with-other-plugins
vim.cmd(([[
    aug Grepper
        au!
        au User Grepper ++nested %s
    aug END
]]):format([[call setqflist([], 'r', {'context': {'bqf': {'pattern_hl': '\%#' . getreg('/')}}})]]))
