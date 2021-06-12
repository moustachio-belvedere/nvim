call plug#begin(stdpath('config') . '/plugged')
" UI
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'itchyny/lightline.vim'

" Language packs
Plug 'rust-lang/rust.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
call plug#end()

" normal mode mappings
nnoremap <leader>o o<esc>k
nnoremap <leader>l yyp<s-v>r-
nnoremap <c-l> :silent! nohls<cr>
nnoremap Y y$

" insert mode mappings
imap <c-=> <esc>:w<CR>

" editor settings
set number
set relativenumber
set numberwidth=1
set autochdir
set expandtab
set tabstop=2
set shiftwidth=2
set ignorecase
set smartcase
set incsearch
set nrformats+=alpha " allow iterating through alphabet
set inccommand=split

" theme
set guifont=Fira\ Code:h14
set cmdheight=1
set signcolumn=auto " CoC suggests this as always on
syntax on " syntax highlighting
au BufNewFile,BufRead *.txt set filetype=custext

let g:lightline = {
      \ 'colorscheme': 'OldHope',
      \ 'active': {
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ }

colorscheme onehalfdark
set noshowmode " don't show mode in commandline, handled by lightline
set cursorline

if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif
