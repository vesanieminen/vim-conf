if has("gui_macvim")
    macmenu File.Open\.\.\. key=<nop>
    nnoremap <D-o> :NERDTreeToggle<CR>
    nnoremap <D-e> :CtrlP<CR>
    nnoremap <D-j> :TagbarToggle<CR>
    nnoremap <D-O> :NERDTreeFind<CR>
    macmenu Edit.Find.Find\ Next key=<nop>
    nnoremap <D-g> :GundoToggle<CR>
    nnoremap <D-b> :OmniSharpBuildAsync<CR>
endif

set cursorline " highlight the cursorline
