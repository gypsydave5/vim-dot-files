"powerline symbols {{{
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
let g:airline_powerline_fonts = 1

" }}}

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
colorscheme badwolf
 "}}}

"promptline settings {{{
 let g:promptline_theme = 'airline'
 let g:promptline_preset = {
         \'a' : [ promptline#slices#battery(), promptline#slices#host({ 'only_if_ssh': 1 }) ],
         \'b' : [ promptline#slices#cwd({ 'dir_limit': 1}) ],
         \'c' : [ promptline#slices#vcs_branch() ],
         \'x' : [ promptline#slices#git_status()],
         \'y' : [ promptline#slices#jobs() ],
         \'warn' : [ promptline#slices#last_exit_code() ]}
"}}}

"autosave! {{{

:au FocusLost * silent! wa
:au BufEnter * silent! wa
:set autowriteall

" }}}

"NERDTree remap {{{

map <C-i> :NERDTreeToggle<CR>

" }}}

"Remap Tab to change window {{{

:nnoremap <Tab> <C-W><C-W>
:nnoremap <S-Tab> <C-W>W

" }}}


"html tags {{{

:let g:html_indent_inctags = "html,body,head,tbody,section"

" }}}

" {{{ some fun from Spike
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>et <C-w><C-v><C-l>:e ~/.tmux.conf<cr>
" }}}

"let g:EditorConfig_core_mode = 'external_command'

autocmd FileType ruby nmap <buffer> <F4> <Plug>(xmpfilter-mark)
autocmd FileType ruby xmap <buffer> <F4> <Plug>(xmpfilter-mark)
autocmd FileType ruby imap <buffer> <F4> <Plug>(xmpfilter-mark)

autocmd FileType ruby nmap <buffer> <F5> <Plug>(xmpfilter-run)
autocmd FileType ruby xmap <buffer> <F5> <Plug>(xmpfilter-run)
autocmd FileType ruby imap <buffer> <F5> <Plug>(xmpfilter-run)

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
