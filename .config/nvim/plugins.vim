
if filereadable(expand('$HOME/Cloud/Development/.config/nvim/variables.vim'))
  execute "so ".expand('$HOME/Cloud/Development/.config/nvim/variables.vim')
endif

let s:plugin_manager = "Shougo/dein.vim"
let s:plugin_github_path = g:nvim_home_path."/repos/github.com"
let s:plugin_manager_path = s:plugin_github_path."/".s:plugin_manager

function! s:source_file(file)
  if filereadable(expand(a:file))
    execute "so ".expand(a:file)
  endif
endfunction

if (!isdirectory(expand(s:plugin_manager_path)))
  call system(expand("mkdir -p ".s:plugin_github_path))
  call system(expand("git clone https://github.com/".s:plugin_manager." ".s:plugin_manager_path))
endif

let &runtimepath.=','.s:plugin_manager_path.'/'

call dein#begin(expand(g:nvim_base_path))

function! dein#get_direct_plugins_path() abort
  return expand(g:nvim_cloud_path."/direct_install.vim")
endfunction

call s:source_file(g:nvim_cloud_path."/direct_install.vim")
call s:source_file(g:nvim_cloud_path."/manual_install.vim")

if dein#check_install()
  call dein#install()
  let pluginsExist=1
endif
call dein#end()
