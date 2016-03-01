set nocompatible               " be iMproved
 "filetype off                   " required!

set rtp+=~/.vim/vim-conf/
call plug#begin('~/.vim/plugged')

" My Plugins here:
"
" original repos on github
Plug 'Gundo', {'on': 'GundoToggle'}
Plug 'SirVer/ultisnips'
Plug 'Syntastic'
Plug 'Tagbar'
Plug 'The-NERD-tree'
Plug 'colorv.vim'
Plug 'ctrlp.vim'
Plug 'fugitive.vim'
"Plug 'git://github.com/Valloric/YouCompleteMe.git'
Plug 'vesanieminen/YouCompleteMe', {'branch': 'stable'}
Plug 'git://github.com/edsono/vim-matchit.git'
Plug 'git://github.com/godlygeek/csapprox.git'
Plug 'git://github.com/tpope/vim-dispatch.git'
Plug 'greplace.vim'
Plug 'honza/vim-snippets'
Plug 'inkpot'
Plug 'mileszs/ack.vim'
Plug 'unimpaired.vim'

"Add plugins to &runtimepath
call plug#end()

"filetype plugin indent on     " required!

" Basic vim configurations:
    if filereadable(expand("~/.vim/plugged/inkpot/colors/inkpot.vim"))
        colorscheme inkpot
    endif
    syntax on
    set hlsearch " highlight search pattern text
    set incsearch " highlight search pattern text
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
    ":set ai
    "cindent	enable specific indenting for C code	(local to buffer)
    ":set cin
    "wrap	long lines wrap
    :set wrap
    "smartindent	do clever autoindenting	(local to buffer)
    ":set si
    "cinkeys	keys that trigger C-indenting in Insert mode	(local to buffer)
    ":set cink=0{,0},0),!^F,o,O,e
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
"set completeopt=longest,menuone,preview
set completeopt=longest,menuone

" map the <Leader> -key to , for terminal vim and gvim
let mapleader="ö"
nnoremap <Leader>j :TagbarToggle<CR>
nnoremap <Leader>o :NERDTreeToggle<CR>
nnoremap <Leader>O :NERDTreeFind<CR>
nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader>, :tabedit $MYVIMRC<CR>
nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>b :!make && ./a.out<CR>
nnoremap <leader>t :!make tests && ./run_tests.app<CR>

"let g:ackprg='ack -H --nocolor --nogroup --column --nobinary'
let g:ackprg='ack -H --nocolor --nogroup --column'

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

" Ultisnips + YCM fix:
    function! g:UltiSnips_Complete()
      call UltiSnips#ExpandSnippet()
      if g:ulti_expand_res == 0
        if pumvisible()
          return "\<C-n>"
        else
          call UltiSnips#JumpForwards()
          if g:ulti_jump_forwards_res == 0
            return "\<TAB>"
          endif
        endif
      endif
      return ""
    endfunction

    function! g:UltiSnips_Reverse()
      call UltiSnips#JumpBackwards()
      if g:ulti_jump_backwards_res == 0
        return "\<C-P>"
      endif

      return ""
    endfunction


    if !exists("g:UltiSnipsJumpForwardTrigger")
      let g:UltiSnipsJumpForwardTrigger = "<tab>"
    endif

    if !exists("g:UltiSnipsJumpBackwardTrigger")
      let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
    endif

    au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger     . " <C-R>=g:UltiSnips_Complete()<cr>"
    au InsertEnter * exec "inoremap <silent> " .     g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"


