# pickled-nvim

forked from [quick.nvim](https://github.com/albingroen/quick.nvim) originally... now with heavy modifications :grin:

see `:h pickled-nvim` for quick reference of plugins, keymaps, etc

## Features

### Diagnostics

powered by trouble.nvim

- `gl`: Show diagnostics in a floating window. See :help vim.diagnostic.open_float().
- `[d`: Move to the previous diagnostic in the current buffer. See :help vim.diagnostic.goto_prev().
- `]d`: Move to the next diagnostic. See :help vim.diagnostic.goto_next().
- `<leader>xx`: toggle trouble window


### Splitting and Joining lines

_powered by splitjoin.vim_ 

- `gS`: change from one-line syntax to multi-line syntax
- `gJ`: change from multi-line syntax to one-line syntax

### Matching words

_powered by vim-matchup_

- `%`:  go forwards to next matching word. If at a close word, cycle back to the corresponding open word.
- `g%`: go backwards to Nth previous matching word. If at an open word, cycle around to the corresponding close word
- `[%`: go to Nth previous outer open word. Allows navigation to the start of blocks surrounding the cursor. This is similar to vim's built-in [( and [{ and is an exclusive motion.
- `]%`: go to Nth next surrounding close word. This is an exclusive motion.
- `z%`: go to inside Nth nearest inner contained block. This is an exclusive motion when used with operators, except it eats whitespace

Text objects:
- `i%`: inside of any block
- `a%`: an any block

[text object examples](https://github.com/andymass/vim-matchup#line-wise-operatortext-object-combinations)


### Misc:

* `ga`: show info about the character under cursor as decimal, octal, and hex (_powered by vim-characterize_)


### Auto-closing

- single quotes
- double quotes
- smart `end` for Ruby and Lua 
- Markdown:
  - italics
  - bold

_powered via nvim-autopairs_
