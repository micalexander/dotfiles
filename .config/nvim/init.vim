" helpers

if filereadable(expand('$HOME/Cloud/Development/.config/nvim/variables.vim'))
  execute "so ".expand('$HOME/Cloud/Development/.config/nvim/variables.vim')
endif

function! s:source_file(file)
  if filereadable(expand(a:file))
    execute "so ".expand(a:file)
  endif
endfunction

" Setup dein  ---------------------------------------------------------------{{{
call s:source_file("$HOME/Cloud/Development/.config/nvim/plugins.vim")


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

nnoremap <silent> <leader>vv :e $HOME/Cloud/Development/.config/nvim/init.vim<CR>

noremap <silent> <leader>d :bp\|bd! #<CR>
" noremap <silent> <leader>w :bd<CR>
"
" Start terminal
" nnoremap <leader>t :Ttoggle<CR>
inoremap <C-T> <esc>:Ttoggle<CR>
tnoremap <C-T> <C-\><C-n>:Ttoggle<CR>

" exit terminal
tnoremap <leader><ESC> <C-\><C-n>
" Buffers
nnoremap <leader>ll <Esc>:bp<CR>
nnoremap <leader>l <Esc>:bn<CR>
nnoremap // <Esc>:nohl<CR>

autocmd! FileType fzf tnoremap <buffer> <ESC> <c-c>

" :FZF show all files
" nnoremap <leader>c <Esc>:Files <C-R>=expand("%:p:h") <CR><CR>
" nnoremap <leader># <Esc>:Files <C-R>=expand("%:p:h") <CR>

" Edit a file from current location
" nnoremap <leader>e <Esc>:e <C-R>=expand("%:p:h") <CR>

" Edit a file from current location
nnoremap <leader>v :vs <C-R>=expand("%:p:h") <CR>

" :FZF show all git files
nnoremap <leader>g :GFiles<CR>

" :FZF show git status
nnoremap <localleader>s :GFiles?<CR>

" :FZF show all files open in buffers
nnoremap <leader>b :Buffers<CR>

" :FZF show all commands
nnoremap <leader>c :Commands<CR>

" :FZF file history
nnoremap <leader>r :Recent<CR>

" :FZF command history
nnoremap <leader>cr :HistoryCommand<CR>

" :FZF search history
nnoremap <leader>s :HistorySearch<CR>

" :FZF all files in current directory
nnoremap <leader>f :FilesWithIcon <CR>

" :FZF text search
nnoremap <leader>t :TextSearch <CR>

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

nnoremap cgn *Ncgn

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

" highlight Comment cterm=italic

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
" set shell=/bin/bash\ -l

" insert mode - line
let &t_SI .= "\<Esc>[5 q"
"replace mode - underline
let &t_SR .= "\<Esc>[4 q"
"common - block
let &t_EI .= "\<Esc>[3 q"

set splitbelow
set splitright

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

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
let g:one_allow_italics = 1

syntax enable
colorscheme one
set background=dark

" call one#highlight('CursorLineNr', '282c33', '99c37e', 'none')
" call one#highlight('Cursor', '99c37e', '282c33', 'none')


autocmd VimEnter,ColorScheme * :call one#highlight ('StartifyHeader', '61afef', 'none', 'none')
autocmd VimEnter,Colorscheme * :call one#highlight('Search', '282c33', '61afef', 'none')
autocmd VimEnter,Colorscheme * :call one#highlight('IncSearch', '282c33', '62afec', 'none')
autocmd VimEnter,Colorscheme * :call one#highlight('CursorLineNr', '282c33', '99c37e', 'none')
autocmd VimEnter,Colorscheme * :call one#highlight('Cursor', '99c37e', '282c33', 'none')
autocmd VimEnter,Colorscheme * :call one#highlight('Normal', 'none', 'none', 'none')
" }}}

" Airline ---------------------------------------------------------------{{{
let g:airline_theme='one'
let g:airline#extensions#tabline#fnamemod = ':t'
hi airline_tabmod guifg=#282c33
hi airline_tabmod_right  guifg=#282c33
hi airline_tabmod_unsel_to_airline_tabmod  guifg=#282c33

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
let g:gutentags_ctags_exclude = [
  \ 'node_modules/*'
  \ ]
let g:gutentags_file_list_command = 'ag -l'
  let g:gutentags_dont_load = 1
let g:gutentags_trace = 1
if !executable('ctags')
  let g:gutentags_dont_load = 1
endif
" }}}

" Indent Guides ---------------------------------------------------------------{{{
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=none ctermbg=NONE
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#2c323c ctermbg=NONE
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_syntax_conceal = 0
let g:indentLine_setColors = 0
let g:indentLine_fileTypeExclude = ['help', 'fzf', 'startify', 'markdown', 'vimwiki', 'calendar']
let g:indentLine_char = '▏'
let g:indentLine_conceallevel=1
let g:indentLine_color_term = 255
set conceallevel=2
set concealcursor+=v
autocmd BufEnter,BufLeave *.md,*.markdown set conceallevel=2

" }}}

" Deoplete ---------------------------------------------------------------{{{
let g:AutoClosePumvisible = {"ENTER": "<C-Y>", "ESC": "<ESC>"}
" let g:deoplete#enable_at_startup = 1
" call deoplete#custom#option({
  " \ 'deoplete-options-on_text_changed_i': 0
  " \})
" :inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" let g:deoplete#auto_complete_start_length = 1
" call deoplete#custom#option('sources', {
 " \ '_': ['buffer'],
 " \ 'jsx': [],
 " \ 'js': ['tern'],
 " \})

" let g:deoplete#sources#ternjs#filetypes = [
	" \ 'jsx',
	" \ 'javascript.jsx',
	" \ 'javascript.js',
	" \ 'typscript.ts',
  " \ 'ts',
  " \ 'js'
	" \ ]
" let g:deoplete#sources#phpactor = ['php', 'php.php']
" let g:deoplete#sources#ternjs#timeout = 3
" let g:deoplete#sources#ternjs#types = 1
" let g:deoplete#sources#ternjs#docs = 1

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

let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,tsx,jsx,scss,css,less,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*" '

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': '--prompt All\ Files:\ '}), <bang>0)

command! -bang -nargs=? -complete=dir Buffers
  \ call fzf#vim#buffers(<q-args>, {'options': '--prompt Active\ Buffers:\ '}, <bang>0)

command! -bang -nargs=? -complete=dir Commands
  \ call fzf#vim#commands({'options': '--prompt All\ Commands:\ '}, <bang>0)

command! -bang -nargs=? -complete=dir Commits
  \ call fzf#vim#commits({'options': '--propmt Commits:\ '}, <bang>0)

command! -bang -nargs=? -complete=dir Recent
  \ call fzf#vim#history({'options': ['-m', '--header-lines', !empty(expand('%')), '--prompt', 'Recent Files: ']}, <bang>0)

command! -bang -nargs=? -complete=dir HistorySearch
  \ call fzf#vim#search_history({'options': '+m --ansi --prompt="Recent Searches: " --header-lines=1 --expect=ctrl-e --tiebreak=index'}, <bang>0)

command! -bang -nargs=? -complete=dir HistoryCommand
  \ call fzf#vim#command_history({'options': '+m --ansi --prompt="Recent Commands: " --header-lines=1 --expect=ctrl-e --tiebreak=index'}, <bang>0)

command! -bang -nargs=* TextSearch call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

inoremap <expr> <c-x><c-f> fzf#vim#complete#path(
    \ "find . -path '*/\.*' -prune -o -print \| sed '1d;s:^..::'",
    \ fzf#wrap({'dir': expand('%:p:h')}))

if has('nvim') && exists('&winblend') && &termguicolors

  " hi NormalFloat guibg=#2c323c guifg=#ABB2BF
  if exists('g:fzf_colors.bg')
    call remove(g:fzf_colors, 'bg')
  endif

  if stridx($FZF_DEFAULT_OPTS, '--border') == -1
    let $FZF_DEFAULT_OPTS .= ' --border'
  endif

  function! FloatingFZF()
    let width = float2nr(&columns * 0.8)
    let height = float2nr(&lines * 0.6)
    let opts = { 'relative': 'editor',
               \ 'style': 'minimal',
               \ 'row': 1,
               \ 'col': (&columns - width) / 2,
               \ 'width': width,
               \ 'height': height }

    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
  endfunction

  let g:fzf_layout = { 'window': 'call FloatingFZF()' }
endif

let $FZF_DEFAULT_OPTS = '--reverse'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

nnoremap <silent> <leader>p :DeinFZFInstall<CR>
nnoremap <silent> <leader>pp :DeinFZFList<CR>
function! Plugin()

  function! s:get_actions()
    return ['Install', 'List', 'Uninstall']
  endfunction

  function! s:action(item)
    if a:item == 'Install'
      :Plugins
      return 0
    elseif a:item == 'List'
      call PluginsList()
    endif
  endfunction

  call fzf#run({
        \ 'source': s:get_actions(),
        \ 'sink': function('s:action'),
        \ 'options': '--prompt \ \ Plugins:\ ',
        \ 'window': 'call FloatingFZF()'
        \ })

endfunction

command! WikiList :call WikiList()
nnoremap <silent> <leader>w :WikiList<CR>
function! WikiList()

  function! s:get_wikis()
    let l:wikis = {}
    for wiki in g:vimwiki_list
      let l:wikis[fnamemodify(wiki['path'], ':t')] = wiki['path'].'/index'.wiki['ext']
    endfor
    return l:wikis
  endfunction

  function! s:get_wiki_names()
    return keys(s:get_wikis())
  endfunction

  function! s:wiki_file(name)
    let l:wikis = s:get_wikis()
    execute 'silent e' l:wikis[a:name]
  endfunction

  call fzf#run({
        \ 'source': s:get_wiki_names(),
        \ 'sink': function('s:wiki_file'),
        \ 'options': '--prompt \ \ Wikis:\ ',
        \ 'window': 'call FloatingFZF()' })

endfunction

" Files + devicons
function! Fzf_dev()
  let l:fzf_files_options = '--preview "bat --style=numbers --color always {2..-1} | head -'.&lines.'"'

  function! s:files()
    let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
    return s:prepend_icon(l:files)
  endfunction

  function! s:prepend_icon(candidates)
    let l:result = []
    for l:candidate in a:candidates
      let l:filename = fnamemodify(l:candidate, ':p:t')
      let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
      call add(l:result, printf('%s %s', l:icon, l:candidate))
    endfor

    return l:result
  endfunction

  function! s:edit_file(item)
    let l:pos = stridx(a:item, ' ')
    let l:file_path = a:item[pos+1:-1]
    execute 'silent e' l:file_path
  endfunction

  call fzf#run({
        \ 'source': <sid>files(),
        \ 'sink':   function('s:edit_file'),
        \ 'options': '-m '.l:fzf_files_options. ' --reverse --prompt All\ Files:\ ' ,
        \ 'window':    'call FloatingFZF()' })
endfunction

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

command! FilesWithIcon :call Fzf_dev()

" " Customize fzf colors to match your color scheme
" let g:fzf_colors =
" \ { 'fg':      ['fg', 'Normal'],
"   \ 'bg':      ['bg', 'Normal'],
"   \ 'hl':      ['fg', 'Comment'],
"   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"   \ 'hl+':     ['fg', 'Statement'],
"   \ 'info':    ['fg', 'PreProc'],
"   \ 'border':  ['fg', 'Ignore'],
"   \ 'prompt':  ['fg', 'Conditional'],
"   \ 'pointer': ['fg', 'Exception'],
"   \ 'marker':  ['fg', 'Keyword'],
"   \ 'spinner': ['fg', 'Label'],
"   \ 'header':  ['fg', 'Comment'] }

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


autocmd FileType startify map <buffer> l <CR>
let g:startify_change_to_dir = 0

let g:startify_session_dir = '~/.local/share/nvim/session'
" https://github.com/mhinz/vim-startify/issues/331
autocmd BufDelete * if empty(filter(tabpagebuflist(), '!buflisted(v:val)')) | Startify | endif

" function! s:cd() abort
"   if &buftype =~# '\v(nofile|terminal)' || expand('%') =~# '^fugitive'
"     return
"   endif
"   if !exists('s:cache')
"     let s:cache = {}
"   endif
"   let dirs   = [ '.git', '.hg', '.svn' ]
"   let curdir = resolve(expand('%:p:h'))
"   if !isdirectory(curdir)
"     echohl WarningMsg | echo 'No such directory: '. curdir | echohl NONE
"     return
"   endif
"   if has_key(s:cache, curdir)
"     execute 'lcd' fnameescape(s:cache[curdir])
"     return
"   endif
"   for dir in dirs
"     let founddir = finddir(dir, curdir .';')
"     if !empty(founddir)
"       break
"     endif
"   endfor
"   let dir = empty(founddir) ? curdir : resolve(fnamemodify(founddir, ':p:h:h'))
"   let s:cache[curdir] = dir
"   execute 'lcd' fnameescape(dir)
" endfunction

" command! Cd call s:cd()
" autocmd BufEnter * call s:cd()
" }}}

" ale Lint Engine ---------------------------------------------------------------{{{

" let g:ale_linters = {
" \   'javascript': ['standard'],
" \}
" let g:ale_fixers = {'javascript': ['prettier_standard']}

" let g:ale_lint_on_save = 1
" let g:ale_fix_on_save = 1
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

imap jk <Esc>
nnoremap jkj <Esc>:w<CR>

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

let g:tagbar_type_javascript = {
      \ 'ctagstype': 'javascript',
      \ 'kinds': [
      \ 'A:arrays',
      \ 'P:properties',
      \ 'T:tags',
      \ 'O:objects',
      \ 'G:generator functions',
      \ 'F:functions',
      \ 'C:constructors/classes',
      \ 'M:methods',
      \ 'V:variables',
      \ 'I:imports',
      \ 'E:exports',
      \ 'S:styled components',
      \ 'a:arrays',
      \ 'p:properties',
      \ 't:tags',
      \ 'o:objects',
      \ 'g:generator functions',
      \ 'f:functions',
      \ 'c:constructors/classes',
      \ 'm:methods',
      \ 'v:variables',
      \ 'i:imports',
      \ 'e:exports',
      \ 's:styled components'
      \ ]}

let g:lightline#bufferline#enable_devicons = 1

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

command! -nargs=0 Prettier :CocCommand prettier.formatFile

let g:coc_global_extensions = [
      \ "coc-emmet",
      \ "coc-tsserver",
      \ "coc-css",
      \ "coc-json",
      \ "coc-yaml",
      \ "coc-phpls",
      \ 'coc-prettier',
      \ 'coc-vimlsp',
      \ "coc-eslint",
      \ "coc-html"
      \]
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Terminal buffer options for fzf
" autocmd! FileType fzf
" autocmd  FileType fzf set noshowmode noruler nonu
autocmd BufWinEnter * call system("vifm --remote -c 'go ". escape(expand("%:p"), ' '). "' -c 'redraw'")
autocmd BufWinEnter * call system("tmux set -g status-right \"#[fg=#3b4048,bg=#2c323c,nobold,nounderscore,noitalics]#[fg=#abb2bf,bg=#3b4048]  #[fg=#98c379,bg=#3b4048,nobold,nounderscore,noitalics]#[fg=#3b4048,bg=#98c379] ".expand("%:p")." #[fg=#3b4048,bg=#98c379,nobold,nounderscore,noitalics]#[fg=#abb2bf,bg=#3b4048]\"")

set path=.,src
set suffixesadd+=.js,.jsx

function! LoadMainNodeModule(fname)
    let nodeModules = "./node_modules/"
    let packageJsonPath = nodeModules . a:fname . "/package.json"

    if filereadable(packageJsonPath)
        return nodeModules . a:fname . "/" . json_decode(join(readfile(packageJsonPath))).main
    else
        return nodeModules . a:fname
    endif
endfunction

set includeexpr=LoadMainNodeModule(v:fname)


" change status of Tmuxline when Vim mode changes
" if exists('$TMUX')
"   function! AddTmuxlineStatus()
"     if exists(':Tmuxline')
"       augroup airline_tmuxline
"         au!
"         au InsertEnter * call SetInsert()
"         au InsertChange * call SetInsert()
"         autocmd InsertLeave * call SetNormal()
"         vnoremap <silent> <expr> <SID>SetVisual SetVisual()
"         nnoremap <silent> <script> v v<SID>SetVisual
"         nnoremap <silent> <script> V V<SID>SetVisual
"         nnoremap <silent> <script> <C-v> <C-v><SID>SetVisual
"         autocmd CursorHold * call SetNormal()
"       augroup END
"     endif
"   endfunction
"   function! SetInsert()
"     if v:insertmode == 'i'
"       Tmuxline airline_insert
"     else
"       Tmuxline airline_replace
"     endif
"   endfunction
"   function! SetVisual()
"     set updatetime=0
"     Tmuxline airline_visual
"     return ''
"   endfunction
"   function! SetNormal()
"     set updatetime=4000
"     Tmuxline airline
"   endfunction
"   au VimEnter * :call AddTmuxlineStatus()
" endif   " exists('$TMUX')
let g:airline#extensions#tmuxline#enabled = 0
let g:VM_maps = {}
let g:VM_maps["Find Under"] = '<C-m>'
let g:VM_maps["Find Subword Under"] = '<C-m>'

nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
inoremap <leader>j <Esc>:m .+1<CR>==gi
inoremap <leader>k <Esc>:m .-2<CR>==gi
vnoremap <leader>j :m '>+1<CR>gv=gv
vnoremap <leader>k :m '<-2<CR>gv=gv

" let g:rainbow_active = 1
" let g:rainbow_conf = {
" \	'guifgs': ['magenta', 'darkorange3', 'seagreen3', 'firebrick'],
" \	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
" \}
let g:AutoPairsShortcutToggle = '<C-p>'
let g:AutoPairsShortcutFastWrap = '<down>'
let g:AutoPairsShortcutJump = '<right>'
let g:AutoPairsShortcutBackInsert = '<left>'

command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
augroup end

let g:vimwiki_global_ext = 0
let g:vimwiki_list = [
                    \ {'path': '~/Cloud/Development/vimwiki/micalexander', 'syntax': 'markdown', 'ext': '.md'},
                    \ {'path': '~/Cloud/Development/vimwiki/Tivity', 'syntax': 'markdown', 'ext': '.md'}
                    \ ]
