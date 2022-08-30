# pickled-nvim

forked from [quick.nvim](https://github.com/albingroen/quick.nvim)

## Features

### Language Support and Completion

_powered by lsp-zero_

### Keybindings

Completion Menu:

* <kbd>Enter</kbd>: Confirms selection.

* <kbd>Up</kbd>: Navigate to previous item on the list.

* `<Down>`: Navigate to the next item on the list.

* `<Ctrl-u>`: Scroll up in the item's documentation.

* `<Ctrl-f>`: Scroll down in the item's documentation.

* `<Ctrl-e>`: Toggles the completion.

* `<Ctrl-d>`: Go to the next placeholder in the snippet.

* `<Ctrl-b>`: Go to the previous placeholder in the snippet.

* `<Tab>`: Enables completion when the cursor is inside a word. If the completion menu is visible it will navigate to the next item in the list.

* `<S-Tab>`: When the completion menu is visible navigate to the previous item in the list.


LSP:

* `K`: Displays hover information about the symbol under the cursor in a floating window. See `:help vim.lsp.buf.hover()`.

* `gd`: Jumps to the definition of the symbol under the cursor. See `:help vim.lsp.buf.definition()`.

* `gD`: Jumps to the declaration of the symbol under the cursor. Some servers don't implement this feature. See `:help vim.lsp.buf.declaration()`.

* `gi`: Lists all the implementations for the symbol under the cursor in the quickfix window. See `:help vim.lsp.buf.implementation()`.

* `go`: Jumps to the definition of the type of the symbol under the cursor. See `:help vim.lsp.buf.type_definition()`.

* `gr`: Lists all the references to the symbol under the cursor in the quickfix window. See `:help vim.lsp.buf.references()`.

* `<Ctrl-k>`: Displays signature information about the symbol under the cursor in a floating window. See `:help vim.lsp.buf.signature_help()`. If a mapping already exists for this key this function is not bound.

* `<F2>`: Renames all references to the symbol under the cursor. See `:help vim.lsp.buf.rename()`.

* `<F4>`: Selects a code action available at the current cursor position. See `:help vim.lsp.buf.code_action()`.

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

### Multiple Cursors

_powered by vim-visual-multi_



- select words with `C-N` (like Ctrl-d in Sublime Text/VS Code)
- create cursors vertically with `C-Down`/`Ctrl-Up`
- select one character at a time with `S-Arrows`
- press `n`/`N` to get next/previous occurrence
- press `[`/`]` to select next/previous cursor
- press `q` to skip current and get next occurrence
- press `Q` to remove current cursor/selection
- start insert mode with i,a,I,A

_note: you'll need to disable macOS Keyboard Shortcuts for Mission Control for some of these to not be hijacked

### Misc:

* `ga`: show info about the character under cursor as decimal, octal, and hex (_powered by vim-characterize_)

### Marks

_powered by marks.nvim_

```
    mx              Set mark x
    m,              Set the next available alphabetical (lowercase) mark
    m;              Toggle the next available mark at the current line
    dmx             Delete mark x
    dm-             Delete all marks on the current line
    dm<space>       Delete all marks in the current buffer
    m]              Move to next mark
    m[              Move to previous mark
    m:              Preview mark. This will prompt you for a specific mark to
                    preview; press <cr> to preview the next mark.
                    
    m[0-9]          Add a bookmark from bookmark group[0-9].
    dm[0-9]         Delete all bookmarks from bookmark group[0-9].
    m}              Move to the next bookmark having the same type as the bookmark under
                    the cursor. Works across buffers.
    m{              Move to the previous bookmark having the same type as the bookmark under
                    the cursor. Works across buffers.
    dm=             Delete the bookmark under the cursor.
```

### Copilot

`<C-]>`: Dismiss the current suggestion.

`<M-]>`: Cycle to the next suggestion, if one is available.
<Plug>(copilot-next)

`<M-[>`: Cycle to the previous suggestion.

### Auto-closing

- single quotes
- double quotes
- smart `end` for Ruby and Lua 
- Markdown:
  - italics
  - bold

_powered via nvim-autopairs_
