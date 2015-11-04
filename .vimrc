" Vundle
" ------
set nocompatible "be iMproved, required by vundle
filetype off "required by vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, required
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/ctrlp.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

call vundle#end()            " required by Vundle
filetype plugin indent on    " required by Vundle

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

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Shortcuts for the CtrlP plugin
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" remap keys
" imap jk <Esc>
nmap \ $
let mapleader = "\<Space>"
