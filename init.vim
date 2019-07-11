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

" Multi-cursor
Plug 'terryma/vim-multiple-cursors'

call plug#end()

" Set main dir for compatibility across various computers
let maindir = '~/OneDrive/Documents'

" UI Theme options
set background=dark
colorscheme material

" Julia specific
let g:default_julia_version = "1.1"

" set tab up for 2 spaces always
set expandtab
set tabstop=2
set shiftwidth=2

" set home dir
exe 'cd' maindir

" set working dir to be file currently editing
set autochdir

" add line number margin
set number

" add commands for easy save and load of default session
let sessionlocation = maindir.'/basetest.vim'
exe 'command -bang Sdfs mks<bang>' sessionlocation
exe 'command Ldfs source' sessionlocation

" convenient mapping for :nohls
nnoremap <esc><esc> :silent! nohls<cr>

" convenient mapping for :put or new-line from command mode
map <S-Enter> o<ESC>

" add mapping for escaping insert mode with a save
imap <c-=> <Esc>:w<CR>
