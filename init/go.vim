let g:go_disable_autoinstall = 1
let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']

au FileType go nmap <leader>gr <Plug>(go-run)
au FileType go nmap <leader>gb <Plug>(go-build)
au FileType go nmap <leader>gt <Plug>(go-test)
au FileType go nmap <leader>gc <Plug>(go-coverage-toggle)
au FileType go nmap <leader>gv <Plug>(go-vet)
au FileType go nmap <leader>gd <Plug>(go-doc-vertical)
au FileType go nmap <leader>gD <Plug>(go-doc-browser)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType go nmap <Leader>gi <Plug>(go-info)

au FileType go nmap <Leader>ga <Plug>(go-alternate-edit)
