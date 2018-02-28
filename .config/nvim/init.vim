if &compatible
  set nocompatible
endif
set runtimepath+=~/.dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.dein')
  call dein#begin('~/.dein')

  call dein#add('~/.dein/repos/github.com/Shougo')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('scrooloose/nerdtree')
  call dein#add('sheerun/vim-polyglot')

  call dein#end()
  call dein#save_state()
endif

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

filetype plugin indent on
syntax on

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
