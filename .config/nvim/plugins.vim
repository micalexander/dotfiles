
if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
  call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
  call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
endif

set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/
call dein#begin(expand('~/.config/nvim'))

function! dein#get_direct_plugins_path() abort
  return expand("$HOME/Cloud/Development/.config/nvim/direct_install.vim")
endfunction

if filereadable(expand("$HOME/Cloud/Development/.config/nvim/direct_install.vim"))
  execute "so ".expand("$HOME/Cloud/Development/.config/nvim/direct_install.vim")
endif

if filereadable(expand("$HOME/Cloud/Development/.config/nvim/manual_install.vim"))
  execute "so ".expand("$HOME/Cloud/Development/.config/nvim/manual_install.vim")
endif

if dein#check_install()
  call dein#install()
  let pluginsExist=1
endif
call dein#end()
