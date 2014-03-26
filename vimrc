"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vudle.vim setting
" http://github.com/gmarik/vundle

set nocompatible              " be iMproved, required
"if has('macunix')
"    filetype on
"endif
filetype off                  " required

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

Plugin 'The-NERD-tree'
" The-NERD-tree = {{{
map <C-n> :NERDTreeToggle<CR>
" }}}

Plugin 'tpope/vim-fugitive'

"Plugin 'moll/vim-node'
"Plugin 'myhere/vim-nodejs-complete'
Plugin 'ahayman/vim-nodejs-complete'
" automatically open and close the popup menu / preview window
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

Plugin 'jelera/vim-javascript-syntax'
Plugin 'othree/javascript-libraries-syntax.vim'
" othree/javascript-libraries-syntax.vim {{{
let g:used_javascript_libs = 'requirejs,underscore'
" }}}

Plugin 'jshint2.vim'
" jshint2.vim = {{{
"let jshint2_save=1

" jshint validation
nnoremap <silent><F1> :JSHint<CR>
inoremap <silent><F1> <C-O>:JSHint<CR>
vnoremap <silent><F1> :JSHint<CR>

" show next jshint error
nnoremap <silent><F2> :lnext<CR>
inoremap <silent><F2> <C-O>:lnext<CR>
vnoremap <silent><F2> :lnext<CR>

" show previous jshint error
nnoremap <silent><F3> :lprevious<CR>
inoremap <silent><F3> <C-O>:lprevious<CR>
vnoremap <silent><F3> :lprevious<CR>
" }}}

"Plugin 'sidorares/node-vim-debugger'


filetype plugin indent on     " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" my config

" node running {{{
nnoremap <silent><F5> :!node %<CR>
inoremap <silent><F5> :!node %<CR>
vnoremap <silent><F5> :!node %<CR>
" }}}


syntax on
set nu
set encoding=UTF-8
set fileencodings=euc-kr,UTF-8
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set ignorecase
set smartcase
set incsearch

set lines=60
set columns=220

set background=dark


cd ~/git
