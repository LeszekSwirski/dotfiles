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
Bundle 'Rip-Rip/clang_complete.git'
Bundle 'vim-scripts/DirDiff.vim.git'
Bundle 'xaizek/vim-inccomplete.git'
Bundle 'tpope/vim-afterimage.git'
Bundle 'tpope/vim-abolish.git'
Bundle 'tpope/vim-surround.git'
Bundle 'techlivezheng/vim-plugin-minibufexpl'
Bundle 'xolox/vim-easytags.git'
Bundle 'kien/ctrlp.vim.git'
Bundle 'proyvind/Cpp11-Syntax-Support.git'
Bundle 'xolox/vim-shell.git'
Bundle 'chrisbra/SudoEdit.vim.git'
Bundle 'majutsushi/tagbar.git'
Bundle 'Lokaltog/vim-powerline.git'
Bundle 'ervandew/supertab.git'
Bundle 'Lokaltog/vim-easymotion.git'
Bundle 'ivanov/vim-ipython.git'
Bundle 'sjl/gundo.vim.git'
Bundle 'mileszs/ack.vim'
Bundle 'terryma/vim-expand-region.git'

" vim-scripts repos
Bundle 'a.vim'
Bundle 'renamer.vim'

" non github repos
Bundle 'git@bitbucket.org:Leszek/cauv-messages.git'

BundleDocs

syntax on
filetype plugin indent on
