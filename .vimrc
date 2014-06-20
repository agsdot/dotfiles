set nocompatible 

"NeoBundle Scripts-----------------------------
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=/Users/agsdot/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/Users/agsdot/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'dkprice/vim-easygrep'
NeoBundle 'sjbach/lusty'
NeoBundle 'yegappan/mru'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------
"


" turn ON line numbers
set number

" 4 space softabs default
set expandtab
set ts=2
set sw=2

" quiet pls
set noeb vb t_vb=

syntax on
colorscheme Tomorrow-Night-Eighties
"colorscheme Base16-flat  
"colorscheme distinguished

" For nerdcommenter
filetype plugin on

let mapleader = ","

map <C-n> :NERDTreeToggle<CR>

set hidden

" Backspace and cursor keys wrap
set whichwrap+=<,>,h,l

" Case insensitive matching.
set ignorecase

" Automatic indentation
set autoindent
set smarttab

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

" Switch colon and semi-colon
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
