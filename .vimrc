set autoindent "this sets the autoindent option
syntax on "activate syntax highlighting
set background=dark "enable color scheme for dark terminal windows
colorscheme solarized "use theme from http://ethanschoonover.com/solarized
set number "activate line numbers
set ruler
set smartcase "do a case insensitive search when only lowercase chars, but case sensitive if uppercase chars exist
set cursorline "underline current line
set tabstop=2
set mouse=a
set wildmode=full
set showcmd "show command in bottom bar
set wildmenu "visual autocomplete for command menu
set lazyredraw "redraw only when we need to
set showmatch "highlight matching [{()}]

" Searching
" ---------
" turn off search highlight
set incsearch "search as characters are entered
set hlsearch "highlight all search matches
nnoremap <leader><space> :nohlsearch<CR>

filetype plugin indent on

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" remap keys
" imap jk <Esc>
nmap \ $
let mapleader = "\<Space>"

" load pathogen
execute pathogen#infect()
