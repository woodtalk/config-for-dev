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

call vundle#end()

filetype plugin indent on     " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" my config
" http://github.com/woodtalk/config-for-dev

" node running {{{
"nnoremap <silent><F5> :w<CR>:!node %<CR>
"inoremap <silent><F5> :w<CR>:!node %<CR>
"vnoremap <silent><F5> :w<CR>:!node %<CR>
" }}}


syntax on



set number


set encoding=UTF-8
set fileencoding=UTF-8
set fileencodings=UTF-8,euc-kr

set tabstop=4
set shiftwidth=4
set softtabstop=4
"set expandtab

set ruler

set ignorecase
set smartcase
set incsearch
set hlsearch

"set noimd
set iminsert=1
set imsearch=-1	" ims using of imi option

set clipboard=unnamed

set scrolloff=5

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
" font name menlo and font size 12
" https://github.com/vovkasm/input-source-switcher
" http://yisangwook.tumblr.com/post/106780445189/vim-insert-mode-keyboard-switch
	if filereadable('/usr/local/lib/libInputSourceSwitcher.dylib')
		autocmd InsertLeave * call libcall('/usr/local/lib/libInputSourceSwitcher.dylib', 'Xkb_Switch_setXkbLayout', 'com.apple.keylayout.US')
	endif
endif

