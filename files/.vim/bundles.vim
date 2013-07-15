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
Bundle 'Lokaltog/vim-easymotion.git'
Bundle 'Lokaltog/vim-powerline.git'
Bundle 'chrisbra/SudoEdit.vim.git'
Bundle 'ervandew/supertab.git'
Bundle 'flazz/vim-colorschemes'
Bundle 'ivanov/vim-ipython.git'
Bundle 'kien/ctrlp.vim.git'
Bundle 'majutsushi/tagbar.git'
Bundle 'mileszs/ack.vim'
Bundle 'proyvind/Cpp11-Syntax-Support.git'
Bundle 'rking/ag.vim'
Bundle 'sjl/gundo.vim.git'
Bundle 'techlivezheng/vim-plugin-minibufexpl'
Bundle 'terryma/vim-expand-region.git'
Bundle 'tpope/vim-abolish.git'
Bundle 'tpope/vim-afterimage.git'
Bundle 'tpope/vim-surround.git'
Bundle 'vim-scripts/DirDiff.vim.git'
Bundle 'xolox/vim-easytags.git'
Bundle 'xolox/vim-misc.git'
Bundle 'xolox/vim-shell.git'
Bundle 'scrooloose/syntastic' 
Bundle 'maxbrunsfeld/vim-yankstack' 
Bundle 'Valloric/YouCompleteMe'
Bundle 'Shougo/vimproc.vim'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/unite-outline'
Bundle 'klen/python-mode'

" vim-scripts repos
Bundle 'a.vim'
Bundle 'renamer.vim'

" non github repos
Bundle 'git@bitbucket.org:Leszek/cauv-messages.git'

BundleDocs

syntax on
filetype plugin indent on
