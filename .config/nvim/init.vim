" Setup dein  ---------------------------------------------------------------{{{

if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
  call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
  call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
endif

set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/
call dein#begin(expand('~/.config/nvim'))

call dein#add('editorconfig/editorconfig-vim')
call dein#add('evidens/vim-twig')
" call dein#add('rafaqz/ranger.vim')
" call dein#add('micalexander/neoranger')
call dein#add('Shougo/context_filetype.vim')
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/deoplete.nvim')
call dein#add('tobyS/pdv')
call dein#add('tobyS/vmustache')
call dein#add('henrik/vim-indexed-search')
call dein#add('metakirby5/codi.vim')
call dein#add('chaoren/vim-wordmotion')
call dein#add('chrisbra/csv.vim')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/vimfiler.vim')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('SirVer/ultisnips')
call dein#add('airblade/vim-gitgutter')
call dein#add('vifm/vifm.vim')
" call dein#add('bkad/CamelCaseMotion')
call dein#add('bogado/file-line')
call dein#add('chrisbra/colorizer')
call dein#add('christoomey/vim-tmux-navigator')
call dein#add('urbainvaes/vim-tmux-pilot')
call dein#add('edkolev/promptline.vim')
call dein#add('ervandew/supertab')
call dein#add('godlygeek/tabular')
call dein#add('haya14busa/dein-command.vim')
call dein#add('jiangmiao/auto-pairs')
call dein#add('joonty/vdebug')
call dein#add('idanarye/vim-vebugger')
call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
call dein#add('junegunn/vim-peekaboo')
call dein#add('kana/vim-textobj-user')
call dein#add('kassio/neoterm')
call dein#add('ludovicchabant/vim-gutentags')
call dein#add('phpactor/phpactor', { 'build': 'composer install'})
call dein#add('kristijanhusak/deoplete-phpactor')
" call dein#add('lvht/phpcd.vim', { 'build': 'composer install'})
call dein#add('majutsushi/tagbar')
call dein#add('mattn/emmet-vim')
call dein#add('mhinz/vim-startify')
call dein#add('michaeljsmith/vim-indent-object')
call dein#add('mtth/scratch.vim')
call dein#add('myusuf3/numbers.vim')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('nelstrom/vim-textobj-rubyblock')
call dein#add('nelstrom/vim-visual-star-search')
call dein#add('leafgarland/typescript-vim')
call dein#add('plasticboy/vim-markdown')
call dein#add('rakr/vim-one')
call dein#add('ryanoasis/vim-devicons')
call dein#add('slim-template/vim-slim')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-eunuch')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-rhubarb')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-unimpaired')
call dein#add('valloric/MatchTagAlways')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('chrisbra/vim-diff-enhanced')
call dein#add('vim-scripts/argtextobj.vim')
call dein#add('vim-scripts/closetag.vim')
call dein#add('vimlab/split-term.vim')
call dein#add('xolox/vim-misc')
call dein#add('chemzqm/vim-jsx-improve')
call dein#add('carlitux/deoplete-ternjs', { 'build': 'yarn global add tern'})
call dein#add('dense-analysis/ale')
call dein#add('tmux-plugins/vim-tmux')
call dein#add('svermeulen/vim-yoink')

if dein#check_install()
  call dein#install()
  let pluginsExist=1
endif
call dein#end()

" }}}

" Environment Dependencies ---------------------------------------------------------------{{{
let s:uname = system("echo -n \"$(uname)\"")

let g:python_host_prog = system("echo -n \"$(which python)\"")
let g:python3_host_prog = system("echo -n \"$(which python3)\"")

"}}}

" Leader Maps ---------------------------------------------------------------{{{
let mapleader = "\<Space>"
" Map localleader
let maplocalleader = "\\"

noremap <silent> <leader>d :bp\|bd! #<CR>
" noremap <silent> <leader>w :bd<CR>
"
" Start terminal
nnoremap <leader>t :Ttoggle<CR>
inoremap <C-T> <esc>:Ttoggle<CR>
tnoremap <C-T> <C-\><C-n>:Ttoggle<CR>

" exit terminal
tnoremap <leader><ESC> <C-\><C-n>
" Buffers
nnoremap <leader>h <Esc>:bp<CR>
nnoremap <leader>l <Esc>:bn<CR>

autocmd! FileType fzf tnoremap <buffer> <ESC> <c-c>

" :FZF show all files
" nnoremap <leader>c <Esc>:Files <C-R>=expand("%:p:h") <CR><CR>
" nnoremap <leader># <Esc>:Files <C-R>=expand("%:p:h") <CR>
nnoremap <leader>f <Esc>:Files <CR>

" Edit a file from current location
" nnoremap <leader>e <Esc>:e <C-R>=expand("%:p:h") <CR>

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
nnoremap <Leader>. :%s///g<left><left>
" Quit vim
nnoremap Q :qall<CR>
" <Leader>r -- Cycle through relativenumber + number, number (only), and no
" numbering (mnemonic: relative).
" nnoremap <silent> <Leader>r :call mappings#cycle_numbering()<CR>
" Save the file
" nnoremap <Leader>w :write<CR>

nnoremap cgn *cgn
nnoremap <Leader>a :FindAll<Space>
" nnoremap <Leader>a ggVG:normal.<CR>``
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
"}}}

" Editor Preferences ---------------------------------------------------------------{{{
" let g:user_emmet_leader_key='<leader>,'
let g:user_emmet_expandabbr_key='<leader>,'

let g:vim_tags_ignore_files = []

" Persistant Undo
" Let's save undo info!
if !isdirectory($HOME."/.config/nvim/undofiles")
    call mkdir($HOME."/.config/nvim/undofiles", "", 0700)
endif
set undodir=~/.config/nvim/undofiles
set undofile

if has('nvim')
  let $VISUAL = 'nvr -cc split --remote-wait'
endif

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

set t_ZH=[3m
set t_ZR=[23m

" set background=dark
" colorscheme one

let g:one_allow_italics = 1

" For Vim inside tmux
set t_8b=[48;2;%lu;%lu;%lum
set t_8f=[38;2;%lu;%lu;%lum

filetype plugin indent on

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

" Switch buffers without saving
set hidden

" set wrap
set linebreak

" note trailing space at end of next line
set showbreak=>\ \ \

" Show command typed
set showcmd

set clipboard=unnamed

" Terminal
set shell=/bin/bash\ -l

" insert mode - line
let &t_SI .= "\<Esc>[5 q"
"replace mode - underline
let &t_SR .= "\<Esc>[4 q"
"common - block
let &t_EI .= "\<Esc>[3 q"

set splitbelow
set splitright

let g:netrw_banner=0

" set foldmethod=marker
autocmd FileType vim setlocal foldmethod=marker

set cursorline

au BufWinLeave *.c mkview
au BufWinEnter *.c silent! loadview

let g:wordmotion_spaces = '_-.'

xnoremap <Leader>iw iw
xnoremap <Leader>aw aw
onoremap <Leader>iw iw
onoremap <Leader>aw aw
" let g:wordmotion_prefix = '<Leader>'
" let g:wordmotion_mappings = {
" \ 'w' : '<M-w>',
" \ 'b' : '<M-b>',
" \ 'e' : '<M-e>',
" \ 'ge' : 'g<M-e>',
" \ 'aw' : 'a<M-w>',
" \ 'iw' : 'i<M-w>',
" \ '<C-R><C-W>' : '<C-R><M-w>'
" \ }
" }}}

" Plugin Preferences ---------------------------------------------------------------{{{

" Vifm  --------------------------------------------------------------- {{{
let g:vifm_replace_netrw = 1
" }}}

" Vim One (colorscheme) --------------------------------------------------------------- {{{
syntax enable
colorscheme one
set background=dark
call one#highlight('CursorLineNr', '282c33', '99c37e', 'none')
call one#highlight('Cursor', '99c37e', '282c33', 'none')
" call one#highlight('Normal', 'b2ad92', '99c37e', 'none')

let g:one_allow_italics = 1

autocmd VimEnter,ColorScheme * :call one#highlight ('StartifyHeader', '61afef', 'none', 'none')

autocmd VimEnter,Colorscheme * :call one#highlight('Search', '282c33', 'd4dce2', 'none')
autocmd VimEnter,Colorscheme * :call one#highlight('IncSearch', 'ffffff', '62afec', 'none')
autocmd VimEnter,Colorscheme * :call one#highlight('CursorLineNr', '282c33', '99c37e', 'none')
autocmd VimEnter,Colorscheme * :call one#highlight('Cursor', '99c37e', '282c33', 'none')
autocmd VimEnter,Colorscheme * :call one#highlight('Normal', 'none', 'none', 'none')
" }}}

" Airline ---------------------------------------------------------------{{{
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
" }}}


" Gutentags ---------------------------------------------------------------{{{
" Don't load me if there's no ctags file
if !executable('ctags')
  let g:gutentags_dont_load = 1
endif
" }}}

" Indent Guides ---------------------------------------------------------------{{{
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=none ctermbg=NONE
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#2e3239 ctermbg=NONE

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 2
let g:indent_guides_auto_colors = 0
" }}}

" Deoplete ---------------------------------------------------------------{{{
let g:AutoClosePumvisible = {"ENTER": "<C-Y>", "ESC": "<ESC>"}
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({
  \ 'deoplete-options-on_text_changed_i': 0
  \})
:inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" let g:deoplete#auto_complete_start_length = 1
" call deoplete#custom#option('sources', {
 " \ '_': ['buffer'],
 " \ 'jsx': [],
 " \ 'js': ['tern'],
 " \})

let g:deoplete#sources#ternjs#filetypes = [
	\ 'jsx',
	\ 'javascript.jsx',
	\ 'javascript.js',
	\ 'typscript.ts',
  \ 'ts',
  \ 'js'
	\ ]
let g:deoplete#sources#phpactor = ['php', 'php.php']
let g:deoplete#sources#ternjs#timeout = 3
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#docs = 1

" call deoplete#custom#var('omni', 'input_patterns', {
    " \ 'r': '[^. *\t]\.\w*',
" Use deoplete.
" let g:tern_request_timeout = 1
" let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete

"Add extra filetypes
" }}}

" Emmet Vim ---------------------------------------------------------------{{{
let g:user_emmet_expandabbr_key='<leader>,'
" }}}

" Phpcd ---------------------------------------------------------------{{{
let g:phpcd_auto_restart = 1
" }}}

" Supertab ---------------------------------------------------------------{{{
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
" let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
"
" let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
" let g:SuperTabContextDiscoverDiscovery =
    " \ ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]
" }}}

" FZF ---------------------------------------------------------------{{{

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

inoremap <expr> <c-x><c-f> fzf#vim#complete#path(
    \ "find . -path '*/\.*' -prune -o -print \| sed '1d;s:^..::'",
    \ fzf#wrap({'dir': expand('%:p:h')}))

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

command! -nargs=+ FindAll call fzf#run({
  \ 'source': 'ag "<args>"',
  \ 'sink': function('AgHandler'),
  \ 'options': '+m',
  \ 'tmux_height': '60%'
\ })

let g:fzf_tags_command = 'ctags -R'
" }}}

" PDV - PHP Documentor ---------------------------------------------------------------{{{
let g:pdv_template_dir = $HOME ."/.config/nvim/repos/github.com/tobyS/pdv/templates"
nnoremap <C-p> :call pdv#DocumentCurrentLine()<CR>
nnoremap - :<C-u>execute '-'.v:count1.'copy.'<CR>
nnoremap + :<C-u>execute '+'.v:count1.'copy.'<CR>
" }}}

" Startify ---------------------------------------------------------------{{{
let g:startify_session_persistence=1
" let g:startify_custom_header = [
" \'',
" \'                         -+.          /:     ',
" \'                       -osoo:         +ys:   ',
" \'                     /osssooo/`       +yyys: ',
" \'                    /+ossssooo+.      +yyyyys',
" \'                    +++osssooooo:     +yyyyyy',
" \'                    +ooooosssssso/`   +yyyyyy',
" \'                    +ooooo++sssssso.  +yyyyyy',
" \'                    +ooooo/`:sssssso- +hhhyyy',
" \'                    oooooo/` -ossssss/+hhhhhy',
" \'                    oooooo/`  `+ssssssyhhhhhy',
" \'                    osssss/`   `/sssssyyhhhhy',
" \'                    osssss/`     -syyyyhhhhhy',
" \'                    `/ssss/`      `oyyyhhhho:',
" \'                      ./ss/`       `/yyhho:.`',
" \'                        .//`         -so:.`  ',
" \'',
" \'                             Neovim',
" \'              hyperextensible Vim-based text editor',
" \'',
" \]
" if !exists(':Startify')
    " finish
" endif


" if has('nvim')
    " let g:startify_ascii = [
let g:startify_custom_header = [
\ "                      .            .      ",
\ "                    .,;'           :,.    ",
\ "                  .,;;;,,.         ccc;.  ",
\ "                .;c::::,,,'        ccccc: ",
\ "                .::cc::,,,,,.      cccccc.",
\ "                .cccccc;;;;;;'     llllll.",
\ "                .cccccc.,;;;;;;.   llllll.",
\ "                .cccccc  ';;;;;;'  oooooo.",
\ "                'lllllc   .;;;;;;;.oooooo'",
\ "                'lllllc     ,::::::looooo'",
\ "                'llllll      .:::::lloddd'",
\ "                .looool       .;::coooodo.",
\ "                  .cool         'ccoooc.  ",
\ "                    .co          .:o:.    ",
\ "                      .           .'      ",
\ "",
\"                          neovim",
\"            hyperextensible Vim-based text editor",
\]
" else
    " let g:startify_ascii = [
                " \ '     ________ ;;     ________',
                " \ '    /********\;;;;  /********\',
                " \ '    \********/;;;;;;\********/',
                " \ '     |******|;;;;;;;;/*****/',
                " \ '     |******|;;;;;;/*****/''',
                " \ '    ;|******|;;;;/*****/'';',
                " \ '  ;;;|******|;;/*****/'';;;;;',
                " \ ';;;;;|******|/*****/'';;;;;;;;;',
                " \ '  ;;;|***********/'';;;;;;;;;',
                " \ '    ;|*********/'';;;;;;;;;',
                " \ '     |*******/'';;;;;;;;;',
                " \ '     |*****/'';;;;;;;;;',
                " \ '     |***/'';;;;;;;;;',
                " \ '     |*/''   ;;;;;;',
                " \ '              ;;',
                " \]
" endif

" let g:startify_custom_header = map(g:startify_ascii, '"     ".v:val')
" let g:startify_skiplist = [
      " \ 'COMMIT_EDITMSG',
      " \ '^/tmp',
      " \ escape(fnamemodify(resolve($VIMRUNTIME), ':p'), '\') .'doc',
      " \ 'bundle/.*/doc',
      " \ ]



" }}}

" ale Lint Engine ---------------------------------------------------------------{{{

let g:ale_linters = {
\   'javascript': ['standard'],
\}
let g:ale_fixers = {'javascript': ['prettier_standard']}

let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
" }}}

" Vim Javascript ---------------------------------------------------------------{{{
let g:javascript_plugin_flow = 1
" }}}

" Vim JSX ---------------------------------------------------------------{{{
" let g:jsx_ext_required = 0
" }}}

" neoterm ---------------------------------------------------------------{{{

tnoremap <esc> <C-\><C-n>
let g:neoterm_fixedsize = 1
let g:neoterm_autoinsert = 1
let g:neoterm_size = 10
let g:neoterm_default_mod = 'rightbelow'
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
" }}}

" Colorizer ---------------------------------------------------------------{{{
let g:colorizer_auto_filetype='scss,css,html'
" }}}

" VeDebug ---------------------------------------------------------------{{{

let g:vdebug_options = {}
let g:vdebug_options["port"] = 9009
let g:vdebug_options["break_on_open"] = 0

" }}}

" Misc Mappings ---------------------------------------------------------------{{{

" Search for visually selected word
vnoremap // y/<C-R>"<CR>

" Remap closing tags
iabbrev <// </<C-X><C-O>

" Remap newline above
nmap <CR><CR> O<Esc>

" Remap newline above
nmap <CR> o<Esc>

imap jj <Esc>
imap jjj <Esc>:w<CR>

autocmd BufWritePre * %s/\s\+$//e
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

" Find out what color is what by typing something like the following
" " For status line forground:
" :echo synIDattr(synIDtrans(hlID('StatusLine')), 'fg');
" " For normal background:
" :echo synIDattr(synIDtrans(hlID('Normal')), 'bg')
" Change color of indent guides
" au BufEnter * if &buftype == 'terminal' | :startinsert | endif

command Q qall
" splits
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-h> <c-w><c-h>
nnoremap <c-l> <c-w><c-l>

cmap w!! w !sudo tee > /dev/null %<CR>

" bkad/CamelCaseMotion
" map <silent> w <Plug>CamelCaseMotion_w
" map <silent> b <Plug>CamelCaseMotion_b
" map <silent> e <Plug>CamelCaseMotion_e
" map <silent> ge <Plug>CamelCaseMotion_ge
" sunmap w
" sunmap b
" sunmap e
" sunmap ge

" omap <silent> iw <Plug>CamelCaseMotion_iw
" xmap <silent> iw <Plug>CamelCaseMotion_iw
" omap <silent> ib <Plug>CamelCaseMotion_ib
" xmap <silent> ib <Plug>CamelCaseMotion_ib
" omap <silent> ie <Plug>CamelCaseMotion_ie
" xmap <silent> ie <Plug>CamelCaseMotion_ie
let g:scratch_filetype = 'markdown'
let g:codi#rightalign = 0
let g:codi#width = '50%'


" }}}
" }}}


" ----------------------------------------------------------------------------
" BTags
" ----------------------------------------------------------------------------
function! s:align_lists(lists)
  let maxes = {}
  for list in a:lists
    let i = 0
    while i < len(list)
      let maxes[i] = max([get(maxes, i, 0), len(list[i])])
      let i += 1
    endwhile
  endfor
  for list in a:lists
    call map(list, "printf('%-'.maxes[v:key].'s', v:val)")
  endfor
  return a:lists
endfunction

function! s:btags_source()
  let lines = map(split(system(printf(
    \ 'ctags -f - --sort=no --excmd=pattern --language-force=%s %s',
    \ &filetype, expand('%:S'))), "\n"), 'split(v:val, "\t")')
  if v:shell_error
    throw 'failed to extract tags'
  endif
  return map(s:align_lists(lines), 'join(v:val, "\t")')
endfunction

function! s:btags_sink(line)
  execute split(a:line, "\t")[2]
endfunction

function! s:btags()
  try
    call fzf#run({'source':  s:btags_source(),
                 \'down':    '40%',
                 \'options': '+m -d "\t" --with-nth 1,4..',
                 \'sink':    function('s:btags_sink')})
  catch
    echohl WarningMsg
    echom v:exception
    echohl None
  endtry
endfunction

command! BTags call s:btags()
