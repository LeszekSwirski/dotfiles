let s:cpo_save=&cpo
set cpo&vim
let &cpo=s:cpo_save

colorscheme jellybeans
if has("gui_gtk")
    set guifont=Monospace\ 8

    set guioptions-=T
    set guioptions-=m
elseif has ("gui_win32")
    set guifont=Consolas:h10
endif
