call plug#begin('~/.vim/plugged')

" sensible defaults for vim
Plug 'tpope/vim-sensible'

" better navigation
Plug 'justinmk/vim-sneak'

Plug 'bling/vim-airline'
Plug 'chrisbra/SudoEdit.vim'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'vim-jp/cpp-vim'
Plug 'rking/ag.vim'
Plug 'sjl/gundo.vim'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-afterimage'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/DirDiff.vim'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-shell'
if g:at_google
    Gsource .vim.syntastic
else
    Plug 'scrooloose/syntastic'
endif
Plug 'maxbrunsfeld/vim-yankstack'

if g:at_google
    Gsource .vim.ycm
else
    function! BuildYCM(info)
        if has('unix')
          !./install.sh --clang-completer
        elseif has('win32')
          exec '!start "Building YCM" "' . substitute(g:plug_home,'\\','/','g') . '/scripts/install-ycm.bat" ' . (has("win64") ? 'x64' : 'x86')'
        endif
    endfunction
    Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
endif

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
Plug 'nanotech/jellybeans.vim'
Plug 'jonathanfilip/vim-lucius'
Plug 'funorpain/vim-smali'
Plug 'kien/rainbow_parentheses.vim'
Plug 'PeterRincker/vim-argumentative'
Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'jelera/vim-javascript-syntax'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'pangloss/vim-javascript'
Plug 'marijnh/tern_for_vim'
Plug 'dag/vim-fish'
Plug 'dockyard/vim-easydir'
Plug 'tejr/vim-tmux'
Plug 'terryma/vim-multiple-cursors'
if !has('win32')
    Plug 'airblade/vim-gitgutter'
endif
Plug 'haya14busa/incsearch.vim'
if executable('tmux')
    Plug 'christoomey/vim-tmux-navigator'
endif
Plug 'chrisbra/Recover.vim'
if isdirectory(expand('~/.fzf'))
  Plug 'junegunn/fzf', { 'dir': expand('~/.fzf') }
endif

" vim-scripts repos
Plug 'a.vim'
Plug 'renamer.vim'
Plug 'paredit.vim'

call plug#end()

if g:at_google
    Gsource .vim.bundles
endif

if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
  PlugInstall | q
endif
