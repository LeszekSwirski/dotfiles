set nocompatible               " be iMproved
filetype off 

if has('win32') || has('win64')
  set rtp+=~/vimfiles/bundle/neobundle.vim/
  call neobundle#rc(expand('$HOME/vimfiles/bundle/'))
else
  " Usual quickstart instructions
  set rtp+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif
"
" let NeoBundle manage NeoBundle
" required! 
NeoBundleFetch 'Shougo/neobundle'

" My Bundles here:
"
" original repos on github
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'bling/vim-airline'
NeoBundle 'chrisbra/SudoEdit.vim', { 'vim_version' : '7.0.111' }
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'majutsushi/tagbar', { 'vim_version' : '7.0.167' }
NeoBundle 'mileszs/ack.vim'
NeoBundle 'vim-jp/cpp-vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'techlivezheng/vim-plugin-minibufexpl'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-afterimage'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'vim-scripts/DirDiff.vim'
NeoBundle 'xolox/vim-easytags'
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-shell'
NeoBundle 'scrooloose/syntastic' 
NeoBundle 'maxbrunsfeld/vim-yankstack' 
NeoBundle 'Valloric/YouCompleteMe', { 'vim_version' : '7.3.584' }
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'echo Cannot auto-update vimproc on windows',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'klen/python-mode'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'jonathanfilip/vim-lucius'

" vim-scripts repos
NeoBundle 'a.vim'
NeoBundle 'renamer.vim'

" non github repos
NeoBundle 'git@bitbucket.org:Leszek/cauv-messages.git'

syntax on
filetype plugin indent on

NeoBundleCheck
