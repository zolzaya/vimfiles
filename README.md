Mislav's vim configuration
==========================

Thanks to these guys:

* [Gary Bernhardt](http://destroyallsoftware.com),
* [Drew Neil](http://vimcasts.org),
* [Tim Pope](http://tbaggery.com),
* and the [Janus project](https://github.com/carlhuda/janus).

My configuration uses [Pathogen](https://github.com/tpope/vim-pathogen) and git submodules.
(But you don't need to care about any of that.)

## Installation:

Prerequisites: ruby, git.

1. Move your existing configuration somewhere else:  
   `mv ~/.vim* ~/.gvim* my_backup`
2. Clone this repo into ".vim":  
   `git clone https://github.com/zolzaya/vimfiles ~/.vim`
3. Go into ".vim" and run "rake":  
   `cd ~/.vim && rake`

This will install "~/.vimrc" and "~/.gvimrc" symlinks that point to
files inside the ".vim" directory.

## Features:

### `vimrc`

* 2 spaces, no tabs
* incremental, case-insensitive search
* `<CR>` - remove highlighting after search
* `<C-j/k/h/l>` - switch between splits (no need to prepend `<C-w>`)
* cursor keys for movement are disabled!
* `Q` - format lines
* `,,` alternates between two most recent buffers
* `,f` - jump to file:
  * `,F` - search in directory of current buffer
  * `,gl` - in `lib/`
  * `,gm` - in `app/models`
  * `,gv` - in `app/views`
  * `,gc` - in `app/controllers`
* `,cf` - search for merge conflicts in buffer
* `:KillWhitespace` - strip trailing whitespace

### Ack

* `:Ack -w foo_bar --no-js --no-css`
* `:Ack!` - search, but don't jump to first match
* `:AckFromSearch`
* `:AckAdd` - append to existing quickfix list

### Surround

* `cs"'` - change string from double to single quotes
* `ds(` - delete surrounding parentheses
* `ysiW]` - surround current WORD with square brackets
* `ysst` - surround current line in a HTML tag
* `ysip<c-t>` - nest current paragraph in a HTML tag

Visual mode: `S`. Insert mode: `<c-s>`.

Surround + rails.vim:

* `-` → `<% -%>`
* `=` → `<%= %>`
* `#` → `<%# %>`
* `e` - nest block and append `end` keyword
* `E` - like `e`, but prompt for text to prepend before block

### Commentary

* `\\{motion}` - comment/uncomment lines that {motion} moves over
* `\\\` - comment/uncomment [count] lines
* `{Visual}\\` - comment/uncomment the highlighted lines
* `\\u` - uncomment the current and adjacent commented lines

### ruby.vim

Motions:

* `]m` / `[m` - next / previous method
* `]M` / `[M` - end of method definition
* `]]` / `[[` - next / previous class/module
* `][` / `[]` - end of class/module

Text objects:

* `am` - a method
* `im` - inner method
* `aM` - a class
* `iM` - inner class

### matchit.vim

`%` alternates between matching HTML tags, class/control flow statements and
matching `end` in Ruby, and more. Also works in visual mode.

### Tabular

In visual mode:

* `:Tabularize assignment`
* `:Tabularize argument_list`
* `:Tabularize /=>`

### Fugitive

* `:Gcommit`
* `:Gstatus`
  * jump between lines that represent files with `<c-n>`, `<c-p>`
  * `-` - add/reset file (visual mode too)
  * `<Enter>` - open current file in the window below
  * `p` - run `git add --patch` for current file
  * `C` - invoke `:Gcommit`
* `:[range]Gbrowse! -` - copy GitHub URL for code that's currently selected
* `:[range]Gblame`

* `:Gedit feature:%` - version of the current file in the "feature" branch
* `:Gwrite` - `add %`
* `:Gread` - `checkout %`
* `:Gremove` - `rm %`
* `:Gmove <dest>` - `mv % <dest>`

### Pathogen

Quickly open vim runtime files:

* `:Vedit`
* `:Vsplit`
* `:Vvsplit`
* `:Vtabedit`
* `:Vpedit`
* `:Vread`

Example:

    :Vsp s/pd<Tab>
