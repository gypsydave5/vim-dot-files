let g:ale_go_gometalinter_options = '--fast'
let g:go_fmt_command = "gofmt"

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
au FileType go nmap <Leader>gm <Plug>(go-imports)

au FileType go nmap <Leader>ga <Plug>(go-alternate-edit)

if exists("g:did_load_filetypes")
  filetype off
  filetype plugin indent off
endif

set rtp+=~/.vim/godoctor.vim
filetype plugin indent on

let g:ale_linters.go = ['gometalinter', 'gofmt', 'goimports', 'gotype', 'go vet', 'staticcheck', 'go build', 'gosimple']

