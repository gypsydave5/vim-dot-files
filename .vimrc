set nocompatible
filetype off

" Kick off Vundle {{{
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
" }}}

" Packages {{{
Plugin 'Spaceghost/vim-matchit'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Yggdroot/indentLine'
Plugin 'aklt/plantuml-syntax'
Plugin 'alfredodeza/jacinto.vim'
Plugin 'benmills/vimux'
Plugin 'bling/vim-airline'
Plugin 'derekwyatt/vim-scala'
Plugin 'digitaltoad/vim-jade'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'edkolev/promptline.vim'
Plugin 'elzr/vim-json'
Plugin 'ensime/ensime-vim'
Plugin 'fatih/vim-go'
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-sexp'
Plugin 'jiangmiao/auto-pairs'
Plugin 'jpalardy/vim-slime'
Plugin 'kana/vim-textobj-user'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'klen/python-mode'
Plugin 'lunaru/vim-less'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'mxw/vim-jsx'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'pangloss/vim-javascript'
Plugin 'python.vim'
Plugin 'python_match.vim'
Plugin 'pythoncomplete'
Plugin 'rizzatti/dash.vim'
Plugin 'rking/ag.vim'
Plugin 'roman/golden-ratio'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/badwolf'
Plugin 'slim-template/vim-slim'
Plugin 'tfnico/vim-gradle'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'tpope/vim-classpath'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-leiningen'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'troydm/easybuffer.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/SQLComplete.vim'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'vim-scripts/dbext.vim'
Plugin 'vim-scripts/groovy.vim'
Plugin 'vim-scripts/scratch.vim'
Plugin 'wavded/vim-stylus'
" }}}

call vundle#end()

filetype plugin indent on

let mapleader = ","
let maplocalleader = "\\"

syntax on

runtime! init/**.vim

if filereadable($HOME . "/.vimrc.local")
    source ~/.vimrc.local
endif
