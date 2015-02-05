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
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'unimpaired.vim'
Plugin 'Gundo'
Plugin 'git://github.com/tpope/vim-dispatch.git'
Plugin 'Syntastic'
Plugin 'git://github.com/Valloric/YouCompleteMe.git'
Plugin 'git://github.com/edsono/vim-matchit.git'

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

" faster window navigation
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l
    
"set completeopt=menu,longest
set completeopt=longest,menuone,preview

" map the <Leader> -key to , for terminal vim and gvim
let mapleader="ö"
nnoremap <Leader>j :TagbarToggle<CR>
nnoremap <Leader>o :NERDTreeToggle<CR>
nnoremap <Leader>O :NERDTreeFind<CR>
nnoremap <leader>g :GundoToggle<CR>
nnoremap <leader>, :tabedit $MYVIMRC<CR>
" vim-test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>

" ignore Unity's .meta files
let NERDTreeIgnore=['\.meta$', '\~$']

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

" YouCompleteMe 
    "let g:ycm_server_log_level = 'debug'
    "let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
    "let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
    let g:ycm_key_list_select_completion=[]
    let g:ycm_key_list_previous_completion=[]

" UltiSnips
    let g:UltiSnipsSnippetsDir = '~/.vim/vim-conf/UltiSnips'
    " Make UltiSnips and YCM play nice together
    let g:UltiSnipsExpandTrigger="<Tab>"
    let g:UltiSnipsJumpForwardTrigger="<Tab>"                                           
    let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

let g:ycm_global_ycm_extra_conf = "~/.vim/vim-conf/.ycm_extra_conf.py"

set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%=%{fugitive#statusline()}
set statusline +=%1*%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
set statusline+=%0*\ \ %m%r%w\ %P\ \ 
set laststatus=2

