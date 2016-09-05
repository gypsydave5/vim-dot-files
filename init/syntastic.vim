let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=5
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_cursor_column = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_echo_current_error = 1
let g:syntastic_cursor_column = 0
let g:syntastic_mode_map = { 'mode': 'active',
\ 'active_filetypes': [],
\ 'passive_filetypes': ['html', 'css', 'slim', 'go', 'javascript'] }

