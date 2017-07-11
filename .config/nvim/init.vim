"" Setup dein  ---------------------------------------------------------------{{{
if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
  call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
  call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
endif

set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/
call dein#begin(expand('~/.config/nvim'))
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/deoplete.nvim')
" call dein#add('Shougo/neoinclude.vim')
call dein#add('haya14busa/dein-command.vim')
" call dein#add('roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'})
" call dein#add('roxma/nvim-completion-manager')
" call dein#add('shawncplus/phpcomplete.vim')
call dein#add('m2mdas/phpcomplete-extended')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('Shougo/context_filetype.vim')
call dein#add('jiangmiao/auto-pairs')
call dein#add('valloric/MatchTagAlways')
call dein#add('vim-scripts/closetag.vim')
call dein#add('godlygeek/tabular')
call dein#add('tpope/vim-repeat')
call dein#add('nathanaelkane/vim-indent-guides')

call dein#add('ervandew/supertab')
call dein#add('tpope/vim-commentary')
call dein#add('joonty/vdebug')
call dein#add('rakr/vim-one')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-surround')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('ryanoasis/vim-devicons')
call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
call dein#add('scrooloose/nerdtree')
call dein#add('airblade/vim-gitgutter')
call dein#add('xolox/vim-misc')

call dein#add('ludovicchabant/vim-gutentags')
call dein#add('majutsushi/tagbar')
call dein#add('mattn/emmet-vim')
" call dein#add('SirVer/ultisnips')
call dein#add('tpope/vim-vinegar')
call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

if dein#check_install()
  call dein#install()
  let pluginsExist=1
endif

call dein#end()
filetype plugin indent on

let g:deoplete#enable_at_startup = 1
autocmd FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP
let g:deoplete#disable_auto_complete = 0
let g:deoplete#enable_smart_case = 1
set completeopt+=noinsert
let g:deoplete#enable_ignore_case = 'ignorecase'
let g:deoplete#omni_patterns = {}
" let g:deoplete#omni_patterns.html = '<[^>]*'
" let g:deoplete#omni_patterns.xml  = '<[^>]*'
" let g:deoplete#omni_patterns.md   = '<[^>]*'
" let g:deoplete#omni_patterns.css   = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
" let g:deoplete#omni_patterns.scss   = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
" let g:deoplete#omni_patterns.sass   = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
" let g:deoplete#omni_patterns.javascript = '[^. \t]\.\%(\h\w*\)\?'
" let g:deoplete#omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
" let g:deoplete#omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
" let g:deoplete#omni_patterns.go = '[^.[:digit:] *\t]\.\w*'
" let g:deoplete#omni_patterns.ruby = ['[^. *\t]\.\w*', '\h\w*::']
let g:deoplete#omni_patterns.php = '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
" let g:deoplete#omni_patterns.python = ['[^. *\t]\.\h\w*\','\h\w*::']
" let g:deoplete#omni_patterns.python3 = ['[^. *\t]\.\h\w*\','\h\w*::']
autocmd CmdwinEnter * let b:deoplete_sources = ['buffer']
let g:deoplete#sources = {}
" let g:deoplete#sources._ = ['buffer']
" let g:deoplete#sources.coffee = ['buffer', 'tag', 'member', 'file', 'omni']
let g:deoplete#sources.php = []
imap     <Nul> <C-Space>
inoremap <expr><C-Space> deoplete#mappings#manual_complete()
inoremap <expr><BS>      deoplete#mappings#smart_close_popup()."\<C-h>"
inoremap <silent><expr> <Tab>
  \ pumvisible() ? "\<C-n>" :
  \ deoplete#mappings#manual_complete()
let g:phpcomplete_parse_docblock_comments = 1

" Close the documentation window when completion is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Map leader
let mapleader = '\'
map <Space> <Leader>

let s:uname = system("echo -n \"$(uname)\"")

if !v:shell_error && s:uname == "Linux"
  let g:python2_host_prog = '/usr/local/python2/bin/python2'
  let g:python3_host_prog = '/usr/local/python3/bin/python3'
endif

if !v:shell_error && s:uname == "Darwin"
  " Do Mac stuff here
  let g:python2_host_prog = '/usr/bin/local/python'
  let g:python3_host_prog = '/usr/local/bin/python3'
endif


let g:user_emmet_leader_key=','
let g:vim_tags_ignore_files = []

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Persistant Undo
" Let's save undo info!
if !isdirectory($HOME."/.config/nvim/undofiles")
    call mkdir($HOME."/.config/nvim/undofiles", "", 0770)
endif
if !isdirectory($HOME."/.config/nvim/undofiles")
    call mkdir($HOME."/.config/nvim/undofiles", "", 0700)
endif
set undodir=~/.config/nvim/undofiles
set undofile

" Automatically change into the directory of opened file
set autochdir

" Search down into subfolders
" Provides tab-completion for all file-related tasks
" set path+=**

" Display all matching files when we tab complete
" set wildmenu

" Treated as a word boundary (though not a WORD boundary)
" set iskeyword-=_

" Set colorscheme
colorscheme one
set background=dark

" Set theme for airline
let g:airline_theme='one'

" Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_symbols.space = "\ua0"

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Make sure the staus bar for airline stays showing
set laststatus=2

" Set to auto read when a file is changed from the outside
set autoread

" Always show current position
set ruler

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Use spaces
set expandtab
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set nowrap
set textwidth=0

" Set line numbers
set relativenumber
set number

" Search for visually selected word
vnoremap // y/<C-R>"<CR>

" :FZF
nnoremap <leader>p <Esc>:Files<CR>
nnoremap <leader>t <Esc>:Tags<CR>
set rtp+=~/.fzf
let g:fzf_tags_command = 'ctags -R'

" Remap closing tags
iabbrev <// </<C-X><C-O>

" Switch buffers without saving
set hidden

" Remap next and prev buffer
map { <Esc>:bp<CR>
map } <Esc>:bn<CR>

" Remap newline above
nmap <CR> O<Esc>
" Remap newline above
nmap <CR><CR> o<Esc>

" Remap history keys
" noremap : q:i
" nnoremap / q/i
" nnoremap ? q?i

"inoremap {<CR> {<CR>}<C-o>O
" inoremap {<CR> {<CR>}<Esc>ko
"inoremap [ []<c-o>a
"inoremap ( ()<c-o>a
"inoremap ( (<CR>)<c-o>ko


imap jj <Esc>
imap jjj <Esc>:w<CR>

" Change cursor shape between insert and normal mode in iTerm2.app
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

autocmd BufWritePre * %s/\s\+$//e

set wrap
set linebreak

" note trailing space at end of next line
set showbreak=>\ \ \

" Show command typed
set showcmd

" you can add these colors to your .vimrc to help customizing
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1

let g:NERDTreeExtensionHighlightColor = {}
let g:NERDTreeExtensionHighlightColor['php'] = s:blue

let g:vdebug_options = {}
let g:vdebug_options["port"] = 9009
let g:vdebug_options["break_on_open"] = 0

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 2

" Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

