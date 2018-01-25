"" Setup dein  ---------------------------------------------------------------{{{

if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
  call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
  call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
endif

set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/
call dein#begin(expand('~/.config/nvim'))
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/deoplete.nvim')
call dein#add('evidens/vim-twig')
" call dein#add('Shougo/neoinclude.vim')
call dein#add('haya14busa/dein-command.vim')
call dein#add('edkolev/promptline.vim')
" call dein#add('edkolev/tmuxline.vim')
call dein#add('lvht/phpcd.vim', { 'build': 'composer install'})
call dein#add('myusuf3/numbers.vim')
call dein#add('mhinz/vim-startify')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/vimfiler.vim')
call dein#add('kassio/neoterm')
call dein#add('vimlab/split-term.vim')
call dein#add('Shougo/context_filetype.vim')
call dein#add('jiangmiao/auto-pairs')
call dein#add('valloric/MatchTagAlways')
call dein#add('chrisbra/colorizer')
call dein#add('vim-scripts/closetag.vim')
call dein#add('godlygeek/tabular')
call dein#add('tpope/vim-repeat')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('slim-template/vim-slim')
call dein#add('bogado/file-line')
call dein#add('christoomey/vim-tmux-navigator')
call dein#add('ervandew/supertab')
call dein#add('tpope/vim-commentary')
call dein#add('joonty/vdebug')
call dein#add('rakr/vim-one')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('tpope/vim-eunuch')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-surround')
call dein#add('ryanoasis/vim-devicons')
" call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
call dein#add('airblade/vim-gitgutter')
call dein#add('xolox/vim-misc')
call dein#add('nelstrom/vim-visual-star-search')
call dein#add('ludovicchabant/vim-gutentags')
call dein#add('majutsushi/tagbar')
call dein#add('mattn/emmet-vim')
call dein#add('SirVer/ultisnips')
call dein#add('tmux-plugins/vim-tmux')
call dein#add('junegunn/vim-peekaboo')
call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

if dein#check_install()
  call dein#install()
  let pluginsExist=1
endif

call dein#end()
filetype plugin indent on

let g:deoplete#enable_at_startup = 1
" set completeopt=longest,menuone,noinsert
set completeopt=noinsert
let g:deoplete#disable_auto_complete = 0
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_ignore_case = 'ignorecase'
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.html = '<[^>]*'
let g:deoplete#omni_patterns.xml  = '<[^>]*'
let g:deoplete#omni_patterns.md   = '<[^>]*'
let g:deoplete#omni_patterns.css   = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
let g:deoplete#omni_patterns.scss   = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
let g:deoplete#omni_patterns.sass   = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'
let g:deoplete#omni_patterns.javascript = '[^. \t]\.\%(\h\w*\)\?'
let g:deoplete#omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:deoplete#omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:deoplete#omni_patterns.go = '[^.[:digit:] *\t]\.\w*'
let g:deoplete#omni_patterns.ruby = ['[^. *\t]\.\w*', '\h\w*::']
let g:deoplete#omni_patterns.php = '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
" let g:deoplete#omni_patterns.php = '->\|::'
let g:deoplete#omni_patterns.python = ['[^. *\t]\.\h\w*\','\h\w*::']
let g:deoplete#omni_patterns.python3 = ['[^. *\t]\.\h\w*\','\h\w*::']
autocmd CmdwinEnter * let b:deoplete_sources = ['buffer']
autocmd FileType php setlocal omnifunc=phpcd#CompletePHP
let g:deoplete#sources = { '_': ['buffer', 'file'] }
" let g:deoplete#sources = {}
" let g:deoplete#sources._ = ['buffer']
let g:deoplete#sources.coffee = ['buffer', 'tag', 'member', 'file', 'omni']
" imap     <Nul> <C-Space>
let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni']
" let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
inoremap <expr><C-Space> deoplete#mappings#manual_complete()
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ deoplete#mappings#manual_complete()
" inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
" " use tab to forward cycle
" inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
" inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:phpcd_auto_restart = 1
"
" Leader mappings.
let mapleader = "\<Space>"
" Map localleader
let maplocalleader = "\\"

noremap <silent> <leader>d :bp\|bd #<CR>
"
" Start terminal
nnoremap <leader>t :Ttoggle<CR>
inoremap <C-T> <esc>:Ttoggle<CR>
tnoremap <C-T> <C-\><C-n>:Ttoggle<CR>
" nnoremap <leader>t <Esc>:term /bin/bash -l <CR>
" exit terminal
tnoremap <leader><ESC> <C-\><C-n>
" Buffers
nnoremap <leader>h <Esc>:bp<CR>
nnoremap <leader>l <Esc>:bn<CR>

autocmd! FileType fzf tnoremap <buffer> <ESC> <c-c>
" :FZF show all files
nnoremap <leader>c <Esc>:Files <C-R>=expand("%:p:h") <CR><CR>
" nnoremap <leader># <Esc>:Files <C-R>=expand("%:p:h") <CR>
nnoremap <leader>f <Esc>:Files <CR>

" Edit a file from current location
nnoremap <leader>e <Esc>:e <C-R>=expand("%:p:h") <CR>

" Edit a file from current location
nnoremap <leader>v <Esc>:vs <C-R>=expand("%:p:h") <CR>

" :FZF show all git files
nnoremap <leader>g <Esc>:GFiles<CR>
" :FZF show git status
nnoremap <localleader>s <Esc>:GFiles?<CR>
" :FZF show all files in current buffers
nnoremap <leader>b <Esc>:Buffers<CR>
" <Leader><Leader> -- Open last buffer.
nnoremap <Leader><Leader> <C-^>
" <Leader>p -- Show the path of the current file (mnemonic: path; useful when
" you have a lot of splits and the status line gets truncated).
nnoremap <localleader>p :echo expand('%')<CR>
" <Leader>pp -- Like <Leader>p, but additionally yanks the filename and sends it
" off to Clipper.
nnoremap <Leader>cp :let @0=expand('%') <Bar> :Clip<CR> :echo expand('%')<CR>
" Quit vim
nnoremap Q :qall<CR>
" <Leader>r -- Cycle through relativenumber + number, number (only), and no
" numbering (mnemonic: relative).
" nnoremap <silent> <Leader>r :call mappings#cycle_numbering()<CR>
" Save the file
nnoremap <Leader>w :write<CR>

nnoremap cgn *cgn
nnoremap <Leader>a ggVG:normal.<CR>``
" Like :wq, but write only when changes have been made.
nnoremap <Leader>x :xit<CR>
" <Leader>zz -- Zap trailing whitespace in the current buffer.
"
"        As this one is somewhat destructive and relatively close to the
"        oft-used <leader>a mapping, make this one a double key-stroke.
nnoremap <silent> <Leader>zz :call mappings#zap()<CR>
" <LocalLeader>c -- Fix (most) syntax highlighting problems in current buffer
" (mnemonic: coloring).
nnoremap <silent> <LocalLeader>c :syntax sync fromstart<CR>
" <LocalLeader>e -- Edit file, starting in same directory as current file.
nnoremap <LocalLeader>e :edit <C-R>=expand('%:p:h') . '/'<CR>
" Rename a buffer and the file on disk simultaneously.
nnoremap <localleader>m :Move
" Like :Move, but relative to the current file's containing directory.
nnoremap <localleader>r :Rename
" Delete a buffer and the file on disk simultaneously.
nnoremap <localleader>d :Delete
" Create a directory, defaulting to the parent of the current file.
nnoremap <localleader>k :Mkdir
" nnoremap <localleader>t :call deoplete#toggle() <CR>

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

" let g:user_emmet_leader_key='<leader>,'
let g:user_emmet_expandabbr_key='<leader>,'

let g:vim_tags_ignore_files = []

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
"
" Automatically change into the directory of opened file
" NOTE: This setting does not work with vimfiler plugin
" set autochdir

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" Treated as a word boundary (though not a WORD boundary)
" set iskeyword-=_

" Set colorscheme
"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
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


set background=dark
colorscheme one
call one#highlight('CursorLineNr', '282c33', '99c37e', 'none')
call one#highlight('Cursor', '99c37e', '282c33', 'none')
" call one#highlight('Normal', 'b2ad92', '99c37e', 'none')

let g:one_allow_italics = 1


set t_ZH=[3m
set t_ZR=[23m

let g:airline_theme='one'

" Set theme for airline
" Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
" let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
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
set smartindent
set nowrap
set textwidth=0

" Set line numbers
set relativenumber
set number

" Search for visually selected word
vnoremap // y/<C-R>"<CR>

" set rtp+=~/.fzf
let g:fzf_tags_command = 'ctags -R'

" Remap closing tags
iabbrev <// </<C-X><C-O>

" Switch buffers without saving
set hidden
" Remap next and prev buffer
" map { <Esc>:bp<CR>
" map } <Esc>:bn<CR>
" " Remap newline above
nmap <CR><CR> O<Esc>
" Remap newline above
nmap <CR> o<Esc>
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
"
" Change cursor shape between insert and normal mode in iTerm2.app
" let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

autocmd BufWritePre * %s/\s\+$//e

" set wrap
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

" let g:NERDTreeDisablePatternMatchHighlight = 1
" let g:NERDTreeExtensionHighlightColor = {}
" let g:NERDTreeExtensionHighlightColor['php'] = s:blue

let g:vdebug_options = {}
let g:vdebug_options["port"] = 9009
let g:vdebug_options["break_on_open"] = 0

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
set clipboard=unnamed

" Find out what color is what by typing something like the following
" " For status line forground:
" :echo synIDattr(synIDtrans(hlID('StatusLine')), 'fg');
" " For normal background:
" :echo synIDattr(synIDtrans(hlID('Normal')), 'bg')
" Change color of indent guides
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#282c33 ctermbg=NONE
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#2e3239 ctermbg=NONE
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 2
let g:indent_guides_auto_colors = 0

" Terminal
set shell=/bin/bash\ -l
tnoremap <esc> <C-\><C-n>
let g:neoterm_fixedsize = 1
let g:neoterm_autoinsert = 1
let g:neoterm_size = 10
let g:neoterm_automap_keys = ',tt'

nnoremap <silent> <f10> :TREPLSendFile<cr>
nnoremap <silent> <f9> :TREPLSendLine<cr>
vnoremap <silent> <f9> :TREPLSendSelection<cr>
" " Useful maps
" hide/close terminal
nnoremap <silent> ,th :call neoterm#close()<cr>
" clear terminal
nnoremap <silent> ,tl :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> ,tc :call neoterm#kill()<cr>
" au BufEnter * if &buftype == 'terminal' | :startinsert | endif

function! s:escape(path)
  return substitute(a:path, ' ', '\\ ', 'g')
endfunction

function! AgHandler(line)
  let parts = split(a:line, ':')
  let [fn, lno] = parts[0 : 1]
  execute 'e '. s:escape(fn)
  execute lno
  normal! zz
endfunction
command! -nargs=+ Fag call fzf#run({
  \ 'source': 'ag "<args>"',
  \ 'sink': function('AgHandler'),
  \ 'options': '+m',
  \ 'tmux_height': '60%'
  \ })

" let g:vimfiler_as_default_explorer = 1
" nnoremap - :VimFilerExplorer<cr>
command Q qall
" splits
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-h> <c-w><c-h>
nnoremap <c-l> <c-w><c-l>
set splitbelow
set splitright
" xnoremap p "_dP
" let g:netrw_browse_split=2
let g:netrw_banner=0
if has('nvim')
  let $VISUAL = 'nvr -cc split --remote-wait'
endif
let g:colorizer_auto_filetype='scss,css,html'
inoremap <expr> <c-x><c-f> fzf#vim#complete#path(
    \ "find . -path '*/\.*' -prune -o -print \| sed '1d;s:^..::'",
    \ fzf#wrap({'dir': expand('%:p:h')}))

let g:startify_session_persistence=1
" For Vim inside tmux
set t_8b=[48;2;%lu;%lu;%lum
set t_8f=[38;2;%lu;%lu;%lum
