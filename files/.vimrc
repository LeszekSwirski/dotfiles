" Load plugins
filetype off
call pathogen#runtime_append_all_bundles() 
call pathogen#helptags()
filetype plugin on
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

set tags+=tags;/
set tagrelative

set makeprg=rmake


let g:GetLatestVimScripts_allowautoinstall=1


" Clang completion
let g:clang_use_library=1
let g:clang_complete_auto=1
let g:clang_complete_copen=1
let g:clang_periodic_quickfix=1


" YankRing
let g:yankring_replace_n_pkey = '<C-,>'
let g:yankring_replace_n_nkey = '<C-.>'
nnoremap <silent> <F11> :YRShow<CR>


" set tags+=~/.tags/cpp
"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_MayCompleteDot = 1
"let OmniCpp_MayCompleteArrow = 1
"let OmniCpp_MayCompleteScope = 1
"let OmniCpp_ShowPrototypeInAbbr = 1
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
"au! CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"set completeopt=menuone,menu,preview,longest

" Taglist
let Tlist_Exit_OnlyWindow = 1

" Moving lines up and down
nmap <M-j> mz:m+<CR>`z==
nmap <M-k> mz:m-2<CR>`z==
imap <M-j> <Esc>:m+<CR>==gi
imap <M-k> <Esc>:m-2<CR>==gi
vmap <M-j> :m'>+<CR>gv=`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<CR>gv=`>my`<mzgv`yo`z

" Window
"noremap <C-J> <C-W>j
"noremap <C-K> <C-W>k
"noremap <C-H> <C-W>h
"noremap <C-L> <C-W>l

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplUseSingleClick = 1

nnoremap <silent> <c-n> :bn<cr>
vnoremap <silent> <c-n> :bn<cr>
inoremap <silent> <c-n> <c-o>:bn<cr>
nnoremap <silent> <c-p> :bp<cr>
vnoremap <silent> <c-p> :bp<cr>
inoremap <silent> <c-p> <c-o>:bp<cr>

if $TERM=='screen'
	exe "set title titlestring=vim:%f"
	exe "set title t_ts=\<ESC>k t_fs=\<ESC>\\"
endif

if $TERM=='screen' || $TERM=='xterm' || $TERM=='gnome-256color'
	set ttymouse=xterm2
    set bg=dark
endif

"if $TERM=='gnome-256color'
"	set t_Co=256
"	set t_Sf=^[[3%dm
"	set t_Sb=^[[4%dm
"endif
