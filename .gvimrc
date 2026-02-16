" Set GUI Font and Size
" Format: Name:hSize (e.g., Consolas:h15, DejaVu_Sans_Mono:h10)
if has("gui_running")
    set guifont=IosevkaTerm\ Nerd\ Font\ 15
    
    " Set color scheme
    colorscheme slate
    " set background=dark " Optional: set background to dark or light
    
    " Optional: Set default window size
    set lines=30
    set columns=90
endif
