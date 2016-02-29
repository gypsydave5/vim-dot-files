"
set nocompatible
filetype on
filetype off

" Utils {{{
source ~/.vim/functions/util.vim
" }}}

" Load external configuration before anything else {{{
if filereadable(expand("~/.vim/before.vimrc"))
  source ~/.vim/before.vimrc
endif
" }}}

let mapleader = ","
let maplocalleader = "\\"

" Local vimrc configuration {{{
let s:localrc = expand($HOME . '/.vim/local.vimrc')
if filereadable(s:localrc)
  exec ':so ' . s:localrc
endif
" }}}

" PACKAGE LIST {{{
if ! exists('g:vimified_packages')
  let g:vimified_packages = ['general', 'go', 'fancy', 'os', 'coding', 'python', 'ruby', 'html', 'css', 'js', 'clojure', 'haskell', 'color', 'db']
endif
" }}}

" VUNDLE {{{
let s:bundle_path=$HOME."/.vim/bundle/"
execute "set rtp+=".s:bundle_path."vundle/"
call vundle#rc()
Plugin 'gmarik/vundle'
" }}}

" PACKAGES {{{

" Install user-supplied Plugins {{{
let s:extrarc = expand($HOME . '/.vim/extra.vimrc')
if filereadable(s:extrarc)
  exec ':so ' . s:extrarc
endif
" }}}

" _. General {{{
if count(g:vimified_packages, 'general')
  Plugin 'editorconfig/editorconfig-vim'
  let g:EditorConfig_exec_path = '/usr/local/bin/editorconfig'

  Plugin 'rking/ag.vim'
  nnoremap <leader>a :Ag -i<space>

  Plugin 'matthias-guenther/hammer.vim'
  nmap <leader>p :Hammer<cr>

  Plugin 'tsaleh/vim-align'
  Plugin 'tpope/vim-endwise'
  Plugin 'tpope/vim-repeat'
  Plugin 'tpope/vim-speeddating'
  Plugin 'tpope/vim-unimpaired'
  Plugin 'maxbrunsfeld/vim-yankstack'
  call yankstack#setup()
  Plugin 'tpope/vim-eunuch'
  Plugin 'tpope/vim-surround'
  Plugin 'elzr/vim-json'
  Plugin 'tpope/vim-sleuth'
  Plugin 'scrooloose/nerdtree'
  " Disable the scrollbars (NERDTree)
  set guioptions-=r
  set guioptions-=L
  " Keep NERDTree window fixed between multiple toggles
  set winfixwidth


  Plugin 'kana/vim-textobj-user'
  Plugin 'vim-scripts/YankRing.vim'
  let g:yankring_replace_n_pkey = '<leader>['
  let g:yankring_replace_n_nkey = '<leader>]'
  let g:yankring_history_dir = '~/.vim/tmp/'
  nmap <leader>y :YRShow<cr>

  Plugin 'michaeljsmith/vim-indent-object'
  let g:indentobject_meaningful_indentation = ["haml", "sass", "python", "yaml", "markdown"]

  Plugin 'Spaceghost/vim-matchit'
  Plugin 'kien/ctrlp.vim'
  let g:ctrlp_working_path_mode = ''

  Plugin 'vim-scripts/scratch.vim'

  Plugin 'troydm/easybuffer.vim'
  nmap <leader>be :EasyBufferToggle<enter>

  Plugin 't9md/vim-ruby-xmpfilter'
  Plugin 'tpope/vim-cucumber'

endif
" }}}
"
" _. tmux {{{
if count(g:vimified_packages, 'tmux')
  Plugin 'benmills/vimux'
  Plugin 'jpalardy/vim-slime'
  let g:slime_target = "tmux"
endif
" }}}

" _. Fancy {{{
if count(g:vimified_packages, 'fancy')
  Plugin 'edkolev/promptline.vim'
  Plugin 'bling/vim-airline'
  Plugin 'roman/golden-ratio'
  let g:golden_ratio_exclude_nonmodifiable = 1
  "Modified the plugin as per https://github.com/roman/golden-ratio/pull/15
  let g:golden_ratio_filetypes_blacklist = ["nerdtree", "unite", "qf"]
endif
" }}}

" _. DB {{{
if count(g:vimified_packages, 'db')
  Plugin 'vim-scripts/dbext.vim'

  let g:dbext_default_SQLSRV_bin = 'tsql'
  let g:dbext_default_SQLSRV_cmd_options = ''


endif
" }}}

" _. Java {{{
if count(g:vimified_packages, 'java')
  Plugin 'tfnico/vim-gradle'
  Plugin 'vim-scripts/groovy.vim'
endif
" }}}
"
" _. Snippets {{{
if count(g:vimified_packages, 'snippets')
  Plugin 'Shougo/neocomplete'
  Plugin 'Shougo/neosnippet'
  Plugin 'Shougo/neosnippet-snippets'
  Plugin 'gypsydave5/vim-snippets'

  "_.echodoc {{{
  Plugin 'Shougo/echodoc.vim'
  let g:echodoc_enable_at_startup = 1
  set cmdheight=2
  " }}}


  let g:neocomplete#enable_at_startup = 1
  "Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
  " Disable AutoComplPop.
  let g:acp_enableAtStartup = 0
  " Use neocomplete.
  let g:neocomplete#enable_at_startup = 1
  " Use smartcase.
  let g:neocomplete#enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

  " Define dictionary.
  let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
          \ }

  " Define keyword.
  if !exists('g:neocomplete#keyword_patterns')
      let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'

  " Plugin key-mappings.
  inoremap <expr><C-g>     neocomplete#undo_completion()
  inoremap <expr><C-l>     neocomplete#complete_common_string()

  " Recommended key-mappings.
  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? "\<C-y>" : "\<CR>"
  endfunction
  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
  " Close popup by <Space>.
  "inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

  " AutoComplPop like behavior.
  "let g:neocomplete#enable_auto_select = 1

  " Shell like behavior(not recommended).
  "set completeopt+=longest
  "let g:neocomplete#enable_auto_select = 1
  "let g:neocomplete#disable_auto_complete = 1
  "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

  " Enable omni completion.
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

  " Enable heavy omni completion.
  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif
  "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
  "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
  "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

  " For perlomni.vim setting.
  " https://github.com/c9s/perlomni.vim
  let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

  " Plugin key-mappings.
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)

  " SuperTab like snippets behavior.
  "imap <expr><TAB>
  " \ pumvisible() ? "\<C-n>" :
  " \ neosnippet#expandable_or_jumpable() ?
  " \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

  " For conceal markers.
  if has('conceal')
    set conceallevel=2 concealcursor=niv
  endif
endif
" }}}
"
" _. Indent {{{
if count(g:vimified_packages, 'indent')
  Plugin 'Yggdroot/indentLine'
  set list lcs=tab:\|\
  let g:indentLine_color_term = 111
  let g:indentLine_color_gui = '#DADADA'
  let g:indentLine_char = 'c'
  let g:indentLine_char = '∙▹¦'
  let g:indentLine_char = '∙'
endif
" }}}

" _. OS {{{
if count(g:vimified_packages, 'os')
	Plugin 'zaiste/tmux.vim'
	Plugin 'benmills/vimux'
  Plugin 'kballard/vim-fish'
	map <Leader>rp :VimuxPromptCommand<CR>
	map <Leader>rl :VimuxRunLastCommand<CR>
	map <LocalLeader>d :call VimuxRunCommand(@v, 0)<CR>
endif
" }}}

" _. Coding {{{

if count(g:vimified_packages, 'coding')
  Plugin 'majutsushi/tagbar'
  nmap <leader>t :TagbarToggle<CR>

  Plugin 'gregsexton/gitv'

  Plugin 'joonty/vdebug.git'

  Plugin 'scrooloose/nerdcommenter'
  nmap <leader># :call NERDComment(0, "invert")<cr>
  vmap <leader># :call NERDComment(0, "invert")<cr>

  " - Plugin 'msanders/snipmate.vim'
  Plugin 'sjl/splice.vim'

  Plugin 'tpope/vim-fugitive'
  nmap <leader>g :Ggrep
  " ,f for global git serach for word under the cursor (with highlight)
  nmap <leader>f :let @/="\\<<C-R><C-W>\\>"<CR>:set hls<CR>:silent Ggrep -w "<C-R><C-W>"<CR>:ccl<CR>:cw<CR><CR>
  " same in visual mode
  :vmap <leader>f y:let @/=escape(@", '\\[]$^*.')<CR>:set hls<CR>:silent Ggrep -F "<C-R>=escape(@", '\\"#')<CR>"<CR>:ccl<CR>:cw<CR><CR>

  Plugin 'scrooloose/syntastic'
  let g:syntastic_enable_signs=1
  let g:syntastic_auto_loc_list=1
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
  let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
  let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['ruby', 'python', 'javascript'], 'passive_filetypes': ['html', 'css', 'slim', 'go'] }
  " --

  Plugin 'vim-scripts/Reindent'

  autocmd FileType gitcommit set tw=68 spell
  autocmd FileType gitcommit setlocal foldmethod=manual

  Plugin 'rizzatti/dash.vim'
  :nmap <silent> <leader>d <Plug>DashSearch

  Plugin 'vim-scripts/SQLComplete.vim'

endif
" }}}

" _. Python {{{
if count(g:vimified_packages, 'python')
  Plugin 'klen/python-mode'
  Plugin 'python.vim'
  Plugin 'python_match.vim'
  Plugin 'pythoncomplete'
  Plugin 'vim-virtualenv'
endif
" }}}

" _. Go {{{
if count(g:vimified_packages, 'go')
  Plugin 'fatih/vim-go'
  let g:go_disable_autoinstall = 1
  let g:go_snippet_engine = "neosnippet"
  let g:go_metalinter_autosave = 1
  let g:go_metalinter_autosave_enabled = ['vet', 'golint']

  au FileType go nmap <leader>gr <Plug>(go-run)
  au FileType go nmap <leader>gb <Plug>(go-build)
  au FileType go nmap <leader>gt <Plug>(go-test)
  au FileType go nmap <leader>gc <Plug>(go-coverage)

  au FileType go nmap <Leader>ds <Plug>(go-def-split)
  au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
  au FileType go nmap <Leader>dt <Plug>(go-def-tab)

  au FileType go nmap <Leader>gi <Plug>(go-info)

  au FileType go nmap <Leader>ga <Plug>(go-alternate-edit)
endif
" }}}

" _. Ruby {{{
if count(g:vimified_packages, 'ruby')
  Plugin 'vim-ruby/vim-ruby'
  Plugin 'tpope/vim-rails'
  Plugin 'nelstrom/vim-textobj-rubyblock'
  Plugin 'ecomba/vim-ruby-refactoring'
  Plugin 'thoughtbot/vim-rspec'

  autocmd FileType ruby,eruby,yaml set tw=80 ai sw=2 sts=2 et
  autocmd FileType ruby,eruby,yaml setlocal foldmethod=manual
  autocmd User Rails set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
endif
" }}}

" _. Clang {{{
if count(g:vimified_packages, 'clang')
  Plugin 'Rip-Rip/clang_complete'
  Plugin 'LucHermitte/clang_indexer'
  Plugin 'newclear/lh-vim-lib'
  Plugin 'LucHermitte/vim-clang'
  Plugin 'devx/c.vim'
endif
" }}}

" _. HTML {{{
if count(g:vimified_packages, 'html')
  Plugin 'tpope/vim-haml'
  Plugin 'tpope/vim-markdown'
  Plugin 'digitaltoad/vim-jade'
  Plugin 'slim-template/vim-slim'
  Plugin 'mustache/vim-mustache-handlebars'
  Plugin 'tpope/vim-ragtag'

  au BufNewFile,BufReadPost *.jade setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
  au BufNewFile,BufReadPost *.html setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
  au BufNewFile,BufReadPost *.slim setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
endif
" }}}

" _. CSS {{{
if count(g:vimified_packages, 'css')
  Plugin 'wavded/vim-stylus'
  Plugin 'lunaru/vim-less'
  nnoremap ,m :w <BAR> !lessc % > %:t:r.css<CR><space>
endif
" }}}

" _. JS {{{
if count(g:vimified_packages, 'js')
  Plugin 'kchmck/vim-coffee-script'
  Plugin 'alfredodeza/jacinto.vim'
  Plugin 'pangloss/vim-javascript'
  Plugin 'mxw/vim-jsx'

  let g:jsx_ext_required = 0
  au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
  au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
  "au BufNewFile,BufReadPost *.js setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
endif
" }}}

" _. Clojure {{{
if count(g:vimified_packages, 'clojure')
  Plugin 'guns/vim-clojure-static'
  Plugin 'tpope/vim-leiningen'
  Plugin 'tpope/vim-fireplace'
  Plugin 'tpope/vim-classpath'
endif
" }}}

" _. Presentation {{{
if count(g:vimified_packages, 'presentation')
  Plugin 'vim-scripts/SyntaxRange'
  Plugin 'tybenz/vimdeck'
endif
" }}}

" _. Haskell {{{
if count(g:vimified_packages, 'haskell')
  Plugin 'Twinside/vim-syntax-haskell-cabal'
  Plugin 'lukerandall/haskellmode-vim'

  au BufEnter *.hs compiler ghc

  let g:ghc = "/usr/local/bin/ghc"
  let g:haddock_browser = "open"
endif
" }}}

" _. Elixir {{{
if count(g:vimified_packages, 'elixir')
  Plugin 'elixir-lang/vim-elixir'
endif
" }}}

" _. Color {{{
if count(g:vimified_packages, 'color')
  Plugin 'sjl/badwolf'
  Plugin 'altercation/vim-colors-solarized'
  Plugin 'tomasr/molokai'
  Plugin 'w0ng/vim-hybrid'

  " During installation the molokai colorscheme might not be avalable
  if filereadable(globpath(&rtp, 'colors/molokai.vim'))
    colorscheme molokai
  else
    colorscheme default
  endif
else
  colorscheme default
endif
" }}}

" }}}

" General {{{
filetype plugin indent on

syntax on

" Set 5 lines to the cursor - when moving vertically
set scrolloff=0

" It defines where to look for the buffer user demanding (current window, all
" windows in other tabs, or nowhere, i.e. open file from scratch every time) and
" how to open the buffer (in the new split, tab, or in the current window).

" This orders Vim to open the buffer.
set switchbuf=useopen

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" redraw the screen on focus
:au FocusGained * :redraw!

" }}}

" Mappings {{{

" Yank from current cursor position to end of line
map Y y$

" clear highlight after search
noremap <silent><Leader>/ :nohls<CR>

nmap <silent> <leader>hh :set invhlsearch<CR>
nmap <silent> <leader>ll :set invlist<CR>
nmap <silent> <leader>nn :set invnumber<CR>
nmap <silent> <leader>pp :set invpaste<CR>
nmap <silent> <leader>ii :set invrelativenumber<CR>

" I suck at typing - and I can never get my finger off shift...
command! W :w
command! Wq :wq
command! WQ :wq
command! WQa :wqa

" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Source current line
vnoremap <leader>L y:execute @@<cr>
" Source visual selection
nnoremap <leader>L ^vg_y:execute @@<cr>

" Fast saving and closing current buffer without closing windows displaying the
" buffer
nmap <leader>wq :w!<cr>:Bclose<cr>

nmap <Tab> <C-W>w

" }}}

" . abbrevs {{{
"
" . }}}

" Settings {{{
set autoread
set backspace=indent,eol,start
set binary
set cinoptions=:0,(s,u0,U1,g0,t0
set completeopt=menu,menuone
set encoding=utf-8
set hidden
set history=1000
set incsearch
set laststatus=2
set list

" Don't redraw while executing macros
set nolazyredraw

" Disable the macvim toolbar
set guioptions-=T

set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:␣
set showbreak=↪

set notimeout
set ttimeout
set ttimeoutlen=10

" _ backups {{{
set undodir=~/.vim/tmp/undo//     " undo files
set undofile
set undolevels=3000
set undoreload=10000
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set backup
set noswapfile
" _ }}}

set modelines=0
set noeol

set norelativenumber
set number

set numberwidth=3
set winwidth=83
set ruler
if executable('bash')
  set shell=bash\ -l
endif
set showcmd

set exrc
set secure

set matchtime=2


" White characters {{{
set autoindent
set tabstop=4
set softtabstop=4
set textwidth=80
set shiftwidth=4
set expandtab
set wrap
set formatoptions=qrn1
if exists('+colorcolumn')
  set colorcolumn=+1
endif
" }}}

set visualbell

set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc,tmp,*.scssc
set wildmenu

set dictionary=/usr/share/dict/words
" }}}

" Triggers {{{

" Save when losing focus
au FocusLost    * :silent! wa
"
" When vimrc is edited, reload it
autocmd! BufWritePost vimrc source ~/.vimrc
" }}}

" Cursorline {{{
" Only show cursorline in the current window and in normal mode.
augroup cline
  au!
  au WinLeave * set nocursorline
  au WinEnter * set cursorline
  au InsertEnter * set nocursorline
  au InsertLeave * set cursorline
augroup END
" }}}

" Trailing whitespace {{{
" Only shown when not in insert mode so I don't go insane.
augroup trailing
  au!
  au InsertEnter * :set listchars-=trail:␣
  au InsertLeave * :set listchars+=trail:␣
augroup END

" Remove trailing whitespaces when saving
" Wanna know more? http://vim.wikia.com/wiki/Remove_unwanted_spaces
" If you want to remove trailing spaces when you want, so not automatically,
" see
" http://vim.wikia.com/wiki/Remove_unwanted_spaces#Display_or_remove_unwanted_whitespace_with_a_script.
autocmd BufWritePre * :%s/\s\+$//e

" }}}

" . searching {{{

" sane regexes
nnoremap / /\v
vnoremap / /\v

set ignorecase
set smartcase
set showmatch
set gdefault
set hlsearch

" clear search matching
noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" Don't jump when using * for search
nnoremap * *<c-o>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>? :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Highlight word {{{

nnoremap <silent> <leader>hh :execute 'match InterestingWord1 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h1 :execute 'match InterestingWord1 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h2 :execute '2match InterestingWord2 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h3 :execute '3match InterestingWord3 /\<<c-r><c-w>\>/'<cr>

" }}}

" }}}

" Navigation & UI {{{

" Begining & End of line in Normal mode
noremap H ^
noremap L g_

" more natural movement with wrap on
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Easy splitted window navigation
noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l

" Easy buffer navigation
noremap <leader>bp :bprevious<cr>
noremap <leader>bn :bnext<cr>

" Splits ,v and ,h to open new splits (vertical and horizontal)
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>j

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Bubbling lines
nmap <C-Up> [e
vmap <C-Up> [egv
nmap <C-Down> ]e
vmap <C-Down> ]egv

" Change current directory to the current file
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" }}}

" . folding {{{

set foldlevelstart=0
set foldmethod=syntax

" Space to toggle folds.
nnoremap <space> za
vnoremap <space> za

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

" Use ,z to "focus" the current fold.
nnoremap <leader>z zMzvzz

" }}}

" Quick editing {{{

nnoremap <leader>ev <C-w>v<C-w>j:e $MYVIMRC<cr>
nnoremap <leader>es <C-w>v<C-w>j:e ~/.vim/snippets/<cr>
nnoremap <leader>eg <C-w>v<C-w>j:e ~/.gitconfig<cr>
nnoremap <leader>eb <C-w>v<C-w>j:e ~/.bashrc<cr>

" --------------------

set ofu=syntaxcomplete#Complete
let g:rubycomplete_buffer_loading = 0
let g:rubycomplete_classes_in_global = 1

" showmarks
let g:showmarks_enable = 1
hi! link ShowMarksHLl LineNr
hi! link ShowMarksHLu LineNr
hi! link ShowMarksHLo LineNr
hi! link ShowMarksHLm LineNr

" }}}

" _ Vim {{{
augroup ft_vim
  au!

  au FileType vim setlocal foldmethod=marker
  au FileType help setlocal textwidth=78
  au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END
" }}}

" EXTENSIONS {{{

" _. Scratch {{{
source ~/.vim/functions/scratch_toggle.vim
" }}}

" _. Buffer Handling {{{
source ~/.vim/functions/buffer_handling.vim
" }}}

" _. Tab {{{
source ~/.vim/functions/insert_tab_wrapper.vim
" }}}

" _. Text Folding {{{
source ~/.vim/functions/my_fold_text.vim
" }}}

" _. Gist {{{
" Send visual selection to gist.github.com as a private, filetyped Gist
" Requires the gist command line too (brew install gist)
vnoremap <leader>G :w !gist -p -t %:e \| pbcopy<cr>
" }}}

" }}}

" TEXT OBJECTS {{{

" Shortcut for [] motion
onoremap ir i[
onoremap ar a[
vnoremap ir i[
vnoremap ar a[

" }}}

" Load addidional configuration (ie to overwrite shorcuts) {{{
if filereadable(expand("~/.vim/after.vimrc"))
  source ~/.vim/after.vimrc
endif
" }}}