" Set up vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
Plugin 'gmarik/vundle'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'rking/ag.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'fatih/vim-go'
Plugin 'henrik/vim-qargs'
Plugin 'mtscout6/vim-cjsx'
call vundle#end()

" Basic settings
set backspace=indent,eol,start
syntax on
filetype plugin indent on
set number
set hidden
set mouse=a
set incsearch
set hlsearch
let mapleader=","
nnoremap <CR> :noh<CR>
set expandtab
set tabstop=2
set shiftwidth=2
set smarttab
set clipboard=unnamed

" Mappings
imap ;; <Esc>
vmap ;; <Esc>
nmap # <c-w>w

" Airline settings
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1

" Color settings
colorscheme Tomorrow-Night
set background=light

" Ctrl P settings
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = 'ra'
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Ag settings
" Map K to grep the word under the cursor and open in quickfix
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Nerdtree settings
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>

" Show differences between current and saved file
function! s:DiffWithSaved()
    let filetype=&ft
    diffthis
    vnew | r # | normal! 1Gdd
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

" Multiple cursors settings
let g:multi_cursor_quit_key='<S-n>'

" Delete whitepace
autocmd BufWritePre * :%s/\s\+$//e

" vim-javascript and vim-jsx settings
let g:jsx_ext_required = 0


