" gvim 8.2 x64
" osx homebrew vim 8.2
" macvim 8.1

						if (isdirectory(expand('~/.vim/bundle')) || isdirectory(expand('~/vimfiles/bundle'))) && (has('win32unix') || has('win64unix')) == 0	" mingw or cygwin Plugin 등 제거
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vudle.vim setting
" http://github.com/gmarik/vundle

set nocompatible              " be iMproved, required
filetype off                  " required

				if has('win32') || has('win64')
set runtimepath+=$HOME/vimfiles/bundle/Vundle.vim/
call vundle#begin('$HOME/vimfiles/bundle/')
				else " mac or linux
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
				endif

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The-NERD-tree = {{{
Plugin 'scrooloose/nerdtree'
noremap <C-n> :NERDTreeToggle<CR>
" }}}
Plugin 'scrooloose/nerdcommenter'

" vim-airline = {{{
Plugin 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
" }}}
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'mhinz/vim-signify'
"	if has('macunix')
"osx terminal vim에서는 동작하지 않는 plugin
"Plugin 'lyokha/vim-xkbswitch'
"	endif

" ctrlp = {{{
Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_custom_ignore = {
  \ 'dir': '\.git$\|\.svn$\|public$\|log$\|tmp$\|vendor$',
  \ 'file': '\v\.(exe|so|dll|swp|zip|gz|jpg|gif)$'
  \ }
" }}}

Plugin 'tpope/vim-fugitive'
"Plugin 'tpope/vim-rhubarb'
Plugin 'idanarye/vim-merginal'
Plugin 'scrooloose/syntastic'

Plugin 'PProvost/vim-ps1'
"Plugin 'hoffstein/vim-tsql'
Plugin 'jeroenbourgois/vim-actionscript'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'goodell/vim-mscgen'
"Plugin 'rainbow_csv.vim'
" gabrielelana/vim-markdown = {{{
"Plugin 'gabrielelana/vim-markdown'
"let g:markdown_enable_spell_checking = 0
"let g:markdown_enable_mappings = 0
" }}}

" vimwiki/vimwiki = {{{
Plugin 'vimwiki/vimwiki'
let vimwiki = {}
let vimwiki.ext = '.md'
let vimwiki.path = '~/vimwiki/'
let vimwiki.syntax = 'markdown'

let githubwiki = {}
let githubwiki.ext = '.md'
let githubwiki.path = '~/git-workspace/woodtalk.github.io/_wiki/'
let githubwiki.syntax = 'markdown'

let g:vimwiki_list = [vimwiki,githubwiki]

let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_conceallevel = 0
" }}}

Plugin 'nanotech/jellybeans.vim'

		if has('gui_running') && (has('win32') || has('win64') || has('gui win32') || has('gui win64'))
Plugin 'mattn/vimtweak'
		endif

" diepm/vim-rest-console = {{{
Plugin 'diepm/vim-rest-console'
" let g:vrc_set_default_mapping = 0 " :call VrcQuery()
let g:vrc_trigger = '<C-j><C-j>'

let g:vrc_header_content_type = 'application/json; charset=utf-8'
let g:vrc_response_default_content_type = 'application/json'
let g:vrc_debug = 0

let g:vrc_auto_format_response_enabled = 1

let g:vrc_show_command = 1

let g:vrc_curl_opts = { '-s': '' } " 결과 메타데이터 생략

" let g:vrc_elasticsearch_support = 1
" }}}

" machakann/vim-highlightedyank = {{{
Plugin 'machakann/vim-highlightedyank'
let g:highlightedyank_highlight_duration = 30000 " milliseconds; -1 persistent
" }}}

" mhinz/vim-startify = {{{
Plugin 'mhinz/vim-startify'
let g:startify_files_number           = 18

" Update session automatically as you exit vim
let g:startify_session_persistence    = 1

" Simplify the startify list to just recent files and sessions
let g:startify_lists = [
  \ { 'type': 'sessions',  'header': ['   Saved sessions'] },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
  \ ]
  " \ { 'type': 'dir',       'header': ['   Recent files']   },
  " \ { 'type': 'files',     'header': ['   Files']            },

let g:startify_bookmarks = []
		if has('unix') && filereadable(expand('~/vimwiki/index.md'))
			let g:startify_bookmarks+=[{ 'vw': '~/vimwiki/index.md' }]
        elseif (has('win32') || has('win64')) && filereadable(expand('$HOME/vimwiki/index.md'))
			let g:startify_bookmarks+=[{ 'vw': '$HOME/vimwiki/index.md' }]
		endif

		if has('unix') && filereadable(expand('~/.vimrc'))
			let g:startify_bookmarks+=[{ 'vr': '~/.vimrc' }]
        elseif (has('win32') || has('win64')) && filereadable(expand('$HOME/_vimrc'))
			let g:startify_bookmarks+=[{ 'vr': '$HOME/_vimrc' }]
		endif

		if has('unix') && filereadable(expand('~/.zshrc'))
			let g:startify_bookmarks+=[{ 'z': '~/.zshrc' }]
		endif

		if has('unix') && isdirectory(expand('~/git-workspace'))
			let g:startify_bookmarks+=[{ 'gw': '~/git-workspace' }]
        elseif (has('win32') || has('win64')) && isdirectory(expand('$HOME/git-workspace'))
			let g:startify_bookmarks+=[{ 'gw': '$HOME/git-workspace' }]
		endif

		if has('unix') && filereadable(expand('~/git-workspace/woodtalk.github.io/_wiki/index.md'))
			let g:startify_bookmarks+=[{ 'b': '~/git-workspace/woodtalk.github.io/_wiki/index.md' }]
        elseif (has('win32') || has('win64')) && filereadable(expand('$HOME/git-workspace/woodtalk.github.io/_wiki/index.md'))
			let g:startify_bookmarks+=[{ 'b': '$HOME/git-workspace/woodtalk.github.io/_wiki/index.md' }]
		endif

let g:startify_custom_header = [
  \ '                               ',
  \ '             __                ',
  \ '    __   __ /\_\    ___ ___    ',
  \ '   /\ \ /\ \\/\ \ /'' __` __`\ ',
  \ '   \ \ \_/ | \ \ \/\ \/\ \/\ \ ',
  \ '    \ \___/   \ \_\ \_\ \_\ \_\',
  \ '     \/__/     \/_/\/_/\/_/\/_/',
  \ ]
" }}}

" eslint/eslint = {{{
Plugin 'eslint/eslint'
" }}}

" w0rp/ale = {{{
Plugin 'w0rp/ale'

let g:ale_linters = {
  \   'javascript': ['eslint'],
  \}
let g:ale_fixers = {
      \   'javascript': ['eslint'],
      \}
let g:ale_fix_on_save = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" let g:ale_python_flake8_options = '--max-line-length 88 --extend-ignore=E203'
" }}}

call vundle#end()

filetype plugin indent on     " required

						endif " isdirectory(expand('~/.vim/bundle')) && (has('win32unix') || has('win64unix')) == 0	" mingw or cygwin Plugin 등 제거

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" my config
" http://github.com/woodtalk/config-for-dev

syntax on

set number

"scriptencoding UTF-8
set encoding=UTF-8
set fileencoding=UTF-8
set fileencodings=ucs-bom,UTF-8,euc-kr,cp949,UTF-16LE,UTF-16BE
set fileformat=unix
set fileformats=unix,dos

set tabstop=4
set shiftwidth=4
set softtabstop=4

autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType vimwiki,markdown,md setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
" https://linux.systemv.pe.kr/vim-yaml-%EB%AC%B8%EB%B2%95-%EC%A0%81%EC%9A%A9/
autocmd! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
autocmd FileType yaml setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2 " autoindent

set ruler

set ignorecase
set smartcase
set incsearch
set hlsearch

set wildmenu	" command mode의 find 명령어 관련?

set showmatch
set matchpairs+=<:>

set scrolloff=5

"set foldmethod=marker
"set foldmethod=syntax
"set foldmarker={{{,}}}	"default option

set clipboard=unnamedplus,unnamed
set backspace=indent,eol,start

colorscheme desert
silent! colorscheme jellybeans
set background=dark

set autochdir

set list
				" {{{
set listchars=tab:▸\ ,eol:↲,trail:•
"set listchars+=space:␣	" not nbsp

set listchars+=extends:⟩,precedes:⟨	"set nowrap
set showbreak=↪	"set wrap
				" }}} else {{{

					"let &listchars="tab:\u25B8 ,eol:\u21b2,trail:\u2022"
					""let &listchars=&listchars.",space:\u2423"	" not nbsp

					"let &listchars=&listchars."extends:\u27E9,precedes:\u27E8"	"set nowrap
					"let &showbreak="\u21AA"	"set wrap

				" }}}

if has('gui_running') && (has('win32') || has('win64') || has('gui win32') || has('gui win64'))

	" 윈도우에서 한글 메뉴 깨짐 현상 수정
	"source $VIMRUNTIME\delmenu.vim
	set langmenu=ko_kr.UTF-8

	set guioptions-=T " no toolbar
	set guioptions-=m " no menu

	language messages ko_kr.UTF-8	" 하단 깨진 한글 메시지 복원

	"windows 10 1809 이상에서는 폰트가 모든 사용자(C:\Windows\Fonts)에 깔려야 font systemlink가 제대로 동작함
	set guifont=SF\ Mono:h10:cANSI,Cascadia\ Mono:h10:cANSI,D2Coding:h10:w5.2:cANSI
	set guifontwide=Dotumche:h9:cHANGEUL

	"set noimd
	set iminsert=1
	set imsearch=-1	" ims using of imi option

	set lines=70
	set columns=270
	" autocmd GUIEnter * simalt ~x	" 전체 화면

	if filereadable(expand('~/vimfiles/bundle/vimtweak/vimtweak64.dll'))
		autocmd GUIEnter * call libcallnr(expand('~/vimfiles/bundle/vimtweak/vimtweak64.dll'), 'SetAlpha', 225)
	endif

elseif has('win32') || has('win64')	" windows에서 cmd에서 vim 명령어로 실행했을 때

	if executable('python') && filereadable(expand('~/git-workspace/config-for-dev/ime_toggle_for_win.py'))

		" 아래 명령은 온전히 내가 만든 것이다.
		autocmd InsertLeave * call system('python "' . expand('~/git-workspace/config-for-dev/ime_toggle_for_win.py') . '" a')

		" git clone https://github.com/heyeshuang/ime_helper %USERPROFILE%/.vim/ime_helper
		" https://github.com/heyeshuang/ime_helper
		"autocmd InsertLeave * call system('python ' . expand('~/.vim/ime_helper/ime_helper.py') . ' --locale en_US')
		"autocmd InsertEnter * call system('python ' . expand('~/.vim/ime_helper/ime_helper.py') . ' --locale ko_KR')
		"autocmd VimLeave * call system('python ' . expand('~/.vim/ime_helper/ime_helper.py') . ' --locale ko_KR')
		" 원래 아래 꺼였는데 뭔가 느린 거 같아 폐기
		" autocmd InsertLeave * :silent execute '!python '.expand('$USERPROFILE/.vim/ime_helper/ime_helper.py').' --locale en_US'

	endif

elseif has('macunix')

	" https://github.com/vovkasm/input-source-switcher
	" https://sangwook.github.io/2015/01/01/vim-insert-mode-keyboard-switch
	if filereadable('/usr/local/lib/libInputSourceSwitcher.dylib')
		autocmd InsertLeave * call libcall('/usr/local/lib/libInputSourceSwitcher.dylib', 'Xkb_Switch_setXkbLayout', 'com.apple.keylayout.ABC')
		"autocmd CmdwinEnter * call libcall('/usr/local/lib/libInputSourceSwitcher.dylib', 'Xkb_Switch_setXkbLayout', 'com.apple.keylayout.ABC')
		" 서치를 하고 나서 Normal mode로 전환될 때도 영어로 전환하게 하고
		" 싶은데, 잘 안되네...
	endif
	" macvim에서 cmd+tab 화면에서 불필요한 아이콘이 생성되고
	" dock에서도 불필요한 아이콘이 증식하는데, libcall 버그가 있는 것 같고
	" 불편하지만 감안하는 걸로 진행

	if has('gui_macvim') && has('gui_running')	" macvim

		set iminsert=1
		set imsearch=-1	" ims using of imi option

		set transparency=15

		set guifont=SF\ Mono:h13,Menlo:h13
		set lines=65
		set columns=220

		autocmd! GUIEnter * set vb t_vb=

	else				" terminal vim

		" 한글 입력 시 바로 커맨드 모드로 나가기 위한 장치
		" 버그가 수정이 안되네
		inoremap <Esc> <Esc><Esc><Esc>

	endif

elseif has('unix') && has('macunix') == 0

	" fcitx-remote 인데 wsl에서는 왠지 안 먹는거 같다

"	if executable('cmd.exe')	" 'cmd.exe가 실행 가능한 unix' == '즉, wsl'
"		if executable('python.exe')
"			" 아래 명령셋은 내가 고안해 놓은 것인데
"			" ime_toggle_for_win.py를 cmd.exe를 이용해서 실행하는 방식이다.
"			let t:home_path = system('cmd.exe /C "echo %USERPROFILE%"')
"			let t:home_path = substitute(t:home_path, '\(\r\|\n\)', '', 'g')
"
"			let t:ime_toggle_path = t:home_path . '/git-workspace/config-for-dev/ime_toggle_for_win.py'
"			let t:ime_toggle_path = substitute(t:ime_toggle_path, '/', '\\', 'g')
"			let t:ime_toggle_path = substitute(t:ime_toggle_path, '\\', '\\\\', 'g')
"			let t:ime_toggle_path = '"' . t:ime_toggle_path . '"'
"
"			call system('cmd.exe /C "IF NOT EXIST ' . t:ime_toggle_path . ' (exit /b 2)"')
"			if v:shell_error == 0
"
"				" 좀 느린게 단점이다.
"				" &로 bg에서 실행하게 했는데, 그럼 let에 변수 대입이 안 된다.
"				"let t:before_ime_toggle_option = 'c'
"				"autocmd InsertLeave * let t:before_ime_toggle_option = substitute(system('python.exe ' . t:ime_toggle_path . ' a'), '\(\r\|\n\)', '', 'g')
"				"autocmd InsertEnter * call system('python.exe ' . t:ime_toggle_path . ' ' . t:before_ime_toggle_option)
"				""autocmd VimLeave * call system('python.exe ' . t:ime_toggle_path . ' ' . t:before_ime_toggle_option)
"
"				" background 실행으로 해결했다.
"				" 여전히 느려서 insert 모드를 빠져 나갈 때 바로 커서가 움직이지는 않지만 잔상이 남아 곤란한 문제는 해결했다.
"				autocmd InsertLeave * call system('python.exe ' . t:ime_toggle_path . ' a &')
"
"				" cmd.exe /Q /D /C start python.exe 이렇게 쓸 수도 있지만 팝업이 뜨는 등 문제가 좀 있다.
"
"			else
"				unlet t:ime_toggle_path
"
"				" 여기는 http://blog.heysh.xyz/2017/09/05/atom-vim-mode-auto-switch-ime/ 참고
"
"				let t:ime_helper_path = t:home_path . '/vimfiles/ime_helper/ime_helper.py'
"				let t:ime_helper_path = substitute(t:ime_helper_path, '/', '\\', 'g')
"				let t:ime_helper_path = substitute(t:ime_helper_path, '\\', '\\\\', 'g')
"				let t:ime_helper_path = '"' . t:ime_helper_path . '"'
"
"				call system('cmd.exe /C "IF NOT EXIST ' . t:ime_helper_path . ' (exit /b 2)"')
"				if v:shell_error == 0
"					autocmd InsertLeave * call system('python.exe ' . t:ime_helper_path . ' --locale en_US' . ' &')
"					autocmd InsertEnter * call system('python.exe ' . t:ime_helper_path . ' --locale ko_KR')
"					autocmd VimLeave * call system('python.exe ' . t:ime_helper_path . ' --locale ko_KR')
"					"autocmd InsertLeave * call system('cmd.exe /C ' . '"' . 'python.exe ' . t:ime_helper_path . ' --locale en_US' . '"')
"				else
"					unlet t:ime_helper_path
"				endif
"			endif
"
"			unlet t:home_path
"		endif
"	endif

endif

" 회사용 encoding & 화면 수정
"if filereadable(expand('~/__at_office'))
"endif
