set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/vim-conf/
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/vundle'

" My Plugins here:
"
" original repos on github
Plugin 'ctrlp.vim'
Plugin 'ack.vim'
Plugin 'Tagbar'
Plugin 'The-NERD-tree'
Plugin 'fugitive.vim'
Plugin 'inkpot'
Plugin 'colorv.vim'
Plugin 'greplace.vim'
Plugin 'git://github.com/godlygeek/csapprox.git'
" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
Plugin 'SuperTab--Van-Dewoestine'
Plugin 'unimpaired.vim'
Plugin 'Gundo'
"Plugin 'git://github.com/nosami/Omnisharp.git'
Plugin 'git://github.com/tpope/vim-dispatch.git'
Plugin 'Syntastic'
Plugin 'tidy'
"Plugin 'git://github.com/Valloric/YouCompleteMe.git'
Plugin 'git://github.com/burnettk/vim-angular.git'
"Plugin 'Keithbsmiley/swift.vim'
Plugin 'git://github.com/pangloss/vim-javascript.git'
Plugin 'git://github.com/claco/jasmine.vim.git'
Plugin 'git://github.com/othree/javascript-libraries-syntax.vim.git'
Plugin 'HTML-AutoCloseTag'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on     " required!
"
" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install(update) bundles
" :PluginSearch(!) foo - search(or refresh cache first) for foo
" :PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin command are not allowed..

" Basic vim configurations:
    if filereadable(expand("~/.vim/bundle/inkpot/colors/inkpot.vim"))
        colorscheme inkpot
    endif
    syntax on
    set hlsearch " highlight search pattern text
    set noswapfile " No swap files
    set formatoptions=l
    set linebreak " type help linebreak for info
    set t_Co=256

    "tabstop	number of spaces a <Tab> in the text stands for	(local to buffer)
    :set ts=4
    "shiftwidth	number of spaces used for each step of (auto)indent	(local to buffer)
    :set sw=4
    "smarttab	a <Tab> in an indent inserts 'shiftwidth' spaces
    :set sta
    "softtabstop	if non-zero, number of spaces to insert for a <Tab>	(local to buffer)
    :set sts=4
    "expandtab	expand <Tab> to spaces in Insert mode	(local to buffer)
    :set et
    "autoindent	automatically set the indent of a new line	(local to buffer)
    :set ai
    "cindent	enable specific indenting for C code	(local to buffer)
    :set cin
    "wrap	long lines wrap
    :set wrap
    "smartindent	do clever autoindenting	(local to buffer)
    :set si
    "cinkeys	keys that trigger C-indenting in Insert mode	(local to buffer)
    :set cink=0{,0},0),!^F,o,O,e
    "textwidth	line length above which to break a line	(local to buffer)
    :set tw=0
    " single character insert
    :nnoremap <Space> i_<Esc>r
" / Basic vim configurations

"folding settings
    set foldmethod=syntax "fold based on indent
    set foldnestmax=10      "deepest fold is 10 levels
    set nofoldenable        "dont fold by default
    set foldlevel=50         "this is just what i use

" tab navigation like firefox
    nmap <C-S-tab> :tabprevious<CR>
    nmap <C-tab> :tabnext<CR>
    map <C-S-tab> :tabprevious<CR>
    map <C-tab> :tabnext<CR>
    imap <C-S-tab> <Esc>:tabprevious<CR>i
    imap <C-tab> <Esc>:tabnext<CR>i
    nmap <C-S-t> :tabnew<CR>
    imap <C-S-t> <Esc>:tabnew<CR>

" faster window navigation
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l
    
"set completeopt=menu,longest
set completeopt=longest,menuone,preview

" supertab:
    "let g:SuperTabDefaultCompletionType='<c-x><c-u>'
    let g:SuperTabDefaultCompletionType='context'
    "let g:SuperTabContextDefaultCompletionType='<c-n>'
    let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
    "let g:SuperTabLongestHighlight = 1
    let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
    let g:SuperTabClosePreviewOnPopupClose = 1
    " If you prefer the Omni-Completion tip window to close when a selection is
    " made, these lines close it on movement in insert mode or when leaving
    " insert mode
    autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" map the <Leader> -key to , for terminal vim and gvim
let mapleader=","
nnoremap <Leader>j :TagbarToggle<CR>
nnoremap <Leader>o :NERDTreeToggle<CR>
nnoremap <Leader>O :NERDTreeFind<CR>
nnoremap <leader>g :GundoToggle<CR>
nnoremap <leader>, :tabedit $MYVIMRC<CR>

" Ultisnips
    let g:UltiSnipsExpandTrigger="<C-S-u>"

"OmniSharp settings:
    "let g:Omnisharp_start_server = 0
    "This is the default value, setting it isn't actually necessary
    "let g:OmniSharp_host = "http://localhost:2000"
    "Timeout in seconds to wait for a response from the server
    "let g:OmniSharp_timeout = 1
    "Showmatch significantly slows down omnicomplete
    "when the first match contains parentheses.
    set noshowmatch
    "Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
    autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
    " Fetch full documentation during omnicomplete requests. 
    " There is a performance penalty with this (especially on Mono)
    " By default, only Type/Method signatures are fetched. Full documentation can still be fetched when
    " you need it with the :OmniSharpDocumentation command.
    " let g:omnicomplete_fetch_documentation=1
    "Move the preview window (code documentation) to the bottom of the screen, so it doesn't move the code!
    "You might also want to look at the echodoc plugin
    set splitbelow
    " Synchronous build (blocks Vim)
    "autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
    " Builds can also run asynchronously with vim-dispatch installed
    autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuildAsync<cr>
    " Get Code Issues and syntax errors
    let g:syntastic_cs_checkers = ['syntax', 'issues']
    autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck
    "show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
    " this setting controls how long to pause (in ms) before fetching type / symbol information.
    set updatetime=500
    " Remove 'Press Enter to continue' message when type information is longer than one line.
    set cmdheight=2
    " Contextual code actions (requires CtrlP)
    nnoremap <leader>a :OmniSharpGetCodeActions<cr>
    " Run code actions with text selected in visual mode to extract method
    vnoremap <leader>a :call OmniSharp#GetCodeActions('visual')<cr>
    "The following commands are contextual, based on the current cursor position.
    autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
    nnoremap <leader>fi :OmniSharpFindImplementations<cr>
    nnoremap <leader>ft :OmniSharpFindType<cr>
    nnoremap <leader>fs :OmniSharpFindSymbol<cr>
    nnoremap <leader>fu :OmniSharpFindUsages<cr>
    nnoremap <leader>fm :OmniSharpFindMembersInBuffer<cr>
    " cursor can be anywhere on the line containing an issue for this one
    nnoremap <leader>x  :OmniSharpFixIssue<cr>
    nnoremap <leader>fx :OmniSharpFixUsings<cr>
    nnoremap <leader>tt :OmniSharpTypeLookup<cr>
    nnoremap <leader>dc :OmniSharpDocumentation<cr>
    " rename with dialog
    nnoremap <leader>nm :OmniSharpRename<cr>
    nnoremap <F2> :OmniSharpRename<cr>      
    " rename without dialog - with cursor on the symbol to rename... ':Rename newname'
    command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")
    " Force OmniSharp to reload the solution. Useful when switching branches etc.
    nnoremap <leader>rl :OmniSharpReloadSolution<cr>
    nnoremap <leader>cf :OmniSharpCodeFormat<cr>
    " Load the current .cs file to the nearest project
    nnoremap <leader>tp :OmniSharpAddToProject<cr>
    " Automatically add new cs files to the nearest project on save
    autocmd BufWritePost *.cs call OmniSharp#AddToProject()
    " (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp server for the current solution
    nnoremap <leader>ss :OmniSharpStartServer<cr>
    nnoremap <leader>sp :OmniSharpStopServer<cr>
    " Add syntax highlighting for types and interfaces
    nnoremap <leader>ht :OmniSharpHighlightTypes<cr>
    "Don't ask to save when changing buffers (i.e. when jumping to a type definition)
    set hidden
" /OmniSharp settings

let g:ackprg='ack -H --nocolor --nogroup --column --nobinary'

" ctrlp configurations
    "let g:ctrpl_map = '<leader>e'
    nnoremap <leader>e :CtrlP<CR>
    let g:ctrlp_custom_ignore = {
        \ 'dir':  '\v[\/]\.(git|hg|svn|redo)$',
        \ 'file': '\v\.(exe|so|dll)$',
        \ }
    set wildignore+=*/build/bin/*,*/build/build/*

" GUI specific configurations:
if has("gui")
    set guifont=Monaco:h13
    set guioptions=egmt
endif

" Source the vimrc file after saving it
"if has("autocmd")
"  autocmd bufwritepost .vimrc source $MYVIMRC
"endif

let g:UltiSnipsSnippetsDir = '~/.vim/vim-conf/UltiSnips'

let g:tagbar_sort = 0

" Show syntax highlighting groups for word under cursor
nmap <leader>c :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

set wildmode=list:longest,full
