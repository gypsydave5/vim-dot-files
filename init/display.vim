let g:airline_powerline_fonts = 1

if $TERM == "xterm-256color" || $TERM == "screen-256color"
	set t_Co=256
endif

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"fonts for different guis {{{
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Monoid:h12
    set guioptions-=m
  elseif has("gui_macvim")
    set guifont=Monoid:h12
    set guioptions-=m
  elseif has("gui_win32")
    set guifont=DejaVu_Sans_Mono_for_Powerline:h12:cANSI
    set winaltkeys=no
    set guioptions-=m
  endif
endif
" }}}

"colorschemes for term/gui {{{
colorscheme nofrils-light
"}}}


