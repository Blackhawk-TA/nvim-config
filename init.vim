call plug#begin("~/.vim/plugged")
  " Plugin Section
  Plug 'joshdick/onedark.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'easymotion/vim-easymotion'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'tpope/vim-fugitive'
  Plug 'dyng/ctrlsf.vim'
call plug#end()

"Config Section
if (has("termguicolors"))
  set termguicolors
endif
syntax on
colorscheme onedark

set number
set number relativenumber
set hlsearch
set incsearch
set ignorecase
set smartcase
set autowrite
set autoindent
set ruler
set confirm
set laststatus=2
set showmode
set showcmd
set hidden
set list
set listchars=tab:\|- 
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set encoding=utf-8

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
let g:NERDTreeShowLineNumbers=1

" Use relative line numbers in nerdtree
autocmd FileType nerdtree setlocal relativenumber
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" search
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \'ctrl-t': 'tab split',
  \'ctrl-s': 'split',
  \'ctrl-v': 'vsplit'
\}
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" global search
nnoremap <C-o> :CtrlSF<CR>