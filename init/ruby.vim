autocmd FileType ruby,eruby,yaml set tw=80 ai sw=2 sts=2 et
autocmd FileType ruby,eruby,yaml setlocal foldmethod=manual
autocmd FileType ruby,eruby,yaml set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

"xmpfilter buttons
autocmd FileType ruby nmap <buffer> <F4> <Plug>(xmpfilter-mark)
autocmd FileType ruby xmap <buffer> <F4> <Plug>(xmpfilter-mark)
autocmd FileType ruby imap <buffer> <F4> <Plug>(xmpfilter-mark)

autocmd FileType ruby nmap <buffer> <F5> <Plug>(xmpfilter-run)
autocmd FileType ruby xmap <buffer> <F5> <Plug>(xmpfilter-run)
autocmd FileType ruby imap <buffer> <F5> <Plug>(xmpfilter-run)
