au BufRead,BufNewFile *.rs set filetype=rust
au BufRead,BufNewFile *.toml set filetype=toml
let g:syntastic_quiet_messages = {"regex": 'is unstable and should only be used on the nightly compiler, but it is currently accepted for backwards compatibility; this will soon change, see issue #31847 for more details'}

let g:rustfmt_autosave = 1
let g:rust_doc#downloaded_rust_doc_dir = '~/.rustup/toolchains/nightly-x86_64-apple-darwin/'
let g:rustfmt_command = 'rustfmt --force'
let g:cargo_command = "cargo {cmd}"
au FileType rust nmap <leader>rp :RustPlay<CR>

au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

let g:cargo_command = "!cargo {cmd}"
au FileType rust nmap <leader>cr :CargoRun<CR>
au FileType rust nmap <leader>cb :CargoBuild<CR>
au FileType rust nmap <leader>cc :CargoCheck<CR>
au FileType rust nmap <leader>ct :CargoTest<CR>
au FileType rust nmap <leader>ci :CargoTest -- --ignored<CR>
au FileType rust nmap <leader>cm :CargoBench<CR>

let g:ale_linters.rust = ['rls']
