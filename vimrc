"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vudle.vim setting
" http://github.com/gmarik/vundle

set nocompatible              " be iMproved, required
filetype off                  " required

				if has('win32') || has('win64')
set runtimepath+=$HOME/vimfiles/bundle/Vundle.vim
call vundle#begin('$HOME/vimfiles/bundle')
				else " mac or linux
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
				endif

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The-NERD-tree = {{{
"Plugin 'The-NERD-tree'
"map <C-n> :NERDTreeToggle<CR>
" }}}

"Plugin 'tComment'

" Plugin 'jelera/vim-javascript-syntax'
"
"
" " jshint2.vim = {{{
" Plugin 'jshint2.vim'
" "let jshint2_save=1
"
" " jshint validation
" nnoremap <silent><F1> :JSHint<CR>
" inoremap <silent><F1> <C-O>:JSHint<CR>
" vnoremap <silent><F1> :JSHint<CR>
"
" " show next jshint error
" nnoremap <silent><F2> :lnext<CR>
" inoremap <silent><F2> <C-O>:lnext<CR>
" vnoremap <silent><F2> :lnext<CR>
"
" " show previous jshint error
" nnoremap <silent><F3> :lprevious<CR>
" inoremap <silent><F3> <C-O>:lprevious<CR>
" vnoremap <silent><F3> :lprevious<CR>
" " }}}
"
" " YCM = {{{
" Plugin 'Valloric/YouCompleteMe' " install 'cmake'(brew), must run 'cd ~/.vim/bundle/YouCompleteMe && ./install.sh'
" "nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
" " }}}
"
" Plugin 'marijnh/tern_for_vim'   " must run 'cd ~/.vim/bundle/tern_for_vim && npm install'

Plugin 'nanotech/jellybeans.vim'

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
"set list

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

set scrolloff=5

"set noimd
set iminsert=1
set imsearch=-1	" ims using of imi option

set clipboard=unnamed

set backspace=indent,eol,start

set background=dark
"colorscheme desert
colorscheme jellybeans


if has('win32') || has('win64')
	set encoding=cp949

	set lines=50
	set columns=190
	set guifont=Consolas:h12:cANSI

elseif has('macunix')
	" font name menlo and font size 12
	" https://github.com/vovkasm/input-source-switcher
	" http://yisangwook.tumblr.com/post/106780445189/vim-insert-mode-keyboard-switch
	if filereadable('/usr/local/lib/libInputSourceSwitcher.dylib')
		autocmd InsertLeave * call libcall('/usr/local/lib/libInputSourceSwitcher.dylib', 'Xkb_Switch_setXkbLayout', 'com.apple.keylayout.US')
	endif

	"cd ~/git-workspace
endif

