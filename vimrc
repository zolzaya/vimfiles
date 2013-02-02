""
"" Thanks:
""   Gary Bernhardt  <destroyallsoftware.com>
""   Drew Neil  <vimcasts.org>
""   Tim Pope  <tbaggery.com>
""   Janus  <github.com/carlhuda/janus>
""


call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on

set nocompatible
set encoding=utf-8
set visualbell
set noerrorbells
set wildmenu
set wildmode=list:longest
set nobackup
set noswapfile

runtime macros/matchit.vim  " enables % to cycle through `if/else/endif`

syntax enable
colorscheme mustang
set guifont=Bitstream\ Vera\ Sans\ Mono:h13

set linespace=5  " set linespace
set antialias
set number       " line numbers aren't needed
set ruler        " show the cursor position all the time
set cursorline   " highlight the line of the cursor
set showcmd      " show partial commands below the status line
set shell=bash   " avoids munging PATH under zsh
let g:is_bash=1  " default shell syntax
set history=1000 " remember more Ex commands
set undolevels=1000
set scrolloff=3  " have some context around the current line always on screen
set title
" Allow backgrounding buffers without writing them, and remember marks/undo
" for backgrounded buffers
set hidden

"" Whitespace
set nowrap                        " don't wrap lines
set tabstop=4                     " a tab is two spaces
set shiftwidth=4                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode
" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the first column when wrap is
                                  " off and the line continues beyond the left of the screen
"" Searching
set hlsearch                      " highlight matches
set incsearch                     " incremental searching
set ignorecase                    " searches are case insensitive...
set smartcase                     " ... unless they contain at least one capital letter
set smarttab

" don't use Ex mode, use Q for formatting
map Q gq

" clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>

let mapleader=","
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
imap <leader>e <C-y>,
imap <C-j> <C-x><C-o>
" paste lines from unnamed register and fix indentation
nmap <leader>p pV`]=
nmap <leader>P PV`]=
nnoremap <F3> :NumbersToggle<CR>
nmap <F4> :NERDTreeToggle<cr>
nmap <F5> :TagbarToggle<CR>

map <leader>t :CtrlP<cr>
" http://vimcasts.org/e/14
"
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" ignore Rubinius, Sass cache files
set wildignore+=tmp/**,*.rbc,.rbx,*.scssc,*.sassc

nnoremap <leader><leader> <c-^>

" find merge conflict markers
nmap <silent> <leader>cf <ESC>/\v^[<=>]{7}( .*\|$)<CR>
nmap <silent> <leader>/ :nohlsearch<CR>

command! KillWhitespace :normal :%s/ *$//g<cr><c-o><cr>

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" disable cursor keys in normal mode
map <Left>  :echo "no!"<cr>
map <Right> :echo "no!"<cr>
map <Up>    :echo "no!"<cr>
map <Down>  :echo "no!"<cr>

if has("statusline") && !&cp
  set laststatus=2  " always show the status bar

  " Start the status line
  set statusline=%f\ %m\ %r%=

  " Add fugitive
  set statusline+=%{fugitive#statusline()}\ 

  " Finish the statusline
  set statusline+=Line:%l/%L\ [%p%%]\ 
  set statusline+=Col:%v
endif

nnoremap <leader>rs :!clear;rspec --color spec<CR>

if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
