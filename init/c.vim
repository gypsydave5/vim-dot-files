autocmd FileType make set noexpandtab

autocmd BufWritePre *.c %!clang-format -style=Google
autocmd BufWritePre *.h %!clang-format -style=Google
let &path.="deps/,"

au BufNewFile,BufReadPost *.c setl shiftwidth=2 tabstop=2 softtabstop=2 noexpandtab

