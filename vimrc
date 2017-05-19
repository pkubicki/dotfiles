" be iMproved
set nocompatible

" required!
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" bundles
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-rails'
Bundle 'vim-ruby/vim-ruby'
Bundle 'thoughtbot/vim-rspec'
Bundle 'jgdavey/tslime.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-commentary'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-haml'
Bundle 'plasticboy/vim-markdown'
Bundle 'pangloss/vim-javascript'
Bundle 'flazz/vim-colorschemes'
Bundle 'rking/ag.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'tpope/vim-endwise'
Bundle 'scrooloose/syntastic'

" required
call vundle#end()

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

" set to auto read when a file is changed from the outside
set autoread

" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase

" disables creation of *.swp files
set noswapfile

" NERDTree
autocmd VimEnter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd VimEnter * wincmd p
nmap <Leader>nt :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" vim-rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = 'call Send_to_Tmux("clear && rspec {spec}\n")'

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" splits
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" trailing whitespaces
nnoremap <Leader>rtw :%s/\s\+$//e<CR>
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" clipboard
set clipboard=unnamed

" The encoding displayed.
set encoding=utf-8

" The encoding written to file.
set fileencoding=utf-8

" gvim
if has("gui_running")

  " remove toolbar
  set guioptions-=T

  " font
  set guifont=Monospace\ 11

  " disable bells
  set noerrorbells visualbell t_vb=
  if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
  endif

endif

" linters
let g:syntastic_ruby_checkers = ['mri', 'rubocop']

" markdown
let g:vim_markdown_folding_disabled = 1

" ag
let g:ag_prg='ag -S --nocolor --nogroup --column --ignore "./log/*" --ignore "./tmp/*" --ignore "./public/*"'
