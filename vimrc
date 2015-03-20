"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vudle.vim setting
" http://github.com/gmarik/vundle

set nocompatible              " be iMproved, required
"if has('macunix')
"    filetype on
"endif
filetype off                  " required

				if has('win32') || has('win64')
set runtimepath+=~/vimfiles/bundle/Vundle.vim
let path='~/vimfiles/bundle'
call vundle#begin(path)
				else " mac or linux
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
				endif

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The-NERD-tree = {{{
Plugin 'The-NERD-tree'
map <C-n> :NERDTreeToggle<CR>
" }}}

"Plugin 'jason0x43/vim-js-inden'

Plugin 'clausreinke/typescript-tools'

" typescript-vim = {{{
Plugin 'leafgarland/typescript-vim'
let g:typescript_compiler_options = '-sourcemap'
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
" }}}


call vundle#end()

filetype plugin indent on     " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" my config

" node running {{{
"nnoremap <silent><F5> :w<CR>:!node %<CR>
"inoremap <silent><F5> :w<CR>:!node %<CR>
"vnoremap <silent><F5> :w<CR>:!node %<CR>
" }}}

"imap ;; <Esc>
"vmap ;; <Esc>

syntax on
set nu

set encoding=UTF-8
set fileencoding=UTF-8
set fileencodings=UTF-8,euc-kr

set tabstop=4
set shiftwidth=4
set softtabstop=4
"set expandtab

set ignorecase
set smartcase
set incsearch
set hlsearch

"set noimd
set imi=1
set ims=-1	" ims using of imi option

set background=dark
colorscheme desert

"cd ~/git-workspace

if has('win32') || has('win64')
	set encoding=cp949

	set lines=50
	set columns=190
	set guifont=Consolas:h12:cANSI

	cd d:\git-workingspace

elseif has('macunix')
" font name melo and font size 12
"set lines=50
"set columns=190
endif
