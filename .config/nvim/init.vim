set number
set relativenumber 
set tabstop=4
set autoindent
set expandtab
set softtabstop=4
nnoremap <C-c> :!clear;g++ -o  %:r.out % -std=c++17 && ./%:r.out
syntax on
imap jj <Esc>
set hlsearch 
set ignorecase 
set incsearch 
set noswapfile 

