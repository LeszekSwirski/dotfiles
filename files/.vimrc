" Load plugins
call pathogen#infect()
Helptags
syntax on


set nocompatible

set mouse=a
set number
set whichwrap=h,l,~,[,],<,>
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab
set expandtab

set autoindent
set smartindent
set showmatch
set incsearch
set wildmode=longest,list

set ignorecase
set smartcase

set hidden
set ruler
set laststatus=2

set history=2000

set backspace=indent,eol,start

set clipboard=unnamed

set spelllang=en_gb

set completeopt=menu,preview,longest

" Change directory to current file's
" autocmd! BufEnter * lcd %:p:h


" Stupid typo
command! WQ wq
command! Wq wq
command! W w
command! Q q

noremap <silent> <F8> :TlistToggle<CR>
inoremap <silent> <F8> <C-O>:TlistToggle<CR>

" Omnicomplete
inoremap <Nul> <C-x><C-o>

if !has('win32')
    function! UpdateTags() 
        silent !echo
        silent !update-tags
        redraw!
        echo system("update-tags -nq")
    endfunction
    function! SilentUpdateTags() 
        silent !update-tags -nq >/dev/null 2>/dev/null &
    endfunction


    noremap <silent> <F12> :call UpdateTags()<CR>
    inoremap <silent> <F12> <C-O>:call UpdateTags()<CR>
    autocmd! BufWrite,CursorHold *.{c,cpp,h,hpp} call SilentUpdateTags()
endif

set tags+=tags;/
set tagrelative

set makeprg=rmake


let g:GetLatestVimScripts_allowautoinstall=1



" Clang completion
if executable('clang')
    let g:clang_use_library=1
    let g:clang_complete_auto=1
    let g:clang_complete_copen=1
    let g:clang_periodic_quickfix=0
else
    let g:clang_use_library=0
    let g:clang_complete_auto=0
    let g:clang_complete_copen=0
    let g:clang_periodic_quickfix=0
endif

set path+=/usr/local/include

" YankRing
let g:yankring_replace_n_pkey = '<M-n>'
let g:yankring_replace_n_nkey = '<M-p>'
nnoremap <silent> <F11> :YRShow<CR>

" Taglist
let Tlist_Exit_OnlyWindow = 1

" Moving lines up and down
nmap <M-j> mz:m+<CR>`z==
nmap <M-k> mz:m-2<CR>`z==
imap <M-j> <Esc>:m+<CR>==gi
imap <M-k> <Esc>:m-2<CR>==gi
vmap <M-j> :m'>+<CR>gv=`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<CR>gv=`>my`<mzgv`yo`z

" Renamer
let g:RenamerSupportColonWToRename = 1

" MiniBufExplorer 
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplUseSingleClick = 1

nnoremap <silent> <c-n> :MBEbn<cr>
vnoremap <silent> <c-n> :MBEbn<cr>
inoremap <silent> <c-n> <c-o>:MBEbn<cr>
nnoremap <silent> <c-p> :MBEbp<cr>
vnoremap <silent> <c-p> :MBEbp<cr>
inoremap <silent> <c-p> <c-o>:MBEbp<cr>

if $TERM=='screen'
	exe "set title titlestring=vim:%f"
	exe "set title t_ts=\<ESC>k t_fs=\<ESC>\\"
endif

if $TERM=='screen' || $TERM=='xterm' || $TERM=='gnome-256color'
	set ttymouse=xterm2
    set bg=dark
endif

if has('win32')
    set directory=.,$TEMP
endif

"if $TERM=='gnome-256color'
"	set t_Co=256
"	set t_Sf=^[[3%dm
"	set t_Sb=^[[4%dm
"endif
