call plug#begin('~/AppData/Local/nvim/plugged')

" intellisense completer and language server
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Colour theme plugin
Plug 'joshdick/onedark.vim'

" async lint engine
Plug 'w0rp/ale'

" Rust language pack from rust-lang
Plug 'rust-lang/rust.vim'

" Syntax highlighter
Plug 'sheerun/vim-polyglot'

" lightline statusline plug-in
Plug 'itchyny/lightline.vim'

call plug#end()

" UI Theme options
syntax on
colorscheme onedark 

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" for lightline
set noshowmode

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

" set tab up for 2 spaces always
set expandtab
set tabstop=2
set shiftwidth=2

" set working dir to be file currently editing
set autochdir

" add line number margin
set number
set relativenumber
set numberwidth=1

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

" Convenience function for cleaning up formatting
func! CustardCleaner()
  %s/\(\S\)=\(\S\)/\1 = \2/ge | %s/\(\S\)->\(\S\)/\1 -> \2/ge | %s/\(\S\),\(\S\)/\1, \2/ge
endfunc

" Remove sign column unless required
set signcolumn=auto

" set line number colors
highlight LineNr guifg=black
highlight CursorLineNr guifg=pink

" set filetype for text
au BufNewFile,BufRead *.txt set filetype=custext

" make sure line endings are always Unix
au BufNewFile,BufRead * set fileformat=unix

" set capital Y analogous to capital D, yank to end of line
nnoremap Y y$

""""""""""""""""""""""""""""""
" Coc.nvim specific settings "
""""""""""""""""""""""""""""""

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

"
