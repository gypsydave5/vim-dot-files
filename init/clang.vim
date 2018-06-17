autocmd FileType make set noexpandtab
autocmd BufWritePre *.h :%pyf /usr/local/Cellar/clang-format/2017-03-17/share/clang/clang-format.py
autocmd BufWritePre *.c :%pyf /usr/local/Cellar/clang-format/2017-03-17/share/clang/clang-format.py
autocmd BufWritePre *.cpp :%pyf /usr/local/Cellar/clang-format/2017-03-17/share/clang/clang-format.py
autocmd BufWritePre *.cc :%pyf /usr/local/Cellar/clang-format/2017-03-17/share/clang/clang-format.py
let &path.="deps/,"
au BufNewFile,BufReadPost *.c setl shiftwidth=2 tabstop=2 softtabstop=2 noexpandtab

