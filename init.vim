call plug#begin(stdpath('config') . '/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'joshdick/onedark.vim'
Plug 'w0rp/ale'
Plug 'rust-lang/rust.vim'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
call plug#end()

" normal mode mappings
nnoremap <leader><cr> o<esc>k
nnoremap <leader>l yyp<s-v>r-
nnoremap <c-l> :silent! nohls<cr>
nnoremap Y y$

" insert mode mappings
imap <c-=> <esc>:w<CR>

" editor settings
set signcolumn=auto " CoC suggests this as always on
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
set cmdheight=1

" theme
set guifont=Fira\ Code:h14
syntax on " syntax highlighting
set noshowmode " for lightline
highlight LineNr guifg=black
highlight CursorLineNr guifg=pink
au BufNewFile,BufRead *.txt set filetype=custext
au BufNewFile,BufRead * set fileformat=unix
colorscheme onedark 

if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ }

" Selection of recommended Coc.nvim settings
set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

autocmd CursorHold * silent call CocActionAsync('highlight')
