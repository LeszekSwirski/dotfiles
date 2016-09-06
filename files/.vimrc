set nocompatible
set encoding=utf-8

let s:google_dir = expand('~/.google.d/')
let g:at_google = isdirectory(s:google_dir)
if g:at_google
    command! -nargs=1 Gsource exec 'source ' . s:google_dir . <f-args>
    Gsource .vimrc.init
endif

runtime bundles.vim

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

set wildmode=longest:full,list:full
set wildignorecase
set wildmenu

set ignorecase
set smartcase

set hidden
set ruler
set laststatus=2

set history=2000

set backspace=indent,eol,start

set clipboard=unnamed,unnamedplus

set spelllang=en_gb

set completeopt=menu,preview,longest

set undofile
if !isdirectory($HOME . "/.vimundo")
    call mkdir($HOME . "/.vimundo", "p", 0700)
endif
set undodir=$HOME/.vimundo/

if &shell =~ '\<fish$'
    set shell=/bin/bash
endif

let mapleader=","
let maplocalleader=","

" Change directory to current file's
" autocmd! BufEnter * lcd %:p:h

" Easily access file's current directory on the cmdline
cabbr <expr> %% expand('%:p:h')

" Stupid typo
command! WQ wq
command! Wq wq
command! W w
command! Q q

noremap <silent> <F8> :TagbarToggle<CR>
inoremap <silent> <F8> <C-O>:TagbarToggle<CR>

" Easy save & make
function! SaveAndMake(count)
    wa
    if empty(a:count)
        make
    else
        exec 'make -j'. a:count1
    end
endfunction
nmap <silent> M :<C-U>call SaveAndMake(v:count)<CR>

" Restore visual selection after indent
vnoremap > >gv
vnoremap < <gv

" Select pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]' 

" differences if in window in diff mode
nnoremap <expr> <silent> <F3> (&diff ? "]c" : ":cnext\<CR>")
nnoremap <expr> <silent> <F2> (&diff ? "[c" : ":cprev\<CR>")

set tags+=tags;/
set tagrelative 

" Moving lines up and down
nmap <M-j> mz:m+<CR>`z==
nmap <M-k> mz:m-2<CR>`z==
imap <M-j> <Esc>:m+<CR>==gi
imap <M-k> <Esc>:m-2<CR>==gi
vmap <M-j> :m'>+<CR>gv=`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<CR>gv=`>my`<mzgv`yo`z

" Open folds by default
autocmd BufRead * normal zR

let g:GetLatestVimScripts_allowautoinstall=1


set path+=/usr/local/include

" Yankstack
" Should be first so that other plugins can map yanking keys
let g:yankstack_map_keys = 0
call yankstack#setup()
nmap <C-P> <Plug>yankstack_substitute_older_paste
nmap ,p <Plug>yankstack_substitute_older_paste
nmap ,P <Plug>yankstack_substitute_newer_paste

" Sneak
let g:sneak#streak = 1
"replace 'f' with inclusive 1-char Sneak
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
"replace 't' with exclusive 1-char Sneak
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T
" explicitly map 's' because yankstack overwrites it
nmap s <Plug>SneakForward
nmap S <Plug>SneakBackward
xmap s <Plug>VSneakForward
xmap Z <Plug>VSneakBackward

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_insertion = 1
if has('win32')
    let g:ycm_path_to_python_interpreter = 'C:\Python27\pythonw.exe'
endif
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Unite.vim
let g:unite_source_history_yank_enable = 1
let g:unite_winheight = 10
let g:unite_split_rule = 'botright'
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

"call unite#filters#sorter_default#use(['sorter_reverse'])
nnoremap <leader>t :<C-u>Unite -buffer-name=files   -start-insert file_rec/async:. file_rec/async:!<cr>
nnoremap <leader>f :<C-u>Unite -buffer-name=files   -start-insert file<cr>
nnoremap <leader>r :<C-u>Unite -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>o :<C-u>Unite -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :<C-u>Unite -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :<C-u>Unite -buffer-name=buffer  -start-insert buffer<cr>
nnoremap <leader>g :<C-u>Unite -buffer-name=grep  grep:.<cr>

let g:unite_source_grep_max_candidates = 200

if executable('ag')
    " Use ag in unite grep source.
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--line-number --nocolor --nogroup --hidden -i'
    let g:unite_source_grep_recursive_opt = ''
elseif executable('ack')
    " Use ack in unite grep source.
    let g:unite_source_grep_command = 'ack'
    let g:unite_source_grep_default_opts = '--no-heading --no-color -a -H'
    let g:unite_source_grep_recursive_opt = ''
endif

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
    " Overwrite settings.

    imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
    imap <buffer> '     <Plug>(unite_quick_match_default_action)
    nmap <buffer> '     <Plug>(unite_quick_match_default_action)
    nmap <buffer> <esc> <Plug>(unite_exit)
    nmap <buffer> q     <Plug>(unite_exit)
    if has('unix') && !has('gui_running')
        setlocal ttimeoutlen=0
        nmap <buffer> <esc>OA <Up>
        nmap <buffer> <esc>OB <Down>
        nmap <buffer> <esc>OC <Left>
        nmap <buffer> <esc>OD <Right>
    endif
endfunction

" Syntastic
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_always_populate_loc_list = 1

" Python-mode
let g:pymode_lint = 0
let g:pymode_folding = 0

" Renamer
let g:RenamerSupportColonWToRename = 1

" Easytags
let g:easytags_suppress_ctags_warning=1
let g:easytags_dynamic_files=1
"let g:easytags_autorecurse=1
let g:easytags_python_enabled=1
let g:easytags_on_cursorhold = 0

noremap <silent> <F12> :UpdateTags<CR>
inoremap <silent> <F12> <C-O>:UpdateTags<CR>

" Airline
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_theme='wombat'
let g:airline_section_z="%P %l:%c"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tab_type = 1

" Gundo
nnoremap U :GundoToggle<CR> 

" LatexBox
let g:LatexBox_latexmk_async = 1
let g:LatexBox_latexmk_preview_continuously = 1
let g:LatexBox_quickfix = 2
let g:LatexBox_latexmk_options = ' -shell-escape -synctex=1 '

" Multiple cursors
" cnoremap <C-N>  <CR>gn:<C-U>call multiple_cursors#find(line("'<"),line("'>"),@/)<CR>

" Incsearch
set hlsearch
let g:incsearch#auto_nohlsearch = 1
let g:incsearch#consistent_n_direction = 1

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)



if $TERM=='screen'
    exe "set title titlestring=vim:%f"
    exe "set title t_ts=\<ESC>k t_fs=\<ESC>\\"
endif

if $TERM=='screen' || $TERM=='xterm' || $TERM=='gnome-256color' || $TERM=='xterm-256color'
    set ttymouse=xterm2
    set bg=dark
endif
colorscheme jellybeans

augroup myvimrc
    autocmd!
    autocmd BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc nested
                \ source $MYVIMRC |
                \ if has('gui_running') | source $MYGVIMRC | endif
augroup END

augroup myi3config
    autocmd!
    autocmd BufWritePost ${HOME}/.config/i3/config nested
                \ silent exec "!i3-msg reload > /dev/null &" | 
                \ redraw!
augroup END


"if $TERM=='gnome-256color'
"   set t_Co=256
"   set t_Sf=^[[3%dm
"   set t_Sb=^[[4%dm
"endif

if filereadable($MYVIMRC . '.local')
    source $MYVIMRC.local
    augroup myvimrc
        autocmd BufWritePost .vimrc.local,_vimrc.local,vimrc.local,.gvimrc.local,_gvimr.localc,gvimrc.local nested
                    \ source $MYVIMRC |
                    \ if has('gui_running') | source $MYGVIMRC | endif
    augroup END
endif

" vim: sw=4:ts=4
