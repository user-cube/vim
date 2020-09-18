syntax on

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'flazz/vim-colorschemes'
Plugin 'initrc/eclim-vundle'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Raimondi/delimitMate'
Plugin 'ryanoasis/vim-devicons'

Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'm0v0nage/vim-quantum'

Plugin 'skywind3000/asyncrun.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this lin

" C completion for YCM
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" eclim
filetype plugin indent on
let g:EclimCompletionMethod = 'omnifunc'
nnoremap <silent> <buffer> <leader>i :JavaImport<cr>

" NerdTree
map <F3> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif"
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

"""""""""
" Comum "
"""""""""
"Altera a função da tecla <Enter>/<CR> no menu completion 
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

set foldcolumn=3
set mouse=a
map <F2>     :set foldcolumn=3<CR>
map <F2><F2> :set foldcolumn=12<CR>
set number
map <F2>     :set foldcolumn=3<CR>
map <F2><F2> :set foldcolumn=12<CR>
hi foldcolumn ctermbg=256 "foldcolumn color = bg color "
set hls is
set autoindent
nmap <C-N><C-N> :set invnumber <CR>
nmap <C-P><C-P> :set paste <CR>
nmap <C-J> :ProjectBuild <CR>
cabb W w
cabb Q q
cabb Wq wq
cabb wQ wq
cabb WQ wq

set tabstop=4 expandtab shiftwidth=4

" colorscheme
set background=dark
colorscheme quantum
if has("termguicolors")
        set termguicolors
endif
au BufRead,BufNewFile *.g4 set filetype=antlr4 " Tema para o ANTLR

" devicons
set encoding=utf8

" Latex
let fts = ['plaintex']
if expand('%:e') == "tex"
	let g:loaded_youcompleteme = 1
    exec("setlocal dictionary+=".$HOME."/.vim/bundle/latex-dict/dictionary")
    set complete+=k

    function! Texc()
        execute "w"
        execute "silent !/bin/pdfLaTeXC.sh % & "
        execute "redraw!"
        execute "sleep 1"
        if filereadable("/tmp/vim_latex_errors")
            execute "bot sp /tmp/vim_latex_errors"
            execute "15winc -"
        endif
    endfunction

    command! Evince 
    \  execute "silent !evince ".expand('%:r').".pdf 1> /dev/null 2> /dev/null &"
    \ | execute "redraw!"

    map <F5> :call Texc() <CR>
    map <F9> :Evince <CR>
endif
