" be iMproved
set nocompatible

" required! 
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" bundles
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-rails'
Bundle 'vim-ruby/vim-ruby'
Bundle 'thoughtbot/vim-rspec'
Bundle 'tpope/vim-dispatch'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-commentary'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-haml'
Bundle 'plasticboy/vim-markdown'
Bundle 'pangloss/vim-javascript'
Bundle 'flazz/vim-colorschemes'

" required!
filetype plugin indent on

" 2 spaces tabs replaced with spaces
set tabstop=2
set shiftwidth=2
set expandtab 

" syntax highlighting
syntax on
colorscheme codeschool
 
" show line numbers
set number

" mouse support
set mouse=a

" viritual edit (enables navigation on blank space)
set ve=all

" allows buffers to be hidden without saving them
set hidden

" highlight searching results
set hlsearch

" keystrokes
let mapleader = ","

" toogle code paste from external source
set pastetoggle=<F2>

" NERDTree
autocmd VimEnter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd VimEnter * wincmd p

" vim-rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = "Dispatch rspec --drb {spec}"


" gvim
if has("gui_running")

  " remove toolbar 
  set guioptions-=T  

  " font
  set guifont=Monospace\ 11

endif

