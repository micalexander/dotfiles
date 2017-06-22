"" Setup dein  ---------------------------------------------------------------{{{
if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
  call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
  call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
endif

set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/
call dein#begin(expand('~/.config/nvim'))
call dein#add('Shougo/dein.vim')
call dein#add('haya14busa/dein-command.vim')
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
" call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('tpope/vim-vinegar')
call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

if dein#check_install()
  call dein#install()
  let pluginsExist=1
endif

call dein#end()
filetype plugin indent on

colorscheme one
set background=dark
let g:one_allow_italics = 1

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
set undofile
set undodir="$HOME/.VIM_UNDO_FILES"

" Automatically change into the directory of opened file
set autochdir

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" Treated as a word boundary (though not a WORD boundary)
set iskeyword-=_

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

" Set theme for airline
let g:airline_theme='one'

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

set relativenumber

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

au FocusLost * set number
au FocusGained * set relativenumber

autocmd InsertEnter * set number
autocmd InsertLeave * set relativenumber

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Set emmet to tap abbreviations
" let g:user_emmet_expandabbr_key='<Tab'
" imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Remap ctrlp
" let g:ctrlp_map = '<C-p>'
"
" :FZF
nnoremap <C-p> <Esc>:Files<CR>
set rtp+=~/.fzf

" Remap multiline cursor
let g:multi_cursor_next_key='<C-a>'
" let g:multi_cursor_prev_key='<A-e>'
let g:multi_cursor_skip_key='<C-x>'

" Remap closing tags
iabbrev <// </<C-X><C-O>

" Remap next and prev buffer
map <S-Left> <Esc>:bp<CR>
map <S-Right> <Esc>:bn<CR>

" Remap save
map <A-s> <Esc>:w!<CR>

" Remap close
map <A-w> <Esc>:bd<CR>

" Remap newline above
nmap <CR> O<Esc>
" Remap newline above
nmap <CR><CR> o<Esc>

" Remap history keys
" noremap : q:i
" nnoremap / q/i
" nnoremap ? q?i

"inoremap {<CR> {<CR>}<C-o>O
inoremap <A-N> <C-N>
inoremap {<CR> {<CR>}<Esc>ko
"inoremap [ []<Esc>a
"inoremap ( ()<Esc>a
"inoremap ( (<CR>)<Esc>ko

imap jj <Esc>
imap jjj <Esc>:w<CR>

set tabstop=2 shiftwidth=2 expandtab

" Change cursor shape between insert and normal mode in iTerm2.app
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

autocmd BufWritePre * %s/\s\+$//e

set wrap
set linebreak
" note trailing space at end of next line
set showbreak=>\ \ \

let g:SuperTabDefaultCompletionType = ""

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
