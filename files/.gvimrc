if has("gui_gtk")
    set guifont=Monospace\ 8

    set guioptions-=T
    set guioptions-=m

    colorscheme jellybeans
elseif has ("gui_win32")
    set guifont=Consolas:h10

    set guioptions-=T

    colorscheme lucius
    LuciusLight
endif
