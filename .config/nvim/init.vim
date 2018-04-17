if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/gklech/.dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/gklech/.dein')
  call dein#begin('/Users/gklech/.dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/gklech/.dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('scrooloose/nerdtree')
  call dein#add('sheerun/vim-polyglot')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

let g:airline#extensions#tabline#enabled = 1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
