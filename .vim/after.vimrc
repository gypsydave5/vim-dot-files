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
    set guifont=Inconsolata\ for\ Powerline\ 12
    set guioptions-=m
  elseif has("gui_macvim")
    set guifont=Meslo\ LG\ L\ for\ Powerline:h14
    set guioptions-=m
  elseif has("gui_win32")
    set guifont=DejaVu_Sans_Mono_for_Powerline:h12:cANSI
    set winaltkeys=no
    set guioptions-=m
  endif
endif
" }}}

" set filetypes {{{
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
" }}}

" WordProcessor Mode / Goyo {{{
let g:goyo_width=65
let g:wp_mode_is_on = 0
function! ToggleWPMode()
    if g:wp_mode_is_on
        set formatoptions=tcq
        set nowrap nolinebreak expandtab
        silent! nunmap <buffer> k
        silent! nunmap <buffer> j
        silent! nunmap <buffer> 0
        silent! nunmap <buffer> $
        silent! iunmap <buffer> k
        silent! iunmap <buffer> j
        silent! iunmap <buffer> 0
        silent! iunmap <buffer> $
        let g:wp_mode_is_on = 0
        Goyo
    else
        set formatoptions=ant1
        noremap k gk
        noremap j gj
        noremap 0 g0
        noremap $ g$
        set wrap linebreak nolist noexpandtab
        set formatprg=par
        set spell spelllang=en_us
        let g:wp_mode_is_on = 1
        Goyo
    endif
endfunction
command! -nargs=? Goyo call s:goyo(<args>) call ToggleWPMode()
nnoremap :Goyo<CR> :call ToggleWPMode()<CR>
" }}}

"colorschemes for term/gui {{{

if has ("gui_running")
	colorscheme base16-railscasts
else
	colorscheme badwolf
end

 "}}}

"set gx browser {{{
if has ('win32')
	:let g:netrw_browsex_viewer= "chrome.exe "
endif
"}}}

"vim-rspec bindings and setup {{{
"
"nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
"nnoremap <Leader>s :call RunNearestSpec()<CR>
"nnoremap <Leader>l :call RunLastSpec()<CR>
"let g:rspec_runner = "os_x_iterm"
"let g:rspec_command = "Dispatch rspec {spec}"
"let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'

"}}}

"promptline settings {{{
let g:promptline_preset = {
        \'a' : [ promptline#slices#cwd() ],
        \'b' : [ promptline#slices#vcs_branch() ],
				\'c' : [ promptline#slices#git_status()],
				\'x' : [ promptline#slices#jobs() ],
        \'warn' : [ promptline#slices#last_exit_code() ]}
"}}}

"autosave! {{{

:au FocusLost * silent! wa
:au BufEnter * silent! wa
:set autowriteall

" }}}

"NERDTree remap {{{

	"let g:NERDTreeToggle <S-Tab>

" }}}

"Remap Tab to change window {{{

:nnoremap <Tab> <C-W><C-W>
:nnoremap <S-Tab> <C-W>W

" }}}

"UltiSnips Triggers {{{
"
"let g:ycm_key_list_select_completion=[]
"let g:ycm_key_list_previous_completion=[]

""let g:UltiSnipsExpandTrigger="<c-j>"

"function! g:UltiSnips_Complete()
    "call UltiSnips#ExpandSnippet()
    "if g:ulti_expand_res == 0
        "if pumvisible()
            "return "\<C-n>"
        "else
            "call UltiSnips#JumpForwards()
            "if g:ulti_jump_forwards_res == 0
               "return "\<TAB>"
            "endif
        "endif
    "endif
    "return ""
"endfunction

"au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsListSnippets="<c-e>"
" this mapping Enter key to <C-y> to chose the current highlight item
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" }}}

" {{{ html tags

:let g:html_indent_inctags = "html,body,head,tbody,section"

" }}}

" {{{ some fun from Spike
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>h :bprevious<CR>
nnoremap <leader>l :bnext<CR>
" }}}
