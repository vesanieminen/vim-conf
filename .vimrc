set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'ctrlp.vim'
Bundle 'ack.vim'
Bundle 'clang-complete'
Bundle 'Tagbar'
Bundle 'The-NERD-tree'
Bundle 'fugitive.vim'
Bundle 'inkpot'
Bundle 'colorv.vim'
Bundle 'greplace.vim'
Bundle 'git://github.com/godlygeek/csapprox.git'
Bundle 'UltiSnips'
Bundle 'SuperTab-continued.'
Bundle 'unimpaired.vim'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

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
    set cursorline " highlight the cursorline

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

" clang_complete configurations:
"let g:clang_user_options='|| exit 0' " disabled because this wasn't needed for me
let g:clang_complete_auto = 0
let g:clang_complete_copen = 1
"let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
let g:clang_use_library = 0
let g:clang_close_preview = 1
let g:clang_snippets = 1
let g:clang_snippets_engine = 'clang_complete'
"let g:clang_snippets_engine = 'ultisnips'
"let g:clang_auto_select = 1 " doesn't work because of SuperTab, using
"SuperTab's LongestHighlight which does the same thing

set completeopt=menu,longest

let g:SuperTabDefaultCompletionType='<c-x><c-u>'
let g:SuperTabLongestHighlight = 1

" map the <Leader> -key to , for terminal vim and gvim
let mapleader=","
map <Leader>j :TagbarToggle<CR>
map <Leader>o :NERDTreeToggle<CR>
map <Leader>O :NERDTreeFind<CR>

let g:ackprg='ack -H --nocolor --nogroup --column --nobinary'

" ctrlp configurations
let g:ctrpl_map = '<leader>e'
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

nmap <leader>, :tabedit $MYVIMRC<CR>

let g:UltiSnipsSnippetsDir = '~/.vim/bundle/UltiSnips/UltiSnips'
"let g:UltiSnipsSnippetsDir = '~/.vim/vim-conf/snippets' " this doesn't work at the moment 10.11.2012

let g:tagbar_sort = 0

