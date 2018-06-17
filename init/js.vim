let g:jsx_ext_required = 0

autocmd BufWrite *.*js ALEFix
autocmd FileType javascript.jsx set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

set autoread

let g:ale_linters.javascript = ['standard']

