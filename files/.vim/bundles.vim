call plug#begin('~/.vim/plugged')

" sensible defaults for vim
Plug 'tpope/vim-sensible'

" better navigation
Plug 'justinmk/vim-sneak'
Plug 'bkad/CamelCaseMotion'
Plug 'kana/vim-textobj-user'
Plug 'glts/vim-textobj-comment'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chrisbra/SudoEdit.vim'
Plug 'majutsushi/tagbar'
Plug 'vim-jp/cpp-vim'
Plug 'sjl/gundo.vim'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-afterimage'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/DirDiff.vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-shell'
if g:at_google
    Gsource .vim.syntastic
else
    Plug 'scrooloose/syntastic'
endif
Plug 'maxbrunsfeld/vim-yankstack'

" if g:at_google
"     Gsource .vim.ycm
" else
"     function! BuildYCM(info)
"         if has('unix')
"           !./install.sh --clang-completer
"         elseif has('win32')
"           exec '!start "Building YCM" "' . substitute(g:plug_home,'\\','/','g') . '/scripts/install-ycm.bat" ' . (has("win64") ? 'x64' : 'x86')'
"         endif
"     endfunction
"     Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
" endif
Plug 'neoclide/coc.nvim', {'branch': 'release'}

function! BuildVimProc(info)
    if has('win32unix')
      !make -f make_cygwin.mak
    elseif has('mac')
      !make -f make_mac.mak
    elseif has('unix')
      !make -f make_unix.mak
    elseif has('win32')
      exec 'start "Building vimproc" "' . substitute(g:bundles_vim_dir,'\\','/','g') . '/scripts/using-vs.bat" ' . (has("win64") ? 'x64' : 'x86') . ' "nmake /nologo /f make_msvc.mak nodebug=1"',
    endif
endfunction
Plug 'Shougo/vimproc.vim', { 'do': function('BuildVimProc') }

Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'
Plug 'Shougo/neomru.vim'
Plug 'tsukkee/unite-tag'
Plug 'nanotech/jellybeans.vim'
Plug 'jonathanfilip/vim-lucius'
Plug 'funorpain/vim-smali'
Plug 'luochen1990/rainbow'
Plug 'PeterRincker/vim-argumentative'

Plug 'jelera/vim-javascript-syntax'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'pangloss/vim-javascript'
Plug 'dag/vim-fish'
Plug 'dockyard/vim-easydir'
Plug 'tmux-plugins/vim-tmux'
Plug 'terryma/vim-multiple-cursors'
if !has('win32')
    Plug 'airblade/vim-gitgutter'
    Plug 'jreybert/vimagit'
endif
Plug 'haya14busa/incsearch.vim'
if executable('tmux')
    Plug 'christoomey/vim-tmux-navigator'
endif
Plug 'chrisbra/Recover.vim'
if isdirectory(expand('~/.fzf'))
  Plug 'junegunn/fzf', { 'dir': expand('~/.fzf') }
  Plug 'junegunn/fzf.vim'
endif

" vim-scripts repos
Plug 'vim-scripts/a.vim'
Plug 'vim-scripts/renamer.vim'
Plug 'vim-scripts/paredit.vim'

call plug#end()

if g:at_google
    Gsource .vim.bundles
endif

if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
  PlugInstall | q
endif
