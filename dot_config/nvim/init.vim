let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set incsearch
set wrap
set number
filetype plugin indent on
syntax on
set clipboard=unnamed
let mapleader=' '
set expandtab
set softtabstop=8
set autoindent
set tabstop=8
set nocompatible
" set termguicolors
"
command Wq wq

au BufRead,BufNewFile *.json5 setfiletype javascript

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-sneak'
" Plug 'ggandor/leap.nvim'
" Plug 'valloric/youcompleteme'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'cespare/vim-toml'
Plug 'arcticicestudio/nord-vim'
Plug 'wellle/targets.vim'
Plug 'dmix/elvish.vim', { 'on_ft': ['elvish'] }
Plug 'LnL7/vim-nix'
call plug#end()

set background=dark
" colorscheme hybrid_material
colorscheme nord


" nmap s <Plug>(easymotion-overwin-f2)
" map  s <Plug>(easymotion-sn)
" omap s <Plug>(easymotion-tn)
"
let g:sneak#label = 1

