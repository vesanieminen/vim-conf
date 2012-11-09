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
colorscheme inkpot
syntax on
set formatoptions=l
set linebreak " type help linebreak for info

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

" tab navigation like firefox
nmap <C-S-tab> :tabprevious<CR>
nmap <C-tab> :tabnext<CR>
map <C-S-tab> :tabprevious<CR>
map <C-tab> :tabnext<CR>
imap <C-S-tab> <Esc>:tabprevious<CR>i
imap <C-tab> <Esc>:tabnext<CR>i
nmap <C-S-t> :tabnew<CR>
imap <C-S-t> <Esc>:tabnew<CR>

" clang_complete configurations:
"let g:clang_user_options='|| exit 0' " disabled because this wasn't needed for me
let g:clang_complete_auto = 0
let g:clang_complete_copen = 1
"let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
let g:clang_use_library = 1
let g:clang_close_preview = 1
let g:clang_snippets = 1
let g:clang_snippets_engine = 'clang_complete'

" map the <Leader> -key to , for terminal vim and gvim
let mapleader=","
map <Leader>j :TagbarToggle<CR>
map <Leader>e :CtrlP<CR>
map <Leader>o :NERDTreeToggle<CR>

" ctrlp configurations
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|hg|svn)$',
	\ 'file': '\v\.(exe|so|dll|cc\.d|cc\.o|cc\.odeps)$',
	\ }

" GUI specific configurations:
if has("gui")
    set guifont=Monaco:h13
    set guioptions=egmt
endif

