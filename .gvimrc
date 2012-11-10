if has("gui_macvim")
    macmenu File.Open\.\.\. key=<nop>
    map <D-o> :NERDTreeToggle<CR>
    map <D-e> :CtrlP<CR>
    map <D-j> :TagbarToggle<CR>
    map <D-O> :NERDTreeFind<CR>
endif
