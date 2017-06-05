"" Setup dein  ---------------------------------------------------------------{{{
if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
  call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
  call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
endif

set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/
call dein#begin(expand('~/.config/nvim'))
call dein#add('Shougo/dein.vim')
call dein#add('haya14busa/dein-command.vim')

call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('tpope/vim-surround')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('ryanoasis/vim-devicons')

if dein#check_install()
  call dein#install()
  let pluginsExist=1
endif

call dein#end()
filetype plugin indent on

colorscheme codeschool

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

" Make sure the staus bar for airline stays showing
set laststatus=2

" Set theme for airline
let g:airline_theme='understated'

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
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Remap ctrlp
let g:ctrlp_map = '<A-p>'

" Remap multiline cursor
let g:multi_cursor_next_key='<C-a>'
" let g:multi_cursor_prev_key='<A-e>'
let g:multi_cursor_skip_key='<C-x>'

" Remap closing tags
iabbrev <// </<C-X><C-O>

" Remap next and prev buffer
map <A-Left> <Esc>:bp<CR>
map <A-Right> <Esc>:bn<CR>

" Remap save
map <A-s> <Esc>:w!<CR>

" Remap close
map <A-w> <Esc>:bd<CR>

" Remap newline above
nmap <CR> O<Esc>
" Remap newline above
nmap <CR><CR> o<Esc>
nmap <C-p> :reg<CR>

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
