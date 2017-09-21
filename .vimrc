set nocompatible
filetype off
set mouse=a

" VUNDLE {{{
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" }}}

" Utils {{{
source ~/.vim/functions/util.vim
" }}}

" Load external configuration before anything else {{{
if filereadable(expand("~/.vim/before.vimrc"))
source ~/.vim/before.vimrc
endif
" }}}

let mapleader = ","
inoremap jj <Esc>

" Local vimrc configuration {{{
let s:localrc = expand("~/.vim/local.vimrc")
if filereadable(s:localrc)
exec ':so ' . s:localrc
endif
" }}}

" PACKAGE LIST {{{
if !exists('g:vimified_packages')
let g:vimified_packages = ['general', 'go', 'fancy', 'os', 'coding', 'python', 'ruby', 'html', 'css', 'js', 'clojure', 'haskell', 'color', 'db', 'scala', 'clang', 'snippets', 'java']
endif
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

Plugin 'jremmen/vim-ripgrep'
nnoremap <leader>r :Rg -i<space>

Plugin 'matthias-guenther/hammer.vim'
nmap <leader>p :Hammer<cr>
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-speeddating'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'godlygeek/tabular'

Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-surround'
Plugin 'elzr/vim-json'
Plugin 'vito-c/jq.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-unimpaired'

Plugin 'mattn/webapi-vim'
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

" Plugin 't9md/vim-ruby-xmpfilter'
Plugin 'tpope/vim-cucumber'
Plugin 'jiangmiao/auto-pairs'

Plugin 'Chiel92/vim-autoformat'
Plugin 'diepm/vim-rest-console'

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
"

" _. rust {{{
Plugin 'rust-lang/rust.vim'
Plugin 'cespare/vim-toml'

au BufRead,BufNewFile *.rs set filetype=rust
au BufRead,BufNewFile *.toml set filetype=toml
let g:syntastic_quiet_messages = {"regex": 'is unstable and should only be used on the nightly compiler, but it is currently accepted for backwards compatibility; this will soon change, see issue #31847 for more details'}

let g:rustfmt_autosave = 0
au FileType rust nmap <leader>rx :RustExpand<CR>
au FileType rust nmap <leader>rp :RustPlay<CR>

let g:cargo_command = "!cargo {cmd}"
au FileType rust nmap <leader>cr :CargoRun<CR>
au FileType rust nmap <leader>cb :CargoBuild<CR>
au FileType rust nmap <leader>ct :CargoTest<CR>
au FileType rust nmap <leader>ci :CargoTest -- --ignored<CR>
au FileType rust nmap <leader>cm :CargoBench<CR>
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
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'udalov/kotlin-vim'

let g:syntastic_java_javac_config_file_enabled = 1
endif
" }}}
"
" _. Snippets {{{
if count(g:vimified_packages, 'snippets')
    Plugin 'Valloric/YouCompleteMe'
    Plugin 'rdnetto/YCM-Generator'
    let g:airline#extensions#ycm#enabled = 1

    Plugin 'SirVer/ultisnips'
    let g:UltiSnipsExpandTrigger="<C-T>"
    let g:UltiSnipsJumpForwardTrigger="<Tab>"
    let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
    let g:UltiSnipsUsePythonVersion=2

    Plugin 'gypsydave5/vim-snippets'
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
Plugin 'tmux-plugins/vim-tmux'
Plugin 'benmills/vimux'
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

Plugin 'tpope/vim-commentary'

Plugin 'sjl/splice.vim'

Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
nmap <leader>g :Ggrep
" ,f for global git serach for word under the cursor (with highlight)
nmap <leader>f :let @/="\\<<C-R><C-W>\\>"<CR>:set hls<CR>:silent Ggrep -w "<C-R><C-W>"<CR>:ccl<CR>:cw<CR><CR>
" same in visual mode
:vmap <leader>f y:let @/=escape(@", '\\[]$^*.')<CR>:set hls<CR>:silent Ggrep -F "<C-R>=escape(@", '\\"#')<CR>"<CR>:ccl<CR>:cw<CR><CR>

Plugin 'scrooloose/syntastic'
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
endif
" }}}

" _. Go {{{
if count(g:vimified_packages, 'go')
    Plugin 'fatih/vim-go'
    let g:go_disable_autoinstall = 1
    let g:go_fmt_command = "gofmt"
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

    Plugin 'godoctor/godoctor.vim'
    if exists("g:did_load_filetypes")
        filetype off
        filetype plugin indent off
    endif
    set rtp+=~/.vim/godoctor.vim
    filetype plugin indent on
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
autocmd FileType ruby,eruby,yaml set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
endif
" }}}

" _. Clang {{{
autocmd FileType make set noexpandtab
if count(g:vimified_packages, 'clang')
    autocmd BufWritePre *.h :%pyf /usr/local/Cellar/clang-format/2017-03-17/share/clang/clang-format.py
    autocmd BufWritePre *.c :%pyf /usr/local/Cellar/clang-format/2017-03-17/share/clang/clang-format.py
    autocmd BufWritePre *.cpp :%pyf /usr/local/Cellar/clang-format/2017-03-17/share/clang/clang-format.py
    autocmd BufWritePre *.cc :%pyf /usr/local/Cellar/clang-format/2017-03-17/share/clang/clang-format.py
    let &path.="deps/,"
    au BufNewFile,BufReadPost *.c setl shiftwidth=2 tabstop=2 softtabstop=2 noexpandtab
endif

" }}}

" _. HTML {{{
if count(g:vimified_packages, 'html')
Plugin 'tpope/vim-haml'
Plugin 'digitaltoad/vim-pug'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'tpope/vim-ragtag'

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

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
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'

let g:jsx_ext_required = 0
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab

let g:syntastic_filetype_map = {"javascript.jsx": "javascript"}
let g:syntastic_javascript_checkers = ['standard']
au bufwritepost *.js silent !standard --fix %
set autoread

endif
" }}}

" _. Clojure {{{
if count(g:vimified_packages, 'clojure')
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-sexp'
let g:sexp_filetypes = 'lisp,clojure'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
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
Plugin 'eagletmt/ghcmod-vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'Shougo/vimproc.vim', {'do' : 'make'}

au FileType haskell setlocal formatprg=hindent\ --style\ johan-tibell
autocmd BufWritePre *.hs :%!hindent --style johan-tibell

let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

let g:ycm_semantic_triggers = {'haskell' : ['.']}
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
"
" _. Scala {{{
if count(g:vimified_packages, 'scala')
"Plugin 'ensime/ensime-vim'
Plugin 'derekwyatt/vim-scala'
"au Filetype scala autocmd BufWritalePost *.scala :EnTypeCheck
"au Filetype scala nnoremap <Leader>t :EnTypeCheck<CR>
endif
" }}}

" }}}

" General {{{
call vundle#end()
call yankstack#setup()

filetype plugin indent on

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
au FocusGained * redraw!
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
nmap <silent> <leader>rr :redraw!<CR>

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
set wrap
set expandtab
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

" Use ,z to "focus" the current fold.
nnoremap <leader>z zMzvzz

" }}}

" Quick editing {{{

nnoremap <leader>ev <C-w>v<C-w>j:e $MYVIMRC<cr>
nnoremap <leader>es <C-w>v<C-w>j:e ~/.vim/snippets/<cr>
nnoremap <leader>eg <C-w>v<C-w>j:e ~/.gitconfig<cr>
nnoremap <leader>eb <C-w>v<C-w>j:e ~/.bashrc<cr>
nnoremap <leader>et <C-w>v<C-w>j:e ~/.tmux.conf<cr>

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

" PlantUML {{{
Plugin 'aklt/plantuml-syntax'
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

syntax enable
" }}}
"
