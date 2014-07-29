set shell=/bin/bash
"NeoBundle Scripts-----------------------------
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'Shougo/vimshell.vim'

NeoBundle 'bling/vim-airline'

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'myusuf3/numbers.vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'bitc/vim-bad-whitespace'
NeoBundle 'mhinz/vim-startify'
NeoBundle 'terryma/vim-smooth-scroll'
NeoBundle 'terryma/vim-expand-region'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------
"

" Switch colon and semi-colon
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

let mapleader = ","

" turn ON line numbers
set number

" 4 space softabs default
set expandtab
set ts=2
set sw=2

" Tabs
set autoindent            " copy indent from previous line
set expandtab             " replace tabs with spaces
set shiftwidth=2          " spaces for autoindenting
set smarttab              " <BS> removes shiftwidth worth of spaces
set softtabstop=2         " spaces for editing, e.g. <Tab> or <BS>
set tabstop=2             " spaces for <Tab>

" Automatic indentation
set autoindent
set smarttab

" quiet pls
set noeb vb t_vb=

syntax on
colorscheme Tomorrow-Night-Eighties

" For nerdtree
let NERDTreeShowHidden=1

set hidden

" Backspace and cursor keys wrap
set whichwrap+=<,>,h,l

" Case insensitive matching.
set ignorecase

set showmatch

" Path/file expansion in colon-mode.
set wildmode=longest:full,list:full,list:longest
set wildchar=<TAB>

" How many lines of history to remember
set history=1000

" Space it out a little more (easier to read)
set lsp=0

" Use mouse everywhere
set mouse=a

" Open where I left off
set viminfo='1000,\"1000,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

let g:ctrlp_show_hidden = 1

set paste

" Clipboard sharing http://vim.wikia.com/wiki/Accessing_the_system_clipboard
set clipboard=unnamed

" Unite bindings http://www.reinteractive.net/posts/166-awesome-vim-plugins
nnoremap <silent> <Leader>r :Unite -buffer-name=recent -winheight=10 file_mru<cr>
nnoremap <Leader>b :Unite -quick-match buffer<cr>
nnoremap <Leader>f :Unite grep:.<cr>
nnoremap <Leader>nt :NERDTreeToggle<cr>
nnoremap <leader>nf :NERDTreeFind<cr>
nnoremap <leader>p :CtrlP<cr>

map <leader>/ <plug>NERDCommenterToggle
imap <leader>/ <Esc><plug>NERDCommenterTogglei

" easier navigation between split windows
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l

set backspace=2 " make backspace work like most other apps

let g:nerdtree_tabs_open_on_console_startup=1

noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
