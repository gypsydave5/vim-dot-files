if !has("gui_running")
  :source $VIMRUNTIME/menu.vim
  :set wildmenu
  :set cpoptions-=<
  :set wildcharm=<C-Z>
  :map <F4> :emenu <C-Z>
endif
