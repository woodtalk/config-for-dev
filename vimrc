" my config
" http://github.com/woodtalk/config-for-dev

scriptencoding utf-8
set encoding=utf-8
set nocompatible

if has('win32') || has('win64')
    let s:vim_home = '$HOME/vimfiles'
else
    let s:vim_home = '~/.vim'
endif

let s:plug_path = expand(s:vim_home . '/autoload/plug.vim')
let s:plug_installed = 0

if empty(glob(s:plug_path))
    if executable('git')
        let s:autoload_dir = expand(s:vim_home . '/autoload')

        silent execute '!git clone https://github.com/junegunn/vim-plug.git "' . s:autoload_dir . '"'

        if !empty(glob(s:plug_path))
            let s:plug_installed = 1
            autocmd VimEnter * PlugInstall --sync | q | source $MYVIMRC
        endif
    endif
else
    let s:plug_installed = 1
endif

                            if s:plug_installed

call plug#begin(expand(s:vim_home . '/plugged'))

" --- [UI / Theme] ---
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'

" --- [Git Integration] ---
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
Plug 'idanarye/vim-merginal'

" --- [Language & Syntax] ---
Plug 'scrooloose/nerdcommenter'
Plug 'dense-analysis/ale'
Plug 'stephpy/vim-yaml'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'jeroenbourgois/vim-actionscript'
Plug 'plasticboy/vim-markdown'
Plug 'godlygeek/tabular'

" --- [Tools] ---
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vimwiki/vimwiki'
Plug 'diepm/vim-rest-console'
Plug 'machakann/vim-highlightedyank'

" --- [Windows Specific] ---
if has('win32') || has('win64')
    Plug 'mattn/vimtweak'
endif

if has('win32') || has('win64') || (has('unix') && executable('cmd.exe'))
    Plug 'brglng/vim-im-select'
endif

call plug#end()

" [NERDTree]
noremap <C-n> :NERDTreeToggle<CR>

" [Airline]
let g:airline#extensions#tabline#enabled = 1

" [CtrlP]
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.svn$\|public$\|log$\|tmp$\|vendor$',
  \ 'file': '\v\.(exe|so|dll|swp|zip|gz|jpg|gif)$'
  \ }

" [Vimwiki]
let g:vimwiki_list = [
            \ {'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'},
            \ {'path': '~/git-workspace/woodtalk.github.io/_wiki/', 'syntax': 'markdown', 'ext': '.md'}
            \ ]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_conceallevel = 0

" [ALE]
let g:ale_linters = {'typescript': ['prettier', 'eslint'], 'javascript': ['prettier', 'eslint']}
let g:ale_fixers = {'typescript': ['prettier', 'eslint'], 'javascript': ['prettier', 'eslint']}
let g:ale_fix_on_save = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" [Gruvbox]
let g:gruvbox_contrast_light = 'hard'

" [Rest Console]
let g:vrc_trigger = '<C-j><C-j>'
let g:vrc_header_content_type = 'application/json; charset=utf-8'
let g:vrc_response_default_content_type = 'application/json'

let g:vrc_auto_format_response_enabled = 1
let g:vrc_show_command = 1
let g:vrc_curl_opts = { '-s': '' } " 결과 메타데이터 생략

" [HighlightedYank]
let g:highlightedyank_highlight_duration = 30000 " milliseconds; -1 persistent

" [Startify]
let g:startify_files_number = 18
let g:startify_session_persistence = 1
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Saved sessions'] },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']       },
      \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
      \ ]

let g:startify_bookmarks = []
let s:raw_bookmarks = [
            \ {'key': 'vw', 'path': '~/vimwiki/index.md'},
            \ {'key': 'vr', 'path': has('win32') ? '$HOME/_vimrc' : '~/.vimrc'},
            \ {'key': 'z',  'path': '~/.zshrc'},
            \ {'key': 'gw', 'path': '~/git-workspace'},
            \ {'key': 'b',  'path': '~/git-workspace/woodtalk.github.io/_wiki/index.md'}
            \ ]

for s:item in s:raw_bookmarks
    let s:expanded_path = expand(s:item.path)
    if filereadable(s:expanded_path) || isdirectory(s:expanded_path)
        let g:startify_bookmarks += [{ s:item.key : s:expanded_path }]
    endif
endfor

let g:startify_custom_header = [
\  '             __                ',
\  '    __   __ /\_\    ___ ___    ',
\  '   /\ \ /\ \\/\ \  /''__` __`\  ',
\  '   \ \ \_/ | \ \ \/\ \/\ \/\ \ ',
\  '    \ \___/   \ \_\ \_\ \_\ \_\',
\  '     \/__/     \/_/\/_/\/_/\/_/',
\  '   version: '.matchstr(execute('version'), 'Vi IMproved \zs\d[^ ]*').'.'.matchstr(execute('version'), '\(포함된 패치\|Included patches\): \(\d*-\?\d\+, \)*\d*-\?\zs\d\+')
\ ]
                                endif " if s:plug_installed

syntax on

set number
set ruler
set wildmenu
set showmatch
set matchpairs+=<:>
set scrolloff=5

set fileencodings=ucs-bom,utf-8,euc-kr,cp949,utf-16le,utf-16be,latin1
set fileformat=unix

set tabstop=4
set shiftwidth=4
set softtabstop=4

set ignorecase
set smartcase
set incsearch
set hlsearch

set clipboard=unnamedplus,unnamed
set backspace=indent,eol,start

set background=light
colorscheme shine
silent! colorscheme gruvbox

set autochdir

set list
set listchars=tab:▸\ ,eol:↲,trail:•,extends:⟩,precedes:⟨
set showbreak=↪

if exists("*mkdir")
    let s:dirs = [expand(s:vim_home.'/swap'), expand(s:vim_home.'/backup'), expand(s:vim_home.'/undo')]

    for s:dir in s:dirs
        if !isdirectory(s:dir) | call mkdir(s:dir, "p") | endif
    endfor

    let &directory = s:dirs[0] . '//'
    let &backupdir = s:dirs[1] . '//'
    let &undodir   = s:dirs[2] . '//'
endif

augroup filetype_setup
    autocmd!
    autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
    autocmd FileType vimwiki,markdown,md,yaml setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
    autocmd FileType vimwiki,markdown,md setlocal backup writebackup undofile
augroup END

set autoread
augroup checktime
    autocmd!
    if !has("gui_running")
        autocmd CursorHold,CursorHoldI,FocusGained,BufEnter * checktime
    endif
augroup END

" https://gist.github.com/atripes/15372281209daf5678cded1d410e6c16?permalink_comment_id=3781583#gistcomment-3781583
"vnoremap <leader>en :!python3 -c 'import sys; from urllib import parse; print(parse.quote_plus(sys.stdin.read().strip()))'<cr>
vnoremap <leader>de :!python3 -c 'import sys; from urllib import parse; print(parse.unquote_plus(sys.stdin.read().strip()))'<cr>
vnoremap <leader>js :!python3 -m json.tool<cr>

" https://stackoverflow.com/a/50521342
nnoremap q: <nop>

" https://stackoverflow.com/a/3736798
set nostartofline

if has('gui_running') && (has('win32') || has('win64'))

    " 윈도우에서 한글 메뉴 깨짐 현상 수정
    set langmenu=ko_kr.UTF-8

	set guioptions-=T " no toolbar
	set guioptions-=m " no menu

    language messages ko_kr.UTF-8   " 하단 깨진 한글 메시지 복원

    set guifont=Cascadia\ Mono:h10:cANSI,D2Coding:h10:w5.2:cANSI
    set guifontwide=D2Coding:h10:cHANGEUL,Dotumche:h9:cHANGEUL

    set iminsert=1
    set imsearch=-1 " ims using of imi option

    set lines=70 columns=270

    if filereadable(expand('$HOME/vimfiles/plugged/vimtweak/vimtweak64.dll'))
        autocmd GUIEnter * call libcallnr(expand('$HOME/vimfiles/plugged/vimtweak/vimtweak64.dll'), 'SetAlpha', 238)
    endif

elseif (has('win32') || has('win64')) || (has('unix') && executable('cmd.exe'))

    let s:im_select_path = expand(s:vim_home . '/bin/im-select.exe')

    if !filereadable(s:im_select_path)

        let s:bin_dir = fnamemodify(s:im_select_path, ':h')
        if !isdirectory(s:bin_dir) | call mkdir(s:bin_dir, 'p') | endif

        let s:url = 'https://github.com/daipeihust/im-select/releases/download/v2.0.2/im-select.exe'

        if executable('curl')
            let s:cmd = '!curl -fLo "' . s:im_select_path . '" --create-dirs ' . s:url
        else
            let s:cmd = '!powershell -Command "Invoke-WebRequest -Uri ' . s:url . ' -OutFile ''' . s:im_select_path . '''"'
        endif
        silent execute s:cmd

        if has('unix')
            silent execute '!chmod +x ' . s:im_select_path
        endif
    endif

    if filereadable(s:im_select_path)
        let s:bin_dir = fnamemodify(s:im_select_path, ':h')
        let $PATH = s:bin_dir . ';' . $PATH

        let g:im_select_default = 1033
        let g:im_select_get_current_cmd = [s:im_select_path]
        let g:im_select_switch_cmd = [s:im_select_path, '{im}']
    endif

elseif has('macunix')

    " macvim
    if has('gui_macvim') && has('gui_running')

        set transparency=10
        set guifont=SF\ Mono:h13,Menlo:h13
        set lines=65 columns=220

        augroup mac_gui_settings
            autocmd!
            " https://github.com/laishulu/macism#must-read-note
            " $(brew --prefix)
            if executable('/opt/homebrew/bin/macism')
                autocmd InsertLeave * :silent execute '!'.'/opt/homebrew/bin/macism'.' '.'com.apple.keylayout.ABC'
            endif
            autocmd GUIEnter * set vb t_vb=
        augroup END

    endif

    if has('python3')
        function! s:NormalizeNFC()
python3 << EOF
import vim, os, unicodedata

def run():
    current_path = vim.eval('expand("%:p")')
    if not os.path.exists(current_path):
        return

    nfc_path = unicodedata.normalize('NFC', current_path)
    if current_path == nfc_path:
        return

    try:
        temp_path = current_path + ".nfc_tmp"
        os.rename(current_path, temp_path)
        os.rename(temp_path, nfc_path)

        esc_path = vim.eval(f"fnameescape('{nfc_path}')")
        vim.command(f"edit {esc_path}")
        vim.command("filetype detect")
        vim.command("redraw!")
        print(f"[Vim] Fixed NFD -> NFC: {os.path.basename(nfc_path)}")

    except Exception as e:
        print(f"[Error] NFC fix failed: {e}")
run()
EOF
        endfunction

        augroup mac_nfc_fix
            autocmd!
            autocmd BufWritePost * call s:NormalizeNFC()
        augroup END
    endif

else

    inoremap <Esc> <Esc><Esc><Esc>
endif

" 회사용 encoding & 화면 수정
"if filereadable(expand('~/__at_office'))
"endif
