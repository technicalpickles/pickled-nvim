# pickled-nvim

forked from [quick.nvim](https://github.com/albingroen/quick.nvim), with heavy modifications :grin:

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

### Textobjects

_powered by nvim-treesitter-textobjects and nvim-treesitter-textsubjects__

Method/function Arguments/paremeters:

- `<leader>a`
- `<leader>A`


While in visual mode:

- `.`: Depending on your location it may select comments, function calls/definitions, loops, if statements, arguments, return values.
- `;`: Depending on your location it may select classes, structs, functions, methods.
- `i;`: Depending on your location it may select inside classes, structs, functions, methods.
- `,`: go back to previous selection


### Bracket keymapings 

_powered by vim-unimpaired_ 

Convenience aliases for Ex commands
- `]q`: `:cnext`, ie jump to next item in quickfix
- `[q`: `:cprevious`, ie jump to previous item in quickfix
- `]a` `:next`, ie edit next file 
- `[a` `:previous` ie edit previous file
- `]A`


- `[A`     |:first|
- `]A`     |:last|

- `[b` is :bprevious. See the documentation for the full set of 20 mappings and mnemonics. All of them take a count.

Line-wise mappings:
- `[&lt;Spaces&gt;` and `]&lt;Space&gt;`: add newlines before and after the cursor line
- `[e` and `]e`: exchange the current line with the one above or below it.


Option toggling:
`[os`, `]os`, and `yos`:  `:set spell`, `:set nospell`, and `:set invspell`, respectively
. There's also l (list), n (number), w (wrap), x (cursorline cursorcolumn), and several others, plus mappings to help alleviate the set paste dance. Consult the documentation.


Encoding and decoding:
- `[x` and `]x`: encode and decode XML (and HTML)
- `[u` and `]u`: encode and decode URLs
- `[y` and `]y`: C String style escaping.


Misc:
- `[f` and `]f`: the next/previous file in the directory
- `[n` and `]n`: jump between SCM conflict markers.

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
