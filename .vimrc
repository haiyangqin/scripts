set nu!
set hlsearch

set showmode
set bg=dark
"not save temp file
set nobackup
set noswapfile

set ru
set incsearch
set confirm
set cursorline
set cursorcolumn

set fileencodings=utf-8,gb18030,gbk,gb2312,big5
set termencoding=utf-8
set encoding=prc


hi CursorLine guibg=#666666
hi CursorColumn guibg=#333333

colorscheme desert 

syntax enable
syntax on

set guifont=DejaVu\ Sans\ Mono\ 14
set linespace=4


nmap <F1> :qa<CR>

"copy and paste
vnoremap <c-c> "+y
noremap <c-x> "+gP
inoremap <c-x> <esc> "+gp
vnoremap <c-x> d"+gP
vnoremap <s-x> d"+yd

source ~/.vim/user/.alias.vim
