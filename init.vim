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

call plug#end()

" UI Theme options
set background=dark
colorscheme material

" set tab up for 2 spaces always
set expandtab
set tabstop=2
set shiftwidth=2

" set home dir
:cd C:/Users/J/Documents
