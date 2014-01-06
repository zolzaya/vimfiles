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

set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim/
let g:Powerline_symbols = 'fancy'
set nocompatible
set t_Co=256
set encoding=utf-8

" Disabling bell sound
set novisualbell
set noerrorbells

set wildmenu
set wildmode=list:longest

" Disabling backup since files are in git
set nobackup
set noswapfile
set nowb
" Mouse usage
set mouse=a

set clipboard=unnamedplus  " enables clipboard sharing
" disabling neosnippet preview
set completeopt-=preview
" max 15 tabs
set tabpagemax=15
" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

runtime macros/matchit.vim  " enables % to cycle through `if/else/endif`

syntax enable
set guifont=Ubuntu\ Mono\ for\ Powerline:h14
" seoul256.vim
colo seoul256
set background=dark

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
set synmaxcol=512 "performance
set scrolloff=3  " have some context around the current line always on screen
set title
" Reload files changed outside vim
set autoread
" Allow backgrounding buffers without writing them, and remember marks/undo
" for backgrounded buffers
set hidden

"" Whitespace
set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set softtabstop=2
" space instead of tab
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
      set gdefault                      " /g flag default for :s
" Using tab
set smarttab
" Resize Split Windows
map + <c-w>+
map _ <c-w>-
map } gt
map { gT
" Don't redraw while executing macros (performance boost)
set lazyredraw


" don't use Ex mode, use Q for quit
nnoremap <silent> Q ZZ

" clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>

let g:neocomplcache_enable_at_startup = 0
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underscore completion.
let g:neocomplcache_enable_underbar_completion = 1
" Sets minimum char length of syntax keyword.
let g:neocomplcache_min_syntax_length = 2

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType phtml,html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

let mapleader=","

imap <leader>e <C-y>,
imap <C-j> <C-x><C-o>
" paste lines from unnamed register and fix indentation
nmap <leader>p pV`]=
nmap <leader>P PV`]=
nnoremap <F3> :NumbersToggle<CR>
nmap <F4> :NERDTreeToggle<cr>
nnoremap <F6> :GundoToggle<CR>
let g:gundo_right = 1
let g:gundo_preview_bottom = 1
" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk

map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e
" omni cancel
inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Don't use <C-P>, leave it available for something else.
let g:ctrlp_map=''
nnoremap <silent> <leader>o :<C-U>CtrlPCurWD<CR>
nnoremap <silent> <leader>b :<C-U>CtrlPBufTag<CR>

" ignore Rubinius, Sass cache files
set wildignore+=tmp/**,*.rbc,.rbx,*.scssc,*.sassc

nnoremap <leader><leader> <c-^>

" find merge conflict markers
nmap <silent> <leader>cf <ESC>/\v^[<=>]{7}( .*\|$)<CR>
nmap <silent> <leader>/ :nohlsearch<CR>

command! KillWhitespace :normal :%s/ *$//g<cr><c-o><cr>
" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

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
map <C-Tab> :bnext<cr>
" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

nnoremap <leader>rs :!clear;rspec --color spec<CR>

if exists(":Tabularize")
  nmap <leader>a= :Tabularize /=<CR>
  vmap <leader>a= :Tabularize /=<CR>
  nmap <leader>a: :Tabularize /:<CR>
  vmap <leader>a: :Tabularize /:<CR>
  nmap <leader>a:: :Tabularize /:\zs<CR>
  vmap <leader>a:: :Tabularize /:\zs<CR>
  nmap <leader>a, :Tabularize /,<CR>
  vmap <leader>a, :Tabularize /,<CR>
  nmap <leader>a| :Tabularize / |<CR>
  vmap <leader>a| :Tabularize / |<CR>
endif

" highlight background if text exceeds 80 char
" highlight OverLength ctermbg=darkred ctermfg=white guibg=#592929
" match OverLength /\%>81v.\+/

" Key bindings for adjusting the tab/shift width.
nnoremap <leader>w2 :setlocal tabstop=2<CR>:setlocal shiftwidth=2<CR>
nnoremap <leader>w4 :setlocal tabstop=4<CR>:setlocal shiftwidth=4<CR>
nnoremap <leader>w8 :setlocal tabstop=8<CR>:setlocal shiftwidth=8<CR>

" Disable event-handler attributes support:
" let g:html5_event_handler_attributes_complete = 0

" Disable RDFa attributes support:
" let g:html5_rdfa_attributes_complete = 0

" Disable microdata attributes support:
" let g:html5_microdata_attributes_complete = 0

" Disable WAI-ARIA attribute support:
" let g:html5_aria_attributes_complete = 0

" Don't prompt on Vim close if we want to save the session.
let g:session_autosave=0
" Don't auto-load saved sessions on Vim start.
let g:session_autoload=0
" Re-map for easy session saving/restore.
noremap <leader>ss :SaveSession user<CR>
noremap <leader>sr :OpenSession user<CR>

let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
" only active windows has cursor line highlight
augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END
