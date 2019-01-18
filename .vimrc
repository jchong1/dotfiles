" Install plugins first call
call plug#begin()
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-surround'
    Plug 'https://tpope.io/vim/repeat.git'
    Plug 'https://github.com/alvan/vim-closetag.git'
    Plug 'itchyny/lightline.vim'
    Plug 'drewtempelmeyer/palenight.vim'
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'
call plug#end()

set expandtab shiftwidth=4 tabstop=4
set autoindent
set number
set laststatus=2
set updatetime=250
set colorcolumn=72
set textwidth=80
set noshowmode
set mouse=a

if (has("termguicolors"))
    set termguicolors
endif
syntax enable
set background=dark
colorscheme palenight

" Yank to system clipboard
set clipboard+=unnamedplus

" Two space tab is superior
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType sh setlocal shiftwidth=2 tabstop=2
autocmd FileType txt setlocal textwidth=100

" Remap pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitright
set splitbelow

" Code folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
tnoremap <Esc> <C-\><C-n>

" Easier terminal usage
command! -nargs=* T split | resize 20 | term

" Open file where left off
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
" Cursorline only for active pane
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

" NerdTree stuff
nmap <C-n> :NERDTreeToggle<CR>
nmap <C-m> :NERDTreeFind<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeWinPos='left'
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

let g:lightline = {
      \ 'colorscheme': 'palenight',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ 'component_expand': {
      \   'statuslinetabs': 'LightlineStatuslineTabs',
      \ },
      \ }

function! LightlineStatuslineTabs() abort
  return join(map(range(1, tabpagenr('$')),
        \ '(v:val == tabpagenr() ? "[*] " : "") . lightline#tab#filename(v:val)'), " \u2b81 ")
endfunction

