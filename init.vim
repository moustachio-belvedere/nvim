call plug#begin('~/AppData/Local/nvim/plugged')

" Material theme plugin
Plug 'kaicataldo/material.vim'

" Julia specific
Plug 'JuliaEditorSupport/julia-vim'

" Editor
" line indent guide
Plug 'Yggdroot/indentLine'
" can't remember
Plug 'w0rp/ale'

" Python Specific
Plug 'Chiel92/vim-autoformat'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'

" Markdown Specific
Plug 'plasticboy/vim-markdown'

" Multi-cursor
Plug 'terryma/vim-multiple-cursors'

" TOML Syntax
Plug 'cespare/vim-toml'

" Rust language pack from rust-lang
Plug 'rust-lang/rust.vim'

call plug#end()

" YAML syntax highlighting (manually installed plug-in)
au BufNewFile, BufRead, *.yaml,*.yml so C:\Users\louis.kaplan\AppData\Local\nbim\pluggedman\yaml.vim

" Markdown syntax highlighting
let g:vim_markdown_math = 1
let g:vim_markdown_folding_disabled = 1

" UI Theme options
set background=dark
colorscheme material

" Julia specific
let g:default_julia_version = "1.4"

" set tab up for 2 spaces always
set expandtab
set tabstop=2
set shiftwidth=2

" set working dir to be file currently editing
set autochdir

" add line number margin
set number

" convenient mapping for :nohls
nnoremap <esc><esc> :silent! nohls<cr>

" convenient mapping for :put or new-line from command mode
map <S-Enter> o<ESC>

" add mapping for escaping insert mode with a save
imap <c-=> <Esc>:w<CR>

" disable arrow keys temporarily for learning purposes
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

imap <Up> <Nop>
imap <Down> <Nop>
imap <Left> <Nop>
imap <Right> <Nop>

" attempted workaround for CMDER highlighting, only works after open atm
syntax on

" get windows copy/paste working, from neovim-qt github issue 327
source $VIMRUNTIME/mswin.vim
