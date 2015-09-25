if has("gui_gtk")
    set guifont=Ubuntu\ Mono\ 11

    set guioptions-=T
    set guioptions-=m

    colorscheme jellybeans
elseif has ("gui_win32")
    set guifont=Consolas:h10

    set guioptions-=T

    colorscheme lucius
    LuciusLight
endif
