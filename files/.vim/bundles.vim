set nocompatible               " be iMproved
filetype off                   " required!

if has('win32') || has('win64')
  set rtp+=~/vimfiles/bundle/vundle/
  call vundle#rc('$HOME/vimfiles/bundle/')
else
  " Usual quickstart instructions
  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()
endif
"
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'chrisbra/SudoEdit.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'mileszs/ack.vim'
Bundle 'vim-jp/cpp-vim'
Bundle 'rking/ag.vim'
Bundle 'sjl/gundo.vim'
Bundle 'techlivezheng/vim-plugin-minibufexpl'
Bundle 'terryma/vim-expand-region'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-afterimage'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-repeat'
Bundle 'vim-scripts/DirDiff.vim'
Bundle 'xolox/vim-easytags'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-shell'
Bundle 'scrooloose/syntastic' 
Bundle 'maxbrunsfeld/vim-yankstack' 
Bundle 'Valloric/YouCompleteMe'
Bundle 'Shougo/vimproc.vim'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/unite-outline'
Bundle 'klen/python-mode'
Bundle 'nanotech/jellybeans.vim'
Bundle 'jonathanfilip/vim-lucius'

" vim-scripts repos
Bundle 'a.vim'
Bundle 'renamer.vim'

" non github repos
Bundle 'git@bitbucket.org:Leszek/cauv-messages.git'

BundleDocs

syntax on
filetype plugin indent on
