set nocompatible               " be iMproved
 "filetype off                   " required!

set rtp+=~/.vim/vim-conf/
call plug#begin('~/.vim/plugged')

Plug 'ctrlp.vim'
Plug 'ack.vim'
Plug 'Tagbar'
Plug 'The-NERD-tree'
"Plug 'jistr/vim-nerdtree-tabs'
Plug 'fugitive.vim'
Plug 'inkpot'
Plug 'colorv.vim'
Plug 'greplace.vim'
Plug 'git://github.com/godlygeek/csapprox.git'
" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
"Plug 'SuperTab--Van-Dewoestine'
Plug 'unimpaired.vim'
Plug 'Gundo', {'on': 'GundoToggle'}
"Plug 'git://github.com/nosami/Omnisharp.git'
Plug 'git://github.com/tpope/vim-dispatch.git'
Plug 'Syntastic'
Plug 'tidy'
Plug 'Valloric/YouCompleteMe'
"Plug 'vesanieminen/YouCompleteMe', {'branch': 'stable'}
Plug 'git://github.com/burnettk/vim-angular.git'
Plug 'matthewsimo/angular-vim-snippets'
"Plug 'marijnh/tern_for_vim'
"Plug 'ternjs/tern_for_vim'
Plug 'claco/jasmine.vim'
Plug 'git://github.com/edsono/vim-matchit.git'
Plug 'chrisgillis/vim-bootstrap3-snippets'
"Plug 'hail2u/vim-css3-syntax'
Plug 'JulesWang/css.vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'vim-scripts/JavaScript-Indent'
Plug 'vim-scripts/repeat-motion'
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'Raimondi/delimitMate'
Plug 'severin-lemaignan/vim-minimap'
Plug 'mxw/vim-jsx'
Plug 'justinj/vim-react-snippets'

"Add plugins to &runtimepath
call plug#end()

"filetype plugin indent on     " required!
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
    if filereadable(expand("~/.vim/plugged/inkpot/colors/inkpot.vim"))
        colorscheme inkpot
    endif
    syntax on
    set hlsearch " highlight search pattern text
    set noswapfile " No swap files
    set formatoptions=l
    set linebreak " type help linebreak for info
    set t_Co=256
    set mouse=a

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
"    nmap <C-S-tab> :tabprevious<CR>
"    nmap <C-tab> :tabnext<CR>
"    map <C-S-tab> :tabprevious<CR>
"    map <C-tab> :tabnext<CR>
"    imap <C-S-tab> <Esc>:tabprevious<CR>i
"    imap <C-tab> <Esc>:tabnext<CR>i
"    nmap <C-S-t> :tabnew<CR>
"    imap <C-S-t> <Esc>:tabnew<CR>
map <C-n> :tabnew<CR>

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
"nnoremap <Leader>o :NERDTreeTabsToggle<CR>
"nnoremap <Leader>O :NERDTreeTabsFind<CR>
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

" YouCompleteMe 
    "let g:ycm_server_log_level = 'debug'
    let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
    let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']

" UltiSnips
    let g:UltiSnipsSnippetsDir = '~/.vim/vim-conf/UltiSnips'
    " Make UltiSnips and YCM play nice together
    let g:UltiSnipsExpandTrigger="<Tab>"
    let g:UltiSnipsJumpForwardTrigger="<Tab>"                                           
    let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

set diffopt+=vertical

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

" javascript-libs
    let g:used_javascript_libs = 'react,flux'
" enhanced javascript syntax
    au FileType javascript call JavaScriptFold()

"" Ultisnips + YCM fix:
"    function! g:UltiSnips_Complete()
"      call UltiSnips#ExpandSnippet()
"      if g:ulti_expand_res == 0
"        if pumvisible()
"          return "\<C-n>"
"        else
"          call UltiSnips#JumpForwards()
"          if g:ulti_jump_forwards_res == 0
"            return "\<TAB>"
"          endif
"        endif
"      endif
"      return ""
"    endfunction
"
"    function! g:UltiSnips_Reverse()
"      call UltiSnips#JumpBackwards()
"      if g:ulti_jump_backwards_res == 0
"        return "\<C-P>"
"      endif
"
"      return ""
"    endfunction
"
"
"    if !exists("g:UltiSnipsJumpForwardTrigger")
"      let g:UltiSnipsJumpForwardTrigger = "<tab>"
"    endif
"
"    if !exists("g:UltiSnipsJumpBackwardTrigger")
"      let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"    endif
"
"    au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger     . " <C-R>=g:UltiSnips_Complete()<cr>"
"    au InsertEnter * exec "inoremap <silent> " .     g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"
