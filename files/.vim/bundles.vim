set nocompatible               " be iMproved
filetype off

let g:bundles_vim_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')

if has('vim_starting')
    let neobundle_dir = g:bundles_vim_dir.'/bundle/neobundle.vim/'
    " Append neobundle dir to rtp
    let &rtp = join(add(split(&rtp,','), neobundle_dir),',')

    " Bootstrap neobundle if necessary
    if !isdirectory(neobundle_dir) || !isdirectory(neobundle_dir.'.git')
        exec '!git clone "https://github.com/Shougo/neobundle.vim.git" ' . shellescape(neobundle_dir)
    endif

    call neobundle#rc(g:bundles_vim_dir.'/bundle/')
endif

" let NeoBundle manage NeoBundle
" required!
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
"
" original repos on github
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'bling/vim-airline'
NeoBundle 'chrisbra/SudoEdit.vim', { 'vim_version' : '7.0.111' }
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
NeoBundle 'Valloric/YouCompleteMe', {
      \ 'vim_version' : '7.3.584',
      \ 'build' : {
      \     'windows' : 'start "Building YCM" "' . substitute(g:bundles_vim_dir,'\\','/','g') . '/scripts/install-ycm.bat"',
      \     'unix' : './install.sh --clang-completer --system-libclang',
      \    },
      \ }
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'start "Building vimproc" "' . substitute(g:bundles_vim_dir,'\\','/','g') . '/scripts/using-vs.bat" "nmake /nologo /f make_msvc.mak nodebug=1"',
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
NeoBundle "funorpain/vim-smali"
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'PeterRincker/vim-argumentative'
NeoBundle 'LaTeX-Box-Team/LaTeX-Box'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'marijnh/tern_for_vim'
NeoBundle 'dag/vim-fish'
NeoBundle 'dockyard/vim-easydir'
NeoBundle 'tejr/vim-tmux'
if !has('win32')
    NeoBundle 'airblade/vim-gitgutter'
endif

" vim-scripts repos
NeoBundle 'a.vim'
NeoBundle 'renamer.vim'
NeoBundle 'paredit.vim'

" non github repos
NeoBundle 'git@bitbucket.org:Leszek/cauv-messages.git'

syntax on
filetype plugin indent on

NeoBundleCheck
